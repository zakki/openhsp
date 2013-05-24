#ifndef JAVAFUNC_H
#define JAVAFUNC_H

#include "appengine.h"
#include "hsp_native_app_glue.h"

#ifdef __cplusplus
extern "C" {
#endif

int javafunc_init( struct engine *en );
struct engine *javafunc_engine( void );

#define JAVAFUNC_INFO_DEVICE 0
#define JAVAFUNC_INFO_VERSION 1
#define JAVAFUNC_INFO_FILESDIR 2

char *j_getinfo( int type );
int j_callVibrator( int val );
int j_dispDialog( char *msg1, char *msg2, int type );
int j_callActivity( char *msg1, char *msg2, int type );
int j_callAdMob( int val );

#ifdef __cplusplus
}
#endif /* __cplusplus */

JNIEXPORT void JNICALL nativepoke( JNIEnv* env, jobject thiz, jint value, jint value2 );

#endif
