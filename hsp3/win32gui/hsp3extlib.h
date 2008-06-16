
//
//	hsp3extlib.cpp header
//
#ifndef __hsp3extlib_h
#define __hsp3extlib_h

#include <vector>
#include <windows.h>

#include "../hsp3code.h"

//------------------------------------------------------------//

namespace hsp3 {

//------------------------------------------------------------//
/*
	拡張プラグイン・ｄｌｌの管理クラス。
*/
//------------------------------------------------------------//

class CDllManager
{
	typedef std::vector< HMODULE > holder_type;

	//............................//

public:
	CDllManager();
	~CDllManager();

	HMODULE load_library( LPCTSTR lpFileName );
	BOOL free_library( HMODULE hModule );
	HMODULE get_error() const;

private:
	// uncopyable;
	CDllManager( CDllManager const & );
	CDllManager const & operator =( CDllManager const & );

	//............................//

private:
	holder_type mModules;
	HMODULE mError;
};

//------------------------------------------------------------//

};	//namespace hsp3 {

//------------------------------------------------------------//

int Hsp3ExtLibInit( HSP3TYPEINFO *info );
void Hsp3ExtLibTerm( void );

int cmdfunc_dllcmd( int cmd );
int exec_dllcmd( int cmd, int mask );
int code_expand_and_call( const STRUCTDAT *st );

/*
	rev 43
	mingw :
	インライン展開しないように宣言
	(インライン展開させる場合はインラインアセンブラでローカルラベルを使用する必要がある。)
*/
#if defined( __GNUC__ )
int __cdecl call_extfunc( void *proc, int *prm, int prms ) __attribute__(( noinline ));
#else
int __cdecl call_extfunc( void *proc, int *prm, int prms );
#endif
 
int cnvwstr( void *out, char *in, int bufsize );
int cnvsjis( void *out, char *in, int bufsize );

#endif
