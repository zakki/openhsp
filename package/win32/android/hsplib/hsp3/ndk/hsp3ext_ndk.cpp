
//
//	HSP3 External program manager (dummy)
//	onion software/onitama 2011/11
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../hsp3config.h"
#include "hsp3ext_ndk.h"

#include "../hgio.h"
#include "../sysreq.h"
#include "../../hsp3embed/hsp3embed.h"
#include "../../javafunc.h"

/*----------------------------------------------------------*/
//		DevInfo Call
/*----------------------------------------------------------*/
static HSP3DEVINFO *mem_devinfo;
static int devinfo_dummy;
static char *devres_none;

static int hsp3dish_devprm( char *name, char *value )
{
	return -1;
}

static int hsp3dish_devcontrol( char *cmd, int p1, int p2, int p3 )
{
	if ( strcmp( cmd, "vibrate" )==0 ) {
		j_callVibrator( p1 );
        //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
		return 0;
	}
	if ( strcmp( cmd, "setflag" )==0 ) {
		j_addWindowFlag( p1 );
		return 0;
	}
	if ( strcmp( cmd, "clearflag" )==0 ) {
		j_clearWindowFlag( p1 );
		return 0;
	}
	if ( strcmp( cmd, "AdMob" )==0 ) {
		j_callAdMob( p1 );
		return 0;
	}
	return -1;
}

static int *hsp3dish_devinfoi( char *name, int *size )
{
	*size = -1;
	return NULL;
    //	return &devinfo_dummy;
}

static char *hsp3dish_devinfo( char *name )
{
	if ( strcmp( name, "name" )==0 ) {
		return mem_devinfo->devname;
	}
	if ( strcmp( name, "locale" )==0 ) {
		return j_getinfo( JAVAFUNC_INFO_LOCALE );
	}
	if ( strcmp( name, "error" )==0 ) {
		return mem_devinfo->error;
	}
	return NULL;
}

void hsp3dish_setdevinfo( void )
{
	//		Initalize DEVINFO
    HSP3DEVINFO *devinfo;
    devinfo = (HSP3DEVINFO *)hsp3eb_getDevInfo();
    mem_devinfo = devinfo;
	devinfo_dummy = 0;
    devres_none = (char *)&devinfo_dummy;
	devinfo->devname = (char *)"Androiddev";
	devinfo->error = (char *)"";
	devinfo->devprm = hsp3dish_devprm;
	devinfo->devcontrol = hsp3dish_devcontrol;
	devinfo->devinfo = hsp3dish_devinfo;
	devinfo->devinfoi = hsp3dish_devinfoi;
}


/*------------------------------------------------------------*/
/*
		type function
*/
/*------------------------------------------------------------*/

static int cmdfunc_dllcmd( int cmd )
{
	//		cmdfunc : TYPE_DLLCTRL
	//		(拡張DLLコントロールコマンド)
	//
	code_next();							// 次のコードを取得(最初に必ず必要です)

	switch( cmd ) {							// サブコマンドごとの分岐
	case 0x00:								// newcom
		throw (HSPERR_UNSUPPORTED_FUNCTION);

	default:
		throw ( HSPERR_SYNTAX );
	}

	return RUNMODE_RUN;
}


static void *reffunc_dllcmd( int *type_res, int arg )
{
	//		reffunc : TYPE_DLLFUNC
	//		(拡張DLL関数)
	//

	//			'('で始まるかを調べる
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) throw ( HSPERR_INVALID_FUNCPARAM );

	*type_res = HSPVAR_FLAG_INT;
	//exec_dllcmd( arg, STRUCTDAT_OT_FUNCTION );
	reffunc_intfunc_ivalue = hspctx->stat;

	//			')'で終わるかを調べる
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != ')' ) throw ( HSPERR_INVALID_FUNCPARAM );
	code_next();

	return &reffunc_intfunc_ivalue;
}


static int termfunc_dllcmd( int option )
{
	//		termfunc : TYPE_DLLCMD
	//
	return 0;
}

void hsp3typeinit_dllcmd( HSP3TYPEINFO *info )
{
	InitSystemInformation();

	hspctx = info->hspctx;
	exinfo = info->hspexinfo;
	type = exinfo->nptype;
	val = exinfo->npval;
	exflg = exinfo->npexflg;

	info->cmdfunc = cmdfunc_dllcmd;
	info->reffunc = reffunc_dllcmd;
	info->termfunc = termfunc_dllcmd;

	InitSystemInformation();
}

void hsp3typeinit_dllctrl( HSP3TYPEINFO *info )
{
}


/*------------------------------------------------------------*/
/*
		Sysinfo, getdir service
*/
/*------------------------------------------------------------*/

char* hsp3ext_getdir(int id)
{
	return "";
}


char *hsp3ext_sysinfo(int p2, int* res, char* outbuf)
{
	//		System strings get
	//
	int fl;
	char *p1;
	fl = HSPVAR_FLAG_STR;
	p1 = outbuf;
	*p1=0;

	switch(p2) {
	case 0:
#ifdef HSPNDK
		{
		char tmp[256];
		strcpy( tmp, j_getinfo( JAVAFUNC_INFO_VERSION ) );
		strcpy( p1, "android " );
		strcat( p1, tmp );
		}
#endif
#ifdef HSPIOS
        gb_getSysVer( p1 );
#endif
        break;
	case 1:
		break;
	case 2:
#ifdef HSPNDK
		j_getinfo( JAVAFUNC_INFO_DEVICE );
#endif
#ifdef HSPIOS
        gb_getSysModel( p1 );
#endif
		break;
	default:
		return NULL;
	}
	*res = fl;
	return p1;
}


void hsp3ext_execfile(char* msg, char* option, int mode)
{
#ifdef HSPNDK
	j_callActivity( msg, option, mode );
#endif
#ifdef HSPIOS
    gb_exec( mode, msg );
#endif
    return 0;
}

