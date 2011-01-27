
//
//	CHsp3cpp.cpp structures
//
#ifndef __CHsp3cpp_h
#define __CHsp3cpp_h

#include "chsp3.h"

#define CPPHED_HSPVAR "Var_"

//		CHSP3 Task callback function
//
typedef void (* CHSP3_TASK) (void);


//	HSP3(.ax)->C++(.cpp) conversion class
//
class CHsp3Cpp : public CHsp3 {
public:

	int MakeSource( int option, void *ref );

private:
	//		Settings
	//
	int makeoption;
	int tasknum;
	int curot;						// �ǉ��p�̃^�X�N(���x��)�e�[�u��ID
	int curprmindex;				// ���݂̃p�����[�^�[�擪�C���f�b�N�X

	//		Internal Function
	//
	int MakeCPPMain( void );
	void MakeCPPSub( int cmdtype, int cmdval );
	void MakeCPPLabel( void );
	void MakeCPPTask( int nexttask );
	void MakeCPPTask2( int nexttask, int newtask );
	void MakeCPPTask( char *funcdef, int nexttask=-1 );

	void MakeCPPSubModCmd( int cmdtype, int cmdval );
	int MakeCPPParam( int addprm=0 );
	int GetCPPExpression( CMemBuf *eout, int *result );
	void GetCPPExpressionSub( CMemBuf *eout );
	int MakeCPPVarForHSP( void );
	void MakeCPPVarName( char *outbuf, int varid );
	int MakeCPPVarExpression( CMemBuf *arname );
	int MakeImmidiateCPPName( char *mes, int type, int val, char *opt=NULL );
	void MakeCPPProgramInfoFuncParam( int structid );

};


#endif
