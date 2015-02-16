//
//			HSP3
//			zakki 2011/05
//
#include "compilecontext.h"

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

#include "llvm/AsmParser/Parser.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/ExecutionEngine/JIT.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/Analysis/Passes.h"
#include "llvm/Transforms/IPO.h"

#include "supio.h"
#include "chsp3op.h"
#include "chsp3llvm.h"
#include "hsp3r.h"
#include "hsp3op.h"

#ifdef HSPWIN
#include <windows.h>
#endif

#define HSP_PROFILE 0

using namespace llvm;
using std::string;
using boost::format;


extern int GetCurTaskId();
extern void HspVarCoreArray2( PVal *pval, int offset );
extern CHsp3Op *hsp3;


CompileContext::CompileContext()
	: Builder(getGlobalContext())
{
}


CompileContext::~CompileContext()
{
}

Value* CompileContext::MakeImmidiateCPPName( CHsp3Op* hsp, BasicBlock* bb, int type, int val, int prm, char *opt )
{
	//		’¼’l(int,double,str)‚ð’Ç‰Á
	//		(’Ç‰Á‚Å‚«‚È‚¢Œ^‚Ìê‡‚Í-1‚ð•Ô‚·)
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



// LLVM utilities
//

StructType* CompileContext::GetPValType()
{
	LLVMContext &Context = getGlobalContext();

	return (StructType*)M->getTypeByName( "struct.PVal" );
}

Value* CompileContext::CreateCallImm( BasicBlock *bblock, const string& name )
{

	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	if ( !f )
		Alert( (char*)(name + " not found!").c_str() );

	std::vector<Value*> args;

	Builder.SetInsertPoint( bblock );
	return Builder.CreateCall( f, makeArrayRef(args) );
}

Value* CompileContext::CreateCallImm( BasicBlock *bblock, const string& name, int a )
{
	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	if ( !f )
		Alert( (char*)(name + " not found!").c_str() );

	std::vector<Value*> args;

	args.push_back( ConstantInt::get( Type::getInt32Ty( Context ), a ) );

	Builder.SetInsertPoint( bblock );
	return Builder.CreateCall(f, makeArrayRef(args));
}

Value* CompileContext::CreateCallImm( BasicBlock *bblock, const string& name, int a, int b )
{
	LLVMContext &Context = getGlobalContext();
	Function *f = M->getFunction( name );
	if ( !f )
		Alert( (char*)(name + " not found!").c_str() );

	std::vector<Value*> args;

	args.push_back(ConstantInt::get( Type::getInt32Ty( Context ), a ) );
	args.push_back(ConstantInt::get( Type::getInt32Ty( Context ), b ) );

	Builder.SetInsertPoint( bblock );
	return Builder.CreateCall(f, makeArrayRef(args));
}

void CompileContext::LoadLLRuntime()
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

Value* CompileContext::CreateCalcI( int code, Value *a, Value *b )
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

Value* CompileContext::CreateCalcD( int code, Value *a, Value *b )
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
