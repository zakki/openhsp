
//
//	CHsp3LLVM.cpp structures
//
#ifndef __CHsp3LLVM_h
#define __CHsp3LLVM_h

#include "chsp3.h"

#define CPPHED_HSPVAR "Var_"

//		CHSP3 Task callback function
//
typedef void (* CHSP3_TASK) (void);

namespace llvm {
	class BasicBlock;
}
//	HSP3(.ax)->C++(.cpp) conversion class
//
class CHsp3LLVM : public CHsp3 {
public:

	CHsp3LLVM();
	int MakeSource( int option, void *ref );
	int MakeImmidiateCPPName( char *mes, int type, int val, char *opt=NULL );

private:
	//		Settings
	//
	int makeoption;
	int tasknum;
	int curot;						// 追加用のタスク(ラベル)テーブルID

	//		Internal Function
	//
	int MakeCPPMain( void );
	void MakeCPPSub( int cmdtype, int cmdval, llvm::BasicBlock* bblock );
	void MakeCPPLabel( void );
	void MakeCPPTask( int nexttask );
	void MakeCPPTask2( int nexttask, int newtask );
	void MakeCPPTask( const char *funcdef, const char *name, int nexttask=-1 );
	int MakeCPPParam( llvm::BasicBlock *bblock, int addprm=0 );
	int GetCPPExpression( CMemBuf *eout, int *result, llvm::BasicBlock *bblock, int flg=0 );
	void GetCPPExpressionSub( CMemBuf *eout, llvm::BasicBlock *bblock, int flg=0 );
	int MakeCPPVarForHSP( void );
	void MakeCPPVarName( char *outbuf, int varid );
	int MakeCPPVarExpression( CMemBuf *arname, llvm::BasicBlock *bblock );

};


#endif
