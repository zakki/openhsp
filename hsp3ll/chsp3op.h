
//
//	CHsp3Op.cpp structures
//
#ifndef __CHsp3Op_h
#define __CHsp3Op_h

#include "chsp3.h"
#include "hsp3op.h"
#include <map>

#define CPPHED_HSPVAR "Var_"

//	HSP3(.ax)->C++(.cpp) conversion class
//
class CHsp3Op : public CHsp3 {
public:

	CHsp3Op();
	int MakeSource( int option, void *ref );
	std::string MakeImmidiateCPPVarName( int type, int val, char *opt=NULL );
	//int MakeImmidiateCPPName( char *mes, int type, int val, char *opt=NULL );
	void MakeCPPProgramInfoFuncParam( int structid );
	int GetLocalPrm( int val ) const {
		return prmcnv_locvar[val - curprmindex];
	}
	int GetFuncPrm( int val ) const {
		return val - curprmindex + curprmlocal;
	}
	int GetLabMax() const {
		return max_lab;
	}
	std::map<std::string, Block*> GetBlocks()
	{
		return sTasks;
	}

private:
	//		Settings
	//
	int makeoption;
	int tasknum;
	int curot;						// 追加用のタスク(ラベル)テーブルID
	int curprmindex;				// 現在のパラメーター先頭インデックス
	int curprmlocal;				// 現在のローカル変数スタック数
	int prmcnv_locvar[64];			// パラメーター変換用バッファ(ローカル変数用)
	int max_lab;
	std::map<std::string, Block*> sTasks;
	Block *sCurTask;
	bool sReachable;

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
	int GetVarExpressionOp( void );
	int MakeCPPVarExpression( bool process, int flg=0 );

};


#endif
