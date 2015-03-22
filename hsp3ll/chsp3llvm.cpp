//
//			HSP3 script generator
//			onion software/onitama 2008/5
//
#include <stdio.h>
#include <string>
#include <map>
#include <set>
#include <vector>
#include <stack>
#include <fstream>
#include <boost/ptr_container/ptr_vector.hpp>
#include <boost/format.hpp>

#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/PassManager.h"
#include "llvm/IR/TypeBuilder.h"
#include "llvm/IR/Verifier.h"

#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/JIT.h"
#include "llvm/ExecutionEngine/JITEventListener.h"
#include "llvm/ExecutionEngine/JITMemoryManager.h"

#include "llvm/Analysis/Passes.h"
#include "llvm/Transforms/Scalar.h"

#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/FileSystem.h"

#include "supio.h"
#include "chsp3op.h"
#include "chsp3llvm.h"
#include "hsp3r.h"
#include "hsp3op.h"
#include "compilecontext.h"

#ifdef HSPWIN
#include <windows.h>
#endif

#define HSP_PROFILE 0

using namespace llvm;
using std::string;
using boost::format;

extern CHsp3Op *hsp3;
extern bool printDebugDump;

class Task;

static void CompileTaskGeneral(CHsp3Op *hsp, Task *task, Function *func, BasicBlock *retBB);

class VarStatics {
public:
	int tflag;
	int num;
	int change;

	VarStatics() : tflag(0), num(0), change(0)
	{
	}
};

class Task {
public:
	CompileContext *cctx;

	Block *block;
	Function *func;
	Function *spFunc;
	CHSP3_TASK funcPtr;
	BasicBlock *entry;
	int numCall;
	int numCurCall;
	int numChange;
	long long time;
	std::vector<VarStatics*> varStatics;
	std::map<VarId, Value*> llVariables;
	std::set<BasicBlock*> returnBlocks;

	std::set<Task*> incoming;
	std::set<Task*> outgoing;

	bool useGeneralFunc;
	bool skipTypeCheck;

	explicit Task(Block *block) : block(block), numCall(0), numCurCall(0), numChange(0), time(0),
		useGeneralFunc(true), skipTypeCheck(false)
	{
	}

	void setup();

	template<typename T>
	Function* createFunction(T gen)
	{
		cctx->ResetModule(&sHspctx, Var__HspVars, &sDsBasePtr);
		Function* func = cast<Function>(cctx->module->getOrInsertFunction(GetTaskFuncName(this),
			Type::getVoidTy(cctx->context),
			(Type *)0));

		BasicBlock *funcEntry = BasicBlock::Create(cctx->context, "entry", func);
		BasicBlock *funcRet = BasicBlock::Create(cctx->context, "ret", func);

		gen(func, funcRet);

		cctx->builder.SetInsertPoint(funcEntry);
		cctx->builder.CreateBr(entry);

		cctx->builder.SetInsertPoint(funcRet);
		cctx->builder.CreateRetVoid();

		return func;
	}
};

class Timer {
	Task* task;
	LARGE_INTEGER start;
public:
	explicit Timer(Task* t) : task(t) {
		QueryPerformanceCounter(&start);
	}
	~Timer() {
		LARGE_INTEGER end;
		QueryPerformanceCounter(&end);
		task->time += end.QuadPart - start.QuadPart;
	}
};

typedef int(*CHSP3_FUNC) (int);

static std::map<VarId, VarStatics*> sVarStatics;
static Program sProgram;

// Runtime
CHSP3_TASK *__HspTaskFunc;
std::vector<Task*> __Task;
static const char *sDsBasePtr;

static int sMaxVar;
static int sMaxHpi;
static int sLabMax;
static HSPCTX *sHspctx;
static Hsp3r *sHsp3r;
static PVal **Var__HspVars;

extern int GetCurTaskId();
extern void HspVarCoreArray2(PVal *pval, int offset);
extern CHsp3Op *hsp3;

static BasicBlock *CompileOp(CHsp3Op *hsp, Function *func,
	BasicBlock *bb, BasicBlock *retBB,
	Task *task, Op *op);
static BasicBlock *GenerateDefaultCode(CHsp3Op *hsp, Function *func,
	BasicBlock *bb, BasicBlock *retBB,
	Task *task, Op *op);

static void RecompileModule();
static void MarkCompile(Op *op, COMPILE_TYPE comp);

extern void UpdateOperands(Block *block);
extern void AnalyzeTask(Block *block);


static string GetTaskFuncName(const Task *task)
{
	return (format("%1%_%2%") % task->block->name % task->numCall).str();
}

static bool CheckCompileType(Task *task, Op *op, CHsp3Op *hsp, const std::map<VarId, int>& varTypes)
{
	switch (op->GetOpCode()) {
	case PUSH_VAR_OP:
	{
		PushVarOp *pv = (PushVarOp*)op;
		const VarId &varId = pv->GetVarId();
		int tflag = varTypes.find(varId)->second;

		for (int i = 0; i < pv->GetArrayDim(); i++) {
			if (op->operands[i]->flag != HSPVAR_FLAG_INT)
				return false;
		}

		if (tflag == TYPE_INUM || tflag == HSPVAR_FLAG_DOUBLE) {
			//return pv->GetArrayDim() == 0;
			return true;
		}
	}
		break;
	case PUSH_VAR_PTR_OP:
	{
		//PushVarPtrOp *pv = (PushVarPtrOp*)op;
		//const VarId &varId = pv->GetVarId();
		//PVal& pval = mem_var[varId.val()];
		//op->flag = pval.flag;
	}
		break;
	case PUSH_DNUM_OP:
		return true;
	case PUSH_INUM_OP:
		return true;
	case PUSH_LABEL_OP:
		break;
	case PUSH_STR_OP:
		break;
	case PUSH_FUNC_END_OP:
		return true;
	case PUSH_FUNC_PARAM_OP:
	{
		PushFuncPrmOp *prmop = (PushFuncPrmOp*)op;
		const STRUCTPRM *st = hsp->GetMInfo(prmop->GetVarNo());
		const VarId &varId = prmop->GetVarId();
		int tflag = varTypes.find(varId)->second;

		switch (st->mptype) {
		case MPTYPE_LOCALVAR:
			break;
		case MPTYPE_VAR:
		case MPTYPE_ARRAYVAR:
		case MPTYPE_SINGLEVAR:
			for (int i = 0; i < prmop->GetArrayDim(); i++) {
				if (op->operands[i]->flag != HSPVAR_FLAG_INT)
					return false;
			}
			if (tflag == TYPE_INUM || tflag == HSPVAR_FLAG_DOUBLE) {
				return true;
			}
			break;
		case MPTYPE_DNUM:
			return true;
		case MPTYPE_INUM:
			return true;
		}
		return false;
	}
		break;
	case PUSH_CMD_OP:
	{
		PushCmdOp *pcop = (PushCmdOp*)op;
		for (auto op2 : op->operands) {

			if (op2->flag != HSPVAR_FLAG_INT
				&& op2->flag != HSPVAR_FLAG_DOUBLE
				&& op2->GetOpCode() != PUSH_FUNC_END_OP) {
				return false;
			}

			if (!CheckCompileType(task, op2, hsp, varTypes)) {
				return false;
			}
		}
		int retType = GetFuncTypeRet(pcop->GetCmdType(), pcop->GetCmdVal(), pcop->GetCmdPNum());
		return retType == HSPVAR_FLAG_INT || retType == HSPVAR_FLAG_DOUBLE;
	}
		break;

	case CALC_OP:
	{
		CalcOp *calc = (CalcOp*)op;
		if ((op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_INT)
			|| (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE)) {
			if (CheckCompileType(task, op->operands[0], hsp, varTypes) &&
				CheckCompileType(task, op->operands[1], hsp, varTypes)) {
				MarkCompile(op, VALUE);
				op->compile = VALUE_STACK;
				return true;
			}
		}
		if ((op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE)
			|| (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_INT)) {
			if (CheckCompileType(task, op->operands[0], hsp, varTypes) &&
				CheckCompileType(task, op->operands[1], hsp, varTypes)) {
				MarkCompile(op, VALUE);
				op->compile = VALUE_STACK;
				return true;
			}
		}
		CheckCompileType(task, op->operands[0], hsp, varTypes);
		CheckCompileType(task, op->operands[1], hsp, varTypes);
		return false;
	}
		break;

	case VAR_INC_OP:
	case VAR_DEC_OP:
		break;

	case VAR_CALC_OP:
	{
		VarCalcOp *vs = (VarCalcOp*)op;
		const VarId &varId = vs->GetVarId();
		int tflag = varTypes.find(varId)->second;

		if (vs->GetArrayDim() == 0 && op->operands.size() == 1) {
			if (!CheckCompileType(task, op->operands[0], hsp, varTypes))
				return false;

			if ((op->operands[0]->flag == HSPVAR_FLAG_INT || op->operands[0]->flag == HSPVAR_FLAG_DOUBLE)
				&& (tflag == HSPVAR_FLAG_INT || tflag == HSPVAR_FLAG_DOUBLE)) {
				op->compile = VALUE;
				MarkCompile(op, VALUE);
				return true;
			}
		}
	}
		break;
	case VAR_SET_OP:
	{
		VarSetOp *vs = (VarSetOp*)op;
		const VarId &varId = vs->GetVarId();
		int tflag = varTypes.find(varId)->second;

		if (vs->GetArrayDim() == 0 && op->operands.size() == 1) {
			if (CheckCompileType(task, op->operands[0], hsp, varTypes) &&
				op->operands[0]->flag == tflag) {
				op->compile = VALUE;
				MarkCompile(op, VALUE);
				return true;
			}
		}

		if (CheckCompileType(task, op->operands[vs->GetArrayDim()], hsp, varTypes)) {
			//op->compile = RHS;
			//MarkCompile( op->operands[vs->GetArrayDim()], VALUE );
			return true;
		}
	}
		break;
	case COMPARE_OP:
	{
		CompareOp *comp = (CompareOp*)op;
		if (op->operands[0]->flag == HSPVAR_FLAG_INT) {
			if (CheckCompileType(task, op->operands[0], hsp, varTypes)) {
				op->compile = VALUE;
				MarkCompile(op, VALUE);
			}
		}
	}
		break;
	case CMD_OP:
	case MODCMD_OP:
	{
		CallOp *call = (CallOp*)op;

		for (auto op2 : call->operands) {
			CheckCompileType(task, op2, hsp, varTypes);
		}
	}
		break;
	case TASK_SWITCH_OP:
		break;
	default:
		break;
	}
	return false;
}

static void MarkCompile(Op *op, COMPILE_TYPE comp)
{
	for (auto o : op->operands) {
		o->compile = comp;
		MarkCompile(o, comp);
	}
}


//TODO �����I�ɕϐ��̌^����n�� -> CheckType
static BasicBlock *CompileOp(CHsp3Op *hsp, Function *func, BasicBlock *bb, BasicBlock *retBB, Task *task, Op *op)
{
	auto cctx = task->cctx;
	LLVMContext &context = cctx->context;
	auto &builder = cctx->builder;
	builder.SetInsertPoint(bb);

	Type *tyPI8 = TypeBuilder<types::i<8>*, false>::get(context);
	Type *tyPI32 = TypeBuilder<types::i<32>*, false>::get(context);
	Type *tyPD = TypeBuilder<types::ieee_double*, false>::get(context);

	switch (op->GetOpCode()) {
	case PUSH_VAR_OP:
	{
		PushVarOp *pv = (PushVarOp*)op;
		const VarId &varId = pv->GetVarId();
		PVal& pval = mem_var[varId.val()];
		Value *lpvar;
		string varname(hsp->MakeImmidiateCPPVarName(pv->GetVarType(), pv->GetVarNo()));

		auto it = task->llVariables.find(pv->GetVarId());

		if (pv->useRegister) {
			op->llValue = it->second;

			Function *pNop = cctx->module->getFunction("Nop");
			builder.SetInsertPoint(bb);
			builder.CreateCall(pNop);
			return bb;
		}

		if (it != task->llVariables.end()) {
			lpvar = it->second;
		}
		else {
			lpvar = cctx->GetValue(bb, pv->GetVarId());
		}
		task->llVariables[pv->GetVarId()] = lpvar;

		Value *lpval = builder.CreateConstGEP2_32(lpvar, 0, 4, "a_" + varname);
		LoadInst *lptr = builder.CreateLoad(lpval, "b_" + varname);
		Value *ptr;
		if (pval.flag == HSPVAR_FLAG_INT) {
			ptr = builder.CreateBitCast(lptr, tyPI32, "c_" + varname);
		}
		else if (pval.flag == HSPVAR_FLAG_DOUBLE) {
			ptr = builder.CreateBitCast(lptr, tyPD, "d_" + varname);
		}
		else {
			return NULL;
		}

		Value *aptr;
		BasicBlock *curBB;
		if (pv->GetArrayDim() == 0) {
			aptr = ptr;
			curBB = bb;
		}
		else {
			curBB = bb;

			Value *ofs1 = NULL;
			BasicBlock *inBB = NULL;
			BasicBlock *outBB = NULL;
			BasicBlock *uniBB = NULL;

			if (pv->GetArrayDim() == 1) {
				// 1�����z��̏ꍇ�̓C�����C���Ŕ͈̓`�F�b�N
				builder.SetInsertPoint(curBB);
				Function *pArray2 = cctx->module->getFunction("HspVarCoreArray1D");
				ofs1 = builder.CreateCall2(pArray2, lpvar,
					static_cast<Value*>(pv->operands[0]->llValue));

				Value *cond = builder.CreateICmpSGE(ofs1,
					ConstantInt::get(Type::getInt32Ty(context), 0));

				inBB = BasicBlock::Create(context, "in", func);
				outBB = BasicBlock::Create(context, "out", func);
				uniBB = BasicBlock::Create(context, "uni", func);
				builder.CreateCondBr(cond, inBB, outBB);

				builder.SetInsertPoint(inBB);
				builder.CreateBr(uniBB);

				curBB = outBB;
			}
			builder.SetInsertPoint(curBB);
			Function *pReset = cctx->module->getFunction("HspVarCoreReset");
			builder.CreateCall(pReset, lpvar);

			Function *pArray2 = cctx->module->getFunction("HspVarCoreArray2");
			for (int i = 0; i < pv->GetArrayDim(); i++) {
				builder.CreateCall2(pArray2, lpvar,
					static_cast<Value*>(pv->operands[i]->llValue));
			}
			Value *lpofs = builder.CreateConstGEP2_32(lpvar, 0, 8);
			LoadInst *lofs = builder.CreateLoad(lpofs, "offset_" + varname);
			Value* ofs;
			if (pv->GetArrayDim() == 1) {
				builder.CreateBr(uniBB);

				builder.SetInsertPoint(uniBB);
				PHINode *ofsPhi = builder.CreatePHI(Type::getInt32Ty(context), 2);
				ofsPhi->addIncoming(ofs1, inBB);
				ofsPhi->addIncoming(lofs, outBB);
				ofs = ofsPhi;
				curBB = uniBB;
			}
			else {
				ofs = lofs;
			}

			aptr = builder.CreateGEP(ptr, ofs);
		}

		//Value *lpval = builder.CreateConstGEP2_32( lpvar, 0, 4 );

		if (pval.flag == HSPVAR_FLAG_INT) {
			op->llValue = builder.CreateLoad(aptr, "p_" + varname);
			return curBB;
		}
		else if (pval.flag == HSPVAR_FLAG_DOUBLE) {
			op->llValue = builder.CreateLoad(aptr, "p_" + varname);
			return curBB;
		}
		else {
			return NULL;
		}
	}
		break;
	case PUSH_VAR_PTR_OP:
	{
	}
		break;
	case PUSH_DNUM_OP:
	{
		PushDnumOp *pd = (PushDnumOp*)op;
		op->llValue = ConstantFP::get(Type::getDoubleTy(context), pd->GetValue());
		return bb;
	}
	case PUSH_INUM_OP:
	{
		PushInumOp *pi = (PushInumOp*)op;
		op->llValue = ConstantInt::get(Type::getInt32Ty(context), pi->GetValue());
		return bb;
	}
	case PUSH_LABEL_OP:
		break;
	case PUSH_STR_OP:
		break;
	case PUSH_FUNC_END_OP:
		return bb;
	case PUSH_FUNC_PARAM_OP:
	{
		PushFuncPrmOp *prmop = (PushFuncPrmOp*)op;
		const STRUCTPRM *st = hsp->GetMInfo(prmop->GetVarNo());
		switch (st->mptype) {
		case MPTYPE_LOCALVAR:
			break;
		case MPTYPE_VAR:
		case MPTYPE_ARRAYVAR:
		case MPTYPE_SINGLEVAR:
		{
			//PushVarOp *pv = (PushVarOp*)op;
			const VarId &varId = prmop->GetVarId();
			PVal &pval = *FuncPrm(varId.prm());
			Value *lpvar;
			string varname(hsp->MakeImmidiateCPPVarName(varId.type(), varId.val()));

			auto it = task->llVariables.find(varId);

			/*
							if ( pv->useRegister) {
							op->llValue = it->second;

							Function *pNop = cctx->module->getFunction( "Nop" );
							builder.SetInsertPoint( bb );
							builder.CreateCall( pNop );
							return bb;
							}
							*/

			//if ( it != task->llVariables.end() ) {
			//lpvar = it->second;
			//} else {
			lpvar = cctx->GetValue(bb, varId.type(), varId.val(), varId.prm());
			//}
			task->llVariables[varId] = lpvar;
			Value *lpval = builder.CreateConstGEP2_32(lpvar, 0, 4, "a_" + varname);
			LoadInst *lptr = builder.CreateLoad(lpval, "b_" + varname);
			Value *ptr;
			if (pval.flag == HSPVAR_FLAG_INT) {
				ptr = builder.CreateBitCast(lptr, tyPI32, "c_" + varname);
			}
			else if (pval.flag == HSPVAR_FLAG_DOUBLE) {
				ptr = builder.CreateBitCast(lptr, tyPD, "d_" + varname);
			}
			else {
				return NULL;
			}

			Value *aptr;
			BasicBlock *curBB;
			if (prmop->GetArrayDim() == 0) {
				aptr = ptr;
				curBB = bb;
			}
			else {
				curBB = bb;
				builder.SetInsertPoint(curBB);
				Function *pReset = cctx->module->getFunction("HspVarCoreReset");
				builder.CreateCall(pReset, lpvar);

				Function *pArray2 = cctx->module->getFunction("HspVarCoreArray2");
				for (int i = 0; i < prmop->GetArrayDim(); i++) {
					builder.CreateCall2(pArray2, lpvar,
						static_cast<Value*>(prmop->operands[i]->llValue));
				}
				Value *lpofs = builder.CreateConstGEP2_32(lpvar, 0, 8);
				LoadInst *lofs = builder.CreateLoad(lpofs, "offset_" + varname);
				aptr = builder.CreateGEP(ptr, lofs);
			}

			if (pval.flag == HSPVAR_FLAG_INT) {
				op->llValue = builder.CreateLoad(aptr, "var_" + varname);
				return curBB;
			}
			else if (pval.flag == HSPVAR_FLAG_DOUBLE) {
				op->llValue = builder.CreateLoad(aptr, "var_" + varname);
				return curBB;
			}
			else {
				return NULL;
			}
			break;
		}
		case MPTYPE_DNUM:
			op->llValue = cctx->CreateCallImm(bb, "FuncPrmD",
				prmop->GetPrmNo());
			return bb;
		case MPTYPE_INUM:
			op->llValue = cctx->CreateCallImm(bb, "FuncPrmI",
				prmop->GetPrmNo());
			return bb;
		}
		return NULL;
	}
		break;

	case PUSH_CMD_OP:
	{
		PushCmdOp *pcop = (PushCmdOp*)op;
		string funcname =
			(format("llvmRt%1%_%2$03x")
			% hsp->GetHSPCmdTypeName(pcop->GetCmdType())
			% pcop->GetCmdVal()).str();
		Function *f = cctx->module->getFunction(funcname);
		if (f) {
			if (f->getArgumentList().size() != op->operands.size() - 1)
				goto NOTMATCH;
			int n = 0;
			for (auto it = f->arg_begin(); it != f->arg_end(); ++it, ++n) {
				const Type *t = it->getType();

				switch (op->operands[n]->flag) {
				case HSPVAR_FLAG_INT:
					if (!t->isIntegerTy(32))
						goto NOTMATCH;
					break;
				case HSPVAR_FLAG_DOUBLE:
					if (!t->isDoubleTy())
						goto NOTMATCH;
					break;
				default:
					goto NOTMATCH;
				}
			}

			{
				std::vector<Value*> args;
				for (int i = 0; i < op->operands.size() - 1; ++i) {
					args.push_back(static_cast<Value*>(op->operands[i]->llValue));
				}
				op->llValue = builder.CreateCall(f, makeArrayRef(args));
				return bb;
			}

		NOTMATCH:
			;
		}

		int retType = GetFuncTypeRet(pcop->GetCmdType(),
			pcop->GetCmdVal(),
			pcop->GetCmdPNum());

		for (auto it = op->operands.rbegin();
			it != op->operands.rend(); it++) {
			//(*it)->compile = true;
			if ((*it)->GetOpCode() == PUSH_FUNC_END_OP) {
				cctx->CreateCallImm(bb, "PushFuncEnd");
				continue;
			}

			switch ((*it)->flag) {
			case HSPVAR_FLAG_INT:
			{
				Function *pPush = cctx->module->getFunction("PushInt");
				builder.CreateCall(pPush, static_cast<Value*>((*it)->llValue));
			}
				break;
			case HSPVAR_FLAG_DOUBLE:
			{
				Function *pPush = cctx->module->getFunction("PushDouble");
				builder.CreateCall(pPush, static_cast<Value*>((*it)->llValue));
			}
				break;
			default:
				return NULL;
			}
		}

		switch (retType) {
		case HSPVAR_FLAG_DOUBLE:
			op->llValue = cctx->CreateCallImm(bb, "CallDouble" + hsp->GetHSPCmdTypeName(pcop->GetCmdType()),
				pcop->GetCmdVal(), pcop->GetCmdPNum());
			return bb;
		case HSPVAR_FLAG_INT:
			op->llValue = cctx->CreateCallImm(bb, "CallInt" + hsp->GetHSPCmdTypeName(pcop->GetCmdType()),
				pcop->GetCmdVal(), pcop->GetCmdPNum());
			return bb;
		default:
			return NULL;
		}
		break;
	}

	case CALC_OP:
	{
		CalcOp *calc = (CalcOp*)op;
		if (op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_INT) {
			op->llValue = cctx->CreateCalcI(calc->GetCalcOp(),
				static_cast<Value*>(op->operands[1]->llValue),
				static_cast<Value*>(op->operands[0]->llValue));
		}
		else if (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE) {
			op->llValue = cctx->CreateCalcD(calc->GetCalcOp(),
				static_cast<Value*>(op->operands[1]->llValue),
				static_cast<Value*>(op->operands[0]->llValue));
		}
		else if (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_INT) {
			Value *v = builder.CreateFPToSI(static_cast<Value*>(op->operands[0]->llValue),
				TypeBuilder<types::i<32>, false>::get(context));
			op->llValue = cctx->CreateCalcI(calc->GetCalcOp(),
				static_cast<Value*>(op->operands[1]->llValue),
				v);
		}
		else if (op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE) {
			Value *v = builder.CreateSIToFP(static_cast<Value*>(op->operands[0]->llValue),
				TypeBuilder<types::ieee_double, false>::get(context));
			op->llValue = cctx->CreateCalcD(calc->GetCalcOp(),
				static_cast<Value*>(op->operands[1]->llValue),
				v);
		}
		if (calc->compile == VALUE_STACK) {
			Value *res = static_cast<Value*>(op->llValue);
			switch (calc->flag) {
			case HSPVAR_FLAG_INT:
			{
				Function *pPush = cctx->module->getFunction("PushInt");
				builder.CreateCall(pPush, res);
			}
				break;
			case HSPVAR_FLAG_DOUBLE:
			{
				Function *pPush = cctx->module->getFunction("PushDouble");
				builder.CreateCall(pPush, res);
			}
				break;
			default:
				return NULL;
			}
		}
		if (op->llValue == NULL)
			return NULL;
		return bb;
	}
		break;

	case VAR_INC_OP:
	case VAR_DEC_OP:
		break;

	case VAR_CALC_OP:
	{
		VarCalcOp *vs = (VarCalcOp*)op;
		const VarId &varId = vs->GetVarId();
		PVal& pval = mem_var[varId.val()];

		if (vs->useRegister) {
			auto it = task->llVariables.find(vs->GetVarId());

			if (pval.flag == HSPVAR_FLAG_INT) {
				Value *rhs;
				if (op->operands[0]->flag == HSPVAR_FLAG_INT) {
					rhs = static_cast<Value*>(op->operands[0]->llValue);
				}
				else if (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE) {
					rhs = builder.CreateFPToSI(static_cast<Value*>(op->operands[0]->llValue),
						TypeBuilder<types::i<32>, false>::get(context));
				}
				else {
					return NULL;
				}
				Value *result = cctx->CreateCalcI(vs->GetCalcOp(),
					it->second, rhs);
				if (!result)
					return NULL;
				op->llValue = result;
			}
			else if (pval.flag == HSPVAR_FLAG_DOUBLE) {
				Value *rhs;
				if (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE) {
					rhs = static_cast<Value*>(op->operands[0]->llValue);
				}
				else if (op->operands[0]->flag == HSPVAR_FLAG_INT) {
					rhs = builder.CreateSIToFP(static_cast<Value*>(op->operands[0]->llValue),
						TypeBuilder<types::ieee_double, false>::get(context));
				}
				else {
					return NULL;
				}

				Value *result = cctx->CreateCalcD(vs->GetCalcOp(),
					it->second, rhs);
				if (!result)
					return NULL;
				op->llValue = result;
			}
			else {
				return NULL;
			}
			task->llVariables[vs->GetVarId()] = static_cast<Value*>(op->llValue);

			Function *pNop = cctx->module->getFunction("Nop");
			builder.SetInsertPoint(bb);
			builder.CreateCall(pNop);

			return bb;
		}

		Value *lpvar = cctx->GetValue(bb, vs->GetVarId());
		Value *lpval = builder.CreateConstGEP2_32(lpvar, 0, 4);
		LoadInst *lptr = builder.CreateLoad(lpval, "ptr");

		if (pval.flag == HSPVAR_FLAG_INT) {
			Value *lp = builder.CreateBitCast(lptr, tyPI32);
			Value *lhs = builder.CreateLoad(lp);
			Value *rhs;
			if (op->operands[0]->flag == HSPVAR_FLAG_INT) {
				rhs = static_cast<Value*>(op->operands[0]->llValue);
			}
			else if (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE) {
				rhs = builder.CreateFPToSI(static_cast<Value*>(op->operands[0]->llValue),
					TypeBuilder<types::i<32>, false>::get(context));
			}
			else {
				return NULL;
			}

			Value *result = cctx->CreateCalcI(vs->GetCalcOp(), lhs, rhs);
			if (!result)
				return NULL;
			op->llValue = builder.CreateStore(result, lp);
		}
		else if (pval.flag == HSPVAR_FLAG_DOUBLE) {
			Value *lp = builder.CreateBitCast(lptr, tyPD);
			Value *lhs = builder.CreateLoad(lp);
			Value *rhs;
			if (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE) {
				rhs = static_cast<Value*>(op->operands[0]->llValue);
			}
			else if (op->operands[0]->flag == HSPVAR_FLAG_INT) {
				rhs = builder.CreateSIToFP(static_cast<Value*>(op->operands[0]->llValue),
					TypeBuilder<types::ieee_double, false>::get(context));
			}
			else {
				return NULL;
			}

			Value *result = cctx->CreateCalcD(vs->GetCalcOp(), lhs, rhs);
			if (!result)
				return NULL;
			op->llValue = builder.CreateStore(result, lp);
		}
		else {
			return NULL;
		}
		return bb;
	}
		break;
	case VAR_SET_OP:
	{
		VarSetOp *vs = (VarSetOp*)op;
		const VarId &varId = vs->GetVarId();

		if (vs->compile == VALUE) {
			if (vs->useRegister) {
				op->llValue = op->operands[0]->llValue;
				task->llVariables[vs->GetVarId()] = static_cast<Value*>(op->llValue);

				Function *pNop = cctx->module->getFunction("Nop");
				builder.SetInsertPoint(bb);
				builder.CreateCall(pNop);

				return bb;
			}

			PVal& pval = mem_var[varId.val()];
			Value *lpvar = cctx->GetValue(bb, vs->GetVarId());
			Value *lpval = builder.CreateConstGEP2_32(lpvar, 0, 4);
			LoadInst *lptr = builder.CreateLoad(lpval, "ptr");

			if (pval.flag == HSPVAR_FLAG_INT) {
				Value *lp = builder.CreateBitCast(lptr, tyPI32);
				op->llValue = builder.CreateStore(static_cast<Value*>(op->operands[0]->llValue), lp);
			}
			else if (pval.flag == HSPVAR_FLAG_DOUBLE) {
				Value *lp = builder.CreateBitCast(lptr, tyPD);
				op->llValue = builder.CreateStore(static_cast<Value*>(op->operands[0]->llValue), lp);
			}
			else {
				return NULL;
			}
			/*
						} else if ( vs->compile == RHS ) {
						Op* rop = op->operands[vs->GetArrayDim()];
						Value* rhv = static_cast<Value*>(rop->llValue);

						switch ( rop->flag ) {
						case HSPVAR_FLAG_INT:
						{
						Function *pPush = cctx->module->getFunction( "PushInt" );
						builder.CreateCall( pPush, rhv );
						}
						break;
						case HSPVAR_FLAG_DOUBLE:
						{
						Function *pPush = cctx->module->getFunction( "PushDouble" );
						builder.CreateCall( pPush, rhv );
						}
						break;
						default:
						return NULL;
						}

						Function *f = cctx->module->getFunction( "VarSet" );
						const FunctionType *ft = f->getFunctionType();

						Value *var = cctx->moduleakeImmidiateCPPName( hsp, bb, vs->GetVarType(),
						vs->GetVarNo(), vs->GetPrmNo() );
						if (!var) {
						Alert( "mes" );
						}
						std::vector<Value*> args;
						args.push_back(var);
						args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
						vs->GetArrayDim() ));
						args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
						vs->GetCmdPNum() ));

						builder.CreateCall(f, args.begin(), args.end());
						*/
		}
		return bb;
	}
		break;
	case COMPARE_OP:
	{
		CompareOp *comp = (CompareOp*)op;

		builder.SetInsertPoint(bb);

		BasicBlock *thenBB = BasicBlock::Create(context, "then", func);
		BasicBlock *elseBB = BasicBlock::Create(context, "else", func);


		Value *cond = builder.CreateICmpEQ(static_cast<Value*>(op->operands[0]->llValue),
			ConstantInt::get(Type::getInt32Ty(context), 0));
		builder.CreateCondBr(cond, thenBB, elseBB);

		builder.SetInsertPoint(thenBB);
		cctx->CreateCallImm(thenBB, "TaskSwitch", comp->GetNextTask());
		builder.CreateBr(retBB);
		task->returnBlocks.insert(thenBB);

		return elseBB;
	}
		break;
	case CMD_OP:
	case MODCMD_OP:
		break;
	case TASK_SWITCH_OP:
		break;
	default:
		break;
	}
	return NULL;
}

static BasicBlock *GenerateDefaultCode(CHsp3Op *hsp, Function *func,
	BasicBlock *bb, BasicBlock *retBB, Task *task, Op *op)
{
	auto cctx = task->cctx;
	auto& builder = cctx->builder;
	LLVMContext &Context = cctx->context;
	builder.SetInsertPoint(bb);

	switch (op->GetOpCode()) {
	case TASK_SWITCH_OP:
	{
		TaskSwitchOp *o = (TaskSwitchOp*)op;
		cctx->CreateCallImm(bb, "TaskSwitch", o->GetNextTask());
		return bb;
	}
	case CALC_OP:
	{
		CalcOp *o = (CalcOp*)op;
		cctx->CreateCallImm(bb, "Calc" + hsp->GetHSPOperator2(o->GetCalcOp()));
		return bb;
	}
	case PUSH_VAR_OP:
	{
		PushVarOp *o = (PushVarOp*)op;
		Function* f = cctx->module->getFunction("PushVar");

		std::vector<Value*> args;
		Value *var = cctx->GetValue(bb, TYPE_VAR, o->GetVarNo(), o->GetPrmNo());
		if (!var)
			Alert("varname");
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context),
			o->GetArrayDim()));

		builder.SetInsertPoint(bb);
		builder.CreateCall(f, makeArrayRef(args));

		return bb;
	}
	case PUSH_VAR_PTR_OP:
	{
		PushVarPtrOp *o = (PushVarPtrOp*)op;
		Function *f = cctx->module->getFunction("PushVAP");

		std::vector<Value*> args;
		Value *var = cctx->GetValue(bb, TYPE_VAR, o->GetVarNo(), o->GetPrmNo());
		if (!var)
			Alert("varname");
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context),
			o->GetArrayDim()));

		builder.SetInsertPoint(bb);
		builder.CreateCall(f, makeArrayRef(args));

		return bb;
	}
	case PUSH_DNUM_OP:
	{
		PushDnumOp *o = (PushDnumOp*)op;
		Function *f = cctx->module->getFunction("Push" + hsp->GetHSPCmdTypeName(TYPE_DNUM));

		std::vector<Value*> args;
		args.push_back(ConstantFP::get(Type::getDoubleTy(Context), o->GetValue()));

		builder.SetInsertPoint(bb);
		builder.CreateCall(f, makeArrayRef(args));

		return bb;
	}
	case PUSH_INUM_OP:
	{
		PushInumOp *o = (PushInumOp*)op;
		cctx->CreateCallImm(bb, "Push" + hsp->GetHSPCmdTypeName(TYPE_INUM), o->GetValue());
		return bb;
	}
	case PUSH_LABEL_OP:
	{
		PushLabelOp *o = (PushLabelOp*)op;
		cctx->CreateCallImm(bb, "Push" + hsp->GetHSPCmdTypeName(TYPE_LABEL), o->GetValue());
		return bb;
	}
	case PUSH_STR_OP:
	{
		PushStrOp *o = (PushStrOp*)op;
		Function *f = cctx->module->getFunction("Push" + hsp->GetHSPCmdTypeName(TYPE_STRING));

		std::vector<Value*> args;

		LoadInst *ld = builder.CreateLoad(cctx->dsBase, "base");
		Constant *constInt = ConstantInt::get(Type::getInt32Ty(Context), o->GetValue());
		Value *v = builder.CreateAdd(ld, constInt);
		Value *ptr = builder.CreateIntToPtr(v, TypeBuilder<types::i<8>*, false>::get(Context));
		args.push_back(ptr);

		builder.SetInsertPoint(bb);
		builder.CreateCall(f, makeArrayRef(args));

		return bb;
	}
	case PUSH_DEFAULT_OP:
	{
		cctx->CreateCallImm(bb, "PushDefault");
		return bb;
	}
	case PUSH_FUNC_PARAM_OP:
	{
		PushFuncPrmOp *o = (PushFuncPrmOp*)op;

		const STRUCTPRM *st = hsp->GetMInfo(o->GetVarNo());
		switch (st->mptype) {
		case MPTYPE_LOCALVAR:
			cctx->CreateCallImm(bb, "PushFuncPrm", o->GetPrmNo(), o->GetArrayDim());
			break;
		case MPTYPE_VAR:
		case MPTYPE_ARRAYVAR:
		case MPTYPE_SINGLEVAR:
			cctx->CreateCallImm(bb, "PushFuncPrm", o->GetPrmNo(), o->GetArrayDim());
			break;
		case MPTYPE_DNUM:
			cctx->CreateCallImm(bb, "PushFuncPrmD", o->GetPrmNo());
			break;
		case MPTYPE_INUM:
			cctx->CreateCallImm(bb, "PushFuncPrmI", o->GetPrmNo());
			break;

		default:
			cctx->CreateCallImm(bb, "PushFuncPrm1", o->GetPrmNo());
			break;
		}
		return bb;
	}
	case PUSH_FUNC_PARAM_PTR_OP:
	{
		PushFuncPrmPtrOp *o = (PushFuncPrmPtrOp*)op;

		cctx->CreateCallImm(bb, "PushFuncPAP", o->GetPrmNo(), o->GetArrayDim());
		return bb;
	}
	case PUSH_CMD_OP:
	{
		PushCmdOp *o = (PushCmdOp*)op;

		cctx->CreateCallImm(bb, "Push" + hsp->GetHSPCmdTypeName(o->GetCmdType()),
			o->GetCmdVal(), o->GetCmdPNum());
		return bb;
	}
	case PUSH_FUNC_END_OP:
	{
		PushFuncEndOp *o = (PushFuncEndOp*)op;

		cctx->CreateCallImm(bb, "PushFuncEnd");
		return bb;
	}
	case VAR_SET_OP:
	{
		VarSetOp *o = (VarSetOp*)op;

		Function *f = cctx->module->getFunction("VarSet");
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = cctx->GetValue(bb, o->GetVarId());
		if (!var) {
			Alert("mes");
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context),
			o->GetArrayDim()));
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context),
			o->GetCmdPNum()));

		builder.CreateCall(f, makeArrayRef(args));

		return bb;
	}
	case VAR_INC_OP:
	{
		VarIncOp *o = (VarIncOp*)op;

		Function *f = cctx->module->getFunction("VarInc");
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = cctx->GetValue(bb, o->GetVarId());
		if (!var) {
			Alert("mes");
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context),
			o->GetArrayDim()));

		builder.CreateCall(f, makeArrayRef(args));

		return bb;
	}
	case VAR_DEC_OP:
	{
		VarDecOp *o = (VarDecOp*)op;

		Function *f = cctx->module->getFunction("VarDec");
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = cctx->GetValue(bb, o->GetVarId());
		if (!var) {
			Alert("mes");
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context),
			o->GetArrayDim()));

		builder.CreateCall(f, makeArrayRef(args));

		return bb;
	}
	case VAR_CALC_OP:
	{
		VarCalcOp *o = (VarCalcOp*)op;

		Function *f = cctx->module->getFunction("VarCalc");
		const FunctionType *ft = f->getFunctionType();

		if (ft->getNumParams() != 3) {
			Alert("bad sig");
		}

		std::vector<Value*> args;

		Value *var = cctx->GetValue(bb, o->GetVarId());
		if (!var) {
			Alert("mes");
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context),
			o->GetArrayDim()));
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context),
			o->GetCalcOp()));

		builder.CreateCall(f, makeArrayRef(args));

		return bb;
	}
	case COMPARE_OP:
	{
		CompareOp *o = (CompareOp*)op;

		BasicBlock *thenBB = BasicBlock::Create(Context, "then", func);
		BasicBlock *elseBB = BasicBlock::Create(Context, "else", func);
		Value *ifRes = cctx->CreateCallImm(bb, "HspIf");
		Value *cond = builder.CreateICmpNE(ifRes,
			ConstantInt::get(Type::getInt8Ty(Context), 0));

		builder.CreateCondBr(cond, thenBB, elseBB);

		builder.SetInsertPoint(thenBB);
		cctx->CreateCallImm(thenBB, "TaskSwitch", o->GetNextTask());
		builder.CreateBr(retBB);
		task->returnBlocks.insert(thenBB);

		return elseBB;
	}
	case CMD_OP:
	{
		CmdOp *o = (CmdOp*)op;

		cctx->CreateCallImm(bb, hsp->GetHSPCmdTypeName(o->GetCmdType()),
			o->GetCmdVal(), o->GetCmdPNum());
		return bb;
	}
	case MODCMD_OP:
	{
		ModCmdOp *o = (ModCmdOp*)op;

		cctx->CreateCallImm(bb, hsp->GetHSPCmdTypeName(o->GetCmdType()),
			o->GetCmdVal(), o->GetCmdPNum());
		return bb;
	}
	default:
		Alert("Unknown op");
		return NULL;
	}
}

static void CompileTask(CHsp3Op *hsp, Task *task, Function *func, BasicBlock *retBB)
{
	auto cctx = task->cctx;
	auto& builder = cctx->builder;
	LLVMContext &context = cctx->context;

	std::map<VarId, int> varTypes;
	for (auto& var : task->block->usedVariables) {
		if (var.type() == TYPE_STRUCT) {
			try {
				const STRUCTPRM *st = hsp->GetMInfo(var.val());
				switch (st->mptype) {
				case MPTYPE_LOCALVAR:
				{
					varTypes[var] = HSPVAR_FLAG_MAX;
					break;
				}
				case MPTYPE_VAR:
				case MPTYPE_ARRAYVAR:
				case MPTYPE_SINGLEVAR:
				{
					PVal *pval = FuncPrm(var.prm());
					varTypes[var] = pval->flag;
					break;
				}
				case MPTYPE_DNUM:
				{
					varTypes[var] = HSPVAR_FLAG_DOUBLE;
					break;
				}
				case MPTYPE_INUM:
					varTypes[var] = HSPVAR_FLAG_INT;
					break;
				}
			}
			catch (HSPERROR e) {

				string funcname =
					(format("prm type error %1%_%2%")
					% var.type()
					% var.prm()).str();
				Alert((char*)funcname.c_str());
				throw e;
			}
		}
		else {
			varTypes[var] = mem_var[var.val()].flag;
		}
	}

	hsp->UpdateOpType(task->block, varTypes);

	string buf(GetTaskFuncName(task));

	for (auto op : task->block->operations) {
		switch (op->GetOpCode()) {
		case PUSH_VAR_OP:
		case PUSH_VAR_PTR_OP:
		case PUSH_DNUM_OP:
		case PUSH_INUM_OP:
		case PUSH_LABEL_OP:
		case PUSH_STR_OP:
		case PUSH_FUNC_END_OP:
		case PUSH_FUNC_PARAM_OP:
			break;

		case PUSH_CMD_OP:
			break;

		case CALC_OP:
			break;

		case VAR_INC_OP:
		case VAR_DEC_OP:
			break;

		case VAR_CALC_OP:
		case VAR_SET_OP:
		case COMPARE_OP:
			CheckCompileType(task, op, hsp, varTypes);
			break;
		case CMD_OP:
		case MODCMD_OP:
			CheckCompileType(task, op, hsp, varTypes);
			break;
		case TASK_SWITCH_OP:
			break;
		default:
			break;
		}
	}

	// ���W�X�^�Ɋ��蓖�Ă邩���f
	for (auto op : task->block->operations) {
		switch (op->GetOpCode()) {
		case PUSH_VAR_PTR_OP:
		case PUSH_VAR_OP:
		case VAR_SET_OP:
		case VAR_CALC_OP:
		case VAR_INC_OP:
		case VAR_DEC_OP:
		{
			VarRefOp* vrop = static_cast<VarRefOp*>(op);
			vrop->useRegister = false;
		}
			break;
		}
	}
	for (auto& var : task->block->usedVariables) {
		VarStatics *stat = sVarStatics[var];
		VarInfo *info = sProgram.varInfos[var];
		if (!info->localVar)
			continue;
		bool useRegister = true;
		for (auto op : task->block->operations) {
			switch (op->GetOpCode()) {
			case PUSH_VAR_PTR_OP:
			case PUSH_VAR_OP:
			case VAR_SET_OP:
			case VAR_CALC_OP:
			case VAR_INC_OP:
			case VAR_DEC_OP:
			{
				VarRefOp* vrop = (VarRefOp*)op;
				if (vrop->IsParam()) {
					useRegister = false;
				}
				else {
					if (vrop->GetVarNo() != var.val())
						continue;
					if (vrop->compile == DEFAULT)
						useRegister = false;
				}
			}
				break;
			}
		}
		for (auto op : task->block->operations) {
			switch (op->GetOpCode()) {
			case PUSH_VAR_PTR_OP:
			case PUSH_VAR_OP:
			case VAR_SET_OP:
			case VAR_CALC_OP:
			case VAR_INC_OP:
			case VAR_DEC_OP:
			{
				VarRefOp* vrop = static_cast<VarRefOp*>(op);
				if (vrop->GetVarNo() != var.val())
					continue;
				vrop->useRegister = useRegister;
			}
				break;
			}
		}
	}


	task->llVariables.clear();
	auto curBB = BasicBlock::Create(context,
		task->block->name + "_entry",
		func);
	task->entry = curBB;

	builder.SetInsertPoint(curBB);


	for (auto op : task->block->operations) {
		if (op->compile == DEFAULT) {
			curBB = GenerateDefaultCode(hsp, func, curBB, retBB, task, op);
		}
		else {
			curBB = CompileOp(hsp, func, curBB, retBB, task, op);
			if (!curBB) {
				Alert((char*)(buf + op->GetName()).c_str());
				return;
			}
		}
	}

	builder.SetInsertPoint(curBB);
	builder.CreateBr(retBB);
	task->returnBlocks.insert(curBB);
}

static void CompileTaskGeneral(CHsp3Op *hsp, Task *task, Function *func, BasicBlock *retBB)
{
	auto cctx = task->cctx;
	auto& builder = cctx->builder;
	LLVMContext &Context = cctx->context;

	std::map<VarId, int> varTypes;
	for (auto& var : task->block->usedVariables) {
		varTypes[var] = HSPVAR_FLAG_MAX;
	}

	hsp->UpdateOpType(task->block, varTypes);

	auto curBB = BasicBlock::Create(Context,
		task->block->name + "_entry",
		func);
	task->entry = curBB;

	builder.SetInsertPoint(curBB);

	for (auto op : task->block->operations) {
		curBB = GenerateDefaultCode(hsp, func, curBB, retBB, task, op);
	}

	builder.SetInsertPoint(curBB);
	builder.CreateBr(retBB);
	task->returnBlocks.insert(curBB);
}


static void ProfileTaskProc()
{
	int cur = GetCurTaskId();
	Task &task = *__Task[cur];
	Timer timer(&task);

	task.numCall++;
	task.funcPtr();
}

static void TraceTaskProc()
{
	int cur = GetCurTaskId();
	Task &task = *__Task[cur];
	Timer timer(&task);

	if (task.numChange > 5) {
#if HSP_PROFILE
		__HspTaskFunc[cur] = ProfileTaskProc;
#else
		__HspTaskFunc[cur] = task.funcPtr;
#endif
		task.funcPtr();
		return;
	}

	if (task.numCurCall > 1000) {// FIXME �^���ς��Ȃ����Ƃ��m�F���ׂ�
#if HSP_PROFILE
		__HspTaskFunc[cur] = ProfileTaskProc;
#else
		__HspTaskFunc[cur] = task.funcPtr;
#endif
		task.funcPtr();
		return;
	}

	auto cctx = task.cctx;
	auto& EE = cctx->EE;

	task.numCall++;

	bool change = false;
	auto varSize = task.block->usedVariables.size();
	for (auto i = 0; i < varSize; ++i) {
		auto& var = task.block->usedVariables[i];
		auto stat = task.varStatics[i];
		//VarStatics *stat = sVarStatics[var];

		switch (var.type()) {
		case TYPE_VAR:
		{
			PVal& pval = mem_var[var.val()];
			if (stat->tflag != pval.flag) {
				stat->num = 1;
				stat->change++;
				change = true;
			}
			else {
				stat->num++;
			}
			stat->tflag = pval.flag;
			break;
		}
		case TYPE_STRUCT:
		{
			break;
		}
		case TYPE_LABEL:
			break;
		default:
			break;
		}
	}
	if (!task.func) {

		task.func = task.createFunction([&](Function *func, BasicBlock *funcRet) {
			CompileTaskGeneral(hsp3, &task, func, funcRet);
		});

		string ErrMsg;
		if (verifyModule(*cctx->module, &raw_string_ostream(ErrMsg))) {
			Alert((char*)ErrMsg.c_str());
		}
		cctx->FPM->run(*task.func);
		cctx->Passes->run(*cctx->module);

		if (task.func) {
			task.funcPtr = (CHSP3_TASK)EE->getPointerToFunction(task.func);
		}
	}
	else if (change) {
		task.numChange++;
		task.numCurCall = 1;
		task.funcPtr = (CHSP3_TASK)EE->getPointerToFunction(task.func);
	}
	else {
		task.numCurCall++;
	}
	if (task.numCurCall == 10) {
		auto& builder = cctx->builder;

		task.spFunc = task.createFunction([&](Function *func, BasicBlock *funcRet) {
			CompileTask(hsp3, &task, func, funcRet);
		});

		if (printDebugDump) {
			auto fname = (format("dump_jit_%1$x.ll") % cur).str();
			DumpModule(fname.c_str(), *cctx->module);
		}

		string ErrMsg;
		if (verifyModule(*cctx->module, &raw_string_ostream(ErrMsg))) {
			Alert((char*)ErrMsg.c_str());
		}

		cctx->FPM->run(*task.spFunc);
		cctx->Passes->run(*cctx->module);
		//Passes->run(*cctx->module);

		if (printDebugDump) {
			auto fname = (format("dump_jit_opt_%1$x.ll") % cur).str();
			DumpModule(fname.c_str(), *cctx->module);
		}

		if (task.spFunc) {
			task.funcPtr = (CHSP3_TASK)EE->getPointerToFunction(task.spFunc);
		}
	}

	task.funcPtr();
}

void DumpResult()
{
	char buf[256];

	string ErrorInfo;
	std::auto_ptr<raw_fd_ostream>
		Out(new raw_fd_ostream("dump.txt", ErrorInfo,
		sys::fs::F_None));

	for (int i = 0; i < sLabMax + 1; i++) {
		if (!__Task[i])
			continue;

		Task &task = *__Task[i];

		sprintf(buf, "%s call:%d cur:%d change:%d time:%lld\r\n",
			task.block->name.c_str(),
			task.numCall, task.numCurCall, task.numChange, task.time);
		*Out << buf;

		for (auto& var : task.block->usedVariables) {
			VarStatics *stat = sVarStatics[var];
			VarInfo *info = sProgram.varInfos[var];
			switch (var.type()) {
			case TYPE_VAR:
				sprintf(buf, "\tvar%d type %d, num %d, change %d local %d\r\n",
					var.val(), stat->tflag, stat->num, stat->change,
					(int)info->localVar);
				*Out << buf;
				break;
			default:
				sprintf(buf, "\t%d\r\n", var.type());
				*Out << buf;
				break;
			}
		}
	}
}


void __HspInit(Hsp3r *hsp3r)
{
	sHsp3r = hsp3r;
	hsp3r->Reset(sMaxVar, sMaxHpi);

}

void __HspSetup(Hsp3r *hsp3r)
{
	Var__HspVars = new PVal*[sMaxVar];

	for (int i = 0; i < sMaxVar; i++) {
		Var__HspVars[i] = mem_var + i;
	}

	if (sLabMax > 0) {
		__HspTaskFunc = new CHSP3_TASK[sLabMax];
	}

	if (printDebugDump) {
		Alert("HspSetup");
	}
	for (int i = 0; i < sLabMax + 1; i++) {
		if (!__Task[i]) {
			__HspTaskFunc[i] = NULL;
		}
		else {
			Task &task = *__Task[i];
			//__Task[i] = task;
			task.setup();

			if (printDebugDump) {
				auto fname = (format("dump_%1$x.ll") % i).str();
				DumpModule(fname.c_str(), *task.cctx->module);
			}

			task.funcPtr = (CHSP3_TASK)task.cctx->EE->getPointerToFunction(task.func);
			__HspTaskFunc[i] = TraceTaskProc;//task.funcPtr;
		}
	}
}

void __HspEntry(void)
{
	sHspctx = &sHsp3r->hspctx;

	Task &task = *__Task[sLabMax];

	void *fp = task.cctx->EE->getPointerToFunction(task.func);
	CHSP3_TASK t = (CHSP3_TASK)fp;
	t();
}

void Task::setup()
{
	cctx = new CompileContext(hsp3);

	func = createFunction([&](Function *func, BasicBlock *funcRet) {
		CompileTaskGeneral(hsp3, this, func, funcRet);
	});

	string ErrMsg;
	if (verifyModule(*cctx->module, &raw_string_ostream(ErrMsg))) {
		Alert((char*)ErrMsg.c_str());
	}
	cctx->FPM->run(*func);
	cctx->Passes->run(*cctx->module);
}

int MakeSource(CHsp3Op *hsp, int option, void *ref)
{
	InitializeNativeTarget();

	//	�R���p�C������
	//
	sMaxVar = hsp->GetHSPHed()->max_val;
	sMaxHpi = hsp->GetHSPHed()->max_hpi;

	//		�^�X�N(���x��)�e�[�u�����쐬����
	//
	sLabMax = hsp->GetLabMax();
	sDsBasePtr = hsp->GetDS(0);

	sProgram.blocks = hsp->GetBlocks();
	sProgram.entryPoint = sProgram.blocks["__HspEntry"];
	AnalyzeProgram(&sProgram);

	__Task.resize(sLabMax + 1);
	for (auto it = sProgram.blocks.begin(); it != sProgram.blocks.end(); ++it) {
		Task *task = new Task(it->second);
		__Task[task->block->id] = task;
		task->varStatics.resize(task->block->usedVariables.size());
		for (auto i = 0; i < task->block->usedVariables.size(); i++) {
			auto& var = task->block->usedVariables[i];
			if (sVarStatics.find(var) == sVarStatics.end()) {
				sVarStatics[var] = new VarStatics();
			}
			task->varStatics[i] = sVarStatics[var];
		}
	}

	// ���ʂ��_���v
	//
	if (printDebugDump) {
		std::ofstream out("dump2.txt");
		std::map<VarId, int> varTypes;

		for (int i = 0; i < sLabMax + 1; i++) {
			if (!__Task[i])
				continue;

			Task &task = *__Task[i];
			for (auto& v : task.block->usedVariables) {
				varTypes[v] = HSPVAR_FLAG_MAX;
			}
			hsp->UpdateOpType(task.block, varTypes);
			out << "#" << task.block->name << std::endl;
			PrettyPrint(out, task.block);
		}
	}
	return 0;
}
