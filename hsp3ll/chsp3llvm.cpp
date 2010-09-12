
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

#include "llvm/LLVMContext.h"
#include "llvm/Module.h"
#include "llvm/Constants.h"
#include "llvm/DerivedTypes.h"
#include "llvm/Instructions.h"
#include "llvm/Assembly/Parser.h"
#include "llvm/Analysis/Verifier.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/ExecutionEngine/JIT.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/Target/TargetSelect.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TypeBuilder.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/IRBuilder.h"

#include "supio.h"
#include "chsp3llvm.h"
#include "hsp3r.h"

using namespace llvm;


//
static char *PROTOTYPES = 
	"%struct.PVal = type { i16, i16, [5 x i32], i32, i8*, i8*, i16, i16, i32, i32 }\n"
	"declare void @Prgcmd(i32, i32)\n"
	"declare void @PushVar(%struct.PVal*, i32)\n"
	"declare void @CalcMulI()\n"
	"declare void @VarSet(%struct.PVal*, i32, i32)\n"
	"declare void @PushInt(i32)\n"
	"declare void @CalcSubI()\n"
	"declare void @PushDouble(double)\n"
	"declare void @PushFuncEnd()\n"
	"declare void @CalcAddI()\n"
	"declare void @PushIntfunc(i32, i32)\n"
	"declare void @CalcDivI()\n"
	"declare void @PushVAP(%struct.PVal*, i32)\n"
	"declare void @VarCalc(%struct.PVal*, i32, i32)\n"
	"declare void @VarInc(%struct.PVal*, i32)\n"
	"declare void @TaskSwitch(i32)\n"
	"declare void @CalcEqI()\n"
	"declare i8 @HspIf() zeroext\n"
	"declare void @CalcGtI()\n"
	"declare void @PushLabel(i32)\n"
	"declare void @CalcLtI()\n"
	"declare void @PushSysvar(i32, i32)\n"
	"declare void @Extcmd(i32, i32)\n"
	"declare void @PushStr(i8*)\n"
	"declare void @CalcAndI()\n"
	"declare void @CalcNeI()\n"
	"declare void @CalcGtEqI()\n"
	"declare void @CalcXorI()\n"
	"declare void @PushExtvar(i32, i32)\n"
	"declare void @CalcRrI()\n"
	"declare void @PushDefault()\n"
	"declare void @Intcmd(i32, i32)\n"
	"declare i32 @Hsp3rReset(%struct.Hsp3r*, i32, i32)\n"
	"declare void @HspVarCoreArray2(%struct.PVal*, i32)\n"

	"declare double @CallDoubleIntfunc(i32, i32)\n"
	"declare i32 @CallIntIntfunc(i32, i32)\n"
	"declare double @CallDoubleSysvar(i32, i32)\n"
	"declare i32 @CallIntSysvar(i32, i32)\n"

	"define void @HspVarCoreReset(%struct.PVal* %a) {\n"
	"%1 = getelementptr %struct.PVal* %a, i32 0, i32 8\n"
	//	"%2 = load i32* %1\n"
	"store i32 0, i32* %1\n"
	"%2 = getelementptr %struct.PVal* %a, i32 0, i32 7\n"
	//	"%4 = load i16* %3\n"
	"store i16 0, i16* %2\n"
	"ret void\n"
	"}\n"
	"define void @Nop() {\n"
	"  ret void\n"
	"}\n";


class Task;

// 
static Module *M;
static ExecutionEngine *EE;
static IRBuilder<> Builder(getGlobalContext());

static Task *sCurTask;
static BasicBlock *sCurBB;
static BasicBlock *sCurTaskRetBB;
static bool sReachable;

static std::map<std::string, Task*> sTasks;

// Runtime
CHSP3_TASK *__HspTaskFunc;
Task **__Task;
static GlobalVariable **sVariables;
static GlobalVariable *sDsBase;
static const char *sDsBasePtr;

static int sMaxVar;
static int sMaxHpi;
static int sLabMax;

static PVal **Var__HspVars;


extern int GetCurTaskId();
extern void HspVarCoreArray2( PVal *pval, int offset );
extern CHsp3LLVM *hsp3;


extern double CallDoubleIntfunc( int val, int pnum );
extern int CallIntIntfunc( int val, int pnum );

extern double CallDoubleSysvar( int val, int pnum );
extern int CallIntSysvar( int val, int pnum );


Value* CreateCallImm( BasicBlock *bblock, const std::string& name );
Value* CreateCallImm( BasicBlock *bblock, const std::string& name, int a );
Value* CreateCallImm( BasicBlock *bblock, const std::string& name, int a, int b );

enum OPCODE {
	NOP, TASK_SWITCH_OP, CALC_OP, PUSH_VAR_OP, PUSH_VAR_PTR_OP, PUSH_DNUM_OP, PUSH_INUM_OP,
	PUSH_STRUCT_OP, PUSH_LABEL_OP, PUSH_STR_OP, PUSH_CMD_OP, PUSH_FUNC_END_OP, VAR_SET_OP,
	VAR_INC_OP, VAR_DEC_OP, VAR_CALC_OP, CMP_OP, CMD_OP
};

class Op {
public:
	bool compile;
	int flag;
	Value *llValue;

	std::vector<Op*> operands;
	
	Op() : compile(false), flag(-1) {
	}
	virtual ~Op() {}
	virtual std::string GetName()
	{
		return "Op";
	}
	virtual OPCODE GetOpCode() = 0;
	virtual BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) = 0;
};

class TaskSwitchOp : public Op {
	int task;
public:
	explicit TaskSwitchOp( int task ) : task( task )
	{
	}
	virtual std::string GetName()
	{
		return "TaskSwitchOp";
	}
	OPCODE GetOpCode() {
		return TASK_SWITCH_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		CreateCallImm( bb, "TaskSwitch", task );
		return bb;
	}
};

class CalcOp : public Op {
	int op;
public:
	explicit CalcOp( int op ) : op( op )
	{
	}
	int GetCalcOp() const {
		return op;
	}
	virtual std::string GetName()
	{
		return "CalcOp";
	}
	OPCODE GetOpCode() {
		return CALC_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		CreateCallImm( bb, "Calc" + hsp->GetHSPOperator2(op) );
		return bb;
	}
};

class VarRefOp : public Op {
protected:
	int type;
	int val;

	int va;
public:
	bool useRegister;

	VarRefOp( int type, int val, int va ) : type( type ), val( val ), va( va )
	{
	}
	int GetVarNo() const {
		return val;
	}
	int GetArrayDim() const {
		return va;
	}
};

class PushVarOp : public VarRefOp {
public:
	PushVarOp( int val, int va ) : VarRefOp( TYPE_VAR, val, va )
	{
	}
	virtual std::string GetName()
	{
		return "PushVarOp";
	}
	OPCODE GetOpCode() {
		return PUSH_VAR_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint(bb);

		char varname[256];
		hsp->MakeImmidiateCPPName( varname, TYPE_VAR, val );

		Function* f = M->getFunction( "PushVar" );
		
		std::vector<Value*> args;
		Value *var = M->getNamedValue(varname);
		if (!var)
			Alert(varname);
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
		
		Builder.SetInsertPoint(bb);
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class PushVarPtrOp : public VarRefOp {
public:
	PushVarPtrOp( int val, int va ) : VarRefOp( TYPE_VAR, val, va )
	{
	}
	virtual std::string GetName()
	{
		return "PushVarPtrOp";
	}
	OPCODE GetOpCode() {
		return PUSH_VAR_PTR_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint(bb);

		char varname[256];
		hsp->MakeImmidiateCPPName( varname, TYPE_VAR, val );

		Function *f = M->getFunction( "PushVAP" );
		
		std::vector<Value*> args;
		Value *var = M->getNamedValue(varname);
		if (!var)
			Alert(varname);
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
		
		Builder.SetInsertPoint(bb);
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class PushDnumOp : public Op {
	double val;
public:
	explicit PushDnumOp( double val ) : val ( val )
	{
	}
	double GetValue() const {
		return val;
	}
	virtual std::string GetName()
	{
		return "PushDnumOp";
	}
	OPCODE GetOpCode() {
		return PUSH_DNUM_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Function *f = M->getFunction("Push" + hsp->GetHSPCmdTypeName(TYPE_DNUM));
		
		std::vector<Value*> args;
		args.push_back(ConstantFP::get( Type::getDoubleTy(Context), val ));
		
		Builder.SetInsertPoint( bb );
		Builder.CreateCall( f, args.begin(), args.end() );

		return bb;
	}
};

class PushInumOp : public Op {
	int val;
public:
	explicit PushInumOp( int val ) : val ( val )
	{
	}
	int GetValue() const {
		return val;
	}
	virtual std::string GetName()
	{
		return "PushInumOp";
	}
	OPCODE GetOpCode() {
		return PUSH_INUM_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName(TYPE_INUM), val );

		return bb;
	}
};

class PushStructOp : public Op {
	int val;
public:
	explicit PushStructOp( int val ) : val ( val )
	{
	}
	virtual std::string GetName()
	{
		return "PushStructOp";
	}
	OPCODE GetOpCode() {
		return PUSH_STRUCT_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName(TYPE_STRUCT), val );

		return bb;
	}
};

class PushLabelOp : public Op {
	int val;
public:
	explicit PushLabelOp( int val ) : val ( val )
	{
	}
	virtual std::string GetName()
	{
		return "PushLabelOp";
	}
	OPCODE GetOpCode() {
		return PUSH_LABEL_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName(TYPE_LABEL), val );

		return bb;
	}
};

class PushStrOp : public Op {
	int val;
public:
	explicit PushStrOp( int val ) : val ( val )
	{
	}
	virtual std::string GetName()
	{
		return "PushStrOp";
	}
	OPCODE GetOpCode() {
		return PUSH_STR_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Function *f = M->getFunction("Push" + hsp->GetHSPCmdTypeName(TYPE_STRING));
		
		std::vector<Value*> args;
		
		LoadInst *ld = Builder.CreateLoad(sDsBase, "base");
		Constant *constInt = ConstantInt::get(Type::getInt32Ty(Context), (int)val);
		Value *v = Builder.CreateAdd(ld, constInt);
		Value *ptr = Builder.CreateIntToPtr(v, TypeBuilder<types::i<8>*, false>::get(Context));
		args.push_back(ptr);
		
		Builder.SetInsertPoint(bb);
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class PushCmdOp : public Op {
	int type;
	int val;

	int ar;
public:
	PushCmdOp( int type, int val, int ar ) : type( type ), val( val ), ar ( ar )
	{
	}
	virtual std::string GetName()
	{
		return "PushCmdOp";
	}
	int GetCmdType() {
		return type;
	}
	int GetCmdVal() {
		return val;
	}
	int GetCmdPNum() {
		return ar;
	}
	OPCODE GetOpCode() {
		return PUSH_CMD_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName(type), val, ar );

		return bb;
	}
};

class PushFuncEndOp : public Op {
public:
	explicit PushFuncEndOp()
	{
	}
	virtual std::string GetName()
	{
		return "PushFuncEndOp";
	}
	OPCODE GetOpCode() {
		return PUSH_FUNC_END_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		CreateCallImm( bb, "PushFuncEnd" );

		return bb;
	}
};

class VarSetOp : public VarRefOp {
	int pnum;
public:
	VarSetOp( int type, int val, int va, int pnum ) : VarRefOp( type, val, va ), pnum( pnum )
	{
	}
	virtual std::string GetName()
	{
		return "VarSetOp";
	}
	OPCODE GetOpCode() {
		return VAR_SET_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint(bb);

		char mes[4096];
		hsp->MakeImmidiateCPPName( mes, type, val );

		Function *f = M->getFunction("VarSet");
		const FunctionType *ft = f->getFunctionType();
		
		std::vector<Value*> args;
		
		Value *var = M->getNamedValue(mes);
		if (!var) {
			Alert(mes);
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context), pnum));
		
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class VarIncOp : public VarRefOp {
public:
	VarIncOp( int type, int val, int va ) : VarRefOp( type, val, va )
	{
	}
	virtual std::string GetName()
	{
		return "VarIncOp";
	}
	OPCODE GetOpCode() {
		return VAR_INC_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint(bb);

		char mes[4096];
		hsp->MakeImmidiateCPPName( mes, type, val );

		Function *f = M->getFunction("VarInc");
		const FunctionType *ft = f->getFunctionType();
		
		std::vector<Value*> args;
		
		Value *var = M->getNamedValue(mes);
		if (!var) {
			Alert(mes);
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
		
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class VarDecOp : public VarRefOp {
public:
	VarDecOp( int type, int val, int va ) : VarRefOp( type, val, va )
	{
	}
	virtual std::string GetName()
	{
		return "VarDecOp";
	}
	OPCODE GetOpCode() {
		return VAR_DEC_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint(bb);

		char mes[4096];
		hsp->MakeImmidiateCPPName( mes, type, val );

		Function *f = M->getFunction("VarDec");
		const FunctionType *ft = f->getFunctionType();
		
		std::vector<Value*> args;
		
		Value *var = M->getNamedValue(mes);
		if (!var) {
			Alert(mes);
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
		
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class VarCalcOp : public VarRefOp {
	int op;
public:
	VarCalcOp( int type, int val, int va, int op ) : VarRefOp( type, val, va ), op( op )
	{
	}
	virtual std::string GetName()
	{
		return "VarCalcOp";
	}
	OPCODE GetOpCode() {
		return VAR_CALC_OP;
	}
	int GetCalcOp() const {
		return op;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint(bb);

		char mes[4096];
		hsp->MakeImmidiateCPPName( mes, type, val );
		
		Function *f = M->getFunction("VarCalc");
		const FunctionType *ft = f->getFunctionType();
		
		if (ft->getNumParams() != 3) {
			Alert("bad sig");
		}
		
		std::vector<Value*> args;

		Value *var = M->getNamedValue(mes);
		if (!var) {
			Alert(mes);
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
		args.push_back(ConstantInt::get(Type::getInt32Ty(Context), op));
		
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class CmpOp : public Op {
	int task;
public:
	CmpOp( int task ) : task( task )
	{
	}
	virtual std::string GetName()
	{
		return "CmpOp";
	}
	OPCODE GetOpCode() {
		return CMD_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint(bb);

		BasicBlock *thenBB = BasicBlock::Create( Context, "then", func );
		BasicBlock *elseBB = BasicBlock::Create( Context, "else", func );
		Value *ifRes = CreateCallImm( bb, "HspIf" );
		
		Value *cond = Builder.CreateICmpNE( ifRes,
											ConstantInt::get( Type::getInt8Ty( Context ), 0 ) );
		
		Builder.CreateCondBr( cond, thenBB, elseBB );
		
		Builder.SetInsertPoint( thenBB );
		CreateCallImm( thenBB, "TaskSwitch", task );
		Builder.CreateBr( sCurTaskRetBB );
		
		return elseBB;
	}
};

class CmdOp : public Op {
	int type;
	int val;

	int pnum;
public:
	CmdOp( int type, int val, int pnum ) : type( type ), val( val ), pnum( pnum )
	{
	}
	virtual std::string GetName()
	{
		return "CmdOp";
	}
	OPCODE GetOpCode() {
		return CMD_OP;
	}
	BasicBlock* GenerateDefaultCode(CHsp3LLVM *hsp, Function *func, BasicBlock *bb) {
		CreateCallImm( bb, hsp->GetHSPCmdTypeName( type ), val, pnum );

		return bb;
	}
};

class Var {
public:
	int type;
	int val;

	int tflag;
	int num;
	int change;

	bool localVar;

	Var(int type, int val) : type( type ), val( val ), tflag(0), num(0), change(0), localVar(false)
	{
	}


    bool operator<( const Var& a ) const {
        return (val < a.val) || (val == a.val && type < a.type);
    }

};



class Task {
public:
	std::string name;
	Function *func;
	Function *spFunc;
	CHSP3_TASK funcPtr;
	int numCall;
	int numCurCall;
	int numChange;
	std::set<Var> usedVariables;
	std::vector<Op*> operations;
	std::map<int, Value*> llVariables;

	Task() : func(NULL), funcPtr(NULL), numCall(0), numCurCall(0), numChange(0)
	{
	}
};

std::map<int, std::set<Task*> > varTaskMap;

static void AnalyzeTask( Task *task ) {
	std::stack<Op*> stack;

	std::string filename = "dump_" + task->name + ".txt";
	std::string ErrorInfo;
	std::auto_ptr<raw_fd_ostream> 
		Out(new raw_fd_ostream(filename.c_str(), ErrorInfo,
							   raw_fd_ostream::F_Binary));
	if (!ErrorInfo.empty()) {
		errs() << ErrorInfo << '\n';
		return;
	}

	for ( std::vector<Op*>::iterator it=task->operations.begin();
		 it != task->operations.end(); it++ ) {
		Op *op = *it;
		switch ( op->GetOpCode() ) {
		case PUSH_VAR_OP:
			{
				PushVarOp *pv = (PushVarOp*)op;
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
				stack.push( op );
				varTaskMap[pv->GetVarNo()].insert( task );
			}
			break;
		case PUSH_VAR_PTR_OP:
			{
				PushVarPtrOp *pv = (PushVarPtrOp*)op;
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
				stack.push( op );
				varTaskMap[pv->GetVarNo()].insert( task );
			}
			break;
		case PUSH_DNUM_OP:
		case PUSH_INUM_OP:
		case PUSH_STRUCT_OP:
		case PUSH_LABEL_OP:
		case PUSH_STR_OP:
		case PUSH_FUNC_END_OP:
			stack.push( op );
			break;

		case PUSH_CMD_OP:
			while ( stack.top()->GetOpCode() != PUSH_FUNC_END_OP ) {
				op->operands.push_back( stack.top() );
				stack.pop();
			}
			op->operands.push_back( stack.top() );
			stack.pop();
			stack.push( op );
			break;

		case CALC_OP:
			op->operands.push_back( stack.top() );
			stack.pop();
			op->operands.push_back( stack.top() );
			stack.pop();
			stack.push( op );
			break;

		case VAR_INC_OP:
		case VAR_DEC_OP:

		case VAR_CALC_OP:
		case VAR_SET_OP:
			while ( !stack.empty() ) {
				op->operands.push_back( stack.top() );
				stack.pop();
			}
			varTaskMap[((VarRefOp*)op)->GetVarNo()].insert( task );
			break;
		case CMP_OP:
			break;
		case CMD_OP:
			break;
		case TASK_SWITCH_OP:
			break;
		default:
			*Out << "UNKNOWN\r\n";
		}
	}

	*Out << "#" << task->name << "\r\n";
	for ( std::vector<Op*>::iterator it=task->operations.begin();
		 it != task->operations.end(); it++ ) {
		*Out << (*it)->GetName() << "\r\n";
		*Out << "\t";
		for ( std::vector<Op*>::iterator it2=(*it)->operands.begin();
			  it2 != (*it)->operands.end(); it2++ ) {
			*Out << (*it2)->GetName() << ", ";
		}
		*Out << "\r\n";
	}
	*Out << "\r\n";
}

static Var *GetTaskVar( Task *task, int no ) {
	for (std::set<Var>::iterator it = task->usedVariables.begin();
		 it != task->usedVariables.end(); it++) {
		Var& var = *it;

		switch( var.type ) {
		case TYPE_VAR:
		{
			PVal& pval = mem_var[var.val];
			if (var.val == no) {
				return &var;
			}
			break;
		}
		}
	}
	return NULL;
}

static bool IsCompilable( Task *task, Op *op ) {

	switch ( op->GetOpCode() ) {
	case PUSH_VAR_OP:
		{
			PushVarOp *pv = (PushVarOp*)op;
			Var *var = GetTaskVar(task, pv->GetVarNo());
			PVal& pval = mem_var[var->val];
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
			Var *var = GetTaskVar(task, pv->GetVarNo());
			PVal& pval = mem_var[var->val];
			//changed |= op->flag == pval.flag;
			//op->flag = pval.flag;
		}
		break;
	case PUSH_DNUM_OP:
		return true;
	case PUSH_INUM_OP:
		return true;
	case PUSH_STRUCT_OP:
		break;
	case PUSH_LABEL_OP:
		break;
	case PUSH_STR_OP:
		break;
	case PUSH_FUNC_END_OP:
		return true;
		
	case PUSH_CMD_OP:
		{
			PushCmdOp *pcop = (PushCmdOp*)op;
			for ( std::vector<Op*>::iterator it=op->operands.begin();
				  it != op->operands.end(); it++ ) {

				if ( (*it)->flag != HSPVAR_FLAG_INT
					 && (*it)->flag != HSPVAR_FLAG_DOUBLE
					 && (*it)->GetOpCode() != PUSH_FUNC_END_OP ) {
					return false;
				}

				if ( !IsCompilable( task, *it ) ) {
					return false;
				}
			}
			switch ( pcop->GetCmdType()) {
			case TYPE_INTFUNC:
				{
					switch( pcop->GetCmdVal() >> 7 ) {
					case 2:
						return false;
					case 3:
					return true;
					break;
				default:
					return true;
					break;
					}
					break;
				}
			case TYPE_SYSVAR:
				switch( pcop->GetCmdVal() ) {
				case 0x000:								// system
				case 0x001:								// hspstat
				case 0x002:								// hspver
				case 0x003:								// stat
				case 0x004:								// cnt
				case 0x005:								// err
				case 0x006:								// strsize
				case 0x007:								// looplev
				case 0x008:								// sublev
				case 0x009:								// iparam
				case 0x00a:								// wparam
				case 0x00b:								// lparam
					return true;
				case 0x00c:								// refstr
					//*type_res = HSPVAR_FLAG_STR;	
					return false;
				case 0x00d:								// refdval
					//*type_res = HSPVAR_FLAG_DOUBLE;
					return false;
				default:
					throw HSPERR_UNSUPPORTED_FUNCTION;
				}
			}
			//std::string name = "Push" + hsp->GetHSPCmdTypeName( op->GetCmdType() ); 
		}
		break;

	case CALC_OP:
		{
			CalcOp *calc = (CalcOp*)op;
			if ((op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_INT)
				|| (op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE)) {
				return IsCompilable( task, op->operands[0] ) &&
					IsCompilable( task, op->operands[1] );
			}
		}
		break;
				
	case VAR_INC_OP:
	case VAR_DEC_OP:
		break;
				
	case VAR_CALC_OP:
		{
			VarCalcOp *vs = (VarCalcOp*)op;
			Var *var = GetTaskVar(task, vs->GetVarNo());
			PVal& pval = mem_var[var->val];
			if ( vs->GetArrayDim() == 0 && op->operands.size() == 1 ) {
				if ( IsCompilable( task, op->operands[0] ) &&
					 op->operands[0]->flag == pval.flag ) {
					return true;
				}
			}
		}
		break;
	case VAR_SET_OP:
		{
			VarSetOp *vs = (VarSetOp*)op;
			Var *var = GetTaskVar(task, vs->GetVarNo());
			PVal& pval = mem_var[var->val];
			if ( vs->GetArrayDim() == 0 && op->operands.size() == 1 ) {
				if ( IsCompilable( task, op->operands[0] ) &&
					 op->operands[0]->flag == pval.flag ) {
					return true;
				}
			}
		}
		break;
	case CMP_OP:
		break;
	case CMD_OP:
		break;
	case TASK_SWITCH_OP:
		break;
	default:
		break;
	}
	return false;
}


static void MarkCompile( Op *op ) {
	/*
	switch ( op->GetOpCode() ) {
	case PUSH_CMD_OP:
		return;
	}
	*/
	for ( std::vector<Op*>::iterator it=op->operands.begin();
		  it != op->operands.end(); it++ ) {
		(*it)->compile = true;
		MarkCompile(*it);
	}
}

static void CheckType( CHsp3LLVM *hsp, Task *task) {

	for ( std::vector<Op*>::iterator it=task->operations.begin();
		  it != task->operations.end(); it++ ) {
		Op *op = *it;
		op->compile = false;
		op->flag = HSPVAR_FLAG_MAX;
	}

	bool changed;
	do {
		changed = false;
		for ( std::vector<Op*>::iterator it=task->operations.begin();
			  it != task->operations.end(); it++ ) {
			Op *op = *it;
			
			switch ( op->GetOpCode() ) {
			case PUSH_VAR_OP:
				{
					Var *var = GetTaskVar(task, ((PushVarOp*)op)->GetVarNo());
					PVal& pval = mem_var[var->val];
					changed |= op->flag == pval.flag;
					op->flag = pval.flag;
				}
				break;
			case PUSH_VAR_PTR_OP:
				{
					Var *var = GetTaskVar(task, ((PushVarPtrOp*)op)->GetVarNo());
					PVal& pval = mem_var[var->val];
					changed |= op->flag == pval.flag;
					op->flag = pval.flag;
				}
				break;
			case PUSH_DNUM_OP:
				changed |= op->flag == HSPVAR_FLAG_DOUBLE;
				op->flag = HSPVAR_FLAG_DOUBLE;
				break;
			case PUSH_INUM_OP:
				changed |= op->flag == HSPVAR_FLAG_INT;
				op->flag = HSPVAR_FLAG_INT;
				break;
			case PUSH_STRUCT_OP:
				changed |= op->flag == HSPVAR_FLAG_STRUCT;
				op->flag = HSPVAR_FLAG_STRUCT;
				break;
			case PUSH_LABEL_OP:
				changed |= op->flag == HSPVAR_FLAG_LABEL;
				op->flag = HSPVAR_FLAG_LABEL;
				break;
			case PUSH_STR_OP:
				changed |= op->flag == HSPVAR_FLAG_STR;
				op->flag = HSPVAR_FLAG_STR;
				break;
			case PUSH_FUNC_END_OP:
				break;
				
			case PUSH_CMD_OP:
				{
					PushCmdOp *pcop = (PushCmdOp*)op;
					switch ( pcop->GetCmdType()) {
					case TYPE_INTFUNC:
						{
							switch( pcop->GetCmdVal() >> 7 ) {
							case 2:
								op->flag = HSPVAR_FLAG_STR;
								break;
							case 3:
								op->flag = HSPVAR_FLAG_DOUBLE;
								break;
							default:
								op->flag = HSPVAR_FLAG_INT;
								break;
							}
							break;
						}
					case TYPE_SYSVAR:
						{
							switch( pcop->GetCmdVal() ) {
							case 0x000:								// system
							case 0x001:								// hspstat
							case 0x002:								// hspver
							case 0x003:								// stat
							case 0x004:								// cnt
							case 0x005:								// err
							case 0x006:								// strsize
							case 0x007:								// looplev
							case 0x008:								// sublev
							case 0x009:								// iparam
							case 0x00a:								// wparam
							case 0x00b:								// lparam
								op->flag = HSPVAR_FLAG_INT;
								break;
							case 0x00c:								// refstr
								op->flag = HSPVAR_FLAG_STR;
								break;
							case 0x00d:								// refdval
								op->flag = HSPVAR_FLAG_DOUBLE;
								break;
							default:
								throw HSPERR_UNSUPPORTED_FUNCTION;
							}
							break;
						}
					}
				}
				break;
			
			case CALC_OP:
				if ( op->operands[0]->flag != HSPVAR_FLAG_MAX && op->operands[1]->flag != HSPVAR_FLAG_MAX ) {
					changed |= op->flag == op->operands[0]->flag;
					op->flag = op->operands[0]->flag;
				}
				break;
				
			case VAR_INC_OP:
			case VAR_DEC_OP:
				break;
				
			case VAR_CALC_OP:
				break;
			case VAR_SET_OP:
				break;
			case CMP_OP:
				break;
			case CMD_OP:
				break;
			case TASK_SWITCH_OP:
				break;
			default:
				break;
			}
		}
	} while (changed);
}

static Value* CompileCalcI( int code, Value *a, Value *b ) {
	
	switch( code ) {
	case CALCCODE_ADD:
		return Builder.CreateAdd( a, b );
	case CALCCODE_SUB:
		return Builder.CreateSub( a, b );
	case CALCCODE_MUL:
		return Builder.CreateMul( a, b );
	case CALCCODE_DIV:
		return Builder.CreateSDiv( a, b );
	case CALCCODE_MOD:
		return Builder.CreateSRem( a, b );
	default:
		return NULL;
					/*
				case CALCCODE_AND:
					return "AndI";
				case CALCCODE_OR:
					return "OrI";
				case CALCCODE_XOR:
					return "XorI";
				case CALCCODE_EQ:
					return "EqI";
				case CALCCODE_NE:
					return "NeI";
				case CALCCODE_GT:
					return "GtI";
				case CALCCODE_LT:
					return "LtI";
				case CALCCODE_GTEQ:
					return "GtEqI";
				case CALCCODE_LTEQ:
					return "LtEqI";
				case CALCCODE_RR:
					return "RrI";
				case CALCCODE_LR:
					return "LrI";
					*/
	}
}

static Value* CompileCalcD( int code, Value *a, Value *b ) {
	
	switch( code ) {
	case CALCCODE_ADD:
		return Builder.CreateFAdd( a, b );
	case CALCCODE_SUB:
		return Builder.CreateFSub( a, b );
	case CALCCODE_MUL:
		return Builder.CreateFMul( a, b );
	case CALCCODE_DIV:
		return Builder.CreateFDiv( a, b );
	case CALCCODE_MOD:
		return Builder.CreateFRem( a, b );
	default:
		return NULL;
					/*
				case CALCCODE_AND:
					return "AndI";
				case CALCCODE_OR:
					return "OrI";
				case CALCCODE_XOR:
					return "XorI";
				case CALCCODE_EQ:
					return "EqI";
				case CALCCODE_NE:
					return "NeI";
				case CALCCODE_GT:
					return "GtI";
				case CALCCODE_LT:
					return "LtI";
				case CALCCODE_GTEQ:
					return "GtEqI";
				case CALCCODE_LTEQ:
					return "LtEqI";
				case CALCCODE_RR:
					return "RrI";
				case CALCCODE_LR:
					return "LrI";
					*/
	}
}

static bool CompileOp( CHsp3LLVM *hsp, Function *func, BasicBlock *bb, Task *task, Op *op ) {

	LLVMContext &Context = getGlobalContext();
	Builder.SetInsertPoint(bb);

	const Type *tyPI8 = TypeBuilder<types::i<8>*, false>::get(Context);
	const Type *tyPI32 = TypeBuilder<types::i<32>*, false>::get(Context);
	const Type *tyPD = TypeBuilder<types::ieee_double*, false>::get(Context);
	
	switch ( op->GetOpCode() ) {
	case PUSH_VAR_OP:
		{
			PushVarOp *pv = (PushVarOp*)op;
			Var *var = GetTaskVar(task, pv->GetVarNo());
			PVal& pval = mem_var[var->val];

			Value *lpvar;
			std::map<int, Value*>::iterator it = task->llVariables.find( pv->GetVarNo() );

			if ( pv->useRegister) {
				op->llValue = it->second;

				Function *pNop = M->getFunction( "Nop" );
				Builder.SetInsertPoint( bb );
				Builder.CreateCall( pNop );
				return true;
			}

			if ( it != task->llVariables.end() ) {
				lpvar = it->second;
			} else {
				char varname[256];
				hsp->MakeImmidiateCPPName( varname, TYPE_VAR, pv->GetVarNo() );
				
				lpvar = M->getNamedValue( varname );
			}
			task->llVariables[pv->GetVarNo()] = lpvar;

			Value *lpval = Builder.CreateConstGEP2_32( lpvar, 0, 4 );
			LoadInst *lptr = Builder.CreateLoad( lpval, "ptr" );
			Value *ptr;
			if ( pval.flag == HSPVAR_FLAG_INT ) {
				ptr = Builder.CreateBitCast( lptr, tyPI32 );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				ptr = Builder.CreateBitCast( lptr, tyPD );
			} else {
				return false;
			}

			Value *aptr;
			if ( pv->GetArrayDim() == 0) {
				aptr = ptr;
			} else {
				//				return false;
				Function *pReset = M->getFunction( "HspVarCoreReset" );
				Builder.CreateCall( pReset, lpvar );

				Function *pArray2 = M->getFunction( "HspVarCoreArray2" );
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					Builder.CreateCall2( pArray2, lpvar, pv->operands[i]->llValue );
				}
				Value *lpofs = Builder.CreateConstGEP2_32( lpvar, 0, 8 );
				LoadInst *lofs = Builder.CreateLoad( lpofs, "offset" );
				aptr = Builder.CreateGEP( ptr, lofs );
			}

			//Value *lpval = Builder.CreateConstGEP2_32( lpvar, 0, 4 );

			if ( pval.flag == HSPVAR_FLAG_INT ) {
				op->llValue = Builder.CreateLoad( aptr );
				return true;
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				op->llValue = Builder.CreateLoad( aptr );
				return true;
			} else {
				return false;
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
			op->llValue = ConstantFP::get( Type::getDoubleTy(Context), pd->GetValue() );
			return true;
		}
		return true;
	case PUSH_INUM_OP:
		{
			PushInumOp *pi = (PushInumOp*)op;
			op->llValue = ConstantInt::get( Type::getInt32Ty( Context ), pi->GetValue() );
			return true;
		}
		return true;
	case PUSH_STRUCT_OP:
		break;
	case PUSH_LABEL_OP:
		break;
	case PUSH_STR_OP:
		break;
	case PUSH_FUNC_END_OP:
		return true;
		
	case PUSH_CMD_OP:
		{
			PushCmdOp *pcop = (PushCmdOp*)op;
			//TODO 複雑な引数はコンパイルしてスタックに積む
			switch ( pcop->GetCmdType() ) {
			case TYPE_INTFUNC:
				{
					for ( std::vector<Op*>::reverse_iterator it=op->operands.rbegin();
						  it != op->operands.rend(); it++ ) {
						//(*it)->compile = true;
						
						if ( (*it)->GetOpCode() == PUSH_FUNC_END_OP ) {
							CreateCallImm( bb, "PushFuncEnd" );
							continue;
						}
						
						switch ( (*it)->flag ) {
						case HSPVAR_FLAG_INT:
							{
								Function *pPush = M->getFunction( "PushInt" );
								Builder.CreateCall( pPush, (*it)->llValue );
							}
							break;
						case HSPVAR_FLAG_DOUBLE:
							{
								Function *pPush = M->getFunction( "PushDouble" );
								Builder.CreateCall( pPush, (*it)->llValue );
							}
							break;
						default:
							return false;
						}
					}
					
					switch( pcop->GetCmdVal() >> 7 ) {
					case 2:
						return false;
						break;
					case 3:
						op->llValue = CreateCallImm( bb, "CallDouble" + hsp->GetHSPCmdTypeName( pcop->GetCmdType() ),
													 pcop->GetCmdVal(), pcop->GetCmdPNum() );
						return true;
					default:
						op->llValue = CreateCallImm( bb, "CallInt" + hsp->GetHSPCmdTypeName( pcop->GetCmdType() ),
													 pcop->GetCmdVal(), pcop->GetCmdPNum() );
						return true;
					}
				}
			case TYPE_SYSVAR:
				{
					for ( std::vector<Op*>::reverse_iterator it=op->operands.rbegin();
						  it != op->operands.rend(); it++ ) {
						if ( (*it)->GetOpCode() == PUSH_FUNC_END_OP ) {
							CreateCallImm( bb, "PushFuncEnd" );
							continue;
						}
						
						switch ( (*it)->flag ) {
						case HSPVAR_FLAG_INT:
							{
								Function *pPush = M->getFunction( "PushInt" );
								Builder.CreateCall( pPush, (*it)->llValue );
							}
							break;
						case HSPVAR_FLAG_DOUBLE:
							{
								Function *pPush = M->getFunction( "PushDouble" );
								Builder.CreateCall( pPush, (*it)->llValue );
							}
							break;
						default:
							return false;
						}
					}

					switch( pcop->GetCmdVal() ) {
					case 0x000:								// system
					case 0x001:								// hspstat
					case 0x002:								// hspver
					case 0x003:								// stat
					case 0x004:								// cnt
					case 0x005:								// err
					case 0x006:								// strsize
					case 0x007:								// looplev
					case 0x008:								// sublev
					case 0x009:								// iparam
					case 0x00a:								// wparam
					case 0x00b:								// lparam
						op->llValue = CreateCallImm( bb, "CallInt" + hsp->GetHSPCmdTypeName( pcop->GetCmdType() ),
													 pcop->GetCmdVal(), pcop->GetCmdPNum() );
						return true;
					case 0x00c:								// refstr
						return false;
					case 0x00d:								// refdval
						op->llValue = CreateCallImm( bb, "CallDouble" + hsp->GetHSPCmdTypeName( pcop->GetCmdType() ),
													 pcop->GetCmdVal(), pcop->GetCmdPNum() );
						return true;
					default:
						throw HSPERR_UNSUPPORTED_FUNCTION;
					}
					break;
				}
			}
			break;
		}
		
	case CALC_OP:
		{
			CalcOp *calc = (CalcOp*)op;
			if ( op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_INT ) {
				op->llValue = CompileCalcI( calc->GetCalcOp(),
											op->operands[1]->llValue,
											op->operands[0]->llValue );
			} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE ) {
				op->llValue = CompileCalcD( calc->GetCalcOp(),
											op->operands[1]->llValue,
											op->operands[0]->llValue );
			}
			return op->llValue != NULL;
		}
		break;
				
	case VAR_INC_OP:
	case VAR_DEC_OP:
		break;
				
	case VAR_CALC_OP:
		{
			VarCalcOp *vs = (VarCalcOp*)op;
			Var *var = GetTaskVar(task, vs->GetVarNo());
			PVal& pval = mem_var[var->val];

			if ( vs->useRegister) {
				std::map<int, Value*>::iterator it = task->llVariables.find( vs->GetVarNo() );

				if ( pval.flag == HSPVAR_FLAG_INT ) {
					Value *result = CompileCalcI( vs->GetCalcOp(), it->second, op->operands[0]->llValue );
					if ( !result )
						return false;
					op->llValue = result;
				} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
					Value *result = CompileCalcD( vs->GetCalcOp(), it->second, op->operands[0]->llValue );
					if ( !result )
						return false;
					op->llValue = result;
				} else {
					return false;
				}
				task->llVariables[vs->GetVarNo()] = op->llValue;

				Function *pNop = M->getFunction( "Nop" );
				Builder.SetInsertPoint( bb );
				Builder.CreateCall( pNop );

				return true;
			}

			char varname[256];
			hsp->MakeImmidiateCPPName( varname, TYPE_VAR, vs->GetVarNo() );
			
			Value *lpvar = M->getNamedValue( varname );
			Value *lpval = Builder.CreateConstGEP2_32( lpvar, 0, 4 );
			LoadInst *lptr = Builder.CreateLoad( lpval, "ptr" );

			if ( pval.flag == HSPVAR_FLAG_INT ) {
				Value *lp = Builder.CreateBitCast( lptr, tyPI32 );
				Value *rhs = Builder.CreateLoad( lp );
				Value *result = CompileCalcI( vs->GetCalcOp(), rhs, op->operands[0]->llValue );
				if ( !result )
					return false;
				op->llValue = Builder.CreateStore( result, lp );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				Value *lp = Builder.CreateBitCast( lptr, tyPD );
				Value *rhs = Builder.CreateLoad( lp );
				Value *result = CompileCalcD( vs->GetCalcOp(), rhs, op->operands[0]->llValue );
				if ( !result )
					return false;
				op->llValue = Builder.CreateStore( result, lp );
			} else {
				return false;
			}
			return true;
		}
		break;
	case VAR_SET_OP:
		{
			VarSetOp *vs = (VarSetOp*)op;
			Var *var = GetTaskVar(task, vs->GetVarNo());
			PVal& pval = mem_var[var->val];

			if ( vs->useRegister) {
				op->llValue = op->operands[0]->llValue;
				task->llVariables[vs->GetVarNo()] = op->llValue;

				Function *pNop = M->getFunction( "Nop" );
				Builder.SetInsertPoint( bb );
				Builder.CreateCall( pNop );

				return true;
			}

			char varname[256];
			hsp->MakeImmidiateCPPName( varname, TYPE_VAR, vs->GetVarNo() );
			
			Value *lpvar = M->getNamedValue( varname );
			Value *lpval = Builder.CreateConstGEP2_32( lpvar, 0, 4 );
			LoadInst *lptr = Builder.CreateLoad( lpval, "ptr" );
			
			if ( pval.flag == HSPVAR_FLAG_INT ) {
				Value *lp = Builder.CreateBitCast( lptr, tyPI32 );
				op->llValue = Builder.CreateStore( op->operands[0]->llValue, lp );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				Value *lp = Builder.CreateBitCast( lptr, tyPD );
				op->llValue = Builder.CreateStore( op->operands[0]->llValue, lp );
			} else {
				return false;
			}
			return true;
		}
		break;
	case CMP_OP:
		break;
	case CMD_OP:
		break;
	case TASK_SWITCH_OP:
		break;
	default:
		break;
	}
	return false;
}

static void CompileTask( CHsp3LLVM *hsp, Task *task ) {
	LLVMContext &Context = getGlobalContext();

	CheckType( hsp, task );

	char buf[256];

	sprintf( buf, "%s_%d", task->name.c_str(), task->numCall );	
	
	for ( std::vector<Op*>::iterator it=task->operations.begin();
		  it != task->operations.end(); it++ ) {
		Op *op = *it;
		
		switch ( op->GetOpCode() ) {
		case PUSH_VAR_OP:
		case PUSH_VAR_PTR_OP:
		case PUSH_DNUM_OP:
		case PUSH_INUM_OP:
		case PUSH_STRUCT_OP:
		case PUSH_LABEL_OP:
		case PUSH_STR_OP:
		case PUSH_FUNC_END_OP:
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
			{
				if ( IsCompilable( task, op ) ) {
					op->compile = true;
					MarkCompile( op );
				}
			}
			break;
		case CMP_OP:
			break;
		case CMD_OP:
			break;
		case TASK_SWITCH_OP:
			break;
		default:
			break;
		}
	}

	// レジスタに割り当てるか判断
	for ( std::vector<Op*>::iterator it2 = task->operations.begin();
		  it2 != task->operations.end(); it2++ ) {
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
	for (std::set<Var>::iterator it =  task->usedVariables.begin();
		 it != task->usedVariables.end(); ++it) {
		Var& var = *it;
		if ( !var.localVar )
			continue;
		bool useRegister = true;
		for ( std::vector<Op*>::iterator it2 = task->operations.begin();
			  it2 != task->operations.end(); it2++ ) {
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
					if ( vrop->GetVarNo() != var.val )
						continue;
					if ( !vrop->compile )
						useRegister = false;
				}
				break;
			}
		}
		for ( std::vector<Op*>::iterator it2 = task->operations.begin();
			  it2 != task->operations.end(); it2++ ) {
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
					if ( vrop->GetVarNo() != var.val )
						continue;
					vrop->useRegister = useRegister;
				}
				break;
			}
		}
	}


	task->llVariables.clear();

	task->spFunc = cast<Function>(M->getOrInsertFunction(buf,
														 Type::getVoidTy(Context),
														 (Type *)0));
	BasicBlock *curBB = BasicBlock::Create( Context, "entry", task->spFunc );

	BasicBlock *retBB = BasicBlock::Create( Context, "ret", task->spFunc );
	sCurTaskRetBB = retBB;

	Builder.SetInsertPoint( retBB );
	Builder.CreateRetVoid();

	Builder.SetInsertPoint( curBB );

	sReachable = true;

	for ( std::vector<Op*>::iterator it=task->operations.begin();
		  it != task->operations.end(); it++ ) {
		Op *op = *it;

		if ( op->compile ) {
			//Function *f = M->getFunction( "Nop" );
			//Builder.SetInsertPoint( curBB );
			//Builder.CreateCall( f );
			if ( !CompileOp( hsp, task->spFunc, curBB, task, op ) ) {
				task->spFunc = NULL;
				Alert((char*)(buf + op->GetName()).c_str());
				return;
			}
		} else {
			curBB = op->GenerateDefaultCode(hsp, task->spFunc, curBB);
		}
	}

	Builder.SetInsertPoint( curBB );
	Builder.CreateBr( retBB );
}

static void TraceTaskProc() {
	int cur = GetCurTaskId();
	Task *task = __Task[cur];
	if ( task->numChange > 5 ) {
		__HspTaskFunc[cur] = task->funcPtr;
		task->funcPtr();
		return;
	}

	if ( task->numCurCall > 1000 ) {// FIXME 型が変わらないことを確認すべき
		__HspTaskFunc[cur] = task->funcPtr;
		task->funcPtr();
		return;
	}

	task->numCall ++;

	bool change = false;
	for (std::set<Var>::iterator it = task->usedVariables.begin();
		 it != task->usedVariables.end(); ++it) {
		Var& var = *it;

		switch( var.type ) {
		case TYPE_VAR:
		{
			PVal& pval = mem_var[var.val];
			if (var.tflag != pval.flag) {
				var.num = 1;
				var.change ++;
				change = true;
			} else {
				var.num ++;
			}
			var.tflag = pval.flag;
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
	if ( change ) {
		task->numChange ++;
		task->numCurCall = 1;
		task->funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task->func );
	} else {
		task->numCurCall ++;
	}
	if ( task->numCurCall == 10 ) {
		CompileTask( hsp3, task );

		if ( true ) {
			std::string ErrorInfo;
			std::auto_ptr<raw_fd_ostream> 
				Out(new raw_fd_ostream("dump_jit.ll", ErrorInfo,
									   raw_fd_ostream::F_Binary));
			if (!ErrorInfo.empty()) {
				errs() << ErrorInfo << '\n';
			} else {
				*Out << *M;
			}
			Out->close();
		}


		std::string ErrMsg;
		if ( verifyModule( *M, ReturnStatusAction, &ErrMsg ) ) {
			Alert((char*)ErrMsg.c_str());
		}

		if ( task->spFunc ) {
			task->funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task->spFunc );
		}
	}

	task->funcPtr();
}

void DumpResult() {
	char buf[256];

	std::string ErrorInfo;
	std::auto_ptr<raw_fd_ostream> 
		Out(new raw_fd_ostream("dump.txt", ErrorInfo,
							   raw_fd_ostream::F_Binary));

	for (int i=0;i<sLabMax;i++) {
		Task *task = __Task[i];
		if (task) {
			sprintf( buf, "L%04x call:%d cur:%d change:%d\r\n", i, task->numCall, task->numCurCall, task->numChange );
			*Out << buf;

			for (std::set<Var>::iterator it =  task->usedVariables.begin();
				 it != task->usedVariables.end(); ++it) {
				Var& var = *it;
				switch( var.type ) {
				case TYPE_VAR:
					sprintf( buf, "\tvar%d type %d, num %d, change %d local %d\r\n",
							 var.val, var.tflag, var.num, var.change, (int)var.localVar );
					*Out << buf;
					break;
				default:
					sprintf( buf, "\t%d\r\n", var.type );
					*Out << buf;
					break;
				}
			}
		}
	}
}

void __HspInit( Hsp3r *hsp3 ) {
	char mes[256];

	hsp3->Reset( sMaxVar, sMaxHpi );

	Var__HspVars = new PVal*[sMaxVar];
	for(int i=0;i<sMaxVar;i++) {
		Var__HspVars[i] = mem_var + i;
		EE->updateGlobalMapping( sVariables[i], Var__HspVars[i] );
	}
	EE->updateGlobalMapping( sDsBase, (void*)&sDsBasePtr );

	if ( sLabMax > 0 ) {
		__HspTaskFunc = new CHSP3_TASK[sLabMax];
		__Task = new Task*[sLabMax];
	}

	Alert("HspInit");
	for (int i=0;i<sLabMax;i++) {
		sprintf( mes, "L%04x", i );
		//		Alert(mes);
		Task *task = sTasks[mes];
		__Task[i] = task;
		if ( task ) {
			task->funcPtr = (CHSP3_TASK)EE->getPointerToFunction(task->func);
			__HspTaskFunc[i] = TraceTaskProc;//task->funcPtr;
		} else {
			__HspTaskFunc[i] = NULL;
		}
	}
}

void __HspEntry( void ) {
	Alert("HspEntry");
	Task *task = sTasks["__HspEntry"];
	void *fp = EE->getPointerToFunction(task->func);
	CHSP3_TASK t = (CHSP3_TASK)fp;
	t();
//	exit(0);
}

// LLVM utilities

static const StructType *GetPValType() {
	LLVMContext &Context = getGlobalContext();

	return (StructType*)M->getTypeByName( "struct.PVal" );
}

Value* CreateCallImm( BasicBlock *bblock, const std::string& name )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	
	std::vector<Value*> args;

	Builder.SetInsertPoint(bblock);
	return Builder.CreateCall( f, args.begin(), args.end() );
}

Value* CreateCallImm( BasicBlock *bblock, const std::string& name, int a )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	
	std::vector<Value*> args;
	
	args.push_back( ConstantInt::get( Type::getInt32Ty( Context ), a ) );

	Builder.SetInsertPoint(bblock);
	return Builder.CreateCall( f, args.begin(), args.end() );
}

Value* CreateCallImm( BasicBlock *bblock, const std::string& name, int a, int b )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	
	std::vector<Value*> args;
	
	args.push_back(ConstantInt::get( Type::getInt32Ty( Context ), a ) );
	args.push_back(ConstantInt::get( Type::getInt32Ty( Context ), b ) );

	Builder.SetInsertPoint(bblock);
	return Builder.CreateCall( f, args.begin(), args.end() );
}

void* HspLazyFunctionCreator( const std::string &Name )
{
	if ("Prgcmd" == Name) return Prgcmd;
	if ("PushVar" == Name) return PushVar;
	if ("CalcMulI" == Name) return CalcMulI;
	if ("VarSet" == Name) return VarSet;
	if ("PushInt" == Name) return PushInt;
	if ("CalcSubI" == Name) return CalcSubI;
	if ("PushDouble" == Name) return PushDouble;
	if ("PushFuncEnd" == Name) return PushFuncEnd;
	if ("CalcAddI" == Name) return CalcAddI;
	if ("PushIntfunc" == Name) return PushIntfunc;
	if ("CalcDivI" == Name) return CalcDivI;
	if ("PushVAP" == Name) return PushVAP;
	if ("VarCalc" == Name) return VarCalc;
	if ("VarInc" == Name) return VarInc;
	if ("TaskSwitch" == Name) return TaskSwitch;
	if ("CalcEqI" == Name) return CalcEqI;
	if ("HspIf" == Name) return HspIf;
	if ("CalcGtI" == Name) return CalcGtI;
	if ("PushLabel" == Name) return PushLabel;
	if ("CalcLtI" == Name) return CalcLtI;
	if ("PushSysvar" == Name) return PushSysvar;
	if ("Extcmd" == Name) return Extcmd;
	if ("PushStr" == Name) return PushStr;
	if ("CalcAndI" == Name) return CalcAndI;
	if ("CalcNeI" == Name) return CalcNeI;
	if ("CalcGtEqI" == Name) return CalcGtEqI;
	if ("CalcXorI" == Name) return CalcXorI;
	if ("PushExtvar" == Name) return PushExtvar;
	if ("CalcRrI" == Name) return CalcRrI;
	if ("PushDefault" == Name) return PushDefault;
	if ("Intcmd" == Name) return Intcmd;
	//if ("HspVarCoreReset" == Name) return HspVarCoreReset;
	if ("HspVarCoreArray2" == Name) return HspVarCoreArray2;

	if ("CallIntIntfunc" == Name) return CallIntIntfunc;
	if ("CallDoubleIntfunc" == Name) return CallDoubleIntfunc;
	if ("CallIntSysvar" == Name) return CallIntSysvar;
	if ("CallDoubleSysvar" == Name) return CallDoubleSysvar;

	//	if ("Hsp3rReset" == Name) return Hsp3rReset;

	Alert((char*)(Name + " not foud").c_str());
	return NULL;
}
/*------------------------------------------------------------*/
CHsp3LLVM::CHsp3LLVM() {
}

void CHsp3LLVM::MakeCPPVarName( char *outbuf, int varid )
{
	//		変数名をoutbufにコピーする
	//
	strcpy( outbuf, CPPHED_HSPVAR );
	strcat( outbuf, GetHSPVarName( varid ).c_str() );
}


int CHsp3LLVM::MakeImmidiateCPPName( char *mes, int type, int val, char *opt )
{
	//		直値(int,double,str)を追加
	//		(追加できない型の場合は-1を返す)
	//
	int i;
	i = MakeImmidiateName( mes, type, val );
	if ( i == 0 ) return 0;
	switch( type ) {
	case TYPE_VAR:
		sprintf( mes, "%s%s", CPPHED_HSPVAR, GetHSPVarName(val).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		break;
	case TYPE_STRUCT:
		{
		const STRUCTPRM *prm;
		prm = GetMInfo( val );
		if ( prm->subid != STRUCTPRM_SUBID_STACK ) {
			sprintf( mes, "_modprm%d", val );
		} else {
			sprintf( mes, "_prm%d", val );
		}
		break;
		}
	case TYPE_LABEL:
		sprintf( mes, "*L%04x", val );
		break;
	default:
		strcpy( mes, GetHSPName( type, val ).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		if ( *mes == 0 ) return -1;
		break;
	}
	return 0;
}


void CHsp3LLVM::MakeCPPTask( const char *funcdef, const char *name, int nexttask )
{
	//		タスクの区切り
	//			funcdef=新しい関数定義
	//			nextttask=次のタスク(ラベルID)
	//
	LLVMContext &Context = getGlobalContext();

	if ( tasknum ) {
		if ( nexttask >= 0 ) {
			OutLine( "TaskSwitch(%d);\r\n", nexttask );
			if (sReachable) {
				CreateCallImm( sCurBB, "TaskSwitch", nexttask );
				sCurTask->operations.push_back( new TaskSwitchOp(nexttask) );
			}
		}
		Builder.CreateBr( sCurTaskRetBB );
		//sCurTaskF->getBasicBlockList().push_back(sCurTaskRetBB);
		OutMes( "}\r\n\r\n" );
	}
	OutMes( "%s {\r\n", funcdef );

	sCurTask = new Task();
	sCurTask->name = name;
	sCurTask->func =
		cast<Function>(M->getOrInsertFunction(name, Type::getVoidTy(Context),
											  (Type *)0));
	sTasks[name] = sCurTask;
	//	Alert((char*)name);

	sCurBB = BasicBlock::Create( Context, "entry", sCurTask->func );
	sReachable = true;

	sCurTaskRetBB = BasicBlock::Create( Context, "return", sCurTask->func );
	Builder.SetInsertPoint( sCurTaskRetBB );
	Builder.CreateRetVoid();

	Builder.SetInsertPoint( sCurBB );
	tasknum++;
}


void CHsp3LLVM::MakeCPPTask( int nexttask )
{
	//		単純タスクの生成
	//
	char name[256];
	sprintf( name,"L%04x", nexttask );
	char mes[256];
	sprintf( mes,"static void L%04x( void )", nexttask );
	MakeCPPTask( mes, name, nexttask );
}


void CHsp3LLVM::MakeCPPTask2( int nexttask, int newtask )
{
	//		単純タスクの生成
	//
	char name[256];
	sprintf( name,"L%04x", newtask );
	char mes[256];
	sprintf( mes,"static void L%04x( void )", newtask );
	MakeCPPTask( mes, name, nexttask );
}


void CHsp3LLVM::MakeCPPLabel( void )
{
	//		ラベルを生成
	//
	int otmax;
	int labindex;
	int myot;

	otmax = GetOTCount();
	if ( otmax == 0 ) return;
	myot = (int)(mcs_last - mcs_start);

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( myot == GetOT( labindex ) ) {
			if ( GetOTInfo( labindex ) == -1 ) {
				MakeCPPTask( labindex );
			} else {
				MakeProgramInfoFuncParam( GetOTInfo( labindex ) );
			}
		}
		labindex++;
	}
}


void CHsp3LLVM::GetCPPExpressionSub( CMemBuf *eout, BasicBlock *bblock, int flg )
{
	//		C/C++の計算式フォーマットでパラメーターを展開する(短項目)
	//		eout : 出力先
	//
	char mes[8192];								// 展開される式の最大文字数
	int op;
	LLVMContext &Context = getGlobalContext();
	int cstype0 = cstype;
	int csval0 = csval;

	*mes = 0;
	switch(cstype) {
		case TYPE_MARK:
			//		記号(スタックから取り出して演算)
			//
			op = csval;
			sprintf( mes,"Calc%s(); ", GetHSPOperator2(op).c_str() );
			if (eout)
				eout->PutStr( mes );
			if (sReachable && bblock) {
				CreateCallImm( bblock, "Calc" + GetHSPOperator2(op) );
				sCurTask->operations.push_back( new CalcOp(op) );
			}
			getCS();
			break;
		case TYPE_VAR:
			{
			//		変数をスタックに積む
			//
			CMemBuf arname;
			int va;
			char varname[256];
			MakeImmidiateCPPName( varname, cstype, csval );
			sCurTask->usedVariables.insert(Var(cstype, csval));
			getCS();
			//		配列要素を付加する
			va = MakeCPPVarExpression( &arname, bblock );
			if (eout)
				eout->PutStr( arname.GetBuffer() );
			sprintf( mes,"PushVar(%s,%d); ", varname, va );
			if (eout)
				eout->PutStr( mes );
			if (sReachable && bblock) {
				Function *f = M->getFunction( flg == 1 ? "PushVAP" : "PushVar" );
				
				std::vector<Value*> args;
				Value *var = M->getNamedValue(varname);
				if (!var)
					Alert(varname);

				args.push_back(var);
				args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));

				Builder.SetInsertPoint(bblock);
				Builder.CreateCall(f, args.begin(), args.end());

				if (flg == 1) {
					sCurTask->operations.push_back( new PushVarPtrOp( csval0, va ) );
				} else {
					sCurTask->operations.push_back( new PushVarOp( csval0, va ) );
				}
			}
			break;
			}
		case TYPE_DNUM:
			{
			//		直実数値をスタックに積む
			//
			double immval = GetDSf(csval);
			sprintf( mes,"Push%s(%f); ", GetHSPCmdTypeName(cstype).c_str(), immval );
			if (eout)
				eout->PutStr( mes );
			if (sReachable && bblock) {
				Function *f = M->getFunction("Push" + GetHSPCmdTypeName(cstype));
				
				std::vector<Value*> args;
				args.push_back(ConstantFP::get( Type::getDoubleTy(Context), immval ));

				Builder.SetInsertPoint( bblock );
				Builder.CreateCall( f, args.begin(), args.end() );
				sCurTask->operations.push_back( new PushDnumOp( immval ) );
			}
			getCS();
			break;
			}
		case TYPE_INUM:
		case TYPE_STRUCT:
		case TYPE_LABEL:
			//		直値をスタックに積む
			//
			sprintf( mes,"Push%s(%d); ", GetHSPCmdTypeName(cstype).c_str(), csval );
			if (eout)
				eout->PutStr( mes );

			if (sReachable && bblock) {
				CreateCallImm( bblock, "Push" + GetHSPCmdTypeName(cstype), csval );
				switch (cstype0) {
				case TYPE_INUM:
					sCurTask->operations.push_back( new PushInumOp( csval ) );
					break;
				case TYPE_STRUCT:
					sCurTask->operations.push_back( new PushStructOp( csval ) );
					break;
				case TYPE_LABEL:
					sCurTask->operations.push_back( new PushLabelOp( csval ) );
					break;
				}
			}

			getCS();
			break;
		case TYPE_STRING:
			//		文字列をスタックに積む
			//
			sprintf( mes,"Push%s(\"%s\"); ", GetHSPCmdTypeName(cstype).c_str(), GetDS( csval ) );
			if (eout)
				eout->PutStr( mes );
			if (sReachable && bblock) {
				Function *f = M->getFunction("Push" + GetHSPCmdTypeName(cstype));
				
				std::vector<Value*> args;

				LoadInst *ld = Builder.CreateLoad(sDsBase, "base");
				Constant *constInt = ConstantInt::get(Type::getInt32Ty(Context), (int)csval);
				Value *v = Builder.CreateAdd(ld, constInt);
				Value *ptr = Builder.CreateIntToPtr(v, TypeBuilder<types::i<8>*, false>::get(Context));
				args.push_back(ptr);
				
				/*
				Constant *constInt = ConstantInt::get(Type::getInt32Ty(Context), (int)GetDS(csval));
				Constant *constPtr = ConstantExpr::getIntToPtr(constInt, TypeBuilder<types::i<8>*, false>::get(Context));
				args.push_back(constPtr);
				*/

				Builder.SetInsertPoint(bblock);
				Builder.CreateCall(f, args.begin(), args.end());

				sCurTask->operations.push_back( new PushStrOp( csval ) );
			}
			getCS();
			break;
		default:
			{
			//		関数として展開する
			//
			int va;
			int fnctype;
			int fncval;
			CMemBuf arname;
			fnctype = cstype;
			fncval = csval;
			getCS();
			//		引数を付加する
			if (eout)
				eout->PutStr( "PushFuncEnd(); " );
			if (sReachable && bblock) {
				CreateCallImm( bblock, "PushFuncEnd" );
				sCurTask->operations.push_back( new PushFuncEndOp() );
			}

			va = MakeCPPVarExpression( &arname, bblock );
			if (eout)
				eout->PutStr( arname.GetBuffer() );

			sprintf( mes, "Push%s(%d,%d); ", GetHSPCmdTypeName(fnctype).c_str(), fncval, va );
			if (eout)
				eout->PutStr( mes );

			if (sReachable && bblock) {
				CreateCallImm( bblock, "Push" + GetHSPCmdTypeName(fnctype), fncval, va );
				sCurTask->operations.push_back( new PushCmdOp( fnctype, fncval, va ) );
			}
			break;
			}
	}
}


int CHsp3LLVM::GetCPPExpression( CMemBuf *eout, int *result, BasicBlock *bblock, int flg )
{
	//		C/C++の計算式フォーマットでパラメーターを展開する
	//		eout : 出力先
	//		result : 結果の格納先(-2=解析なし/-1=複数項の計算式/other=単一のパラメーターtype)
	//
	int res;
	int tres;

	*result = -2;

	if (exflag&EXFLG_1) return 1;				// パラメーター終端
	if (exflag&EXFLG_2) {						// パラメーター区切り(デフォルト時)
		exflag^=EXFLG_2;
		return -1;
	}
	if ( cstype == TYPE_MARK ) {
		if ( csval == 63 ) {					// パラメーター省略時('?')
			getCS();
			exflag&=~EXFLG_2;
			return -1;
		}
		if ( csval == ')' ) {					// 関数内のパラメーター省略時
			exflag&=~EXFLG_2;
			return 2;
		}
	}

	res = 0;
	tres = cstype;

	while(1) {
		if ( mcs > mcs_end ) {
			res = 1;			// データ終端チェック
			break;
		}
		if ( tres >= 0 ) {
			if ( tres != cstype ) { tres = -1; }
		}

		switch(cstype) {
		case TYPE_MARK:
			//		記号(スタックから取り出して演算)
			//
			if ( csval == ')' ) {					// 引数の終了マーク
				exflag |= EXFLG_2;
				res = 2;
				break;
			}
		default:
			GetCPPExpressionSub( eout, bblock, flg );
			break;
		}

		if ( exflag ) {								// パラメーター終端チェック
			exflag&=~EXFLG_2;
			break;
		}
	}
	*result = tres;
	return res;
}


int CHsp3LLVM::MakeCPPParam( BasicBlock *bblock, int addprm )
{
	//		パラメーターのトレース
	//
	int i;
	int prm;
	int len;
	int result;
	int curidx;
	CMemBuf tmpbuf;
	char *p;
	std::vector<std::pair<MCSCONTEXT, int> > expressionContext;
	int ret = 0;

	prm = 0;
	tmpbuf.AddIndexBuffer();

	int j;
	for(j=0;j<addprm;j++) {
		if ( exflag & EXFLG_1) break;		// パラメーター列終端
		if ( mcs > mcs_end ) break;			// データ終端チェック
		if ( prm ) {
			tmpbuf.Put(0);
		}

		MCSCONTEXT ctx;
		GetContext(&ctx);
		tmpbuf.RegistIndex( tmpbuf.GetSize() );
		GetCPPExpressionSub( &tmpbuf, NULL );
		expressionContext.push_back( std::make_pair( ctx, -3 ) );
		prm++;
	}

	while(1) {
		if ( exflag & EXFLG_1) break;		// パラメーター列終端
		if ( mcs > mcs_end ) break;			// データ終端チェック
		if ( prm ) {
			tmpbuf.Put(0);
		}
		MCSCONTEXT ctx;
		GetContext(&ctx);
		curidx = tmpbuf.GetIndexBufferSize();
		tmpbuf.RegistIndex( tmpbuf.GetSize() );
		ret = i = GetCPPExpression( &tmpbuf, &result, NULL );
		expressionContext.push_back( std::make_pair( ctx, result ) );
		if ( i > 0 ) break;
		if ( i < -1 ) break;
		if ( i == -1 ) {
			tmpbuf.PutStr( "PushDefault();" );
		}
		if ( result == TYPE_VAR ) {			// 単一項で変数が指定されていた場合
			p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
			p = strstr2( p, "PushVar" );
			p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAPに直す
		}
		prm++;
	}
	
	// TODO
	MCSCONTEXT ctx;
	GetContext(&ctx);
	for ( int j = expressionContext.size() - 1; j >= 0; j-- ) {
		std::pair<MCSCONTEXT, int> &p = expressionContext[j];
		SetContext(&p.first);
		if ( p.second == -3 ) {
			GetCPPExpressionSub( NULL, bblock );
		} else {
			if ( p.second == TYPE_VAR ) {			// 単一項で変数が指定されていた場合
				i = GetCPPExpression( NULL, &result, bblock, 1 );
			} else {
				i = GetCPPExpression( NULL, &result, bblock );
			}
			if ( i == -1 ) {
				CreateCallImm( bblock, "PushDefault" );
			}
		}
	}
	SetContext(&ctx);

	if ( ret < -1 )
		return ret;

	//		パラメーターを逆順で登録する
	//		(stackをpopして正常な順番になるように)
	//
	i=tmpbuf.GetIndexBufferSize();
	while(1) {
		if ( i == 0 ) break;
		i--;
		p = tmpbuf.GetBuffer() + tmpbuf.GetIndex(i);
		len = (int)strlen( p );
		if ( len ) {
			int a1;
			char lnbuf[4096];
			strsp_ini();
			while(1) {
				a1 = strsp_get( p, lnbuf, 0, 4090 );
				OutLine( "%s\r\n", lnbuf );
				if ( a1 == 0 ) break;
			}
		}
	}

	return prm;
}


int CHsp3LLVM::MakeCPPVarForHSP( void )
{
	//		コメント用にHSP形式の代入を作成
	//		(同時に代入の種類を識別して返す)
	//		(retval:-1=通常代入、-2,-3=++or--、その他=演算子)
	//
	int i;
	int op;
	char arbuf[VAREXP_BUFFER_MAX];
	i = GetHSPVarExpression( arbuf );
	if ( i ) { out->PutStr( arbuf ); }
	if ( cstype == TYPE_MARK ) {
		if ( csval == CALCCODE_EQ ) {
			out->PutStr( "=" );
			getCS();
			MakeProgramInfoParam2();
			return -1;
		}
		op = csval;
		getCS();
		if ( exflag & EXFLG_1) {		// ++ or --
			out->PutStr( GetHSPOperator(op).c_str() );
			out->PutStr( GetHSPOperator(op).c_str() );
			MakeProgramInfoParam2();
			if ( op == CALCCODE_ADD ) return -2;
			return -3;
		}
		out->PutStr( GetHSPOperator(op).c_str() );
		out->PutStr( "=" );
		//getCS();
		MakeProgramInfoParam2();
		return op;
	}
	Alert( "CHsp3:Var Syntax unknown." );
	return -4;
}


int CHsp3LLVM::MakeCPPVarExpression( CMemBuf *arname, BasicBlock *bblock )
{
	//	変数名直後に続くパラメーター(配列)を展開する
	//	arname : 配列設定展開用のバッファ
	//	ret : 0=配列なし/1～=配列あり
	//
	int i;
	int prm;
	int len;
	int result;
	int curidx;
	CMemBuf tmpbuf;
	char *p;
	int ret = 0;
	std::vector<MCSCONTEXT> expressionContext;
	tmpbuf.AddIndexBuffer();

	if ( cstype == TYPE_MARK ) {
		if ( csval == '(' ) {
			getCS();
			prm = 1;
			while(1) {
				if ( exflag & EXFLG_1) break;		// パラメーター列終端
				if ( mcs > mcs_end ) break;			// データ終端チェック
				if ( prm > 1 ) {
					tmpbuf.Put(0);
				}
				curidx = tmpbuf.GetIndexBufferSize();
				tmpbuf.RegistIndex( tmpbuf.GetSize() );

				MCSCONTEXT ctx;
				GetContext(&ctx);
				expressionContext.push_back(ctx);
				ret = i = GetCPPExpression( &tmpbuf, &result, NULL );
				if ( i > 0 ) break;
				if ( i < -1 ) break;
				if ( i == -1 ) {
					tmpbuf.PutStr( "PushDefault();" );
				}
				//if ( result == TYPE_VAR ) {			// 単一項で変数が指定されていた場合
				//	p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
				//	p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAPに直す
				//}
				prm++;
			}

			MCSCONTEXT ctx;
			GetContext(&ctx);
			for(int j = expressionContext.size() - 1; j >= 0; j--) {
				SetContext(&expressionContext[j]);
				i = GetCPPExpression( NULL, &result, bblock );
				if ( i == -1 ) {
					CreateCallImm( bblock, "PushDefault" );
				}
			}
			SetContext(&ctx);

			if (ret < -1)
				return ret;

			getCS();

			//		パラメーターを逆順で登録する
			//		(stackをpopして正常な順番になるように)
			//
			i=tmpbuf.GetIndexBufferSize();
			while(1) {
				if ( i == 0 ) break;
				i--;
				p = tmpbuf.GetBuffer() + tmpbuf.GetIndex(i);
				len = (int)strlen( p );
				if ( len ) {
					if (arname)
						OutLineBuf( arname, "%s\r\n", p );
				}
			}
			return prm;
		}
	}
	return 0;
}


/*------------------------------------------------------------*/

void CHsp3LLVM::MakeCPPSub( int cmdtype, int cmdval, BasicBlock *bblock )
{
	//		通常命令とパラメーターを展開
	//
	int pnum;
	MCSCONTEXT ctxbak;

	OutLine( "// %s ", GetHSPName( cmdtype, cmdval ).c_str() );
	getCS();
	GetContext( &ctxbak );
	MakeProgramInfoParam2();
	SetContext( &ctxbak );
	pnum = MakeCPPParam( bblock );

	OutLine( "%s(%d,%d);\r\n", GetHSPCmdTypeName(cmdtype).c_str(), cmdval, pnum );
	if (bblock) {
		CreateCallImm( bblock, GetHSPCmdTypeName(cmdtype), cmdval, pnum );
		sCurTask->operations.push_back( new CmdOp( cmdtype, cmdval, pnum ) );
	}
}


int CHsp3LLVM::MakeCPPMain( void )
{
	//		プログラムのトレース
	//
	int i;
	int op;
	int cmdtype, cmdval;
	char mes[4096];
	MCSCONTEXT ctxbak, ctxbak2;
	int maxvar;
	LLVMContext &Context = getGlobalContext();
	const Type *pvalType = GetPValType();
	const Type *ppvalType = PointerType::getUnqual(pvalType);

	//		初期化
	//
	tasknum = 0;

	OutMes( "void __HspInitEntry( void );\r\n\r\n" );
	MakeCPPTask( "void __HspEntry( void )", "__HspEntry" );

	OutMes( "\t// Var initalize\r\n" );
	maxvar = hsphed->max_val;
	for(i=0;i<maxvar;i++) {
		OutMes( "\t%s%s = &mem_var[%d];\r\n", CPPHED_HSPVAR, GetHSPVarName(i).c_str(), i );
	}
	OutMes( "\r\n" );

	OutLine( "__HspInitEntry();\r\n" );
	OutMes( "}\r\n\r\n" );
	OutMes( "void __HspInitEntry( void ) {\r\n" );

	//		コードの変換
	//
	while(1) {
		if ( mcs > mcs_end ) break;

		//		endifのチェック
		//
		if ( ifmode[iflevel]>=2 ) {		// if end
			if ( mcs_last>=ifptr[iflevel] ) {
				ifmode[iflevel] = 0;
				if ( iflevel == 0 ) { Alert( "Invalid endif." ); return -1; }
				i = iftaskid[iflevel];
				iflevel--;
				//SetIndent( iflevel );
				//OutLine( "}\n" );
				MakeCPPTask( i );
				continue;
			}
		}

		//		ラベルチェック
		//
		MakeCPPLabel();

		//		行頭のコード
		//
		cmdtype = cstype;
		cmdval = csval;
		//MakeProgramInfoHSPName();
		//printf( "#%06x:CSTYPE%d VAL%d\n", mcs_last - mcs_start, cstype, csval );
		//Alert( mes );
		//out->PutStr( mes );

		//		パラメーター
		//
		switch( cmdtype ) {
		case TYPE_STRUCT:						// 代替変数(struct)
		case TYPE_VAR:							// 変数代入
			{
			CMemBuf arname;
			int va,pnum;
			MakeImmidiateHSPName( mes, cmdtype, cmdval );
			OutLine( "// %s ", mes );
			getCS();
			GetContext( &ctxbak );
			op = MakeCPPVarForHSP();
			SetContext( &ctxbak );
			MakeImmidiateCPPName( mes, cmdtype, cmdval );
			sCurTask->usedVariables.insert(Var(cmdtype, cmdval));
			va = MakeCPPVarExpression( &arname, NULL );
			getCS();

			switch( op ) {
			case -1:		// 通常の代入
				pnum = MakeCPPParam( sCurBB );
				OutMes( arname.GetBuffer() );
				OutLine( "VarSet(%s,%d,%d);\r\n", mes, va, pnum );

				if (sReachable) {
					GetContext( &ctxbak2 );
					SetContext( &ctxbak );
					MakeCPPVarExpression( NULL, sCurBB );
					SetContext( &ctxbak2 );

					Function *f = M->getFunction("VarSet");
					const FunctionType *ft = f->getFunctionType();

					if (ft->getNumParams() != 3) {
						Alert("bad sig");
					}
				
					std::vector<Value*> args;

//					Value *var = M->getOrInsertGlobal(mes, pvalType);
					Value *var = M->getNamedValue(mes);
					if (!var) {
						Alert(mes);
					}
					args.push_back(var);
					args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
					args.push_back(ConstantInt::get(Type::getInt32Ty(Context), pnum));
				
					Builder.CreateCall(f, args.begin(), args.end());
					sCurTask->operations.push_back( new VarSetOp( cmdtype, cmdval, va, pnum ) );
				}
				break;
			case -2:		// ++
				OutMes( arname.GetBuffer() );
				OutLine( "VarInc(%s,%d);\r\n", mes, va );
				if (sReachable) {
					GetContext( &ctxbak2 );
					SetContext( &ctxbak );
					MakeCPPVarExpression( NULL, sCurBB );
					SetContext( &ctxbak2 );

					Function *f = M->getFunction("VarInc");
					const FunctionType *ft = f->getFunctionType();
				
					std::vector<Value*> args;

					Value *var = M->getNamedValue(mes);
					if (!var) {
						Alert(mes);
					}
					args.push_back(var);
					args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
				
					Builder.CreateCall(f, args.begin(), args.end());

					sCurTask->operations.push_back( new VarIncOp( cmdtype, cmdval, va ) );
				}
				break;
			case -3:		// --
				OutMes( arname.GetBuffer() );
				OutLine( "VarDec(%s,%d);\r\n", mes, va );
				if (sReachable) {
					GetContext( &ctxbak2 );
					SetContext( &ctxbak );
					MakeCPPVarExpression( NULL, sCurBB );
					SetContext( &ctxbak2 );

					Function *f = M->getFunction("VarDec");
					const FunctionType *ft = f->getFunctionType();
				
					std::vector<Value*> args;

					Value *var = M->getNamedValue(mes);
					if (!var) {
						Alert(mes);
					}
					args.push_back(var);
					args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
				
					Builder.CreateCall(f, args.begin(), args.end());

					sCurTask->operations.push_back( new VarDecOp( cmdtype, cmdval, va ) );
				}
				break;
			case -4:		// エラー
				break;
			default:		// 演算子付き代入
				pnum = MakeCPPParam( sCurBB );
				if ( pnum > 1 ) {
					Alert( "Too much parameters(VarCalc)." );
				}
				OutMes( arname.GetBuffer() );
				OutLine( "VarCalc(%s,%d,%d);\r\n", mes, va, op );
				if (sReachable) {
					GetContext( &ctxbak2 );
					SetContext( &ctxbak );
					MakeCPPVarExpression( NULL, sCurBB );
					SetContext( &ctxbak2 );

					Function *f = M->getFunction("VarCalc");
					const FunctionType *ft = f->getFunctionType();

					if (ft->getNumParams() != 3) {
						Alert("bad sig");
					}
				
					std::vector<Value*> args;

//					Value *var = M->getOrInsertGlobal(mes, pvalType);
					Value *var = M->getNamedValue(mes);
					if (!var) {
						Alert(mes);
					}
					args.push_back(var);
					args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
					args.push_back(ConstantInt::get(Type::getInt32Ty(Context), op));
				
					Builder.CreateCall(f, args.begin(), args.end());

					sCurTask->operations.push_back( new VarCalcOp( cmdtype, cmdval, va, op ) );
				}
				break;
			}
			break;
			}
		case TYPE_CMPCMD:						// 比較命令
			{
			//	HSPソースコメント
			if ( cmdval == 0 ) {
				GetContext( &ctxbak );
				OutLine( "// if " );
				mcs++;
				getCS();
				MakeProgramInfoParam2();
				SetContext( &ctxbak );
			}
			int thenTask = 0;
			// C形式の出力
			if ( cmdval == 0 ) {
				iflevel++;

				sprintf( mes, "if (HspIf()) { TaskSwitch(%d); return; }\r\n", curot );
				thenTask = curot;
				if ( iflevel >= MAX_IFLEVEL ) {
					Alert( "Stack(If) overflow." );
					return -2;
				}

				ifmode[iflevel] = 1;
				iftaskid[iflevel] = curot;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				ifmode[iflevel]++;
				curot++;
			} else {
				strcpy( mes, "// else\r\n" );
				ifmode[iflevel] = 3;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				//SetIndent( iflevel-1 );
				i = iftaskid[iflevel];
				MakeCPPTask2( curot, i );
				iftaskid[iflevel] = curot;
				curot++;
			}
			mcs++;
			getCS();
			MakeCPPParam( sCurBB );
			OutLine( mes );
			if ( cmdval == 0 ) {
				
				BasicBlock *thenBB = BasicBlock::Create( getGlobalContext(), "then", sCurTask->func );
				BasicBlock *elseBB = BasicBlock::Create( getGlobalContext(), "else", sCurTask->func );
				//				BasicBlock *mergeBB = BasicBlock::Create(getGlobalContext(), "ifcont");
				Value *ifRes = CreateCallImm( sCurBB, "HspIf" );

				Value *cond = Builder.CreateICmpNE( ifRes,
													ConstantInt::get( Type::getInt8Ty( Context ), 0 ) );

				Builder.CreateCondBr( cond, thenBB, elseBB );

				Builder.SetInsertPoint( thenBB );
				CreateCallImm( thenBB, "TaskSwitch", thenTask );
				Builder.CreateBr( sCurTaskRetBB );

				//				sCurTaskF->getBasicBlockList().push_back(elseBB);
				sCurBB = elseBB;
				Builder.SetInsertPoint( elseBB );

				sCurTask->operations.push_back( new CmpOp( thenTask ) );
			} else {
			}
			//SetIndent( iflevel );
			}
			break;
		case TYPE_PROGCMD:						// プログラム制御命令
			switch( cmdval ) {
			case 0x00:								// goto
			case 0x02:								// return
			case 0x03:								// break
			case 0x05:								// loop
			case 0x06:								// continue
			case 0x0b:								// foreach
			case 0x0c:								// (hidden)foreach check
			case 0x10:								// end
			case 0x1b:								// assert
			case 0x11:								// stop
			case 0x19:								// on
				//		後にreturnを付ける
				//
				MakeCPPSub( cmdtype, cmdval, sCurBB );
				OutLine( "return;\r\n" );
				sReachable = false;
				break;
			case 0x01:								// gosub
			case 0x18:								// exgoto
				//		gosubの展開
				//
				{
				int pnum;
				OutLine( "// %s\r\n", GetHSPName(cmdtype,cmdval).c_str() );
				getCS();
				pnum = MakeCPPParam( sCurBB );
				OutLine( "PushLabel(%d); %s(%d,%d); return;\r\n", curot, GetHSPCmdTypeName(cmdtype).c_str(), cmdval, pnum+1 );
				CreateCallImm( sCurBB, "PushLabel", curot );
				sCurTask->operations.push_back( new PushLabelOp( curot ) );
				CreateCallImm( sCurBB, GetHSPCmdTypeName(cmdtype), cmdval, pnum+1 );
				sCurTask->operations.push_back( new CmdOp( cmdtype, cmdval, pnum+1 ) );
				sReachable = false;
				MakeCPPTask( curot );
				curot++;
				break;
				}
			case 0x04:								// repeat
				//		repeatの展開
				//
				{
				int pnum;
				OutLine( "// repeat\r\n" );
				getCS();
				pnum = MakeCPPParam( sCurBB, 1 );
				OutLine( "PushLabel(%d); %s(%d,%d); return;\r\n", curot, GetHSPCmdTypeName(cmdtype).c_str(), cmdval, pnum+1 );
				CreateCallImm( sCurBB, "PushLabel", curot );
				sCurTask->operations.push_back( new PushLabelOp( curot ) );
				CreateCallImm( sCurBB, GetHSPCmdTypeName(cmdtype), cmdval, pnum+1 );
				sCurTask->operations.push_back( new CmdOp( cmdtype, cmdval, pnum+1 ) );
				sReachable = false;
				MakeCPPTask( curot );
				curot++;
				break;
				}

			case 0x07:								// wait
			case 0x08:								// await
			case 0x17:								// run
				//		タスクを区切る
				//
				MakeCPPSub( cmdtype, cmdval, sCurBB );
				MakeCPPTask( curot );
				curot++;
				break;
			default:
				MakeCPPSub( cmdtype, cmdval, sCurBB );
				break;
			}
			break;
		default:
			//		通常命令
			//
			MakeCPPSub( cmdtype, cmdval, sCurBB );
			break;
		}
	}

	Builder.CreateBr( sCurTaskRetBB );
	//	sCurTaskF->getBasicBlockList().push_back(sCurTaskRetBB);
	//Builder.CreateRetVoid();
	OutMes( "}\r\n\r\n" );
	OutMes( "//-End of Source-------------------------------------------\r\n" );
	return 0;
}

/*------------------------------------------------------------*/


int CHsp3LLVM::MakeSource( int option, void *ref )
{
	//		C/C++ソースを出力する
	//
	int i;
	int otmax;
	int labindex;
	int maxvar;
	LLVMContext &Context = getGlobalContext();

	makeoption = option;

	maxvar = hsphed->max_val;

  
	// Create some module to put our function into it.
	M = new Module("test", Context);
  
	OutMes( "//\r\n//\thsp3cnv generated source\r\n//\t[%s]\r\n//\r\n", orgname );

	OutMes( "#include \"hsp3r.h\"\r\n" );
	OutMes( "\r\n#define _HSP3CNV_DATE %s\n#define _HSP3CNV_TIME %s\r\n", localinfo.CurrentDate(), localinfo.CurrentTime() );
	OutMes( "#define _HSP3CNV_MAXVAR %d\r\n", hsphed->max_val );
	OutMes( "#define _HSP3CNV_MAXHPI %d\r\n", hsphed->max_hpi );
	OutMes( "#define _HSP3CNV_VERSION 0x%x\r\n", hsphed->version );
	OutMes( "#define _HSP3CNV_BOOTOPT %d\r\n", hsphed->bootoption );
	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );


	sMaxVar = hsphed->max_val;
	sMaxHpi = hsphed->max_hpi;

	maxvar = hsphed->max_val;

	// 関数の準備
	SMDiagnostic Err;
	ParseAssemblyString(PROTOTYPES, M, Err, Context);
	const Type *pvalType = GetPValType();

	// 変数の準備
	sVariables = new GlobalVariable*[maxvar];
	for(i=0;i<maxvar;i++) {
		OutMes( "static PVal *%s%s;\r\n", CPPHED_HSPVAR, GetHSPVarName(i).c_str(), i );

		Constant *constInt = ConstantInt::get(Type::getInt32Ty(Context), (int)0);
		Constant *constPtr = ConstantExpr::getIntToPtr(constInt, pvalType);

//		sVariables[i] = new GlobalVariable(ppvalType, false, GlobalValue::ExternalLinkage, constPtr,
//										   CPPHED_HSPVAR + GetHSPVarName(i), M);
		sVariables[i] = (GlobalVariable*)M->getOrInsertGlobal(CPPHED_HSPVAR + GetHSPVarName(i), pvalType);
	}

	sDsBase = (GlobalVariable*)M->getOrInsertGlobal("ds_base", Type::getInt32Ty(Context));

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	//		初期化ファンクションを作成する
	//
	OutMes( "void __HspInit( Hsp3r *hsp3 ) {\r\n" );
	OutMes( "\thsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );\r\n" );
	OutMes( "}\r\n" );

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	otmax = GetOTCount();
	curot = otmax;

	i = MakeCPPMain();
	if ( i ) return i;

	//		タスク(ラベル)テーブルを作成する
	//
	OutMes( "\r\nCHSP3_TASK __HspTaskFunc[]={\r\n" );

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( GetOTInfo( labindex ) == -1 ) {
			OutMes( "(CHSP3_TASK) L%04x,\r\n", labindex );
		} else {
			OutMes( "(CHSP3_TASK) 0,\r\n" );
		}
		labindex++;
	}
	while(1) {
		if ( labindex>=curot ) break;
		OutMes( "(CHSP3_TASK) L%04x,\r\n", labindex );
		labindex++;
	}
	OutMes( "\r\n};\r\n" );
	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	sLabMax = labindex;
	//sLabMax = labindex = 500;
	sDsBasePtr = GetDS( 0 );

	std::string ErrorInfo;
	std::auto_ptr<raw_fd_ostream> 
		Out(new raw_fd_ostream("dump.ll", ErrorInfo,
							   raw_fd_ostream::F_Binary));
	if (!ErrorInfo.empty()) {
		errs() << ErrorInfo << '\n';
		return -1;
	}
	
	*Out << *M;

	std::auto_ptr<raw_fd_ostream> 
		Out2(new raw_fd_ostream("dump2.txt", ErrorInfo,
							   raw_fd_ostream::F_Binary));
	if (!ErrorInfo.empty()) {
		errs() << ErrorInfo << '\n';
		return -1;
	}
	
	char mes[256];
	for (int i=0;i<sLabMax;i++) {
		sprintf( mes, "L%04x", i );
		Task *task = sTasks[mes];
		
		*Out2 << "#" << mes << "\r\n";
		for (int j=0; j < task->operations.size(); j++) {
			*Out2 << task->operations[j]->GetName() << "\r\n";
		}
		*Out2 << "\r\n";
		AnalyzeTask(task);
	}

	for(std::map<int, std::set<Task*> >::iterator it = varTaskMap.begin();
		it != varTaskMap.end(); ++it) {
		if ( it->second.size() == 1 ) {
			Task *task = *(it->second.begin());
			Var *var = GetTaskVar( task, it->first );

			VarRefOp* firstAccessOp = NULL;
			bool useRegister = true;
			for ( std::vector<Op*>::iterator it2 = task->operations.begin();
				  it2 != task->operations.end(); it2++ ) {
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
						if ( vrop->GetVarNo() != var->val )
							continue;
						if ( op->GetOpCode() == PUSH_VAR_PTR_OP ) {
							useRegister = false;
						}
						if ( vrop->GetArrayDim() > 0) {
							useRegister = false;
						}
						if ( !firstAccessOp ) {
							firstAccessOp = vrop;
						}
					}
					break;
				}
			}
			switch (firstAccessOp->GetOpCode()) {
			case VAR_SET_OP:
				break;
			case PUSH_VAR_OP:
			case PUSH_VAR_PTR_OP:
			case VAR_CALC_OP:
			case VAR_INC_OP:
			case VAR_DEC_OP:
				useRegister = false;
				break;
			}
			var->localVar = useRegister;
		}
	}

    std::string ErrMsg;
	if (verifyModule(*M, ReturnStatusAction, &ErrMsg)) {
		Alert((char*)ErrMsg.c_str());
	}


	EE = EngineBuilder(M)
		.setEngineKind(EngineKind::JIT)
		.setOptLevel(CodeGenOpt::Default)
		.create();

	EE->InstallLazyFunctionCreator(HspLazyFunctionCreator);

	return 0;
}
