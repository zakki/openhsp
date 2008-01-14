
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

int __cdecl call_extfunc( void *proc, int *prm, int prms );

int cnvwstr( void *out, char *in, int bufsize );
int cnvsjis( void *out, char *in, int bufsize );

#endif
