//
//	hsp3dish.cpp header
//
#ifndef __hsp3ndk_h
#define __hsp3ndk_h

struct HSPCTX;

#ifdef __cplusplus
extern "C" {
#endif

int hsp3ndk_init( char *startfile );
void hsp3ndk_bye( void );
int hsp3ndk_exec( void );
int hsp3ndk_exectime( int tick );
void hsp3ndk_pause( void );
void hsp3ndk_resume( void );
void hsp3ndk_dialog( char *mes );
HSPCTX *hsp3ndk_getctx( void );
void *hsp3ndk_getDevInfo( void );

char *hsp3ndk_stmp( char *str );
void hsp3ndk_setstat( int stat );
#ifdef __cplusplus
}
#endif

#endif
