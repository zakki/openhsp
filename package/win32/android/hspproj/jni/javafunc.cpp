//--------------------------------------------------------------------------
//	JNI<->CPP bridge
//	2012/06 onitama/onion software
//--------------------------------------------------------------------------

#include <stdio.h>
#include <android/log.h>
#include <jni.h>
#include <android/sensor.h>

#include "javafunc.h"

#include "hsp3/hsp3config.h"
#include "hsp3/strbuf.h"
#include "hsp3/hsp3gr.h"
#include "hsp3/supio.h"
#include "hsp3embed/hsp3embed.h"

/*
static int jniRegisterNativeMethods(JNIEnv* env, const char* className,
    const JNINativeMethod* gMethods, int numMethods)
{
    jclass clazz;

    LOGD("Registering %s natives\n", className);
    clazz = (*env)->FindClass(env, className);
    if (clazz == NULL) {
        LOGD("Native registration unable to find class '%s'\n", className);
        return -1;
    }
    if ((*env)->RegisterNatives(env, clazz, gMethods, numMethods) < 0) {
        LOGD("RegisterNatives failed for '%s'\n", className);
        return -1;
    }
    return 0;
}
*/

static engine *m_engine;
static JavaVM *m_vm;

//--------------------------------------------------------------------------

static char *jcall_void_str( const char *name ) {
	//	call JavaMethod ( char*(void) )
    JNIEnv* env;
    char *p;

	m_vm->AttachCurrentThread(&env, NULL);
    jclass clazz = env->GetObjectClass(m_engine->app->activity->clazz);
    jmethodID methodj = env->GetMethodID(clazz, name, "()Ljava/lang/String;");
    jstring jstr = (jstring)env->CallObjectMethod(m_engine->app->activity->clazz, methodj);
    if (jstr != NULL) {
        char* str = (char *)env->GetStringUTFChars(jstr, NULL);
        p = hsp3eb_stmp( str );
        env->ReleaseStringUTFChars(jstr, str);
    }
	m_vm->DetachCurrentThread();
	return p;
}


static int jcall_int_int( const char *name, int val ) {
	//	call JavaMethod ( int (int) )
    JNIEnv* env;
    jint prm;

	prm = (jint)val;
	m_vm->AttachCurrentThread(&env, NULL);
    jclass clazz = env->GetObjectClass(m_engine->app->activity->clazz);

    jmethodID methodj = env->GetMethodID(clazz, name, "(I)I");
    jint value = env->CallIntMethod(m_engine->app->activity->clazz, methodj, prm);

	m_vm->DetachCurrentThread();
	return (int)value;
}


static int jcall_SSI_int( const char *name, char *str1, char *str2, int val ) {
	//	call JavaMethod ( int (char *,char *,int) )
    JNIEnv* env;
    jint prm;

	prm = (jint)val;
	m_vm->AttachCurrentThread(&env, NULL);
    jclass clazz = env->GetObjectClass(m_engine->app->activity->clazz);

    jmethodID methodj = env->GetMethodID(clazz, name, "(Ljava/lang/String;Ljava/lang/String;I)I");
    jint value = env->CallIntMethod(m_engine->app->activity->clazz, methodj, env->NewStringUTF(str1), env->NewStringUTF(str2), val );

	m_vm->DetachCurrentThread();
	return (int)value;
}


JNIEXPORT void JNICALL nativepoke( JNIEnv* env, jobject thiz, jint value, jint value2 )
{
	LOGI( "[Java->Native Ready(%d)(%d)]",value,value2 );
}

//--------------------------------------------------------------------------

static const JNINativeMethod methods[] = {
	{ "nativepoke", "(II)V", (void *)nativepoke }
};

int javafunc_init( struct engine *en ) {

	//		setup Java enviroment
	//
    JNIEnv* env;
    JavaVM* vm = en->app->activity->vm;
    m_vm = vm;
    m_engine = en;

	//LOGI( "[Native->Java Ready]" );

	//		register native function
	//
	m_vm->AttachCurrentThread(&env, NULL);
	jclass clazz = env->GetObjectClass(m_engine->app->activity->clazz);
    if (env->RegisterNatives( clazz, methods, sizeof(methods)/sizeof(JNINativeMethod) ) < 0) {
        LOGW("RegisterNatives failed");
        return -1;
    }
	m_vm->DetachCurrentThread();

	//j_callVibrator( 400 );
	//LOGI( "DEVICE[%s]", j_getinfo(JAVAFUNC_INFO_DEVICE) );
	//LOGI( "VERSION[%s]", j_getinfo(JAVAFUNC_INFO_VERSION) );
	return 0;
}


struct engine *javafunc_engine( void ) {
	return m_engine;
}


char *j_getinfo( int type )
{
	switch( type ) {
	case JAVAFUNC_INFO_DEVICE:
		return jcall_void_str( "getInfo_Device" );
	case JAVAFUNC_INFO_VERSION:
		return jcall_void_str( "getInfo_Version" );
	case JAVAFUNC_INFO_FILESDIR:
		return jcall_void_str( "getInfo_FilesDir" );
	default:
		break;
	}
	return (char *)"";
}


int j_callVibrator( int val )
{
	return jcall_int_int( "callVibrator", val );
}


int j_dispDialog( char *msg1, char *msg2, int type )
{
	//return jcall_SSI_int( "dispDialog", msg1, msg2, type );
	return 0;
}


int j_callActivity( char *msg1, char *msg2, int type )
{
	return jcall_SSI_int( "callActivity", msg1, msg2, type );
}

//--------------------------------------------------------------------------

int j_callAdMob( int val )
{
		return jcall_int_int( "callAdMob", val );
}



