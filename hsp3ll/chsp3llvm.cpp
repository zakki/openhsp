
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
#include "chsp3llvm.h"
#include "hsp3r.h"

#ifdef HSPWIN
#include <windows.h>
#endif

using namespace llvm;


class Op;


class Var {
public:
	int type;
	int val;

	int tflag;
	int num;
	int change;

	bool localVar;

	Var( int type, int val ) : type( type ), val( val ), tflag(0), num(0), change(0), localVar(false)
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
	BasicBlock *entry;
	int numCall;
	int numCurCall;
	int numChange;
	std::set<Var> usedVariables;
	std::vector<Op*> operations;
	std::map<std::pair<int, int>, Value*> llVariables;
	std::set<BasicBlock*> returnBlocks;

	bool useGeneralFunc;
	bool skipTypeCheck;

	Task() : numCall(0), numCurCall(0), numChange(0),
			 useGeneralFunc(true), skipTypeCheck(false)
	{
	}
};

typedef int (* CHSP3_FUNC) (int);

//
static Module *M;
static ExecutionEngine *EE;
static IRBuilder<> Builder(getGlobalContext());
static FunctionPassManager *TheFPM;
static PassManager *Passes;

static Task *sCurTask;
//static BasicBlock *sCurBB;
//static BasicBlock *sCurTaskRetBB;
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
static HSPCTX *sHspctx;
static Hsp3r *sHsp3r;
static PVal **Var__HspVars;
static Function *sOrigFunc;
static Function *sCurFunc;
static int sCurNo;


extern int GetCurTaskId();
extern void HspVarCoreArray2( PVal *pval, int offset );
extern CHsp3LLVM *hsp3;

static Value* MakeImmidiateCPPName( CHsp3LLVM* hsp, BasicBlock* bb, int type,
									int val, int prm, char *opt=NULL );

static Value* CreateCallImm( BasicBlock *bblock, const std::string& name );
static Value* CreateCallImm( BasicBlock *bblock, const std::string& name, int a );
static Value* CreateCallImm( BasicBlock *bblock, const std::string& name, int a, int b );
static void LoadLLRuntime();

static void RecompileModule();

enum OPCODE {
	NOP, TASK_SWITCH_OP, CALC_OP, PUSH_VAR_OP, PUSH_VAR_PTR_OP, PUSH_DNUM_OP, PUSH_INUM_OP,
	PUSH_LABEL_OP, PUSH_STR_OP, PUSH_CMD_OP, PUSH_FUNC_END_OP, VAR_SET_OP,
	VAR_INC_OP, VAR_DEC_OP, VAR_CALC_OP, COMPARE_OP, CMD_OP, MODCMD_OP, PUSH_DEFAULT_OP,
	PUSH_FUNC_PARAM_OP, PUSH_FUNC_PARAM_PTR_OP,
};

enum COMPILE_TYPE {
	DEFAULT, VALUE
};

class Op {
public:
	COMPILE_TYPE compile;
	int flag;
	Value *llValue;

	std::vector<Op*> operands;

	Op() : flag(-1)
	{
	}
	virtual ~Op() {}
	virtual std::string GetName() const
	{
		return "Op";
	}
	virtual std::string GetParam() const
	{
		return "()";
	}
	virtual OPCODE GetOpCode() const = 0;
	virtual BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
											 BasicBlock *bb, BasicBlock *retBB, Task *task ) = 0;
};

class TaskSwitchOp : public Op {
	int taskId;
public:
	explicit TaskSwitchOp( int task ) : taskId( task )
	{
	}
	virtual std::string GetName() const
	{
		return "TaskSwitchOp";
	}
	virtual std::string GetParam() const
	{
		char buf[256];
		sprintf( buf, "(%d)", taskId );
		return buf;
	}
	virtual OPCODE GetOpCode() const
	{
		return TASK_SWITCH_OP;
	}
	int GetNextTask() const
	{
		return taskId;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		CreateCallImm( bb, "TaskSwitch", taskId );
		return bb;
	}
};

class CalcOp : public Op {
	int op;
public:
	explicit CalcOp( int op ) : op( op )
	{
	}
	int GetCalcOp() const
	{
		return op;
	}
	virtual std::string GetName() const
	{
		return "CalcOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return CALC_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		CreateCallImm( bb, "Calc" + hsp->GetHSPOperator2( op ) );
		return bb;
	}
};

class VarRefOp : public Op {
protected:
	int type;
	int val;
	int prm;

	int va;
public:
	bool useRegister;

	VarRefOp( int type, int val, int prm, int va ) : type( type ), val( val ), prm( prm ), va( va )
	{
	}
	std::pair<int, int> GetVarKey() const
	{
		return std::make_pair(type, val);
	}
	int GetVarType() const
	{
		return type;
	}
	int GetVarNo() const
	{
		return val;
	}
	int GetPrmNo() const
	{
		return prm;
	}
	int GetArrayDim() const
	{
		return va;
	}
	virtual bool IsParam() const
	{
		return false;
	}
};

class PushVarOp : public VarRefOp {
public:
	PushVarOp( int val, int va ) : VarRefOp( TYPE_VAR, val, -1, va )
	{
	}
	virtual std::string GetName() const
	{
		return "PushVarOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_VAR_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint( bb );

		Function* f = M->getFunction( "PushVar" );

		std::vector<Value*> args;
		Value *var = MakeImmidiateCPPName( hsp, bb, TYPE_VAR, val, prm );
		if (!var)
			Alert( "varname" );
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty( Context ), va));

		Builder.SetInsertPoint( bb );
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class PushVarPtrOp : public VarRefOp {
public:
	PushVarPtrOp( int val, int va ) : VarRefOp( TYPE_VAR, val, -1, va )
	{
	}
	virtual std::string GetName() const
	{
		return "PushVarPtrOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_VAR_PTR_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint( bb );

		Function *f = M->getFunction( "PushVAP" );

		std::vector<Value*> args;
		Value *var = MakeImmidiateCPPName( hsp, bb, TYPE_VAR, val, prm );
		if (!var)
			Alert( "varname" );
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty( Context ), va));

		Builder.SetInsertPoint( bb );
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
	double GetValue() const
	{
		return val;
	}
	virtual std::string GetName() const
	{
		return "PushDnumOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_DNUM_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Function *f = M->getFunction("Push" + hsp->GetHSPCmdTypeName( TYPE_DNUM ));

		std::vector<Value*> args;
		args.push_back(ConstantFP::get( Type::getDoubleTy( Context ), val ));

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
	int GetValue() const
	{
		return val;
	}
	virtual std::string GetName() const
	{
		return "PushInumOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_INUM_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task ) {
		CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName( TYPE_INUM ), val );

		return bb;
	}
};

class PushLabelOp : public Op {
	int val;
public:
	explicit PushLabelOp( int val ) : val ( val )
	{
	}
	virtual std::string GetName() const
	{
		return "PushLabelOp";
	}
	virtual std::string GetParam() const
	{
		char buf[256];
		sprintf( buf, "(%d)", val );
		return buf;
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_LABEL_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName( TYPE_LABEL ), val );

		return bb;
	}
};

class PushStrOp : public Op {
	int val;
public:
	explicit PushStrOp( int val ) : val ( val )
	{
	}
	virtual std::string GetName() const
	{
		return "PushStrOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_STR_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Function *f = M->getFunction("Push" + hsp->GetHSPCmdTypeName( TYPE_STRING ));

		std::vector<Value*> args;

		LoadInst *ld = Builder.CreateLoad( sDsBase, "base" );
		Constant *constInt = ConstantInt::get(Type::getInt32Ty( Context ), (int)val);
		Value *v = Builder.CreateAdd( ld, constInt );
		Value *ptr = Builder.CreateIntToPtr(v, TypeBuilder<types::i<8>*, false>::get(Context));
		args.push_back(ptr);

		Builder.SetInsertPoint( bb );
		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class PushDefaultOp : public Op {
	double val;
public:
	explicit PushDefaultOp()
	{
	}
	virtual std::string GetName() const
	{
		return "PushDefaultOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_DEFAULT_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();

		CreateCallImm( bb, "PushDefault" );
		return bb;
	}
};

class PushFuncPrmOp : public VarRefOp {
public:
	explicit PushFuncPrmOp( int val, int prm, int va ) : VarRefOp ( TYPE_STRUCT, val, prm, va )
	{
	}
	virtual std::string GetName() const
	{
		return "PushFuncPrmOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_FUNC_PARAM_OP;
	}
	virtual bool IsParam() const
	{
		return true;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		const STRUCTPRM *st = hsp->GetMInfo( val );
		switch( st->mptype ) {
		case MPTYPE_LOCALVAR:
			CreateCallImm( bb, "PushFuncPrm", prm, va );
			break;
		case MPTYPE_VAR:
		case MPTYPE_ARRAYVAR:
		case MPTYPE_SINGLEVAR:
			CreateCallImm( bb, "PushFuncPrm", prm, va );
			break;
		case MPTYPE_DNUM:
			CreateCallImm( bb, "PushFuncPrmD", prm );
			break;
		case MPTYPE_INUM:
			CreateCallImm( bb, "PushFuncPrmI", prm );
			break;

		default:
			CreateCallImm( bb, "PushFuncPrm1", prm );
			break;
		}
/*
		if ( va == 0 ) {
			CreateCallImm( bb, "PushFuncPrm1", prm );
		} else {
			CreateCallImm( bb, "PushFuncPrm", prm, va );
		}
*/
/*
			int prmid;
			int va;
			STRUCTPRM *prm;
			prm = GetMInfo( csval );
			switch( prm->mptype ) {
			case MPTYPE_LOCALVAR:
				prmid = prmcnv_locvar[csval - curprmindex];
				getCS();
				va = MakeCPPVarExpression( &arname );
				eout->PutStr( arname.GetBuffer() );
				sprintf( mes,"PushFuncPrm(%d,%d); ", prmid, va );
				vflag = 1;
				break;
			case MPTYPE_VAR:
			case MPTYPE_ARRAYVAR:
			case MPTYPE_SINGLEVAR:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				va = MakeCPPVarExpression( &arname );
				eout->PutStr( arname.GetBuffer() );
				sprintf( mes,"PushFuncPrm(%d,%d); ", prmid, va );
				vflag = 1;
				break;
			case MPTYPE_DNUM:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrmD(%d); ", prmid );
				break;
			case MPTYPE_INUM:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrmI(%d); ", prmid );
				break;

			default:
				prmid = csval - curprmindex + curprmlocal;
				getCS();
				sprintf( mes,"PushFuncPrm(%d); ", prmid );
				break;
			}
*/
		return bb;
	}
};

class PushFuncPrmPtrOp : public VarRefOp {
public:
	explicit PushFuncPrmPtrOp( int val, int prm, int va ) : VarRefOp ( TYPE_STRUCT, val, prm, va )
	{
	}
	virtual std::string GetName() const
	{
		return "PushFuncPrmPtrOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_FUNC_PARAM_PTR_OP;
	}
	virtual bool IsParam() const
	{
		return true;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		CreateCallImm( bb, "PushFuncPAP", prm, va );
		return bb;
	}
};

class CallOp : public Op {
protected:
	int type;
	int val;

	int pnum;
public:
	CallOp( int type, int val, int pnum ) : type( type ), val( val ), pnum ( pnum )
	{
	}
	int GetCmdType()
	{
		return type;
	}
	int GetCmdVal()
	{
		return val;
	}
	int GetCmdPNum()
	{
		return pnum;
	}
};

class PushCmdOp : public CallOp {
public:
	PushCmdOp( int type, int val, int pnum ) : CallOp( type, val, pnum )
	{
	}
	virtual std::string GetName() const
	{
		return "PushCmdOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_CMD_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		CreateCallImm( bb, "Push" + hsp->GetHSPCmdTypeName( type ), val, pnum );

		return bb;
	}
};

class PushFuncEndOp : public Op {
public:
	explicit PushFuncEndOp()
	{
	}
	virtual std::string GetName() const
	{
		return "PushFuncEndOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return PUSH_FUNC_END_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		CreateCallImm( bb, "PushFuncEnd" );

		return bb;
	}
};

class VarSetOp : public VarRefOp {
	int pnum;
public:
	VarSetOp( int type, int val, int prm, int va, int pnum ) : VarRefOp( type, val, prm, va ), pnum( pnum )
	{
	}
	virtual std::string GetName() const
	{
		return "VarSetOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return VAR_SET_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint( bb );

		Function *f = M->getFunction( "VarSet" );
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = MakeImmidiateCPPName( hsp, bb, type, val, prm );
		if (!var) {
			Alert( "mes" );
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty( Context ), va));
		args.push_back(ConstantInt::get(Type::getInt32Ty( Context ), pnum));

		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class VarIncOp : public VarRefOp {
public:
	VarIncOp( int type, int val, int prm, int va ) : VarRefOp( type, val, prm, va )
	{
	}
	virtual std::string GetName() const
	{
		return "VarIncOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return VAR_INC_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint( bb );

		Function *f = M->getFunction( "VarInc" );
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = MakeImmidiateCPPName( hsp, bb, type, val, prm );
		if (!var) {
			Alert( "mes" );
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty( Context ), va));

		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class VarDecOp : public VarRefOp {
public:
	VarDecOp( int type, int val, int prm, int va ) : VarRefOp( type, val, prm, va )
	{
	}
	virtual std::string GetName() const
	{
		return "VarDecOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return VAR_DEC_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint( bb );

		Function *f = M->getFunction( "VarDec" );
		const FunctionType *ft = f->getFunctionType();

		std::vector<Value*> args;

		Value *var = MakeImmidiateCPPName( hsp, bb, type, val, prm );
		if (!var) {
			Alert( "mes" );
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty( Context ), va));

		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class VarCalcOp : public VarRefOp {
	int op;
public:
	VarCalcOp( int type, int val, int prm, int va, int op ) : VarRefOp( type, val, prm, va ), op( op )
	{
	}
	virtual std::string GetName() const
	{
		return "VarCalcOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return VAR_CALC_OP;
	}
	int GetCalcOp() const {
		return op;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint( bb );

		Function *f = M->getFunction( "VarCalc" );
		const FunctionType *ft = f->getFunctionType();

		if (ft->getNumParams() != 3) {
			Alert( "bad sig" );
		}

		std::vector<Value*> args;

		Value *var = MakeImmidiateCPPName( hsp, bb, type, val, prm );
		if (!var) {
			Alert( "mes" );
		}
		args.push_back(var);
		args.push_back(ConstantInt::get(Type::getInt32Ty( Context ), va));
		args.push_back(ConstantInt::get(Type::getInt32Ty( Context ), op));

		Builder.CreateCall(f, args.begin(), args.end());

		return bb;
	}
};

class CompareOp : public Op {
	int taskId;
public:
	CompareOp( int task ) : taskId( task )
	{
	}
	virtual std::string GetName() const
	{
		return "CompareOp";
	}
	virtual OPCODE GetOpCode() const
	{
		return COMPARE_OP;
	}
	int GetNextTask() const
	{
		return taskId;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		LLVMContext &Context = getGlobalContext();
		Builder.SetInsertPoint( bb );

		BasicBlock *thenBB = BasicBlock::Create( Context, "then", func );
		BasicBlock *elseBB = BasicBlock::Create( Context, "else", func );
		Value *ifRes = CreateCallImm( bb, "HspIf" );

		Value *cond = Builder.CreateICmpNE( ifRes,
											ConstantInt::get( Type::getInt8Ty( Context ), 0 ) );

		Builder.CreateCondBr( cond, thenBB, elseBB );

		Builder.SetInsertPoint( thenBB );
		CreateCallImm( thenBB, "TaskSwitch", taskId );
		Builder.CreateBr( retBB );
		task->returnBlocks.insert( thenBB );

		return elseBB;
	}
};

class CmdOp : public CallOp {
public:
	CmdOp( int type, int val, int pnum ) : CallOp( type, val, pnum )
	{
	}
	virtual std::string GetName() const
	{
		return "CmdOp";
	}
	virtual std::string GetParam() const
	{
		char buf[256];
		sprintf( buf, "(%d, %d, %d)//%s", type, val, pnum,
				 CHsp3Parser::GetHSPCmdTypeName( type ).c_str() );
		return buf;
	}
	virtual OPCODE GetOpCode() const
	{
		return CMD_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		CreateCallImm( bb, hsp->GetHSPCmdTypeName( type ), val, pnum );

		return bb;
	}
};

class ModCmdOp : public CallOp {
public:
	ModCmdOp( int type, int val, int pnum ) : CallOp( type, val, pnum )
	{
	}
	virtual std::string GetName() const
	{
		return "ModCmdOp";
	}
	virtual std::string GetParam() const
	{
		char buf[256];
		sprintf( buf, "(%d, %d, %d)", type, val, pnum );
		return buf;
	}
	virtual OPCODE GetOpCode() const
	{
		return MODCMD_OP;
	}
	BasicBlock* GenerateDefaultCode( CHsp3LLVM *hsp, Function *func,
									 BasicBlock *bb, BasicBlock *retBB, Task *task )
	{
		CreateCallImm( bb, hsp->GetHSPCmdTypeName( type ), val, pnum );

		return bb;
	}
};

std::map<std::pair<int, int>, std::set<Task*> > varTaskMap;


static void UpdateOperands( Task *task )
{
	std::stack<Op*> stack;

	for ( std::vector<Op*>::iterator it=task->operations.begin();
		 it != task->operations.end(); it++ ) {
		Op *op = *it;
		op->operands.clear();
		switch ( op->GetOpCode() ) {
		case PUSH_VAR_OP:
			{
				PushVarOp *pv = (PushVarOp*)op;
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
				stack.push( op );
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
			}
			break;
		case PUSH_FUNC_PARAM_OP:
		case PUSH_FUNC_PARAM_PTR_OP:
			{
				VarRefOp *pv = (VarRefOp*)op;
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
				stack.push( op );
			}
			break;

		case PUSH_DNUM_OP:
		case PUSH_INUM_OP:
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
			break;
		case COMPARE_OP:
			op->operands.push_back( stack.top() );
			stack.pop();
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
}

static void AnalyzeTask( Task *task )
{
	std::string filename = "dump_" + task->name + ".txt";
	std::string ErrorInfo;
	std::auto_ptr<raw_fd_ostream>
		Out(new raw_fd_ostream(filename.c_str(), ErrorInfo,
							   raw_fd_ostream::F_Binary));
	if (!ErrorInfo.empty()) {
		errs() << ErrorInfo << '\n';
		return;
	}

	UpdateOperands( task );

	// 代入の右辺が変数へのポインタの場合、値に置き換える
	while ( true ) {
		bool changed = false;
		for ( std::vector<Op*>::iterator it = task->operations.begin();
			  it != task->operations.end() && !changed; it++ ) {
			Op *op = *it;
			switch ( op->GetOpCode() ) {
			case VAR_INC_OP:
			case VAR_DEC_OP:
			case VAR_CALC_OP:
			case VAR_SET_OP:
				{
					VarRefOp *vro = (VarRefOp*)op;
					if (vro->operands.size() == 1) {
						Op *rhv = vro->operands[0];
						if ( rhv->GetOpCode() == PUSH_VAR_PTR_OP ) {
							PushVarPtrOp *pv = (PushVarPtrOp*)rhv;
							find( task->operations.begin(),
								  task->operations.end(),
								  pv)[0]
								= new PushVarOp( pv->GetVarNo(), pv->GetArrayDim() );
							*Out << "VAP->Var\r\n";
							delete pv;
							UpdateOperands( task );
							changed = true;
						}
					}
				}
				break;
			}
		}
		if ( !changed )
			break;
	}

	for ( std::vector<Op*>::iterator it=task->operations.begin();
		 it != task->operations.end(); it++ ) {
		Op *op = *it;
		switch ( op->GetOpCode() ) {
		case PUSH_VAR_OP:
		case PUSH_VAR_PTR_OP:

		case PUSH_FUNC_PARAM_OP:
		case PUSH_FUNC_PARAM_PTR_OP:

		case VAR_INC_OP:
		case VAR_DEC_OP:

		case VAR_CALC_OP:
		case VAR_SET_OP:
			varTaskMap[((VarRefOp*)op)->GetVarKey()].insert( task );
			break;

		case PUSH_DNUM_OP:
		case PUSH_INUM_OP:
		case PUSH_LABEL_OP:
		case PUSH_STR_OP:
		case PUSH_FUNC_END_OP:
		case PUSH_CMD_OP:
		case CALC_OP:
		case COMPARE_OP:
		case CMD_OP:
		case MODCMD_OP:
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

static Var *GetTaskVar( Task *task, const std::pair<int, int>& key )
{
	for (std::set<Var>::iterator it = task->usedVariables.begin();
		 it != task->usedVariables.end(); it++) {
		Var& var = *it;

		if ( var.type != key.first )
			continue;

		PVal& pval = mem_var[var.val];
		if ( var.val == key.second ) {
			return &var;
		}
	}
	return NULL;
}

static bool IsCompilable( Task *task, Op *op, CHsp3LLVM *hsp )
{
	switch ( op->GetOpCode() ) {
	case PUSH_VAR_OP:
		{
			PushVarOp *pv = (PushVarOp*)op;
			Var *var = GetTaskVar( task, pv->GetVarKey() );
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
			Var *var = GetTaskVar( task, pv->GetVarKey() );
			PVal& pval = mem_var[var->val];
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
			for ( std::vector<Op*>::iterator it=op->operands.begin();
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
			Var *var = GetTaskVar( task, vs->GetVarKey() );
			PVal& pval = mem_var[var->val];
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
			Var *var = GetTaskVar( task, vs->GetVarKey() );
			PVal& pval = mem_var[var->val];
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
	for ( std::vector<Op*>::iterator it=op->operands.begin();
		  it != op->operands.end(); it++ ) {
		(*it)->compile = comp;
		MarkCompile( *it, comp );
	}
}

static void CheckType( CHsp3LLVM *hsp, Task *task)
{
	for ( std::vector<Op*>::iterator it=task->operations.begin();
		  it != task->operations.end(); it++ ) {
		Op *op = *it;
		op->compile = DEFAULT;
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
					Var *var = GetTaskVar( task,
										   ((PushVarOp*)op)->GetVarKey() );
					PVal& pval = mem_var[var->val];
					changed |= op->flag != pval.flag;
					op->flag = pval.flag;
				}
				break;
			case PUSH_VAR_PTR_OP:
				{
					Var *var = GetTaskVar(task,
										  ((PushVarPtrOp*)op)->GetVarKey() );
					PVal& pval = mem_var[var->val];
					changed |= op->flag != pval.flag;
					op->flag = pval.flag;
				}
				break;
			case PUSH_DNUM_OP:
				changed |= op->flag != HSPVAR_FLAG_DOUBLE;
				op->flag = HSPVAR_FLAG_DOUBLE;
				break;
			case PUSH_INUM_OP:
				changed |= op->flag != HSPVAR_FLAG_INT;
				op->flag = HSPVAR_FLAG_INT;
				break;
			case PUSH_LABEL_OP:
				changed |= op->flag != HSPVAR_FLAG_LABEL;
				op->flag = HSPVAR_FLAG_LABEL;
				break;
			case PUSH_STR_OP:
				changed |= op->flag != HSPVAR_FLAG_STR;
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
					break;
				case MPTYPE_DNUM:
					changed |= op->flag != HSPVAR_FLAG_DOUBLE;
					op->flag = HSPVAR_FLAG_DOUBLE;
					break;
				case MPTYPE_INUM:
					changed |= op->flag != HSPVAR_FLAG_INT;
					op->flag = HSPVAR_FLAG_INT;
					break;
				}
				}
				break;

			case PUSH_CMD_OP:
				{
					PushCmdOp *pcop = (PushCmdOp*)op;

					int retType = GetFuncTypeRet( pcop->GetCmdType(),
												  pcop->GetCmdVal(),
												  pcop->GetCmdPNum() );
					changed |= op->flag != retType;
					op->flag = retType;
				}
				break;

			case CALC_OP:
				{
					CalcOp *calc = (CalcOp*)op;
					int tflag = GetOpTypeRet( calc->GetCalcOp(),
											 op->operands[1]->flag,
											 op->operands[0]->flag );
					changed |= op->flag != tflag;
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
	} while (changed);
}

static Value* CompileCalcI( int code, Value *a, Value *b )
{
	LLVMContext &Context = getGlobalContext();

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
	case CALCCODE_AND:
		return Builder.CreateAnd( a, b );
	case CALCCODE_OR:
		return Builder.CreateOr( a, b );
	case CALCCODE_XOR:
		return Builder.CreateXor( a, b );
	case CALCCODE_EQ:
		{
			Value *cond = Builder.CreateICmpEQ( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_NE:
		{
			Value *cond = Builder.CreateICmpNE( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_GT:
		{
			Value *cond = Builder.CreateICmpSGT( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_LT:
		{
			Value *cond = Builder.CreateICmpSLT( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_GTEQ:
		{
			Value *cond = Builder.CreateICmpSGE( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_LTEQ:
		{
			Value *cond = Builder.CreateICmpSLE( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_RR:
		return Builder.CreateAShr( a, b );
	case CALCCODE_LR:
		return Builder.CreateShl( a, b );

	default:
		return NULL;
	}
}

static Value* CompileCalcD( int code, Value *a, Value *b )
{
	LLVMContext &Context = getGlobalContext();

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
//	case CALCCODE_AND:
//	case CALCCODE_OR:
//	case CALCCODE_XOR:
	case CALCCODE_EQ:
		{
			Value *cond = Builder.CreateFCmpUEQ( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_NE:
		{
			Value *cond = Builder.CreateFCmpUNE( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_GT:
		{
			Value *cond = Builder.CreateFCmpUGT( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_LT:
		{
			Value *cond = Builder.CreateFCmpULT( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_GTEQ:
		{
			Value *cond = Builder.CreateFCmpUGE( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
	case CALCCODE_LTEQ:
		{
			Value *cond = Builder.CreateFCmpULE( a, b );
			return Builder.CreateZExt( cond, Type::getInt32Ty( Context ) );
		}
//	case CALCCODE_RR:
//	case CALCCODE_LR:
	default:
		return NULL;
	}
}

static BasicBlock *CompileOp( CHsp3LLVM *hsp, Function *func, BasicBlock *bb, Task *task, Op *op, BasicBlock *retBB )
{
	LLVMContext &Context = getGlobalContext();
	Builder.SetInsertPoint( bb );

	const Type *tyPI8 = TypeBuilder<types::i<8>*, false>::get(Context);
	const Type *tyPI32 = TypeBuilder<types::i<32>*, false>::get(Context);
	const Type *tyPD = TypeBuilder<types::ieee_double*, false>::get(Context);

	switch ( op->GetOpCode() ) {
	case PUSH_VAR_OP:
		{
			PushVarOp *pv = (PushVarOp*)op;
			Var *var = GetTaskVar( task, pv->GetVarKey() );
			PVal& pval = mem_var[var->val];

			Value *lpvar;
			char varnamebuf[256];
			hsp->MakeImmidiateCPPName( varnamebuf, pv->GetVarType(), pv->GetVarNo() );
			std::string varname(varnamebuf);

			std::map<std::pair<int, int>, Value*>::iterator it
				= task->llVariables.find( std::make_pair( pv->GetVarType(), pv->GetVarNo() ));

			if ( pv->useRegister) {
				op->llValue = it->second;

				Function *pNop = M->getFunction( "Nop" );
				Builder.SetInsertPoint( bb );
				Builder.CreateCall( pNop );
				return bb;
			}

			if ( it != task->llVariables.end() ) {
				lpvar = it->second;
			} else {
				lpvar = MakeImmidiateCPPName( hsp, bb, pv->GetVarType(),
											  pv->GetVarNo(), pv->GetPrmNo() );
			}
			task->llVariables[std::make_pair( pv->GetVarType(), pv->GetVarNo() )] = lpvar;

			Value *lpval = Builder.CreateConstGEP2_32( lpvar, 0, 4, "a_" + varname );
			LoadInst *lptr = Builder.CreateLoad( lpval, "b_" + varname );
			Value *ptr;
			if ( pval.flag == HSPVAR_FLAG_INT ) {
				ptr = Builder.CreateBitCast( lptr, tyPI32, "c_" + varname );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				ptr = Builder.CreateBitCast( lptr, tyPD, "d_" + varname );
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
				Builder.SetInsertPoint( curBB );
				Function *pReset = M->getFunction( "HspVarCoreReset" );
				Builder.CreateCall( pReset, lpvar );

				Function *pArray2 = M->getFunction( "HspVarCoreArray2" );
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					Builder.CreateCall2( pArray2, lpvar, pv->operands[i]->llValue );
				}
				Value *lpofs = Builder.CreateConstGEP2_32( lpvar, 0, 8 );
				LoadInst *lofs = Builder.CreateLoad( lpofs, "offset_" + varname );
				aptr = Builder.CreateGEP( ptr, lofs );
			}

			//Value *lpval = Builder.CreateConstGEP2_32( lpvar, 0, 4 );

			if ( pval.flag == HSPVAR_FLAG_INT ) {
				op->llValue = Builder.CreateLoad( aptr, "p_" + varname );
				return curBB;
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				op->llValue = Builder.CreateLoad( aptr, "p_" + varname );
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
				op->llValue = CreateCallImm( bb, "FuncPrmD",
											 prmop->GetPrmNo() );
				return bb;
			case MPTYPE_INUM:
				op->llValue = CreateCallImm( bb, "FuncPrmI",
											 prmop->GetPrmNo() );
				return bb;
			}
			return NULL;
		}
		break;

	case PUSH_CMD_OP:
		{
			PushCmdOp *pcop = (PushCmdOp*)op;
			char funcname[256];
			sprintf( funcname, "llvmRt%s_%03x",
					 hsp->GetHSPCmdTypeName( pcop->GetCmdType() ).c_str(),
					 pcop->GetCmdVal() );
			Function *f = M->getFunction( funcname );
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
						args.push_back( op->operands[i]->llValue );
					}
					op->llValue = Builder.CreateCall( f, args.begin(), args.end() );
					return bb;
				}

			NOTMATCH:
				;
			}

			int retType = GetFuncTypeRet( pcop->GetCmdType(),
										  pcop->GetCmdVal(),
										  pcop->GetCmdPNum() );

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
					return NULL;
				}
			}

			switch( retType ) {
			case HSPVAR_FLAG_DOUBLE:
				op->llValue = CreateCallImm( bb, "CallDouble" + hsp->GetHSPCmdTypeName( pcop->GetCmdType() ),
											 pcop->GetCmdVal(), pcop->GetCmdPNum() );
				return bb;
			case HSPVAR_FLAG_INT:
				op->llValue = CreateCallImm( bb, "CallInt" + hsp->GetHSPCmdTypeName( pcop->GetCmdType() ),
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
				op->llValue = CompileCalcI( calc->GetCalcOp(),
											op->operands[1]->llValue,
											op->operands[0]->llValue );
			} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE ) {
				op->llValue = CompileCalcD( calc->GetCalcOp(),
											op->operands[1]->llValue,
											op->operands[0]->llValue );
			} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE && op->operands[1]->flag == HSPVAR_FLAG_INT ) {
				Value *v = Builder.CreateFPToSI( op->operands[0]->llValue,
												TypeBuilder<types::i<32>, false>::get(Context) );
				op->llValue = CompileCalcI( calc->GetCalcOp(),
											op->operands[1]->llValue,
											v );
			} else if ( op->operands[0]->flag == HSPVAR_FLAG_INT && op->operands[1]->flag == HSPVAR_FLAG_DOUBLE ) {
				Value *v = Builder.CreateSIToFP( op->operands[0]->llValue,
												 TypeBuilder<types::ieee_double, false>::get(Context) );
				op->llValue = CompileCalcD( calc->GetCalcOp(),
											op->operands[1]->llValue ,
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
			Var *var = GetTaskVar( task, vs->GetVarKey() );
			PVal& pval = mem_var[var->val];

			if ( vs->useRegister) {
				std::map<std::pair<int, int>, Value*>::iterator it
					= task->llVariables.find( vs->GetVarKey() );

				if ( pval.flag == HSPVAR_FLAG_INT ) {
					Value *rhs;
					if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
						rhs = op->operands[0]->llValue;
					} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE ) {
						rhs = Builder.CreateFPToSI( op->operands[0]->llValue,
													TypeBuilder<types::i<32>, false>::get(Context) );
					} else {
						return NULL;
					}
					Value *result = CompileCalcI( vs->GetCalcOp(),
												  it->second, rhs );
					if ( !result )
						return NULL;
					op->llValue = result;
				} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
					Value *rhs;
					if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE ) {
						rhs = op->operands[0]->llValue;
					} else if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
						rhs = Builder.CreateSIToFP( op->operands[0]->llValue,
													TypeBuilder<types::ieee_double, false>::get(Context) );
					} else {
						return NULL;
					}

					Value *result = CompileCalcD( vs->GetCalcOp(),
												  it->second, rhs);
					if ( !result )
						return NULL;
					op->llValue = result;
				} else {
					return NULL;
				}
				task->llVariables[ vs->GetVarKey() ] = op->llValue;

				Function *pNop = M->getFunction( "Nop" );
				Builder.SetInsertPoint( bb );
				Builder.CreateCall( pNop );

				return bb;
			}

			Value *lpvar = MakeImmidiateCPPName( hsp, bb, vs->GetVarType(),
												 vs->GetVarNo(), vs->GetPrmNo() );
			Value *lpval = Builder.CreateConstGEP2_32( lpvar, 0, 4 );
			LoadInst *lptr = Builder.CreateLoad( lpval, "ptr" );

			if ( pval.flag == HSPVAR_FLAG_INT ) {
				Value *lp = Builder.CreateBitCast( lptr, tyPI32 );
				Value *lhs = Builder.CreateLoad( lp );
				Value *rhs;
				if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
					rhs = op->operands[0]->llValue;
				} else if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE ) {
					rhs = Builder.CreateFPToSI( op->operands[0]->llValue,
												TypeBuilder<types::i<32>, false>::get(Context) );
				} else {
					return NULL;
				}

				Value *result = CompileCalcI( vs->GetCalcOp(), lhs, rhs );
				if ( !result )
					return NULL;
				op->llValue = Builder.CreateStore( result, lp );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				Value *lp = Builder.CreateBitCast( lptr, tyPD );
				Value *lhs = Builder.CreateLoad( lp );
				Value *rhs;
				if ( op->operands[0]->flag == HSPVAR_FLAG_DOUBLE ) {
					rhs = op->operands[0]->llValue;
				} else if ( op->operands[0]->flag == HSPVAR_FLAG_INT ) {
					rhs = Builder.CreateSIToFP( op->operands[0]->llValue,
												TypeBuilder<types::ieee_double, false>::get(Context) );
				} else {
					return NULL;
				}

				Value *result = CompileCalcD( vs->GetCalcOp(), lhs, rhs );
				if ( !result )
					return NULL;
				op->llValue = Builder.CreateStore( result, lp );
			} else {
				return NULL;
			}
			return bb;
		}
		break;
	case VAR_SET_OP:
		{
			VarSetOp *vs = (VarSetOp*)op;
			Var *var = GetTaskVar( task, vs->GetVarKey() );
			PVal& pval = mem_var[var->val];

			if ( vs->useRegister) {
				op->llValue = op->operands[0]->llValue;
				task->llVariables[ vs->GetVarKey() ] = op->llValue;

				Function *pNop = M->getFunction( "Nop" );
				Builder.SetInsertPoint( bb );
				Builder.CreateCall( pNop );

				return bb;
			}

			Value *lpvar = MakeImmidiateCPPName( hsp, bb, vs->GetVarType(),
												 vs->GetVarNo(), vs->GetPrmNo() );
			Value *lpval = Builder.CreateConstGEP2_32( lpvar, 0, 4 );
			LoadInst *lptr = Builder.CreateLoad( lpval, "ptr" );

			if ( pval.flag == HSPVAR_FLAG_INT ) {
				Value *lp = Builder.CreateBitCast( lptr, tyPI32 );
				op->llValue = Builder.CreateStore( op->operands[0]->llValue, lp );
			} else if ( pval.flag == HSPVAR_FLAG_DOUBLE ) {
				Value *lp = Builder.CreateBitCast( lptr, tyPD );
				op->llValue = Builder.CreateStore( op->operands[0]->llValue, lp );
			} else {
				return NULL;
			}
			return bb;
		}
		break;
	case COMPARE_OP:
		{
			CompareOp *comp = (CompareOp*)op;

			Builder.SetInsertPoint( bb );

			BasicBlock *thenBB = BasicBlock::Create( Context, "then", func );
			BasicBlock *elseBB = BasicBlock::Create( Context, "else", func );


			Value *cond = Builder.CreateICmpEQ( op->operands[0]->llValue,
											   ConstantInt::get( Type::getInt32Ty( Context ), 0 ) );
			Builder.CreateCondBr( cond, thenBB, elseBB );

			Builder.SetInsertPoint( thenBB );
			CreateCallImm( thenBB, "TaskSwitch", comp->GetNextTask() );
			Builder.CreateBr( retBB );
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

static void CompileTask( CHsp3LLVM *hsp, Task *task, Function *func, BasicBlock *retBB )
{
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
					if ( vrop->IsParam() ) {
							useRegister = false;
					} else {
						if ( vrop->GetVarNo() != var.val )
							continue;
						if ( vrop->compile != VALUE )
							useRegister = false;
					}
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
	BasicBlock *curBB = BasicBlock::Create( Context,
											task->name + "_entry",
											func );
	task->entry = curBB;

	Builder.SetInsertPoint( curBB );

	sReachable = true;

	for ( std::vector<Op*>::iterator it=task->operations.begin();
		  it != task->operations.end(); it++ ) {
		Op *op = *it;

		if ( op->compile == VALUE ) {
			curBB = CompileOp( hsp, func, curBB, task, op, retBB );
			if ( !curBB ) {
				Alert( (char*)(buf + op->GetName()).c_str() );
				return;
			}
		} else {
			curBB = op->GenerateDefaultCode( hsp, func, curBB, retBB, task );
		}
	}

	Builder.SetInsertPoint( curBB );
	Builder.CreateBr( retBB );
	task->returnBlocks.insert( curBB );
}

static void CompileTaskGeneral( CHsp3LLVM *hsp, Task *task, Function *func, BasicBlock *retBB )
{
	LLVMContext &Context = getGlobalContext();

	CheckType( hsp, task );

	char buf[256];

	sprintf( buf, "%s", task->name.c_str() );

	BasicBlock *curBB = BasicBlock::Create( Context,
											task->name + "_entry",
											func );
	task->entry = curBB;

	Builder.SetInsertPoint( curBB );

	sReachable = true;

	for ( std::vector<Op*>::iterator it=task->operations.begin();
		  it != task->operations.end(); it++ ) {
		Op *op = *it;

		curBB = op->GenerateDefaultCode( hsp, func, curBB, retBB, task );
	}

	Builder.SetInsertPoint( curBB );
	Builder.CreateBr( retBB );
	task->returnBlocks.insert( curBB );
}

static void TraceTaskProc()
{
	int cur = GetCurTaskId();
	Task *task = __Task[cur];
	if ( task->numChange > 5) {
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
	if ( !task->func ) {
		LLVMContext &Context = getGlobalContext();
		char buf[256];
		sprintf( buf, "%s_%d", task->name.c_str(), task->numCall );

		Function* func = cast<Function>(M->getOrInsertFunction( buf,
																Type::getInt32Ty( Context ),
																Type::getInt32Ty( Context ),
																(Type *)0 ));
		Argument &arg = *func->arg_begin();
		BasicBlock *funcRet = BasicBlock::Create( Context, "ret", func );

		CompileTaskGeneral( hsp3, task, func, funcRet );

		Builder.SetInsertPoint( funcRet );
		Builder.CreateRet( ConstantInt::get( Type::getInt32Ty( Context ), -1 ) );

		task->func = func;

		std::string ErrMsg;
		if ( verifyModule( *M, ReturnStatusAction, &ErrMsg ) ) {
			Alert( (char*)ErrMsg.c_str() );
		}

		if ( task->func ) {
			task->funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task->func );
		}
	} else if ( change ) {
		task->numChange ++;
		task->numCurCall = 1;
		task->funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task->func );
	} else {
		task->numCurCall ++;
	}
	if ( task->numCurCall == 10 ) {
		LLVMContext &Context = getGlobalContext();
		char buf[256];
		sprintf( buf, "%s_%d", task->name.c_str(), task->numCall );

		LoadLLRuntime();

		Function* func = cast<Function>(M->getOrInsertFunction( buf,
																Type::getInt32Ty( Context ),
																Type::getInt32Ty( Context ),
																(Type *)0 ));
		Argument &arg = *func->arg_begin();
		BasicBlock *funcEntry = BasicBlock::Create( Context, "entry", func );
		BasicBlock *funcRet = BasicBlock::Create( Context, "ret", func );

		CompileTask( hsp3, task, func, funcRet );

		Builder.SetInsertPoint( funcEntry );
		Builder.CreateBr( task->entry );

		Builder.SetInsertPoint( funcRet );
		Builder.CreateRet( ConstantInt::get( Type::getInt32Ty( Context ), -1 ) );

		task->spFunc = func;
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
			Alert( (char*)ErrMsg.c_str() );
		}

		TheFPM->run( *task->spFunc );
		Passes->run( *M) ;

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

		if ( task->spFunc ) {
			task->funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task->spFunc );
		}
	}

	task->funcPtr();
}

void DumpResult()
{
	char buf[256];

	std::string ErrorInfo;
	std::auto_ptr<raw_fd_ostream>
		Out( new raw_fd_ostream( "dump.txt", ErrorInfo,
								 raw_fd_ostream::F_Binary ) );

	for (int i=0;i<sLabMax;i++) {
		Task *task = __Task[i];
		if (task) {
			sprintf( buf, "L%04x call:%d cur:%d change:%d\r\n",
					 i, task->numCall, task->numCurCall, task->numChange );
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

void __HspInit( Hsp3r *hsp3r )
{
	sHsp3r = hsp3r;
	hsp3r->Reset( sMaxVar, sMaxHpi );

}

void __HspSetup( Hsp3r *hsp3r )
{
	LLVMContext &Context = getGlobalContext();
	char mes[256];

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

	Alert( "HspSetup" );
	for (int i=-1;i<sLabMax;i++) {
		if ( i == -1 ) {
			sprintf( mes, "%s", "__HspEntry" );
		} else {
			sprintf( mes, "L%04x", i );
		}
		//		Alert( mes );
		Task *task = sTasks[mes];
		__Task[i] = task;
		if ( task ) {
			Function* func = cast<Function>(M->getOrInsertFunction( mes,
																	Type::getInt32Ty( Context ),
																	Type::getInt32Ty( Context ),
																	(Type *)0 ));
			Argument &arg = *func->arg_begin();
			BasicBlock *funcEntry = BasicBlock::Create( Context, "entry", func );
			BasicBlock *funcRet = BasicBlock::Create( Context, "ret", func );

			CompileTaskGeneral( hsp3, task, func, funcRet );

			Builder.SetInsertPoint( funcEntry );
			Builder.CreateBr( task->entry );

			Builder.SetInsertPoint( funcRet );
			Builder.CreateRet( ConstantInt::get( Type::getInt32Ty( Context ), -1 ) );

			std::string ErrMsg;
			if ( verifyModule( *M, ReturnStatusAction, &ErrMsg ) ) {
				Alert( (char*)ErrMsg.c_str() );
			}
			task->func = func;
			task->funcPtr = (CHSP3_TASK)EE->getPointerToFunction( task->func );
			__HspTaskFunc[i] = TraceTaskProc;//task->funcPtr;
		} else {
			__HspTaskFunc[i] = NULL;
		}
	}
	std::string ErrorInfo;
	std::auto_ptr<raw_fd_ostream>
		Out(new raw_fd_ostream("dump0.ll", ErrorInfo,
							   raw_fd_ostream::F_Binary));
	if (!ErrorInfo.empty()) {
		errs() << ErrorInfo << '\n';
		return;
	}

	*Out << *M;
}

void __HspEntry( void )
{
	sHspctx = &sHsp3r->hspctx;

	GlobalVariable *ctx = (GlobalVariable*)M->getGlobalVariable( "hspctx" );
	EE->updateGlobalMapping( ctx, (void*)&sHspctx );

	Task *task = sTasks["__HspEntry"];

	void *fp = EE->getPointerToFunction( task->func );
	CHSP3_FUNC t = (CHSP3_FUNC)fp;
	t(1);
}

// LLVM utilities

static const StructType *GetPValType()
{
	LLVMContext &Context = getGlobalContext();

	return (StructType*)M->getTypeByName( "struct.PVal" );
}

Value* CreateCallImm( BasicBlock *bblock, const std::string& name )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	if ( !f )
		Alert( (char*)(name + " not found!").c_str() );

	std::vector<Value*> args;

	Builder.SetInsertPoint( bblock );
	return Builder.CreateCall( f, args.begin(), args.end() );
}

Value* CreateCallImm( BasicBlock *bblock, const std::string& name, int a )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	if ( !f )
		Alert( (char*)(name + " not found!").c_str() );

	std::vector<Value*> args;

	args.push_back( ConstantInt::get( Type::getInt32Ty( Context ), a ) );

	Builder.SetInsertPoint( bblock );
	return Builder.CreateCall( f, args.begin(), args.end() );
}

Value* CreateCallImm( BasicBlock *bblock, const std::string& name, int a, int b )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	if ( !f )
		Alert( (char*)(name + " not found!").c_str() );

	std::vector<Value*> args;

	args.push_back(ConstantInt::get( Type::getInt32Ty( Context ), a ) );
	args.push_back(ConstantInt::get( Type::getInt32Ty( Context ), b ) );

	Builder.SetInsertPoint( bblock );
	return Builder.CreateCall( f, args.begin(), args.end() );
}

void* HspLazyFunctionCreator( const std::string &Name )
{
	if ("Prgcmd" == Name) return Prgcmd;
	if ("Modcmd" == Name) return Modcmd;
	if ("PushVar" == Name) return PushVar;
	if ("CalcMulI" == Name) return CalcMulI;
	if ("VarSet" == Name) return VarSet;
	if ("PushInt" == Name) return PushInt;
	if ("CalcSubI" == Name) return CalcSubI;
	if ("PushDouble" == Name) return PushDouble;
	if ("PushFuncEnd" == Name) return PushFuncEnd;
	if ("CalcAddI" == Name) return CalcAddI;
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

	if ("PushExtvar" == Name) return PushExtvar;
	if ("PushIntfunc" == Name) return PushIntfunc;
	if ("PushSysvar" == Name) return PushSysvar;
	if ("PushModcmd" == Name) return PushModcmd;
	if ("PushDllfunc" == Name) return PushDllfunc;

	if ("Extcmd" == Name) return Extcmd;
	if ("PushStr" == Name) return PushStr;
	if ("CalcAndI" == Name) return CalcAndI;
	if ("CalcNeI" == Name) return CalcNeI;
	if ("CalcGtEqI" == Name) return CalcGtEqI;
	if ("CalcXorI" == Name) return CalcXorI;
	if ("CalcRrI" == Name) return CalcRrI;
	if ("PushDefault" == Name) return PushDefault;

	if ("PushFuncPrm1" == Name) return PushFuncPrm1;
	if ("PushFuncPrmI" == Name) return PushFuncPrmI;
	if ("PushFuncPrmD" == Name) return PushFuncPrmD;
	if ("PushFuncPrm" == Name) return PushFuncPrm;
	if ("PushFuncPAP" == Name) return PushFuncPAP;
	if ("FuncPrm" == Name) return FuncPrm;
	if ("LocalPrm" == Name) return LocalPrm;

	if ("FuncPrmI" == Name) return FuncPrmI;
	if ("FuncPrmD" == Name) return FuncPrmD;

	if ("Intcmd" == Name) return Intcmd;
	//if ("HspVarCoreReset" == Name) return HspVarCoreReset;
	if ("HspVarCoreArray2" == Name) return HspVarCoreArray2;

	if ("CallIntIntfunc" == Name) return CallIntIntfunc;
	if ("CallDoubleIntfunc" == Name) return CallDoubleIntfunc;
	if ("CallIntSysvar" == Name) return CallIntSysvar;
	if ("CallDoubleSysvar" == Name) return CallDoubleSysvar;
	if ("log" == Name) return (double(*)(double))log;
	if ("exp" == Name) return (double(*)(double))exp;
	if ("sqrt" == Name) return (double(*)(double))sqrt;
	if ("cos" == Name) return (double(*)(double))cos;
	if ("sin" == Name) return (double(*)(double))sin;

	//	if ("Hsp3rReset" == Name) return Hsp3rReset;
	if ("GetCurTaskId" == Name) return GetCurTaskId;

	Alert( (char*)(Name + " not foud").c_str() );
	return NULL;
}

static void LoadLLRuntime()
{
#ifdef HSPWIN
	LLVMContext &Context = getGlobalContext();

	HRSRC hrc;
	HGLOBAL hgb;
	LPVOID p;

	hrc = FindResource(NULL, MAKEINTRESOURCEA(256), "TEXT");
	hgb = LoadResource(NULL, hrc);
	p = LockResource(hgb);

	SMDiagnostic Err;
	ParseAssemblyString( (char*) p, M, Err, Context );
	FreeResource(hrc);
#else
	#error
#endif
}

Value* MakeImmidiateCPPName( CHsp3LLVM* hsp, BasicBlock* bb, int type, int val, int prm, char *opt )
{
	//		直値(int,double,str)を追加
	//		(追加できない型の場合は-1を返す)
	//
	char mes[4096];
	int i;
	i = hsp->MakeImmidiateName( mes, type, val );
	if ( i == 0 ) return NULL;
	switch( type ) {
	case TYPE_VAR:
		sprintf( mes, "%s%s", CPPHED_HSPVAR, hsp->GetHSPVarName( val ).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		break;
	case TYPE_STRUCT:
		{
		const STRUCTPRM *st = hsp->GetMInfo( val );
		switch( st->mptype ) {
		case MPTYPE_LOCALVAR:
			return CreateCallImm( bb, "LocalPrm", prm );
			break;
		default:
			return CreateCallImm( bb, "FuncPrm", prm );
			break;
		}
		break;
		}
	case TYPE_LABEL:
		sprintf( mes, "*L%04x", val );
		break;
	default:
		strcpy( mes, hsp->GetHSPName( type, val ).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		if ( *mes == 0 ) return NULL;
		break;
	}
	return M->getNamedValue( mes );
}

/*------------------------------------------------------------*/
CHsp3LLVM::CHsp3LLVM()
{
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
		sprintf( mes, "%s%s", CPPHED_HSPVAR, GetHSPVarName( val ).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		break;
	case TYPE_STRUCT:
		{
		const STRUCTPRM *prm = GetMInfo( val );
		if ( prm->subid != STRUCTPRM_SUBID_STACK ) {
			sprintf( mes, "_modprm%d", val - curprmindex );
		} else {
			sprintf( mes, "_prm%d", val - curprmindex );
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


void CHsp3LLVM::MakeCPPTask( const char *name, int nexttask )
{
	//		タスクの区切り
	//			funcdef=新しい関数定義
	//			nextttask=次のタスク(ラベルID)
	//
	LLVMContext &Context = getGlobalContext();

	if ( tasknum ) {
		if ( nexttask >= 0 ) {
			if ( sReachable ) {
				sCurTask->operations.push_back( new TaskSwitchOp( nexttask ) );
			}
		}
	}

	sCurTask = new Task();
	sCurTask->name = name;
	sTasks[name] = sCurTask;
	//	Alert((char*)name);

	sReachable = true;

	tasknum++;
}


void CHsp3LLVM::MakeCPPTask( int nexttask )
{
	//		単純タスクの生成
	//
	char name[256];
	sprintf( name,"L%04x", nexttask );
	MakeCPPTask( name, nexttask );
}


void CHsp3LLVM::MakeCPPTask2( int nexttask, int newtask )
{
	//		単純タスクの生成
	//
	char name[256];
	sprintf( name,"L%04x", newtask );
	MakeCPPTask( name, nexttask );
}

void CHsp3LLVM::MakeCPPProgramInfoFuncParam( int structid )
{
	//		定義命令パラメーター生成
	//		structid : パラメーターID
	//
	const STRUCTDAT *fnc = GetFInfo( structid );
	const STRUCTPRM *prm = GetMInfo( fnc->prmindex );
	int max = fnc->prmmax;
	int locnum = 0;
	curprmindex = fnc->prmindex;

	for(int i=0;i<max;i++) {
		prmcnv_locvar[i] = -1;
		switch( prm[i].mptype ) {
		case MPTYPE_VAR:
			break;
		case MPTYPE_STRING:
		case MPTYPE_LOCALSTRING:
			break;
		case MPTYPE_DNUM:
			break;
		case MPTYPE_INUM:
			break;
		case MPTYPE_LABEL:
			break;
		case MPTYPE_LOCALVAR:
			prmcnv_locvar[i] = locnum;
			locnum++;
			break;
		case MPTYPE_ARRAYVAR:
			break;
		case MPTYPE_SINGLEVAR:
			break;
		default:
			break;
		}
	}

//	fnc->size = locnum;		// size項目にローカル変数の数を入れておく(runtimeで必要)
	curprmlocal = locnum;

	int prmid = locnum;
	for(int i=0;i<max;i++) {
		switch( prm[i].mptype ) {
		case MPTYPE_LOCALVAR:
			break;
		case MPTYPE_VAR:
		case MPTYPE_STRING:
		case MPTYPE_LOCALSTRING:
		case MPTYPE_DNUM:
		case MPTYPE_INUM:
		case MPTYPE_LABEL:
		case MPTYPE_ARRAYVAR:
		case MPTYPE_SINGLEVAR:
		default:
			prmcnv_locvar[i] = prmid;
			prmid++;
			break;
		}
	}
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
				MakeCPPTask( labindex );
//				MakeProgramInfoFuncParam( GetOTInfo( labindex ) );
				MakeCPPProgramInfoFuncParam( GetOTInfo( labindex ) );
			}
		}
		labindex++;
	}
}


int CHsp3LLVM::GetCPPExpressionSub( bool bblock, int flg )
{
	//		C/C++の計算式フォーマットでパラメーターを展開する(短項目)
	//
	int op;
	LLVMContext &Context = getGlobalContext();
	int cstype0 = cstype;
	int csval0 = csval;
	int vflag;

	vflag = 0;
	switch(cstype) {
		case TYPE_MARK:
			//		記号(スタックから取り出して演算)
			//
			op = csval;
			if ( sReachable && bblock ) {
				sCurTask->operations.push_back( new CalcOp( op ) );
			}
			getCS();
			break;
		case TYPE_VAR:
			{
			//		変数をスタックに積む
			//
			int va;
			sCurTask->usedVariables.insert( Var( cstype, csval ) );
			getCS();
			//		配列要素を付加する
			va = MakeCPPVarExpression( bblock );
			if (sReachable && bblock) {
				if ( flg == 1 && va == 0) {
					sCurTask->operations.push_back( new PushVarPtrOp( csval0, va ) );
				} else {
					sCurTask->operations.push_back( new PushVarOp( csval0, va ) );
				}
			}
			vflag = 1;
			break;
			}
		case TYPE_DNUM:
			{
			//		直実数値をスタックに積む
			//
			double immval = GetDSf( csval );
			if ( sReachable && bblock ) {
				sCurTask->operations.push_back( new PushDnumOp( immval ) );
			}
			getCS();
			break;
			}
		case TYPE_INUM:
		case TYPE_LABEL:
			//		直値をスタックに積む
			//
			if ( sReachable && bblock ) {
				switch (cstype0) {
				case TYPE_INUM:
					sCurTask->operations.push_back( new PushInumOp( csval ) );
					break;
				case TYPE_LABEL:
					sCurTask->operations.push_back( new PushLabelOp( csval ) );
					break;
				}
			}

			getCS();
			break;
		case TYPE_STRUCT:
			{
			//		パラメーターをスタックに積む
			//
			int va = 0;
			int prmid;
			const STRUCTPRM *prm = GetMInfo( csval );
			switch( prm->mptype ) {
			case MPTYPE_LOCALVAR:
				prmid = prmcnv_locvar[csval - curprmindex];
				getCS();
				va = MakeCPPVarExpression( bblock );
				vflag = 1;
				break;
			case MPTYPE_VAR:
			case MPTYPE_ARRAYVAR:
			case MPTYPE_SINGLEVAR:
				prmid = csval - curprmindex + curprmlocal;
				prmid = prmcnv_locvar[csval - curprmindex];
				getCS();
				va = MakeCPPVarExpression( bblock );
				vflag = 1;
				break;
			default:
				prmid = csval - curprmindex + curprmlocal;
				prmid = prmcnv_locvar[csval - curprmindex];
				getCS();
				break;
			}
			sCurTask->usedVariables.insert( Var( cstype0, csval0 ) );
			if ( sReachable && bblock ) {
				if ( flg == 1 && vflag && va == 0 ) {
					sCurTask->operations.push_back( new PushFuncPrmPtrOp( csval0, prmid, va ) );
				} else {
					sCurTask->operations.push_back( new PushFuncPrmOp( csval0, prmid, va ) );
				}
			}
			break;
			}
		case TYPE_STRING:
			//		文字列をスタックに積む
			//
			if ( sReachable && bblock ) {
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
			fnctype = cstype;
			fncval = csval;
			getCS();
			//		引数を付加する
			if ( sReachable && bblock ) {
				sCurTask->operations.push_back( new PushFuncEndOp() );
			}

			va = MakeCPPVarExpression( bblock, 1 );

			if ( sReachable && bblock ) {
				sCurTask->operations.push_back( new PushCmdOp( fnctype, fncval, va ) );
			}
			break;
			}
	}
	return vflag;
}


int CHsp3LLVM::GetCPPExpression( int *result, bool bblock, int flg )
{
	//		C/C++の計算式フォーマットでパラメーターを展開する
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
			if ( tres >= 0 ) {
				if ( tres != cstype ) { tres = -1; }
			}
			GetCPPExpressionSub( bblock, flg );
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


int CHsp3LLVM::MakeCPPParam( bool bblock, int addprm )
{
	//		パラメーターのトレース
	//
	int i;
	int prm;
	int result;
	char *p;
	std::vector<std::pair<MCSCONTEXT, int> > expressionContext;
	int ret = 0;

	prm = 0;

	int j;
	for(j=0;j<addprm;j++) {
		if ( exflag & EXFLG_1) break;		// パラメーター列終端
		if ( mcs > mcs_end ) break;			// データ終端チェック
		if ( prm ) {
		}

		MCSCONTEXT ctx;
		GetContext( &ctx );
		GetCPPExpressionSub( NULL );
		expressionContext.push_back( std::make_pair( ctx, -3 ) );
		prm++;
	}

	while(1) {
		if ( exflag & EXFLG_1) break;		// パラメーター列終端
		if ( mcs > mcs_end ) break;			// データ終端チェック
		if ( prm ) {
		}
		MCSCONTEXT ctx;
		GetContext( &ctx );
		ret = i = GetCPPExpression( &result, false );
		expressionContext.push_back( std::make_pair( ctx, result ) );
		if ( i > 0 ) break;
		if ( i < -1 ) break;
		if ( i == -1 ) {
			expressionContext.push_back( std::make_pair( ctx, -4 ) );
		}
		prm++;
	}

	// TODO
	MCSCONTEXT ctx;
	GetContext( &ctx );
	for ( int j = expressionContext.size() - 1; j >= 0; j-- ) {
		std::pair<MCSCONTEXT, int> &p = expressionContext[j];
		SetContext( &p.first );
		if ( p.second == -3 ) {
			GetCPPExpressionSub( bblock );
		} else if ( p.second == -4 ) {
			if (sReachable && bblock) {
				sCurTask->operations.push_back( new PushDefaultOp() );
			}
		} else {
			if ( p.second == TYPE_VAR || p.second == TYPE_STRUCT ) {			// 単一項で変数が指定されていた場合
				i = GetCPPExpression( &result, bblock, 1 );
			} else {
				i = GetCPPExpression( &result, bblock );
			}
			if ( i == -1 ) {
			}
		}
	}
	SetContext( &ctx );

	if ( ret < -1 )
		return ret;

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
	if ( cstype == TYPE_MARK ) {
		if ( csval == CALCCODE_EQ ) {
			getCS();
			MakeProgramInfoParam2();
			return -1;
		}
		op = csval;
		getCS();
		if ( exflag & EXFLG_1) {		// ++ or --
			MakeProgramInfoParam2();
			if ( op == CALCCODE_ADD ) return -2;
			return -3;
		}
		//getCS();
		MakeProgramInfoParam2();
		return op;
	}
	Alert( "CHsp3:Var Syntax unknown." );
	return -4;
}


int CHsp3LLVM::MakeCPPVarExpression( bool bblock, int flg )
{
	//	変数名直後に続くパラメーター(配列)を展開する
	//	ret : 0=配列なし/1～=配列あり
	//
	int i;
	int prm;
	int len;
	int result;
	char *p;
	int ret = 0;
	std::vector<std::pair<MCSCONTEXT, int> > expressionContext;

	if ( cstype == TYPE_MARK ) {
		if ( csval == '(' ) {
			getCS();
			prm = 1;
			while(1) {
				if ( exflag & EXFLG_1) break;		// パラメーター列終端
				if ( mcs > mcs_end ) break;			// データ終端チェック

				MCSCONTEXT ctx;
				GetContext( &ctx );
				ret = i = GetCPPExpression( &result, false );
				expressionContext.push_back( std::make_pair( ctx, result ) );
				if ( i > 0 ) break;
				if ( i < -1 ) break;
				if ( i == -1 ) {
					expressionContext.push_back( std::make_pair( ctx, -4 ) );
				}
				prm++;
			}

			MCSCONTEXT ctx;
			GetContext( &ctx );
			for(int j = expressionContext.size() - 1; j >= 0; j--) {
				std::pair<MCSCONTEXT, int> &p = expressionContext[j];
				if ( p.second == -4 ) {
					if ( sReachable && bblock ) {
						sCurTask->operations.push_back( new PushDefaultOp() );
					}
				} else {
					SetContext( &p.first );
//					if ( p.second == TYPE_VAR ) {			// 単一項で変数が指定されていた場合
					if ( p.second != -1 && flg ) {
						i = GetCPPExpression( &result, bblock, 1 );
					} else {
						i = GetCPPExpression( &result, bblock );
					}
//i = GetCPPExpression( &result, bblock );
					if ( i == -1 ) {
						if ( sReachable && bblock ) {
							sCurTask->operations.push_back( new PushDefaultOp() );
						}
					}
				}
			}
			SetContext( &ctx );

			if (ret < -1)
				return ret;

			getCS();

			return prm;
		}
	}
	return 0;
}


/*------------------------------------------------------------*/

void CHsp3LLVM::MakeCPPSub( int cmdtype, int cmdval )
{
	//		通常命令とパラメーターを展開
	//
	int pnum;
	MCSCONTEXT ctxbak;

	getCS();
	GetContext( &ctxbak );
	MakeProgramInfoParam2();
	SetContext( &ctxbak );
	pnum = MakeCPPParam( true );

	if (sReachable) {
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
	MCSCONTEXT ctxbak, ctxbak2;
	int maxvar;
	LLVMContext &Context = getGlobalContext();
	const Type *pvalType = GetPValType();
	const Type *ppvalType = PointerType::getUnqual( pvalType );

	//		初期化
	//
	tasknum = 0;

	MakeCPPTask( "__HspEntry" );

	maxvar = hsphed->max_val;

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
			int va,pnum;
			int varid;
			switch ( cmdtype ) {
			case TYPE_VAR:
				{
				varid = cmdval;
				break;
				}
			case TYPE_STRUCT:
				{
				const STRUCTPRM *prm = GetMInfo( csval );
				switch( prm->mptype ) {
				case MPTYPE_LOCALVAR:
					varid = prmcnv_locvar[cmdval - curprmindex];
					break;
				case MPTYPE_VAR:
				case MPTYPE_ARRAYVAR:
				case MPTYPE_SINGLEVAR:
					varid = cmdval - curprmindex + curprmlocal;
					break;
				default:
					varid = cmdval - curprmindex + curprmlocal;
					break;
				}
				break;
				}
			}

			getCS();
			GetContext( &ctxbak );
			op = MakeCPPVarForHSP();
			SetContext( &ctxbak );
			sCurTask->usedVariables.insert(Var( cmdtype, cmdval ));
			va = MakeCPPVarExpression( false );
			getCS();

			switch( op ) {
			case -1:		// 通常の代入
				pnum = MakeCPPParam( true );

				if (sReachable) {
					GetContext( &ctxbak2 );
					SetContext( &ctxbak );
					MakeCPPVarExpression( true );
					SetContext( &ctxbak2 );

					sCurTask->operations.push_back( new VarSetOp( cmdtype, cmdval, varid, va, pnum ) );
				}
				break;
			case -2:		// ++
				if (sReachable) {
					GetContext( &ctxbak2 );
					SetContext( &ctxbak );
					MakeCPPVarExpression( true );
					SetContext( &ctxbak2 );

					sCurTask->operations.push_back( new VarIncOp( cmdtype, cmdval, varid, va ) );
				}
				break;
			case -3:		// --
				if (sReachable) {
					GetContext( &ctxbak2 );
					SetContext( &ctxbak );
					MakeCPPVarExpression( true );
					SetContext( &ctxbak2 );

					sCurTask->operations.push_back( new VarDecOp( cmdtype, cmdval, varid, va ) );
				}
				break;
			case -4:		// エラー
				break;
			default:		// 演算子付き代入
				pnum = MakeCPPParam( true );
				if ( pnum > 1 ) {
					Alert( "Too much parameters(VarCalc)." );
				}
				if (sReachable) {
					GetContext( &ctxbak2 );
					SetContext( &ctxbak );
					MakeCPPVarExpression( true );
					SetContext( &ctxbak2 );

					sCurTask->operations.push_back( new VarCalcOp( cmdtype, cmdval, varid, va, op ) );
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
				mcs++;
				getCS();
				MakeProgramInfoParam2();
				SetContext( &ctxbak );
			}
			int thenTask = 0;
			// C形式の出力
			if ( cmdval == 0 ) {
				iflevel++;

				thenTask = curot;
				if ( iflevel >= MAX_IFLEVEL ) {
					Alert( "Stack( If ) overflow." );
					return -2;
				}

				ifmode[iflevel] = 1;
				iftaskid[iflevel] = curot;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				ifmode[iflevel]++;
				curot++;
			} else {
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
			MakeCPPParam( true );

			if ( cmdval == 0 ) {
				sCurTask->operations.push_back( new CompareOp( thenTask ) );
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
				MakeCPPSub( cmdtype, cmdval );
				sReachable = false;
				break;
			case 0x01:								// gosub
			case 0x18:								// exgoto
				//		gosubの展開
				//
				{
				int pnum;
				getCS();
				pnum = MakeCPPParam( true );
				if (sReachable) {
					sCurTask->operations.push_back( new PushLabelOp( curot ) );
					sCurTask->operations.push_back( new CmdOp( cmdtype, cmdval, pnum+1 ) );
				}
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
				getCS();
				pnum = MakeCPPParam( true, 1 );
				if (sReachable) {
					sCurTask->operations.push_back( new PushLabelOp( curot ) );
					sCurTask->operations.push_back( new CmdOp( cmdtype, cmdval, pnum+1 ) );
				}
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
				MakeCPPSub( cmdtype, cmdval );
				MakeCPPTask( curot );
				curot++;
				break;
			default:
				MakeCPPSub( cmdtype, cmdval );
				break;
			}
			break;
		case TYPE_MODCMD:						// 定義命令
			{
			int pnum;
			getCS();
			pnum = MakeCPPParam( true );
			if (sReachable) {
				sCurTask->operations.push_back( new PushLabelOp( curot ) );
				sCurTask->operations.push_back( new ModCmdOp( cmdtype, cmdval, pnum ) );
			}
			sReachable = false;
			MakeCPPTask( curot );
			curot++;
			break;
			}
		default:
			//		通常命令
			//
			MakeCPPSub( cmdtype, cmdval );
			break;
		}
	}

	return 0;
}

/*------------------------------------------------------------*/


int CHsp3LLVM::MakeSource( int option, void *ref )
{
	//	コンパイル処理
	//
	int i;
	int otmax;
	int maxvar;
	LLVMContext &Context = getGlobalContext();

	makeoption = option;

	maxvar = hsphed->max_val;


	// Create some module to put our function into it.
	M = new Module( "test", Context );

	sMaxVar = hsphed->max_val;
	sMaxHpi = hsphed->max_hpi;

	maxvar = hsphed->max_val;


	// 関数の準備
	LoadLLRuntime();

	const Type *pvalType = GetPValType();

	// 変数の準備
	sVariables = new GlobalVariable*[maxvar];
	for(i=0;i<maxvar;i++) {
		Constant *constInt = ConstantInt::get(Type::getInt32Ty( Context ), (int)0);
		Constant *constPtr = ConstantExpr::getIntToPtr( constInt, pvalType );

//		sVariables[i] = new GlobalVariable(ppvalType, false, GlobalValue::ExternalLinkage, constPtr,
//										   CPPHED_HSPVAR + GetHSPVarName( i ), M);
		sVariables[i] = (GlobalVariable*)M->getOrInsertGlobal(CPPHED_HSPVAR + GetHSPVarName( i ), pvalType);
	}

	sDsBase = (GlobalVariable*)M->getOrInsertGlobal("ds_base", Type::getInt32Ty( Context ));


	//		初期化ファンクションを作成する
	//
	otmax = GetOTCount();
	curot = otmax;

	i = MakeCPPMain();
	if ( i ) return i;

	//		タスク(ラベル)テーブルを作成する
	//
	sLabMax = curot;
	sDsBasePtr = GetDS( 0 );

	{
		std::string ErrorInfo;
		std::auto_ptr<raw_fd_ostream>
			Out(new raw_fd_ostream("dump.ll", ErrorInfo,
								   raw_fd_ostream::F_Binary));
		if (!ErrorInfo.empty()) {
			errs() << ErrorInfo << '\n';
			return -1;
		}

		*Out << *M;
	}

	{
		std::string ErrorInfo;
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
			*Out2 << "#" << mes << "\r\n";
			Task *task = sTasks[mes];

			if ( task == NULL ) {
				*Out2 << "NO OP\r\n";
				continue;
			}
			for (int j=0; j < task->operations.size(); j++) {
				*Out2 << task->operations[j]->GetName()
					  << task->operations[j]->GetParam() << "\r\n";
			}
			*Out2 << "\r\n";

			AnalyzeTask( task );

			for (int j=0; j<task->operations.size(); j++) {
				Op* op = task->operations[j];
				*Out2 << op->GetName()
					  << op->GetParam() << "\r\n";
				for(int k=0; k<op->operands.size(); k++) {
					Op* o = op->operands[k];
					*Out2 << "\t" << o->GetName()
						  << o->GetParam() << "\r\n";
				}
			}
			*Out2 << "\r\n" << "\r\n";
		}
	}

	for(std::map<std::pair<int, int>, std::set<Task*> >::iterator it = varTaskMap.begin();
		it != varTaskMap.end(); ++it) {
		if ( it->second.size() == 0 )
			continue;

		bool useRegister = true;

		// 書き込んでから読み込むタスクだけかチェック
		for (std::set<Task*>::iterator it2 = it->second.begin();
			 it2 != it->second.end(); ++it2) {
			Task *task = *it2;
			Var *var = GetTaskVar( task, it->first );

			VarRefOp* firstAccessOp = NULL;
			for ( std::vector<Op*>::iterator it2 = task->operations.begin();
				  it2 != task->operations.end(); it2++ ) {
				Op *op = *it2;
				switch ( op->GetOpCode() ) {
				case PUSH_VAR_PTR_OP:
				case PUSH_VAR_OP:
				case PUSH_FUNC_PARAM_OP:
				case PUSH_FUNC_PARAM_PTR_OP:
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
						if ( vrop->IsParam() ) {
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
			case PUSH_FUNC_PARAM_OP:
			case PUSH_FUNC_PARAM_PTR_OP:
			case VAR_CALC_OP:
			case VAR_INC_OP:
			case VAR_DEC_OP:
				useRegister = false;
				break;
			}
		}

		for (std::set<Task*>::iterator it2 = it->second.begin();
			 it2 != it->second.end(); ++it2) {
			Task *task = *it2;
			Var *var = GetTaskVar( task, it->first );

			var->localVar = useRegister;
		}
	}

	std::string ErrMsg;
	if ( verifyModule( *M, ReturnStatusAction, &ErrMsg ) ) {
		Alert( (char*)ErrMsg.c_str() );
	}

	EE = EngineBuilder( M )
		.setEngineKind( EngineKind::JIT )
		.setOptLevel( CodeGenOpt::Default )
		.create();

	EE->InstallLazyFunctionCreator( HspLazyFunctionCreator );

	TargetData *TD = new TargetData(*EE->getTargetData());

	Passes = new PassManager();

	Passes->add(TD);
	createStandardLTOPasses( Passes, false, true, true );


	TheFPM = new FunctionPassManager(M);

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
