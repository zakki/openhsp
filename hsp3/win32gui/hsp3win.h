
//
//	hsp3win.cpp header
//
#ifndef __hsp3win_h
#define __hsp3win_h


#include <deque>
#include <windows.h>

//------------------------------------------------------------//

namespace hsp3 {

//------------------------------------------------------------//
/*
	拡張プラグイン・dllの管理クラス。
*/
//------------------------------------------------------------//

class CDllManager
{
	typedef std::deque< HMODULE > holder_type;

	//............................//

public:
	CDllManager();
	~CDllManager();

	HMODULE load_library( LPCTSTR lpFileName );
	BOOL free_library( HMODULE hModule );
	BOOL free_all_library();
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

int hsp3win_exec( void );
int hsp3win_init( HINSTANCE hInstance, char *startfile );
void hsp3win_dialog( char *mes );

hsp3::CDllManager & DllManager();

#endif
