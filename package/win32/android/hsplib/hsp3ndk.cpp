/*--------------------------------------------------------
	HSP3 main (NDK)
									  2011/3  onitama
  --------------------------------------------------------*/

#include <stdio.h>
#include <ctype.h>

#ifdef HSPDISHGP
#include "gamehsp.h"
#endif

#include "hsp3ndk.h"
#include "hsp3/hsp3config.h"
#include "hsp3/strbuf.h"
#include "hsp3/hsp3.h"
//#include "hsp3/hsp3ext.h"
#include "hsp3/hsp3gr.h"
#include "hsp3/supio.h"
#include "hsp3/hgio.h"
#include "hsp3/sysreq.h"
#include "hsp3/strnote.h"

//#include "hsp3r.h"
//#include "hsp3embed.h"

//#define USE_OBAQ

#ifdef USE_OBAQ
#include "../obaq/hsp3dw.h"
#endif

//typedef BOOL (*HSP3DBGFUNC)(HSP3DEBUG *,int,int,int);

/*----------------------------------------------------------*/

static Hsp3 *hsp = NULL;
static HSPCTX *ctx;
static HSPEXINFO *exinfo;								// Info for Plugins

static char fpas[]={ 'H'-48,'S'-48,'P'-48,'H'-48,
					 'E'-48,'D'-48,'~'-48,'~'-48 };
static char optmes[] = "HSPHED~~\0_1_________2_________3______";

static int hsp_wx, hsp_wy, hsp_wd, hsp_ss;

#ifndef HSPDEBUG
static int hsp_sscnt, hsp_ssx, hsp_ssy;
#endif

#ifdef HSPDEBUG
static HSP3DBGFUNC dbgwin;
static HSP3DBGFUNC dbgnotice;
static HINSTANCE h_dbgwin;
static HWND dbgwnd;
static HSP3DEBUG *dbginfo;
#endif


#ifdef HSPDISHGP
gamehsp *game;
gameplay::Platform *platform;

//-------------------------------------------------------------
//             gameplay Log
//-------------------------------------------------------------

static char gplog[1024];

extern "C" {
	static void logfunc( gameplay::Logger::Level level, const char *msg )
	{
		printf( "[GamePlay3D] %s\n", msg );
		if (strlen(gplog) + strlen(msg) + 1 > sizeof(gplog))
			gplog[0] = 0;
		strcat( gplog, msg );
	}
}
#endif

/*----------------------------------------------------------*/

void hsp3ndk_dialog( char *mes )
{
	Alert( (const char *)mes );
}

int hsp3ndk_wait( int tick )
{
	//		時間待ち(wait)
	//		(awaitに変換します)
	//
	if ( ctx->waitcount <= 0 ) {
		ctx->runmode = RUNMODE_RUN;
		return RUNMODE_RUN;
	}
	ctx->waittick = tick + ( ctx->waitcount * 10 );
	return RUNMODE_AWAIT;
}


int hsp3ndk_await( int tick )
{
	//		時間待ち(await)
	//
	if ( ctx->waittick < 0 ) {
		if ( ctx->lasttick == 0 ) ctx->lasttick = tick;
		ctx->waittick = ctx->lasttick + ctx->waitcount;
	}
	if ( tick >= ctx->waittick ) {
		ctx->lasttick = tick;
		ctx->runmode = RUNMODE_RUN;
		return RUNMODE_RUN;
	}
	return RUNMODE_AWAIT;
}



void hsp3ndk_msgfunc( HSPCTX *hspctx )
{
	int tick;

	while(1) {
		// logmes なら先に処理する
		if ( hspctx->runmode == RUNMODE_LOGMES ) {
			hspctx->runmode = RUNMODE_RUN;
			return;
		}

		switch( hspctx->runmode ) {
		case RUNMODE_STOP:
			return;
		case RUNMODE_WAIT:
		case RUNMODE_AWAIT:
			return;
//		case RUNMODE_END:
//			throw HSPERR_NONE;
		case RUNMODE_RETURN:
			throw HSPERR_RETURN_WITHOUT_GOSUB;
		case RUNMODE_INTJUMP:
			throw HSPERR_INTJUMP;
		case RUNMODE_ASSERT:
			hspctx->runmode = RUNMODE_STOP;
#ifdef HSPDEBUG
			hsp3dish_debugopen();
#endif
			break;
	//	case RUNMODE_LOGMES:
		default:
			return;
		}
	}
}

/*----------------------------------------------------------*/

int hsp3ndk_init( char *startfile )
{
	//		システム関連の初期化
	//
	int a,orgexe, mode;
//	int hsp_sum, hsp_dec;
//	char a1;
#ifdef HSPDEBUG
	int i;
#endif

#ifdef HSPDISHGP
	SetSysReq( SYSREQ_MAXMATERIAL, 64 );            // マテリアルのデフォルト値

	game = NULL;
	platform = NULL;
#endif

	//		HSP関連の初期化
	//
	Alertf( "---Init HSP3\n" );

	hsp = new Hsp3();
	if ( startfile != NULL ) {
		hsp->SetFileName( startfile );
	}

	//		実行ファイルかデバッグ中かを調べる
	//
	mode = 0;
	orgexe=0;
	hsp_wx = 640;
	hsp_wy = 480;
	hsp_wd = 0;
	hsp_ss = 0;

	if ( hsp->Reset( mode ) ) {
		Alertf( "Startup failed." );
		return 1;
	}

	ctx = &hsp->hspctx;

	//		Register Type
	//
	ctx->msgfunc = hsp3ndk_msgfunc;

//	hsp3typeinit_dllcmd( code_gettypeinfo( TYPE_DLLFUNC ) );
//	hsp3typeinit_dllctrl( code_gettypeinfo( TYPE_DLLCTRL ) );
	hsp3typeinit_extcmd( code_gettypeinfo( TYPE_EXTCMD )  );
	hsp3typeinit_extfunc( code_gettypeinfo( TYPE_EXTSYSVAR ) );

#ifdef USE_OBAQ
	hsp3typeinit_dw_extcmd( code_gettypeinfo( -1 ) ); // TYPE_USERDEF
	//hsp3typeinit_dw_extfunc( code_gettypeinfo( TYPE_USERDEF+1 ) );
#endif

	exinfo = ctx->exinfo2;

	//		Utility setup
	//VarUtilInit();

#ifdef HSPDEBUG
	dbginfo = code_getdbg();
#endif

	// ctx->endcode = 0;
	// ctx->looplev = 0;
	// ctx->sublev = 0;
	
	//StackReset();
	
	return 0;
}


void hsp3ndk_bye( void )
{
	//		HSP関連の解放
	//
	if ( hsp != NULL ) { delete hsp; hsp = NULL; }

#ifdef HSPDEBUG
	//		デバッグウインドゥの解放
	//
	if ( h_dbgwin != NULL ) { FreeLibrary( h_dbgwin ); h_dbgwin = NULL; }
#endif


	//		システム関連の解放
	//
//	DllManager().free_all_library();
	Alertf( "---Term HSP3\n" );

}


void hsp3ndk_error( void )
{
	char errmsg[1024];
	char *msg;
	char *fname;
	HSPERROR err;
	int ln;
	err = code_geterror();
	ln = code_getdebug_line();
	msg = hspd_geterror(err);
	fname = code_getdebug_name();

	if ( ln < 0 ) {
		sprintf( errmsg, "#Error %d\n-->%s\n",(int)err,msg );
		fname = NULL;
	} else {
		sprintf( errmsg, "#Error %d in line %d (%s)\n-->%s\n",(int)err, ln, fname, msg );
	}
//	hsp3win_debugopen();
	hsp3ndk_dialog( errmsg );
}


extern int code_execcmd_one( int& prev );

int hsp3ndk_exec( void )
{
	//		実行メインを呼び出す
	//
	static int code_execcmd_state = 0;
	int i;
	//LOGI("exec %d", ctx->runmode);
	if ( ctx->runmode == RUNMODE_ERROR ) {
		return ctx->runmode;
	}
	ctx->runmode = RUNMODE_RUN;

	try {
		while(1) {
			//LOGI("execcmd");
			//code_execcmd();
			int runmode = code_execcmd_one(code_execcmd_state);
			//LOGI("execcmd -> %d %d", runmode, ctx->runmode);
			switch ( ctx->runmode ){
			case RUNMODE_RUN:
				break;
			case RUNMODE_WAIT:
			case RUNMODE_AWAIT:
				return ctx->runmode;
			case RUNMODE_END:
			case RUNMODE_ERROR:
				return ctx->runmode;
				break;
			}
			if ( ctx->runmode != 0 ) {
                if ( ctx->runmode != RUNMODE_RETURN ) break;  
            }
		}
	}

		catch( HSPERROR code ) {						// HSPエラー例外処理
			Alertf("execcmd err -> %d", code);
		if ( code == HSPERR_NONE ) {
			ctx->runmode = RUNMODE_END;
		} else {
			i = RUNMODE_ERROR;
			ctx->err = code;
			ctx->runmode = i;
			hsp3ndk_error();
		}
	}
	//Alertf( "RUN=%d",ctx->runmode );
	return ctx->runmode;
}


int hsp3ndk_exectime( int tick )
{
	//		実行メインを呼び出す
	//		(time=経過時間)
	//
	//LOGI("execute(%d) %d", tick, ctx->runmode);
	switch( ctx->runmode ) {
		case RUNMODE_STOP:
		case RUNMODE_ASSERT:
			return ctx->runmode;
		case RUNMODE_WAIT:
			//	高精度タイマー
			ctx->runmode = hsp3ndk_wait( tick );
            if ( ctx->runmode == RUNMODE_RUN ) break;
			return ctx->runmode;
		case RUNMODE_AWAIT:
			//	高精度タイマー
			ctx->runmode = hsp3ndk_await( tick );
            if ( ctx->runmode == RUNMODE_RUN ) break;
			return ctx->runmode;
		case RUNMODE_END:
			return ctx->runmode;
		case RUNMODE_INTJUMP:
			break;
		default:
			break;
		}
	//LOGI("exe()", tick, ctx->runmode);
	return hsp3ndk_exec();
}


void hsp3ndk_setstat( int stat )
{
	//		stat値を設定
	//
    ctx->stat = stat;
}


HSPCTX *hsp3ndk_getctx( void )
{
	//		HSPCTXを返す
	//
	return ctx;
}


void *hsp3ndk_getDevInfo( void )
{
	//		DEVINFOを返す
	//
	return hsp3extcmd_getdevinfo();
}


char *hsp3ndk_stmp( char *str )
{
	//		HSPCTXのstmpに文字列を格納する
	//
	code_stmpstr( str );
	return ctx->stmp;
}


void hsp3ndk_pause( void )
{
	//		アプリケーションの一時停止
	//
	hsp3extcmd_pause();
}


void hsp3ndk_resume( void )
{
	//		アプリケーションの再開
	//
	hsp3extcmd_resume();
}


// int hsp3ndk_gettask( void )
// {
// 	return GetTaskID();
// }



