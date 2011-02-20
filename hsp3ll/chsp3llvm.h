
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
	void MakeCPPProgramInfoFuncParam( int structid );
	int GetLocalPrm( int val ) {
		return prmcnv_locvar[val - curprmindex];
	}
	int GetFuncPrm( int val ) {
		return val - curprmindex + curprmlocal;
	}

private:
	//		Settings
	//
	int makeoption;
	int tasknum;
	int curot;						// �ǉ��p�̃^�X�N(���x��)�e�[�u��ID
	int curprmindex;				// ���݂̃p�����[�^�[�擪�C���f�b�N�X
	int curprmlocal;				// ���݂̃��[�J���ϐ��X�^�b�N��
	int prmcnv_locvar[64];			// �p�����[�^�[�ϊ��p�o�b�t�@(���[�J���ϐ��p)

	//		Internal Function
	//
	int MakeCPPMain( void );
	void MakeCPPSub( int cmdtype, int cmdval );
	void MakeCPPLabel( void );
	void MakeCPPTask( int nexttask );
	void MakeCPPTask2( int nexttask, int newtask );
	void MakeCPPTask( const char *name, int nexttask=-1 );
	int MakeCPPParam( bool process, int addprm=0 );
	int GetCPPExpression( int *result, bool process, int flg=0 );
	int GetCPPExpressionSub( bool process, int flg=0 );
	int MakeCPPVarForHSP( void );
	void MakeCPPVarName( char *outbuf, int varid );
	int MakeCPPVarExpression( bool process, int flg=0 );

};


#endif
