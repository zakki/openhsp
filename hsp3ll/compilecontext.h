//
//			HSP3
//			zakki 2011/05
//
#ifndef __compilecontext_h
#define __compilecontext_h

#include <string>
#include "llvm/LLVMContext.h"
#include "llvm/Module.h"
#include "llvm/PassManager.h"
#include "llvm/ExecutionEngine/JIT.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/Support/TypeBuilder.h"
#include "llvm/Support/IRBuilder.h"

class CHsp3Op;

class CompileContext {
public:
	llvm::Module *M;
	llvm::IRBuilder<> Builder;

	CompileContext();
	~CompileContext();

	const llvm::StructType* GetPValType();

	llvm::Value* CreateCalcI( int code, llvm::Value *a, llvm::Value *b );
	llvm::Value* CreateCalcD( int code, llvm::Value *a, llvm::Value *b );

	llvm::Value* MakeImmidiateCPPName( CHsp3Op* hsp, llvm::BasicBlock* bb, int type,
								 int val, int prm, char *opt=NULL );

	llvm::Value* CreateCallImm( llvm::BasicBlock *bblock, const std::string& name );
	llvm::Value* CreateCallImm( llvm::BasicBlock *bblock, const std::string& name, int a );
	llvm::Value* CreateCallImm( llvm::BasicBlock *bblock, const std::string& name, int a, int b );
	void LoadLLRuntime();
};
#endif
