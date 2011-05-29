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

#include "llvm/LLVMContext.h"
#include "llvm/Module.h"
#include "llvm/Constants.h"
#include "llvm/DerivedTypes.h"
#include "llvm/Instructions.h"
#include "llvm/PassManager.h"
#include "llvm/Assembly/Parser.h"
#include "llvm/Analysis/Verifier.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/ExecutionEngine/JIT.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/Target/TargetData.h"
#include "llvm/Target/TargetSelect.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TypeBuilder.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/IRBuilder.h"

#include "llvm/Analysis/Dominators.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/Analysis/Verifier.h"
#include "llvm/Transforms/IPO.h"
#include "llvm/Support/StandardPasses.h"

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
	Block *block;
	Function *func;
	Function *spFunc;
	CHSP3_TASK funcPtr;
	BasicBlock *entry;
	int numCall;
	int numCurCall;
	int numChange;
	long long time;
	std::map<VarId, Value*> llVariables;
	std::set<BasicBlock*> returnBlocks;

	std::set<Task*> incoming;
	std::set<Task*> outgoing;

	bool useGeneralFunc;
	bool skipTypeCheck;

	Task() : numCall(0), numCurCall(0), numChange(0), time(0),
			 useGeneralFunc(true), skipTypeCheck(false)
	{
	}
};

class Timer {
	Task* task;
	LARGE_INTEGER start;
public:
	explicit Timer(Task* t) : task(t) {
		QueryPerformanceCounter( &start );
	}
	~Timer() {
		LARGE_INTEGER end;
		QueryPerformanceCounter( &end );
		task->time += end.QuadPart - start.QuadPart;
	}
};

typedef int (* CHSP3_FUNC) (int);

static std::map<VarId, VarStatics*> sVarStatics;
static Program sProgram;

// Runtime
CHSP3_TASK *__HspTaskFunc;
boost::ptr_vector<Task> __Task;
static GlobalVariable **sVariables;
static GlobalVariable *sDsBase;
static const char *sDsBasePtr;

static CompileContext *sCC;

static ExecutionEngine *EE;
static FunctionPassManager *TheFPM;
static PassManager *Passes;

static int sMaxVar;
static int sMaxHpi;
static int sLabMax;
static HSPCTX *sHspctx;
static Hsp3r *sHsp3r;
static PVal **Var__HspVars;

extern int GetCurTaskId();
extern void HspVarCoreArray2( PVal *pval, int offset );
extern CHsp3Op *hsp3;

static BasicBlock *CompileOp( CHsp3Op *hsp, Function *func,
							  BasicBlock *bb, BasicBlock *retBB,
							  Task *task, Op *op );
static BasicBlock *GenerateDefaultCode( CHsp3Op *hsp, Function *func,
										BasicBlock *bb, BasicBlock *retBB,
										Task *task, Op *op );

static void RecompileModule();

extern void UpdateOperands( Block *block );
extern void AnalyzeTask( Block *block );


static string GetTaskFuncName( const Task *task )
{
	return ( format( "%1%_%2%" ) % task->block->name % task->numCall ).str();
}

static VarStatics *GetTaskVar( Task *task, const VarId& id )
{
	if ( task->block->usedVariables.find( id ) != task->block->usedVariables.end() )
		return sVarStatics[id];
	else
		return NULL;
}

static bool IsCompilable( Task *task, Op *op, CHsp3Op *hsp )
{
	switch ( op->GetOpCode() ) {
	case PUSH_VAR_OP:
		{
			PushVarOp *pv = (PushVarOp*)op;
			const VarId &varId = pv->GetVarId();
			VarStatics *var = GetTaskVar( task, varId );
			PVal& pval = mem_var[varId.val()];
			//changed |= op->flag == pval.flag;
			//op->flag = pval.flag;

			for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
				if ( op->operands[i]->flag != HSPVAR_FLAG_INT )
					return false;
			}

			if (pval.flag == TYPE_INUM || pval.flag == HSPVAR_FLAG_DOUBLE) {
				//return pv->GetArrayDim() == 0;
				return true;
			}
		}
		break;
	case PUSH_VAR_PTR_OP:
		{
			PushVarPtrOp *pv = (PushVarPtrOp*)op;
			const VarId &varId = pv->GetVarId();
			VarStatics *var = GetTaskVar( task, varId );
			PVal& pval = mem_var[varId.val()];
			//changed |= op->flag == pval.flag;
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
			const STRUCTPRM *st = hsp->GetMInfo( prmop->GetVarNo() );
			switch( st->mptype ) {
			case MPTYPE_LOCALVAR:
				break;
			case MPTYPE_VAR:
			case MPTYPE_ARRAYVAR:
			case MPTYPE_SINGLEVAR:
/*
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					if ( op->operands[i]->flag != HSPVAR_FLAG_INT )
						return false;
				}
				if (pval.flag == TYPE_INUM || pval.flag == HSPVAR_FLAG_DOUBLE) {
					return true;
				}
*/
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
			for ( op_list::iterator it=op->operands.begin();
				  it != op->operands.end(); it++ ) {

				if ( (*it)->flag != HSPVAR_FLAG_INT
					 && (*it)->flag != HSPVAR_FLAG_DOUBLE
					 && (*it)->GetOpCode() != PUSH_FUNC_END_OP ) {
					return false;
				}

				if ( !IsCompilable( task, *it, hsp ) ) {
					return false;
				}
			}
			int retType = GetFuncTypeRet(  pcop->GetCmdType(),  pcop->GetCmdVal(), pcop->GetCmdPNum() );
			return retType == HSPVAR_FLAG_INT || retType == HSPVAR_FLAG_DOUBLE;
		}
		break;

	case CALC_OP:
		{
			CalcOp *calc = (CalcOp*)op;
			if ((op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_INT)
				|| (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE)) {
				return IsCompilable( task, op->operands[0], hsp ) &&
					IsCompilable( task, op->operands[1], hsp );
			}
			if ((op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE)
				|| (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_INT)) {
				return IsCompilable( task, op->operands[0], hsp ) &&
					IsCompilable( task, op->operands[1], hsp );
			}
		}
		break;

	case VAR_INC_OP:
	case VAR_DEC_OP:
		break;

	case VAR_CALC_OP:
		{
			VarCalcOp *vs = (VarCalcOp*)op;
			const VarId &varId = vs->GetVarId();
			VarStatics *var = GetTaskVar( task, varId );
			PVal& pval = mem_var[varId.val()];

			if ( vs->GetArrayDim() == 0 && op->operands.size() == 1 ) {
				if ( !IsCompilable( task, op->operands[0], hsp ) )
					return false;

				if ( (op->operands[0]->flag == HSPVAR_FLAG_INT || op->operands[0]->flag == HSPVAR_FLAG_DOUBLE)
					 && (pval.flag == HSPVAR_FLAG_INT || pval.flag == HSPVAR_FLAG_DOUBLE)) {
					return true;
				}
			}
		}
		break;
	case VAR_SET_OP:
		{
			VarSetOp *vs = (VarSetOp*)op;
			const VarId &varId = vs->GetVarId();
			VarStatics *var = GetTaskVar( task, varId );
			PVal& pval = mem_var[varId.val()];

			if ( vs->GetArrayDim() == 0 && op->operands.size() == 1 ) {
				if ( IsCompilable( task, op->operands[0], hsp ) &&
					 op->operands[0]->flag == pval.flag ) {
					return true;
				}
			}
		}
		break;
	case COMPARE_OP:
		{
			CompareOp *comp = (CompareOp*)op;
			if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
				return IsCompilable( task, op->operands[0], hsp );
			}
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
	return false;
}

static void MarkCompile( Op *op, COMPILE_TYPE comp )
{
	for ( op_list::iterator it=op->operands.begin();
		  it != op->operands.end(); it++ ) {
		(*it)->compile = comp;
		MarkCompile( *it, comp );
	}
}

static void CheckType( CHsp3Op *hsp, Task *task,
					   const std::map<VarId, int>& varTypes)
{
	for ( op_list::iterator it=task->block->operations.begin();
		  it != task->block->operations.end(); it++ ) {
		Op *op = *it;
		op->compile = DEFAULT;
		op->flag = HSPVAR_FLAG_MAX;
	}

	for ( op_list::iterator it=task->block->operations.begin();
		  it != task->block->operations.end(); it++ ) {
		Op *op = *it;

		switch ( op->GetOpCode() ) {
		case PUSH_VAR_OP:
		{
			const VarId &varId = ((PushVarOp*)op)->GetVarId();
			op->flag = varTypes.find(varId)->second;
			break;
		}
		case PUSH_VAR_PTR_OP:
		{
			const VarId &varId = ((PushVarPtrOp*)op)->GetVarId();
			op->flag = varTypes.find(varId)->second;
			break;
		}
		case PUSH_DNUM_OP:
			op->flag = HSPVAR_FLAG_DOUBLE;
			break;
		case PUSH_INUM_OP:
			op->flag = HSPVAR_FLAG_INT;
			break;
		case PUSH_LABEL_OP:
			op->flag = HSPVAR_FLAG_LABEL;
			break;
		case PUSH_STR_OP:
			op->flag = HSPVAR_FLAG_STR;
			break;
		case PUSH_FUNC_END_OP:
		case PUSH_FUNC_PARAM_PTR_OP:
			break;
		case PUSH_FUNC_PARAM_OP:
		{
			PushFuncPrmOp *prmop = (PushFuncPrmOp*)op;
			const STRUCTPRM *st = hsp->GetMInfo( prmop->GetVarNo() );
			switch( st->mptype ) {
			case MPTYPE_LOCALVAR:
				break;
			case MPTYPE_VAR:
			case MPTYPE_ARRAYVAR:
			case MPTYPE_SINGLEVAR:
				//op->flag = varTypes[varId];
				break;
			case MPTYPE_DNUM:
				op->flag = HSPVAR_FLAG_DOUBLE;
				break;
			case MPTYPE_INUM:
				op->flag = HSPVAR_FLAG_INT;
				break;
			}
			break;
		}
		case PUSH_CMD_OP:
		{
			PushCmdOp *pcop = (PushCmdOp*)op;
			int retType = GetFuncTypeRet( pcop->GetCmdType(),
										  pcop->GetCmdVal(),
										  pcop->GetCmdPNum() );
			op->flag = retType;
			break;
		}
		case CALC_OP:
		{
			CalcOp *calc = (CalcOp*)op;
			int tflag = GetOpTypeRet( calc->GetCalcOp(),
									  op->operands[1]->flag,
									  op->operands[0]->flag );
			op->flag = tflag;
		}
		break;

		case VAR_INC_OP:
		case VAR_DEC_OP:
			break;

		case VAR_CALC_OP:
			break;
		case VAR_SET_OP:
			break;
		case COMPARE_OP:
			break;
		case CMD_OP:
			break;
		case MODCMD_OP:
			break;
		case TASK_SWITCH_OP:
			break;
		default:
			break;
		}
	}
}

static BasicBlock *CompileOp( CHsp3Op *hsp, Function *func, BasicBlock *bb, BasicBlock *retBB, Task *task, Op *op )
{
	LLVMContext &Context = getGlobalContext();
	sCC->Builder.SetInsertPoint( bb );

	const Type *tyPI8 = TypeBuilder<types::i<8>*, false>::get(Context);
	const Type *tyPI32 = TypeBuilder<types::i<32>*, false>::get(Context);
	const Type *tyPD = TypeBuilder<types::ieee_double*, false>::get(Context);

	switch ( op->GetOpCode() ) {
	case PUSH_VAR_OP:
		{
			PushVarOp *pv = (PushVarOp*)op;
			const VarId &varId = pv->GetVarId();
			VarStatics *var = GetTaskVar( task, varId );
			PVal& pval = mem_var[varId.val()];
			Value *lpvar;
			string varname(hsp->MakeImmidiateCPPVarName( pv->GetVarType(), pv->GetVarNo() ));

			std::map<VarId, Value*>::iterator it
				= task->llVariables.find( pv->GetVarId() );

			if ( pv->useRegister) {
				op->llValue = it->second;

				Function *pNop = sCC->M->getFunction( "Nop" );
				sCC->Builder.SetInsertPoint( bb );
				sCC->Builder.CreateCall( pNop );
				return bb;
			}

			if ( it != task->llVariables.end() ) {
				lpvar = it->second;
			} else {
				lpvar = sCC->MakeImmidiateCPPName( hsp, bb, pv->GetVarType(),
												   pv->GetVarNo(), pv->GetPrmNo() );
			}
			task->llVariables[pv->GetVarId()] = lpvar;

			Value *lpval = sCC->Builder.CreateConstGEP2_32( lpvar, 0, 4, "a_" + varname );
			LoadInst *lptr = sCC->Builder.CreateLoad( lpval, "b_" + varname );
			Value *ptr;
			if ( pval.flag == HSPVAR_FLAG_INT ) {
				ptr = sCC->Builder.CreateBitCast( lptr, tyPI32, "c_" + varname );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				ptr = sCC->Builder.CreateBitCast( lptr, tyPD, "d_" + varname );
			} else {
				return NULL;
			}

			Value *aptr;
			BasicBlock *curBB;
			if ( pv->GetArrayDim() == 0) {
				aptr = ptr;
				curBB = bb;
			} else {
				curBB = bb;
				sCC->Builder.SetInsertPoint( curBB );
				Function *pReset = sCC->M->getFunction( "HspVarCoreReset" );
				sCC->Builder.CreateCall( pReset, lpvar );

				Function *pArray2 = sCC->M->getFunction( "HspVarCoreArray2" );
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					sCC->Builder.CreateCall2( pArray2, lpvar,
										 static_cast<Value*>(pv->operands[i]->llValue ));
				}
				Value *lpofs = sCC->Builder.CreateConstGEP2_32( lpvar, 0, 8 );
				LoadInst *lofs = sCC->Builder.CreateLoad( lpofs, "offset_" + varname );
				aptr = sCC->Builder.CreateGEP( ptr, lofs );
			}

			//Value *lpval = sCC->Builder.CreateConstGEP2_32( lpvar, 0, 4 );

			if ( pval.flag == HSPVAR_FLAG_INT ) {
				op->llValue = sCC->Builder.CreateLoad( aptr, "p_" + varname );
				return curBB;
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				op->llValue = sCC->Builder.CreateLoad( aptr, "p_" + varname );
				return curBB;
			} else {
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
			op->llValue = ConstantFP::get( Type::getDoubleTy( Context ), pd->GetValue() );
			return bb;
		}
	case PUSH_INUM_OP:
		{
			PushInumOp *pi = (PushInumOp*)op;
			op->llValue = ConstantInt::get( Type::getInt32Ty( Context ), pi->GetValue() );
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
			const STRUCTPRM *st = hsp->GetMInfo( prmop->GetVarNo() );
			switch( st->mptype ) {
			case MPTYPE_LOCALVAR:
				break;
			case MPTYPE_VAR:
			case MPTYPE_ARRAYVAR:
			case MPTYPE_SINGLEVAR:
				break;
			case MPTYPE_DNUM:
				op->llValue = sCC->CreateCallImm( bb, "FuncPrmD",
												  prmop->GetPrmNo() );
				return bb;
			case MPTYPE_INUM:
				op->llValue = sCC->CreateCallImm( bb, "FuncPrmI",
												  prmop->GetPrmNo() );
				return bb;
			}
			return NULL;
		}
		break;

	case PUSH_CMD_OP:
		{
			PushCmdOp *pcop = (PushCmdOp*)op;
			string funcname =
				( format( "llvmRt%1%_%2$03x" )
				  % hsp->GetHSPCmdTypeName( pcop->GetCmdType() )
				  % pcop->GetCmdVal() ).str();
			Function *f = sCC->M->getFunction( funcname );
			if ( f ) {
				if ( f->getArgumentList().size() != op->operands.size() - 1 )
					goto NOTMATCH;
				int n = 0;
				for ( Function::const_arg_iterator it = f->arg_begin();
					  it != f->arg_end(); ++it, ++n ) {
					const Type *t = it->getType();

					switch ( op->operands[n]->flag ) {
					case HSPVAR_FLAG_INT:
						if ( !t->isIntegerTy( 32 ) )
							goto NOTMATCH;
						break;
					case HSPVAR_FLAG_DOUBLE:
						if (!t->isDoubleTy() )
							goto NOTMATCH;
						break;
					default:
						goto NOTMATCH;
					}
				}

				{
					std::vector<Value*> args;
					for ( int i = 0; i < op->operands.size() - 1; ++i ) {
						args.push_back( static_cast<Value*>(op->operands[i]->llValue) );
					}
					op->llValue = sCC->Builder.CreateCall( f, args.begin(), args.end() );
					return bb;
				}

			NOTMATCH:
				;
			}

			int retType = GetFuncTypeRet( pcop->GetCmdType(),
										  pcop->GetCmdVal(),
										  pcop->GetCmdPNum() );

			for ( op_list::reverse_iterator it=op->operands.rbegin();
				  it != op->operands.rend(); it++ ) {
				//(*it)->compile = true;
				if ( (*it)->GetOpCode() == PUSH_FUNC_END_OP ) {
					sCC->CreateCallImm( bb, "PushFuncEnd" );
					continue;
				}

				switch ( (*it)->flag ) {
				case HSPVAR_FLAG_INT:
					{
						Function *pPush = sCC->M->getFunction( "PushInt" );
						sCC->Builder.CreateCall( pPush, static_cast<Value*>((*it)->llValue) );
					}
					break;
				case HSPVAR_FLAG_DOUBLE:
					{
						Function *pPush = sCC->M->getFunction( "PushDouble" );
						sCC->Builder.CreateCall( pPush, static_cast<Value*>((*it)->llValue) );
					}
					break;
				default:
					return NULL;
				}
			}

			switch( retType ) {
			case HSPVAR_FLAG_DOUBLE:
				op->llValue = sCC->CreateCallImm( bb, "CallDouble" + hsp->GetHSPCmdTypeName( pcop->GetCmdType() ),
												  pcop->GetCmdVal(), pcop->GetCmdPNum() );
				return bb;
			case HSPVAR_FLAG_INT:
				op->llValue = sCC->CreateCallImm( bb, "CallInt" + hsp->GetHSPCmdTypeName( pcop->GetCmdType() ),
												  pcop->GetCmdVal(), pcop->GetCmdPNum() );
				return bb;
			default:
				return NULL;
			}
			break;
		}

	case CALC_OP:
		{
			CalcOp *calc = (CalcOp*)op;
			if ( op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_INT ) {
				op->llValue = sCC->CreateCalcI( calc->GetCalcOp(),
												static_cast<Value*>(op->operands[1]->llValue),
												static_cast<Value*>(op->operands[0]->llValue) );
			} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE ) {
				op->llValue = sCC->CreateCalcD( calc->GetCalcOp(),
												static_cast<Value*>(op->operands[1]->llValue),
												static_cast<Value*>(op->operands[0]->llValue) );
			} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_INT ) {
				Value *v = sCC->Builder.CreateFPToSI( static_cast<Value*>(op->operands[0]->llValue),
												TypeBuilder<types::i<32>, false>::get(Context) );
				op->llValue = sCC->CreateCalcI( calc->GetCalcOp(),
												static_cast<Value*>(op->operands[1]->llValue),
												v );
			} else if ( op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE ) {
				Value *v = sCC->Builder.CreateSIToFP( static_cast<Value*>(op->operands[0]->llValue),
												 TypeBuilder<types::ieee_double, false>::get(Context) );
				op->llValue = sCC->CreateCalcD( calc->GetCalcOp(),
												static_cast<Value*>(op->operands[1]->llValue) ,
												v );
			}
			if ( op->llValue == NULL )
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
			VarStatics *var = GetTaskVar( task, varId );
			PVal& pval = mem_var[varId.val()];

			if ( vs->useRegister) {
				std::map<VarId, Value*>::iterator it
					= task->llVariables.find( vs->GetVarId() );

				if ( pval.flag == HSPVAR_FLAG_INT ) {
					Value *rhs;
					if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
						rhs = static_cast<Value*>(op->operands[0]->llValue);
					} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE ) {
						rhs = sCC->Builder.CreateFPToSI( static_cast<Value*>(op->operands[0]->llValue),
													TypeBuilder<types::i<32>, false>::get(Context) );
					} else {
						return NULL;
					}
					Value *result = sCC->CreateCalcI( vs->GetCalcOp(),
													  it->second, rhs );
					if ( !result )
						return NULL;
					op->llValue = result;
				} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
					Value *rhs;
					if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE ) {
						rhs = static_cast<Value*>(op->operands[0]->llValue);
					} else if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
						rhs = sCC->Builder.CreateSIToFP( static_cast<Value*>(op->operands[0]->llValue),
													TypeBuilder<types::ieee_double, false>::get(Context) );
					} else {
						return NULL;
					}

					Value *result = sCC->CreateCalcD( vs->GetCalcOp(),
													  it->second, rhs );
					if ( !result )
						return NULL;
					op->llValue = result;
				} else {
					return NULL;
				}
				task->llVariables[ vs->GetVarId() ] = static_cast<Value*>(op->llValue);

				Function *pNop = sCC->M->getFunction( "Nop" );
				sCC->Builder.SetInsertPoint( bb );
				sCC->Builder.CreateCall( pNop );

				return bb;
			}

			Value *lpvar = sCC->MakeImmidiateCPPName( hsp, bb, vs->GetVarType(),
													  vs->GetVarNo(), vs->GetPrmNo() );
			Value *lpval = sCC->Builder.CreateConstGEP2_32( lpvar, 0, 4 );
			LoadInst *lptr = sCC->Builder.CreateLoad( lpval, "ptr" );

			if ( pval.flag == HSPVAR_FLAG_INT ) {
				Value *lp = sCC->Builder.CreateBitCast( lptr, tyPI32 );
				Value *lhs = sCC->Builder.CreateLoad( lp );
				Value *rhs;
				if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
					rhs = static_cast<Value*>(op->operands[0]->llValue);
				} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE ) {
					rhs = sCC->Builder.CreateFPToSI( static_cast<Value*>(op->operands[0]->llValue),
												TypeBuilder<types::i<32>, false>::get(Context) );
				} else {
					return NULL;
				}

				Value *result = sCC->CreateCalcI( vs->GetCalcOp(), lhs, rhs );
				if ( !result )
					return NULL;
				op->llValue = sCC->Builder.CreateStore( result, lp );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				Value *lp = sCC->Builder.CreateBitCast( lptr, tyPD );
				Value *lhs = sCC->Builder.CreateLoad( lp );
				Value *rhs;
				if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE ) {
					rhs = static_cast<Value*>(op->operands[0]->llValue);
				} else if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
					rhs = sCC->Builder.CreateSIToFP( static_cast<Value*>(op->operands[0]->llValue),
												TypeBuilder<types::ieee_double, false>::get(Context) );
				} else {
					return NULL;
				}

				Value *result = sCC->CreateCalcD( vs->GetCalcOp(), lhs, rhs );
				if ( !result )
					return NULL;
				op->llValue = sCC->Builder.CreateStore( result, lp );
			} else {
				return NULL;
			}
			return bb;
		}
		break;
	case VAR_SET_OP:
		{
			VarSetOp *vs = (VarSetOp*)op;
			const VarId &varId = vs->GetVarId();
			VarStatics *var = GetTaskVar( task, varId );
			PVal& pval = mem_var[varId.val()];

			if ( vs->useRegister) {
				op->llValue = op->operands[0]->llValue;
				task->llVariables[ vs->GetVarId() ] = static_cast<Value*>(op->llValue);

				Function *pNop = sCC->M->getFunction( "Nop" );
				sCC->Builder.SetInsertPoint( bb );
				sCC->Builder.CreateCall( pNop );

				return bb;
			}

			Value *lpvar = sCC->MakeImmidiateCPPName( hsp, bb, vs->GetVarType(),
													  vs->GetVarNo(), vs->GetPrmNo() );
			Value *lpval = sCC->Builder.CreateConstGEP2_32( lpvar, 0, 4 );
			LoadInst *lptr = sCC->Builder.CreateLoad( lpval, "ptr" );

			if ( pval.flag == HSPVAR_FLAG_INT ) {
				Value *lp = sCC->Builder.CreateBitCast( lptr, tyPI32 );
				op->llValue = sCC->Builder.CreateStore( static_cast<Value*>(op->operands[0]->llValue), lp );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				Value *lp = sCC->Builder.CreateBitCast( lptr, tyPD );
				op->llValue = sCC->Builder.CreateStore( static_cast<Value*>(op->operands[0]->llValue), lp );
			} else {
				return NULL;
			}
			return bb;
		}
		break;
	case COMPARE_OP:
		{
			CompareOp *comp = (CompareOp*)op;

			sCC->Builder.SetInsertPoint( bb );

			BasicBlock *thenBB = BasicBlock::Create( Context, "then", func );
			BasicBlock *elseBB = BasicBlock::Create( Context, "else", func );


			Value *cond = sCC->Builder.CreateICmpEQ( static_cast<Value*>(op->operands[0]->llValue),
											   ConstantInt::get( Type::getInt32Ty( Context ), 0 ) );
			sCC->Builder.CreateCondBr( cond, thenBB, elseBB );

			sCC->Builder.SetInsertPoint( thenBB );
			sCC->CreateCallImm( thenBB, "TaskSwitch", comp->GetNextTask() );
			sCC->Builder.CreateBr( retBB );
			task->returnBlocks.insert( thenBB );

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

static BasicBlock *GenerateDefaultCode( CHsp3Op *hsp, Function *func,
										BasicBlock *bb, BasicBlock *retBB, Task *task, Op *op )
{
	LLVMContext &Context = getGlobalContext();
	sCC->Builder.SetInsertPoint( bb );

	switch ( op->GetOpCode() ) {
	case TASK_SWITCH_OP:
	{
		TaskSwitchOp *o = (TaskSwitchOp*)op;
		sCC->CreateCallImm( bb, "TaskSwitch", o->GetNextTask() );
		return bb;
	}
	case CALC_OP:
	{
		CalcOp *o = (CalcOp*)op;
		sCC->CreateCallImm( bb, "Calc" + hsp->GetHSPOperator2( o->GetCalcOp() ) );
		return bb;
	}
	case PUSH_VAR_OP:
	{
		PushVarOp *o = (PushVarOp*)op;
		Function* f = sCC->M->getFunction( "PushVar" );

		std::vector<Value*> args;
		Value *var = sCC->MakeImmidiateCPPName( hsp, bb, TYPE_VAR,
												o->GetVarNo(), o->GetPrmNo() );
		if (!var)
			Alert( "varname" );
		args.push_back( var );
		args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
										 o->GetArrayDim() ));

		sCC->Builder.SetInsertPoint( bb );
		sCC->Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
	case PUSH_VAR_PTR_OP:
	{
		PushVarPtrOp *o = (PushVarPtrOp*)op;
		Function *f = sCC->M->getFunction( "PushVAP" );

		std::vector<Value*> args;
		Value *var = sCC->MakeImmidiateCPPName( hsp, bb, TYPE_VAR,
												o->GetVarNo(), o->GetPrmNo() );
		if (!var)
			Alert( "varname" );
		args.push_back(var);
		args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
										 o->GetArrayDim() ));

		sCC->Builder.SetInsertPoint( bb );
		sCC->Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
	case PUSH_DNUM_OP:
	{
		PushDnumOp *o = (PushDnumOp*)op;
		Function *f = sCC->M->getFunction("Push" + hsp->GetHSPCmdTypeName( TYPE_DNUM ));

		std::vector<Value*> args;
		args.push_back(ConstantFP::get( Type::getDoubleTy( Context ), o->GetValue() ));

		sCC->Builder.SetInsertPoint( bb );
		sCC->Builder.CreateCall( f, args.begin(), args.end() );

		return bb;
	}
	case PUSH_INUM_OP:
	{
		PushInumOp *o = (PushInumOp*)op;
		sCC->CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName( TYPE_INUM ), o->GetValue() );
		return bb;
	}
	case PUSH_LABEL_OP:
	{
		PushLabelOp *o = (PushLabelOp*)op;
		sCC->CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName( TYPE_LABEL ), o->GetValue() );
		return bb;
	}
	case PUSH_STR_OP:
	{
		PushStrOp *o = (PushStrOp*)op;
		Function *f = sCC->M->getFunction("Push" + hsp->GetHSPCmdTypeName( TYPE_STRING ));

		std::vector<Value*> args;

		LoadInst *ld = sCC->Builder.CreateLoad( sDsBase, "base" );
		Constant *constInt = ConstantInt::get(Type::getInt32Ty( Context ), o->GetValue());
		Value *v = sCC->Builder.CreateAdd( ld, constInt );
		Value *ptr = sCC->Builder.CreateIntToPtr(v, TypeBuilder<types::i<8>*, false>::get(Context));
		args.push_back(ptr);

		sCC->Builder.SetInsertPoint( bb );
		sCC->Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
	case PUSH_DEFAULT_OP:
	{
		sCC->CreateCallImm( bb, "PushDefault" );
		return bb;
	}
	case PUSH_FUNC_PARAM_OP:
	{
		PushFuncPrmOp *o = (PushFuncPrmOp*)op;

		const STRUCTPRM *st = hsp->GetMInfo( o->GetVarNo() );
		switch( st->mptype ) {
		case MPTYPE_LOCALVAR:
			sCC->CreateCallImm( bb, "PushFuncPrm", o->GetPrmNo(), o->GetArrayDim() );
			break;
		case MPTYPE_VAR:
		case MPTYPE_ARRAYVAR:
		case MPTYPE_SINGLEVAR:
			sCC->CreateCallImm( bb, "PushFuncPrm", o->GetPrmNo(), o->GetArrayDim() );
			break;
		case MPTYPE_DNUM:
			sCC->CreateCallImm( bb, "PushFuncPrmD", o->GetPrmNo() );
			break;
		case MPTYPE_INUM:
			sCC->CreateCallImm( bb, "PushFuncPrmI", o->GetPrmNo() );
			break;

		default:
			sCC->CreateCallImm( bb, "PushFuncPrm1", o->GetPrmNo() );
			break;
		}
		return bb;
	}
	case PUSH_FUNC_PARAM_PTR_OP:
	{
		PushFuncPrmPtrOp *o = (PushFuncPrmPtrOp*)op;

		sCC->CreateCallImm( bb, "PushFuncPAP", o->GetPrmNo(), o->GetArrayDim() );
		return bb;
	}
	case PUSH_CMD_OP:
	{
		PushCmdOp *o = (PushCmdOp*)op;

		sCC->CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName( o->GetCmdType() ),
							o->GetCmdVal(), o->GetCmdPNum() );
		return bb;
	}
	case PUSH_FUNC_END_OP:
	{
		PushFuncEndOp *o = (PushFuncEndOp*)op;

		sCC->CreateCallImm( bb, "PushFuncEnd" );
		return bb;
	}
	case VAR_SET_OP:
	{
		VarSetOp *o = (VarSetOp*)op;

		Function *f = sCC->M->getFunction( "VarSet" );
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = sCC->MakeImmidiateCPPName( hsp, bb, o->GetVarType(),
												o->GetVarNo(), o->GetPrmNo() );
		if (!var) {
			Alert( "mes" );
		}
		args.push_back(var);
		args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
										o->GetArrayDim() ));
		args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
										 o->GetCmdPNum() ));

		sCC->Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
	case VAR_INC_OP:
	{
		VarIncOp *o = (VarIncOp*)op;

		Function *f = sCC->M->getFunction( "VarInc" );
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = sCC->MakeImmidiateCPPName( hsp, bb, o->GetVarType(),
												o->GetVarNo(), o->GetPrmNo() );
		if (!var) {
			Alert( "mes" );
		}
		args.push_back(var);
		args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
										 o->GetArrayDim() ));

		sCC->Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
	case VAR_DEC_OP:
	{
		VarDecOp *o = (VarDecOp*)op;

		Function *f = sCC->M->getFunction( "VarDec" );
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = sCC->MakeImmidiateCPPName( hsp, bb, o->GetVarType(),
												o->GetVarNo(), o->GetPrmNo() );
		if (!var) {
			Alert( "mes" );
		}
		args.push_back(var);
		args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
										 o->GetArrayDim() ));

		sCC->Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
	case VAR_CALC_OP:
	{
		VarCalcOp *o = (VarCalcOp*)op;

		Function *f = sCC->M->getFunction( "VarCalc" );
		const FunctionType *ft = f->getFunctionType();

		if (ft->getNumParams() != 3) {
			Alert( "bad sig" );
		}

		std::vector<Value*> args;

		Value *var = sCC->MakeImmidiateCPPName( hsp, bb, o->GetVarType(),
												o->GetVarNo(), o->GetPrmNo() );
		if (!var) {
			Alert( "mes" );
		}
		args.push_back(var);
		args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
										 o->GetArrayDim() ));
		args.push_back(ConstantInt::get( Type::getInt32Ty( Context ),
										 o->GetCalcOp() ));

		sCC->Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
	case COMPARE_OP:
	{
		CompareOp *o = (CompareOp*)op;

		BasicBlock *thenBB = BasicBlock::Create( Context, "then", func );
		BasicBlock *elseBB = BasicBlock::Create( Context, "else", func );
		Value *ifRes = sCC->CreateCallImm( bb, "HspIf" );
		Value *cond = sCC->Builder.CreateICmpNE( ifRes,
											ConstantInt::get( Type::getInt8Ty( Context ), 0 ) );

		sCC->Builder.CreateCondBr( cond, thenBB, elseBB );

		sCC->Builder.SetInsertPoint( thenBB );
		sCC->CreateCallImm( thenBB, "TaskSwitch", o->GetNextTask() );
		sCC->Builder.CreateBr( retBB );
		task->returnBlocks.insert( thenBB );

		return elseBB;
	}
	case CMD_OP:
	{
		CmdOp *o = (CmdOp*)op;

		sCC->CreateCallImm( bb, hsp->GetHSPCmdTypeName( o->GetCmdType() ),
							o->GetCmdVal(), o->GetCmdPNum() );
		return bb;
	}
	case MODCMD_OP:
	{
		ModCmdOp *o = (ModCmdOp*)op;

		sCC->CreateCallImm( bb, hsp->GetHSPCmdTypeName( o->GetCmdType() ),
							o->GetCmdVal(), o->GetCmdPNum() );
		return bb;
	}
	default:
		Alert( "Unknown op" );
		return NULL;
	}
}

static void CompileTask( CHsp3Op *hsp, Task *task, Function *func, BasicBlock *retBB )
{
	LLVMContext &Context = getGlobalContext();

	std::map<VarId, int> varTypes;
	for (std::set<VarId>::iterator it =  task->block->usedVariables.begin();
		 it != task->block->usedVariables.end(); ++it) {
		if (it->type() != TYPE_STRUCT) {
			varTypes[*it] = mem_var[it->val()].flag;
		}
	}

	CheckType( hsp, task, varTypes );

	string buf( GetTaskFuncName( task ) );

	for ( op_list::iterator it=task->block->operations.begin();
		  it != task->block->operations.end(); it++ ) {
		Op *op = *it;

		switch ( op->GetOpCode() ) {
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
			{
				if ( IsCompilable( task, op, hsp ) ) {
					op->compile = VALUE;
					MarkCompile( op, VALUE );
				}
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
	}

	// レジスタに割り当てるか判断
	for ( op_list::iterator it2 = task->block->operations.begin();
		  it2 != task->block->operations.end(); it2++ ) {
		Op *op = *it2;
		switch ( op->GetOpCode() ) {
		case PUSH_VAR_PTR_OP:
		case PUSH_VAR_OP:
		case VAR_SET_OP:
		case VAR_CALC_OP:
		case VAR_INC_OP:
		case VAR_DEC_OP:
			{
				VarRefOp* vrop = (VarRefOp*)op;
				vrop->useRegister = false;
			}
			break;
		}
	}
	for (std::set<VarId>::iterator it =  task->block->usedVariables.begin();
		 it != task->block->usedVariables.end(); ++it) {
		VarStatics *var = sVarStatics[*it];
		VarInfo *info = sProgram.varInfos[*it];
		if ( !info->localVar )
			continue;
		bool useRegister = true;
		for ( op_list::iterator it2 = task->block->operations.begin();
			  it2 != task->block->operations.end(); it2++ ) {
			Op *op = *it2;
			switch ( op->GetOpCode() ) {
			case PUSH_VAR_PTR_OP:
			case PUSH_VAR_OP:
			case VAR_SET_OP:
			case VAR_CALC_OP:
			case VAR_INC_OP:
			case VAR_DEC_OP:
				{
					VarRefOp* vrop = (VarRefOp*)op;
					if ( vrop->IsParam() ) {
							useRegister = false;
					} else {
						if ( vrop->GetVarNo() != it->val() )
							continue;
						if ( vrop->compile != VALUE )
							useRegister = false;
					}
				}
				break;
			}
		}
		for ( op_list::iterator it2 = task->block->operations.begin();
			  it2 != task->block->operations.end(); it2++ ) {
			Op *op = *it2;
			switch ( op->GetOpCode() ) {
			case PUSH_VAR_PTR_OP:
			case PUSH_VAR_OP:
			case VAR_SET_OP:
			case VAR_CALC_OP:
			case VAR_INC_OP:
			case VAR_DEC_OP:
				{
					VarRefOp* vrop = (VarRefOp*)op;
					if ( vrop->GetVarNo() != it->val() )
						continue;
					vrop->useRegister = useRegister;
				}
				break;
			}
		}
	}


	task->llVariables.clear();
	BasicBlock *curBB = BasicBlock::Create( Context,
											task->block->name + "_entry",
											func );
	task->entry = curBB;

	sCC->Builder.SetInsertPoint( curBB );


	for ( op_list::iterator it=task->block->operations.begin();
		  it != task->block->operations.end(); it++ ) {
		Op *op = *it;

		if ( op->compile == VALUE ) {
			curBB = CompileOp( hsp, func, curBB, retBB, task, op );
			if ( !curBB ) {
				Alert( (char*)(buf + op->GetName()).c_str() );
				return;
			}
		} else {
			curBB = GenerateDefaultCode( hsp, func, curBB, retBB, task, op );
		}
	}

	sCC->Builder.SetInsertPoint( curBB );
	sCC->Builder.CreateBr( retBB );
	task->returnBlocks.insert( curBB );
}

static void CompileTaskGeneral( CHsp3Op *hsp, Task *task, Function *func, BasicBlock *retBB )
{
	LLVMContext &Context = getGlobalContext();

	std::map<VarId, int> varTypes;
	for (std::set<VarId>::iterator it =  task->block->usedVariables.begin();
		 it != task->block->usedVariables.end(); ++it) {
		varTypes[*it] = HSPVAR_FLAG_MAX;
	}

	CheckType( hsp, task, varTypes );

	BasicBlock *curBB = BasicBlock::Create( Context,
											task->block->name + "_entry",
											func );
	task->entry = curBB;

	sCC->Builder.SetInsertPoint( curBB );

	for ( op_list::iterator it=task->block->operations.begin();
		  it != task->block->operations.end(); it++ ) {
		Op *op = *it;

		curBB = GenerateDefaultCode( hsp, func, curBB, retBB, task, op );
	}

	sCC->Builder.SetInsertPoint( curBB );
	sCC->Builder.CreateBr( retBB );
	task->returnBlocks.insert( curBB );
}


static void ProfileTaskProc()
{
	int cur = GetCurTaskId();
	Task &task = __Task[cur];
	Timer timer( &task );

	task.numCall ++;
	task.funcPtr();
}

static void TraceTaskProc()
{
	int cur = GetCurTaskId();
	Task &task = __Task[cur];
	Timer timer( &task );

	if ( task.numChange > 5) {
#if HSP_PROFILE
		__HspTaskFunc[cur] = ProfileTaskProc;
#else
		__HspTaskFunc[cur] = task.funcPtr;
#endif
		task.funcPtr();
		return;
	}

	if ( task.numCurCall > 1000 ) {// FIXME 型が変わらないことを確認すべき
#if HSP_PROFILE
		__HspTaskFunc[cur] = ProfileTaskProc;
#else
		__HspTaskFunc[cur] = task.funcPtr;
#endif
		task.funcPtr();
		return;
	}

	task.numCall ++;

	bool change = false;
	for (std::set<VarId>::iterator it = task.block->usedVariables.begin();
		 it != task.block->usedVariables.end(); ++it) {
		VarStatics *var = sVarStatics[*it];

		switch( it->type() ) {
		case TYPE_VAR:
		{
			PVal& pval = mem_var[it->val()];
			if (var->tflag != pval.flag) {
				var->num = 1;
				var->change ++;
				change = true;
			} else {
				var->num ++;
			}
			var->tflag = pval.flag;
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
	if ( !task.func ) {
		LLVMContext &Context = getGlobalContext();

		Function* func = cast<Function>(sCC->M->getOrInsertFunction( GetTaskFuncName( &task ),
																Type::getInt32Ty( Context ),
																Type::getInt32Ty( Context ),
																(Type *)0 ));
		Argument &arg = *func->arg_begin();
		BasicBlock *funcRet = BasicBlock::Create( Context, "ret", func );

		CompileTaskGeneral( hsp3, &task, func, funcRet );

		sCC->Builder.SetInsertPoint( funcRet );
		sCC->Builder.CreateRet( ConstantInt::get( Type::getInt32Ty( Context ), -1 ) );

		task.func = func;

		string ErrMsg;
		if ( verifyModule( *sCC->M, ReturnStatusAction, &ErrMsg ) ) {
			Alert( (char*)ErrMsg.c_str() );
		}

		if ( task.func ) {
			task.funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task.func );
		}
	} else if ( change ) {
		task.numChange ++;
		task.numCurCall = 1;
		task.funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task.func );
	} else {
		task.numCurCall ++;
	}
	if ( task.numCurCall == 10 ) {
		LLVMContext &Context = getGlobalContext();

		sCC->LoadLLRuntime();

		Function* func = cast<Function>(sCC->M->getOrInsertFunction( GetTaskFuncName( &task ),
																Type::getInt32Ty( Context ),
																Type::getInt32Ty( Context ),
																(Type *)0 ));
		Argument &arg = *func->arg_begin();
		BasicBlock *funcEntry = BasicBlock::Create( Context, "entry", func );
		BasicBlock *funcRet = BasicBlock::Create( Context, "ret", func );

		CompileTask( hsp3, &task, func, funcRet );

		sCC->Builder.SetInsertPoint( funcEntry );
		sCC->Builder.CreateBr( task.entry );

		sCC->Builder.SetInsertPoint( funcRet );
		sCC->Builder.CreateRet( ConstantInt::get( Type::getInt32Ty( Context ), -1 ) );

		task.spFunc = func;
		if ( true ) {
			string ErrorInfo;
			std::auto_ptr<raw_fd_ostream>
				Out(new raw_fd_ostream("dump_jit.ll", ErrorInfo,
									   raw_fd_ostream::F_Binary));
			if (!ErrorInfo.empty()) {
				errs() << ErrorInfo << '\n';
			} else {
				*Out << *sCC->M;
			}
			Out->close();
		}

		string ErrMsg;
		if ( verifyModule( *sCC->M, ReturnStatusAction, &ErrMsg ) ) {
			Alert( (char*)ErrMsg.c_str() );
		}

		TheFPM->run( *task.spFunc );
		Passes->run( *sCC->M) ;

		if ( true ) {
			string ErrorInfo;
			std::auto_ptr<raw_fd_ostream>
				Out(new raw_fd_ostream("dump_jit.ll", ErrorInfo,
									   raw_fd_ostream::F_Binary));
			if (!ErrorInfo.empty()) {
				errs() << ErrorInfo << '\n';
			} else {
				*Out << *sCC->M;
			}
			Out->close();
		}

		if ( task.spFunc ) {
			task.funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task.spFunc );
		}
	}

	task.funcPtr();
}

void DumpResult()
{
	char buf[256];

	string ErrorInfo;
	std::auto_ptr<raw_fd_ostream>
		Out( new raw_fd_ostream( "dump.txt", ErrorInfo,
								 raw_fd_ostream::F_Binary ) );

	for (int i=0; i<sLabMax+1; i++) {
		if ( __Task.is_null(i) )
			continue;

		Task &task = __Task[i];

		sprintf( buf, "%s call:%d cur:%d change:%d time:%lld\r\n",
				 task.block->name.c_str(),
				 task.numCall, task.numCurCall, task.numChange, task.time );
		*Out << buf;

		for (std::set<VarId>::iterator it =  task.block->usedVariables.begin();
			 it != task.block->usedVariables.end(); ++it) {
			VarStatics *var = sVarStatics[*it];
			VarInfo *info = sProgram.varInfos[*it];
			switch( it->type() ) {
			case TYPE_VAR:
				sprintf( buf, "\tvar%d type %d, num %d, change %d local %d\r\n",
						 it->val(), var->tflag, var->num, var->change,
						 (int)info->localVar );
				*Out << buf;
				break;
			default:
				sprintf( buf, "\t%d\r\n", it->type() );
				*Out << buf;
				break;
			}
		}
	}
}


void* HspLazyFunctionCreator( const string &name )
{
#define RESOLVE_FUNC(arg) if (#arg == name) return arg;
RESOLVE_FUNC(Prgcmd)
RESOLVE_FUNC(Modcmd)
RESOLVE_FUNC(VarSet)
RESOLVE_FUNC(PushInt)
RESOLVE_FUNC(PushDouble)
RESOLVE_FUNC(PushStr)
RESOLVE_FUNC(PushLabel)
RESOLVE_FUNC(PushVar)
RESOLVE_FUNC(PushVAP)
RESOLVE_FUNC(PushDefault)
RESOLVE_FUNC(PushFuncEnd)

RESOLVE_FUNC(PushFuncPrm1)
RESOLVE_FUNC(PushFuncPrmI)
RESOLVE_FUNC(PushFuncPrmD)
RESOLVE_FUNC(PushFuncPrm)
RESOLVE_FUNC(PushFuncPAP)
RESOLVE_FUNC(FuncPrm)
RESOLVE_FUNC(LocalPrm)
RESOLVE_FUNC(FuncPrmI)
RESOLVE_FUNC(FuncPrmD)

RESOLVE_FUNC(CalcAddI)
RESOLVE_FUNC(CalcSubI)
RESOLVE_FUNC(CalcMulI)
RESOLVE_FUNC(CalcDivI)
RESOLVE_FUNC(CalcModI)
RESOLVE_FUNC(CalcAndI)
RESOLVE_FUNC(CalcOrI)
RESOLVE_FUNC(CalcXorI)
RESOLVE_FUNC(CalcEqI)
RESOLVE_FUNC(CalcNeI)
RESOLVE_FUNC(CalcGtI)
RESOLVE_FUNC(CalcLtI)
RESOLVE_FUNC(CalcGtEqI)
RESOLVE_FUNC(CalcLtEqI)
RESOLVE_FUNC(CalcRrI)
RESOLVE_FUNC(CalcLrI)

RESOLVE_FUNC(PushIntfunc)
RESOLVE_FUNC(VarCalc)
RESOLVE_FUNC(VarInc)
RESOLVE_FUNC(TaskSwitch)
RESOLVE_FUNC(HspIf)
RESOLVE_FUNC(PushSysvar)
RESOLVE_FUNC(PushExtvar)
RESOLVE_FUNC(PushDllfunc)
RESOLVE_FUNC(PushModcmd)
RESOLVE_FUNC(Extcmd)
RESOLVE_FUNC(Intcmd)
RESOLVE_FUNC(GetCurTaskId)
//RESOLVE_FUNC(Hsp3rReset)
RESOLVE_FUNC(HspVarCoreArray2)
RESOLVE_FUNC(CallDoubleIntfunc)
RESOLVE_FUNC(CallIntIntfunc)
RESOLVE_FUNC(CallDoubleSysvar)
RESOLVE_FUNC(CallIntSysvar)

RESOLVE_FUNC(strlen)

//RESOLVE_FUNC(log)
//RESOLVE_FUNC(exp)
//RESOLVE_FUNC(sqrt)
//RESOLVE_FUNC(cos)
//RESOLVE_FUNC(sin)
	if ("log" == name) return (double(*)(double))log;
	if ("exp" == name) return (double(*)(double))exp;
	if ("sqrt" == name) return (double(*)(double))sqrt;
	if ("cos" == name) return (double(*)(double))cos;
	if ("sin" == name) return (double(*)(double))sin;
#undef LAZY_FUNC

	Alert( const_cast<char*>((name + " not foud").c_str()) );
	return NULL;
}


void __HspInit( Hsp3r *hsp3r )
{
	sHsp3r = hsp3r;
	hsp3r->Reset( sMaxVar, sMaxHpi );

}

void __HspSetup( Hsp3r *hsp3r )
{
	LLVMContext &Context = getGlobalContext();

	Var__HspVars = new PVal*[sMaxVar];
	for(int i=0;i<sMaxVar;i++) {
		Var__HspVars[i] = mem_var + i;
		EE->updateGlobalMapping( sVariables[i], Var__HspVars[i] );
	}
	EE->updateGlobalMapping( sDsBase, (void*)&sDsBasePtr );

	if ( sLabMax > 0 ) {
		__HspTaskFunc = new CHSP3_TASK[sLabMax];
	}

	Alert( "HspSetup" );
	for (int i=0; i<sLabMax+1; i++) {
		if ( __Task.is_null(i) ) {
			__HspTaskFunc[i] = NULL;
		} else {
			Task &task = __Task[i];
			__Task[i] = task;

			Function* func = cast<Function>(sCC->M->getOrInsertFunction( task.block->name,
																	Type::getInt32Ty( Context ),
																	Type::getInt32Ty( Context ),
																	(Type *)0 ));
			Argument &arg = *func->arg_begin();
			BasicBlock *funcEntry = BasicBlock::Create( Context, "entry", func );
			BasicBlock *funcRet = BasicBlock::Create( Context, "ret", func );

			CompileTaskGeneral( hsp3, &task, func, funcRet );

			sCC->Builder.SetInsertPoint( funcEntry );
			sCC->Builder.CreateBr( task.entry );

			sCC->Builder.SetInsertPoint( funcRet );
			sCC->Builder.CreateRet( ConstantInt::get( Type::getInt32Ty( Context ), -1 ) );

			string ErrMsg;
			if ( verifyModule( *sCC->M, ReturnStatusAction, &ErrMsg ) ) {
				Alert( (char*)ErrMsg.c_str() );
			}
			task.func = func;
			task.funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task.func );
			__HspTaskFunc[i] = TraceTaskProc;//task.funcPtr;
		}
	}
	string ErrorInfo;
	std::auto_ptr<raw_fd_ostream>
		Out(new raw_fd_ostream("dump0.ll", ErrorInfo,
							   raw_fd_ostream::F_Binary));
	if (!ErrorInfo.empty()) {
		errs() << ErrorInfo << '\n';
		return;
	}

	*Out << *sCC->M;
}

void __HspEntry( void )
{
	sHspctx = &sHsp3r->hspctx;

	GlobalVariable *ctx = (GlobalVariable*)sCC->M->getGlobalVariable( "hspctx" );
	EE->updateGlobalMapping( ctx, (void*)&sHspctx );

	Task &task = __Task[sLabMax];

	void *fp = EE->getPointerToFunction( task.func );
	CHSP3_FUNC t = (CHSP3_FUNC)fp;
	t(1);
}

int MakeSource( CHsp3Op *hsp, int option, void *ref )
{
	//	コンパイル処理
	//
	int i;
	int maxvar;
	LLVMContext &Context = getGlobalContext();

	sCC = new CompileContext();

	// Create some module to put our function into it.
	sCC->M = new Module( "test", Context );

	sMaxVar = hsp->GetHSPHed()->max_val;
	sMaxHpi = hsp->GetHSPHed()->max_hpi;
	maxvar = hsp->GetHSPHed()->max_val;


	// 関数の準備
	sCC->LoadLLRuntime();

	const Type *pvalType = sCC->GetPValType();

	// 変数の準備
	sVariables = new GlobalVariable*[maxvar];
	for(i=0;i<maxvar;i++) {
		Constant *constInt = ConstantInt::get(Type::getInt32Ty( Context ), (int)0);
		Constant *constPtr = ConstantExpr::getIntToPtr( constInt, pvalType );

//		sVariables[i] = new GlobalVariable(ppvalType, false, GlobalValue::ExternalLinkage, constPtr,
//										   CPPHED_HSPVAR + GetHSPVarName( i ), M);
		sVariables[i] = (GlobalVariable*)sCC->M->getOrInsertGlobal(CPPHED_HSPVAR + hsp->GetHSPVarName( i ), pvalType);
	}

	sDsBase = (GlobalVariable*)sCC->M->getOrInsertGlobal("ds_base", Type::getInt32Ty( Context ));


	//		タスク(ラベル)テーブルを作成する
	//
	sLabMax = hsp->GetLabMax();
	sDsBasePtr = hsp->GetDS( 0 );

	sProgram.blocks = hsp->GetBlocks();
	sProgram.entryPoint  =sProgram.blocks["__HspEntry"];
	AnalyzeProgram( &sProgram );

	__Task.resize( sLabMax + 1 );
	for(std::map<string, Block*>::iterator it = sProgram.blocks.begin();
		it != sProgram.blocks.end(); ++it) {
		Task *task = new Task();
		Block *block = it->second;
		task->block = block;
		__Task.replace(task->block->id, task);

		for (std::set<VarId>::iterator it2 = block->usedVariables.begin();
			 it2 != block->usedVariables.end(); ++it2) {
			if (sVarStatics.find(*it2) != sVarStatics.end())
				continue;
			VarStatics *var = new VarStatics();
			sVarStatics[*it2] = var;
		}
	}

	// 結果をダンプ
	//
	{
		string errorInfo;
		std::auto_ptr<raw_fd_ostream>
			out(new raw_fd_ostream("dump.ll", errorInfo,
								   raw_fd_ostream::F_Binary));
		if (!errorInfo.empty()) {
			errs() << errorInfo << '\n';
			return -1;
		}

		*out << *sCC->M;
	}

	{
		std::ofstream out("dump2.txt");

		char mes[256];
		for (int i=0;i<sLabMax+1;i++) {
			if ( __Task.is_null(i) )
				continue;

			Task &task = __Task[i];
			out << "#" << task.block->name << std::endl;
			PrettyPrint( out, task.block );
		}
	}

	string ErrMsg;
	if ( verifyModule( *sCC->M, ReturnStatusAction, &ErrMsg ) ) {
		Alert( (char*)ErrMsg.c_str() );
	}

	EE = EngineBuilder( sCC->M )
		.setEngineKind( EngineKind::JIT )
		.setOptLevel( CodeGenOpt::Default )
		.create();

	EE->InstallLazyFunctionCreator( HspLazyFunctionCreator );

	TargetData *TD = new TargetData(*EE->getTargetData());

	Passes = new PassManager();

	Passes->add(TD);
	createStandardLTOPasses( Passes, false, true, true );


	TheFPM = new FunctionPassManager( sCC->M );

	// Set up the optimizer pipeline.  Start with registering info about how the
	// target lays out data structures.
	TheFPM->add(TD);
	// Do simple "peephole" optimizations and bit-twiddling optzns.
	TheFPM->add(createInstructionCombiningPass());
	// Reassociate expressions.
	TheFPM->add(createReassociatePass());
	// Eliminate Common SubExpressions.
	TheFPM->add(createGVNPass());
	// Simplify the control flow graph (deleting unreachable blocks, etc).
	TheFPM->add(createCFGSimplificationPass());

	TheFPM->doInitialization();

	return 0;
}
