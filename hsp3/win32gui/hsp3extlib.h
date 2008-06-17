
//
//	hsp3extlib.cpp header
//
#ifndef __hsp3extlib_h
#define __hsp3extlib_h

#include "../hsp3code.h"

int Hsp3ExtLibInit( HSP3TYPEINFO *info );
void Hsp3ExtLibTerm( void );

int cmdfunc_dllcmd( int cmd );
int exec_dllcmd( int cmd, int mask );
int code_expand_and_call( const STRUCTDAT *st );

#if defined( __GNUC__ )
int __cdecl call_extfunc( void *proc, int *prm, int prms ) __attribute__(( noinline ));
#else
int __cdecl call_extfunc( void *proc, int *prm, int prms );
#endif
 
int cnvwstr( void *out, char *in, int bufsize );
int cnvsjis( void *out, char *in, int bufsize );

#endif
