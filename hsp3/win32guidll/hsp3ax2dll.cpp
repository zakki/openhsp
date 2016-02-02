
#include <windows.h>

#include "hsp3ax2dll.h"

#include "../hsp3code.h"
#include "../hspvar_core.h"
#include "../win32gui/hsp3win.h"

static HSPCTX *ctx;
static HSPEXINFO *exinfo;
static int *type;
static int *val;

static int cmdfunc_ax2dllcmd(int);
static void hsp3typeinit_ax2dllcmd(HSP3TYPEINFO*);

int hsp3ax2dll_init(HINSTANCE hInstance,char *startfile)
{
	int res;
	res = hsp3win_init(hInstance,startfile);
	hsp3typeinit_ax2dllcmd(code_gettypeinfo(TYPE_USERDEF));
	return res;
}

static int cmdfunc_ax2dllcmd(int cmd)
{
	code_next();
	switch ( cmd )
	{
	case 0x000:
		code_gets();
		code_gets();
		code_gets();
		code_next();
		break;
	case 0x001:
		code_gets();
		break;
	default:
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}
	return 0;
}

void hsp3typeinit_ax2dllcmd(HSP3TYPEINFO *info)
{
	ctx = info->hspctx;
	exinfo = info->hspexinfo;
	type = exinfo->nptype;
	val = exinfo->npval;
	
	info->cmdfunc = cmdfunc_ax2dllcmd;
}

void dll_init(void)
{
	code_call(ctx->mem_mcs);
}

int runproc( void )
{
	while(1) {

#ifdef HSPDEBUG
		if ( code_getdbgmode() ) code_dbgtrace();					// トレースモード時の処理
#endif
		if ( code_gettypeinfo( *type )->cmdfunc( *val ) ) {	// タイプごとの関数振り分け
			if ( ctx->runmode == RUNMODE_END ) {
				throw HSPERR_NONE;
			}
			if ( ctx->runmode == RUNMODE_RETURN ) {
				cmdfunc_return();
				break;
			} else {
				ctx->msgfunc( ctx );
			}
		}
	}

	return RUNMODE_RUN;//
}