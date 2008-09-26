/*--------------------------------------------------------
	HSP3 interpreter main
									  1995/10 onitama
									  1997/7  onitama
									  1999/8  onitama
									  2003/4  onitama
  --------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include "hsp3r.h"
#include "hsp3gr_win.h"

/*----------------------------------------------------------*/

static Hsp3r *hsp;
static HSPCTX *ctx;

void hsp3win_dialog( char *mes )
{
	printf( "%s\n", mes );
}

void hsp3cl_error( void )
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

	hsp3win_dialog( errmsg );
	hsp3win_dialog( "[ERROR] Press any key..." );
}


void hsp3cl_msgfunc( HSPCTX *hspctx )
{
	while(1) {

		switch( hspctx->runmode ) {
		case RUNMODE_STOP:
			hsp3win_dialog( "[STOP] Press any key..." );
			throw HSPERR_NONE;
		case RUNMODE_WAIT:
		case RUNMODE_AWAIT:
			break;
		case RUNMODE_END:
			throw HSPERR_NONE;
		case RUNMODE_RETURN:
			throw HSPERR_RETURN_WITHOUT_GOSUB;

		default:
			return;
		}
	}
}


int main( int argc, char *argv[] )
{
	int runmode;

	//		HSP関連の初期化
	//
	hsp = new Hsp3r();
	if ( hsp->Reset( 16, 0 ) ) {
		hsp3win_dialog( "Startup failed." );
		return -1;
	}

	//		Register Type
	//
	ctx = &hsp->hspctx;
	ctx->msgfunc = hsp3cl_msgfunc;
	ctx->hspstat |= 16;
	hsp3typeinit_cl_extcmd( code_gettypeinfo( TYPE_EXTCMD ) );
	hsp3typeinit_cl_extfunc( code_gettypeinfo( TYPE_EXTSYSVAR ) );

	//		実験コード
	//
	StackPushType( TYPE_EX_ENDOFPARAM );

#if 0
	//#define Var_a &mem_var[0]
	// a =123
	//PushStr("TEST STRING");
	//PushDouble(999.999); 
	PushInt(999); 
	VarSet(Var_a,0,1);
	PushInt(10); 
	//VarDec(Var_a,0);
	VarCalc(Var_a,0,1);

	PushStr("OKOK=");
	PushVar( Var_a, 0 ); CalcAddI();

	//StackPushStr( "Test Code" );
	//code_gettypeinfo( TYPE_EXTCMD )->cmdfunc( 0x0f );
	Extcmd(15,1);
#endif

	//		実行の開始
	//
	runmode = code_execcmd();
	if ( runmode == RUNMODE_ERROR ) {
		try {
			hsp3cl_error();
		}
		catch( ... ) {
		}
		return -1;
	}

	//		HSP関連の解放
	//
	delete hsp;



	return 0;
}



