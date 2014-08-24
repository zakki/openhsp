/*--------------------------------------------------------
	HSP3dish main (emscripten & SDL)
  --------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if defined( __GNUC__ )
#include <ctype.h>
#endif

#include "hsp3dish.h"
#include "../../hsp3/hsp3config.h"
#include "../../hsp3/strbuf.h"
#include "../../hsp3/hsp3.h"
#include "../hsp3gr.h"
#include "../supio.h"
#include "../hgio.h"
#include "../sysreq.h"
//#include "../hsp3ext.h"
#include "../../hsp3/strnote.h"
#include "appengine.h"

#include <GL/gl.h>
//#include <GL/glut.h>

#include "SDL/SDL.h"
#include "SDL/SDL_image.h"
#include "SDL/SDL_opengl.h"

#include <emscripten.h>

//typedef BOOL (CALLBACK *HSP3DBGFUNC)(HSP3DEBUG *,int,int,int);

/*----------------------------------------------------------*/

static Hsp3 *hsp = NULL;
static HSPCTX *ctx;
static HSPEXINFO *exinfo;								// Info for Plugins

static char fpas[]={ 'H'-48,'S'-48,'P'-48,'H'-48,
					 'E'-48,'D'-48,'~'-48,'~'-48 };
static char optmes[] = "HSPHED~~\0_1_________2_________3______";

static int hsp_wx, hsp_wy, hsp_wd, hsp_ss;
static int drawflag;
static int hsp_fps;
static int hsp_limit_step_per_frame;

//static	HWND m_hWnd;

#ifndef HSPDEBUG
static int hsp_sscnt, hsp_ssx, hsp_ssy;
#endif

/*----------------------------------------------------------*/
void handleEvent() {
	SDL_Event event;
	while (SDL_PollEvent(&event)) {
		switch(event.type) {
		case SDL_MOUSEMOTION:
			{
				Bmscr *bm;
				if ( exinfo != NULL ) {
					SDL_MouseMotionEvent *m = (SDL_MouseMotionEvent*)&event;
					int x, y;
					hgio_scale_point( m->x, m->y, x, y );

					bm = (Bmscr *)exinfo->HspFunc_getbmscr(0);
					bm->savepos[BMSCR_SAVEPOS_MOSUEX] = x;
					bm->savepos[BMSCR_SAVEPOS_MOSUEY] = y;
					bm->UpdateAllObjects();
					bm->setMTouchByPointId( -1, x, y, true );

					//printf("motion: %d,%d  %d,%d\n", m->x, m->y, m->xrel, m->yrel);
				}
				//assert(x == m->x && y == m->y);
				//result += 2 * (m->x + m->y + m->xrel + m->yrel);
				break;
			}
		case SDL_MOUSEBUTTONDOWN:
			{
				SDL_MouseButtonEvent *m = (SDL_MouseButtonEvent*)&event;
				//printf("button down: %d,%d  %d,%d\n", m->button, m->state, m->x, m->y);
				hgio_touch( m->x, m->y, 1 );
				break;
			}
		case SDL_MOUSEBUTTONUP:
			{
				SDL_MouseButtonEvent *m = (SDL_MouseButtonEvent*)&event;
				//printf("button up: %d,%d  %d,%d\n", m->button, m->state, m->x, m->y);
				hgio_touch( m->x, m->y, 0 );
				break;
			}
		}
	}
}

static void hsp3dish_initwindow( engine* engine, int sx, int sy, char *windowtitle )
{
	printf("INIT %dx%d %s\n", sx,sy,windowtitle);
	// glutInit(NULL, NULL);
	// glutInitWindowSize(sx, sy);

	// glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);

	// glutCreateWindow(windowtitle);

	SDL_Surface *screen;

	// Slightly different SDL initialization
	if ( SDL_Init(SDL_INIT_VIDEO) != 0 ) {
		printf("Unable to initialize SDL: %s\n", SDL_GetError());
		return;
	}

	SDL_GL_SetAttribute( SDL_GL_DOUBLEBUFFER, 1 );

	screen = SDL_SetVideoMode( sx, sy, 16, SDL_OPENGL );
	if ( !screen ) {
		printf("Unable to set video mode: %s\n", SDL_GetError());
		return;
	}

	// �`��API�ɓn��
	hgio_init( 0, sx, sy, engine );
	hgio_clsmode( CLSMODE_SOLID, 0xffffff, 0 );

	// �}���`�^�b�`������
	//MTouchInit( m_hWnd );
}


void hsp3dish_dialog( char *mes )
{
	//MessageBox( NULL, mes, "Error",MB_ICONEXCLAMATION | MB_OK );
	printf( "%s\n", mes );
}


#ifdef HSPDEBUG
char *hsp3dish_debug( int type )
{
	//		�f�o�b�O���擾
	//
	char *p;
	p = code_inidbg();

	switch( type ) {
	case DEBUGINFO_GENERAL:
//		hsp3gr_dbg_gui();
		code_dbg_global();
		break;
	case DEBUGINFO_VARNAME:
		break;
	case DEBUGINFO_INTINFO:
		break;
	case DEBUGINFO_GRINFO:
		break;
	case DEBUGINFO_MMINFO:
		break;
	}
	return p;
}
#endif


void hsp3dish_drawon( void )
{
	//		�`��J�n�w��
	//
	if ( drawflag == 0 ) {
		hgio_render_start();
		drawflag = 1;
	}
}


void hsp3dish_drawoff( void )
{
	//		�`��I���w��
	//
	if ( drawflag ) {
		hgio_render_end();
		drawflag = 0;
	}
}


int hsp3dish_debugopen( void )
{
	return 0;
}

int hsp3dish_wait( int tick )
{
	//		���ԑ҂�(wait)
	//		(await�ɕϊ����܂�)
	//
	if ( ctx->waitcount <= 0 ) {
		ctx->runmode = RUNMODE_RUN;
		return RUNMODE_RUN;
	}
	ctx->waittick = tick + ( ctx->waitcount * 10 );
	return RUNMODE_AWAIT;
}


int hsp3dish_await( int tick )
{
	//		���ԑ҂�(await)
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


void hsp3dish_msgfunc( HSPCTX *hspctx )
{
	int tick;

	while(1) {
		// logmes �Ȃ��ɏ�������
		if ( hspctx->runmode == RUNMODE_LOGMES ) {
			hspctx->runmode = RUNMODE_RUN;
			return;
		}

		switch( hspctx->runmode ) {
		case RUNMODE_STOP:
			// while(1) {
			// 	GetMessage( &msg, NULL, 0, 0 );
			// 	if ( msg.message == WM_QUIT ) throw HSPERR_NONE;
			// 	hsp3dish_dispatch( &msg );
			// 	if ( hspctx->runmode != RUNMODE_STOP ) break;
			// }
			// MsgWaitForMultipleObjects(0, NULL, FALSE, 1000, QS_ALLINPUT );
			return;
		case RUNMODE_WAIT:
			tick = hgio_gettick();
			hspctx->runmode = code_exec_wait( tick );
		case RUNMODE_AWAIT:
			tick = hgio_gettick();
			if ( code_exec_await( tick ) != RUNMODE_RUN ) {
				//MsgWaitForMultipleObjects(0, NULL, FALSE, hspctx->waittick - tick, QS_ALLINPUT );
				//printf("AWAIT WAIT %d < %d\n", tick, ctx->waittick);
			} else {
				//printf("AWAIT RUN %d < %d\n", tick, ctx->waittick);
				ctx->runmode = RUNMODE_AWAIT;
#ifndef HSPDEBUG
				if ( ctx->hspstat & HSPSTAT_SSAVER ) {
					if ( hsp_sscnt ) hsp_sscnt--;
				}
#endif
			}
				return;
			break;
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
//		�f�o�C�X�R���g���[���֘A
/*----------------------------------------------------------*/
static HSP3DEVINFO *mem_devinfo;
static int devinfo_dummy;

static int hsp3dish_devprm( char *name, char *value )
{
	return -1;
}

static int hsp3dish_devcontrol( char *cmd, int p1, int p2, int p3 )
{
	return -1;
}

static int *hsp3dish_devinfoi( char *name, int *size )
{
	devinfo_dummy = 0;
	*size = -1;
	return NULL;
//	return &devinfo_dummy;
}

static char *hsp3dish_devinfo( char *name )
{
	if ( strcmp( name, "name" )==0 ) {
		return mem_devinfo->devname;
	}
	if ( strcmp( name, "error" )==0 ) {
		return mem_devinfo->error;
	}
	return NULL;
}

static void hsp3dish_setdevinfo( HSP3DEVINFO *devinfo )
{
	//		Initalize DEVINFO
	mem_devinfo = devinfo;
	devinfo->devname = "emscripten";
	devinfo->error = "";
	devinfo->devprm = hsp3dish_devprm;
	devinfo->devcontrol = hsp3dish_devcontrol;
	devinfo->devinfo = hsp3dish_devinfo;
	devinfo->devinfoi = hsp3dish_devinfoi;
}

/*----------------------------------------------------------*/

int hsp3dish_init( char *startfile )
{
	//		�V�X�e���֘A�̏�����
	//		( mode:0=debug/1=release )
	//
	int a,orgexe, mode;
	int hsp_sum, hsp_dec;
	char a1;
#ifdef HSPDEBUG
	int i;
#endif
	InitSysReq();

	//		HSP�֘A�̏�����
	//
	hsp = new Hsp3();

	if ( startfile != NULL ) {
		hsp->SetFileName( startfile );
	}

	//		���s�t�@�C�����f�o�b�O�����𒲂ׂ�
	//
	mode = 0;
	orgexe=0;
	hsp_wx = 320;
	hsp_wy = 480;
//	hsp_wx = 640;
//	hsp_wy = 480;
	hsp_wd = 0;
	hsp_ss = 0;

	for( a=0 ; a<8; a++) {
		a1=optmes[a]-48;if (a1==fpas[a]) orgexe++;
	}
	if ( orgexe == 0 ) {
		mode = atoi(optmes+9) + 0x10000;
		a1=*(optmes+17);
		if ( a1 == 's' ) hsp_ss = HSPSTAT_SSAVER;
		hsp_wx=*(short *)(optmes+20);
		hsp_wy=*(short *)(optmes+23);
		hsp_wd=( *(short *)(optmes+26) );
		hsp_sum=*(unsigned short *)(optmes+29);
		hsp_dec=*(int *)(optmes+32);
		hsp->SetPackValue( hsp_sum, hsp_dec );
	}

	char *env_wx = getenv( "HSP_WX" );
	if ( env_wx ) {
		int v = atoi( env_wx );
		if ( v > 0 ) {
			hsp_wx = v;
		}
	}

	char *env_wy = getenv( "HSP_WY" );
	if ( env_wy ) {
		int v = atoi( env_wy );
		if ( v > 0 ) {
			hsp_wy = v;
		}
	}

	float sx = 0, sy = 0;

	char *env_sx = getenv( "HSP_SX" );
	if ( env_sx ) {
		sx = atof( env_sx );
	}

	char *env_sy = getenv( "HSP_SY" );
	if ( env_sy ) {
		sy = atof( env_sy );
	}

	if ( sx > 0 && sy > 0 ) {
		//OK
	} else {
		sx = hsp_wx;
		sy = hsp_wy;
	}

	char *env_autoscale = getenv( "HSP_AUTOSCALE" );
	int autoscale = 0;
	if ( env_autoscale ) {
		autoscale = atoi( env_autoscale );
	}

	char *env_fps = getenv( "HSP_FPS" );
	hsp_fps = 0;
	if ( env_fps ) {
		hsp_fps = atoi( env_fps );
	}

	char *env_step = getenv( "HSP_LIMIT_STEP" );
	hsp_limit_step_per_frame = 5000;
	if ( env_step ) {
		hsp_limit_step_per_frame = atoi( env_step );
	}

	printf("Screen %f %f\n", sx, sy);

	if ( hsp->Reset( mode ) ) {
		hsp3dish_dialog( "Startup failed." );
		return 1;
	}

	ctx = &hsp->hspctx;

	//		Register Type
	//
	drawflag = 0;
	ctx->msgfunc = hsp3dish_msgfunc;

	//		Initalize Window
	//
	hsp3dish_initwindow( NULL, sx, sy, "HSPDish ver" hspver );

	if ( sx != hsp_wx || sy != hsp_wy ) {
		hgio_view( hsp_wx, hsp_wy );
		hgio_size( sx, sy );
		hgio_autoscale( autoscale );
	}

//	hsp3typeinit_dllcmd( code_gettypeinfo( TYPE_DLLFUNC ) );
//	hsp3typeinit_dllctrl( code_gettypeinfo( TYPE_DLLCTRL ) );

	//		Initalize GUI System
	//
	hsp3typeinit_extcmd( code_gettypeinfo( TYPE_EXTCMD ) );
	hsp3typeinit_extfunc( code_gettypeinfo( TYPE_EXTSYSVAR ) );

#ifdef USE_OBAQ
	hsp3typeinit_dw_extcmd( code_gettypeinfo( TYPE_DLLFUNC ) );
	hsp3typeinit_dw_extfunc( code_gettypeinfo( TYPE_DLLCTRL ) );
#endif

	exinfo = ctx->exinfo2;

	//		Initalize DEVINFO
	HSP3DEVINFO *devinfo;
	devinfo = hsp3extcmd_getdevinfo();
	hsp3dish_setdevinfo( devinfo );

	return 0;
}


static void hsp3dish_bye( void )
{
	//		Window�֘A�̉��
	//
	hsp3dish_drawoff();

	//		�^�C�}�[�̊J��
	//
	emscripten_cancel_main_loop();

	//		HSP�֘A�̉��
	//
	if ( hsp != NULL ) { delete hsp; hsp = NULL; }

	// if ( m_hWnd != NULL ) {
	// 	hgio_term();
	// 	DestroyWindow( m_hWnd );
	// 	m_hWnd = NULL;
	// }
}


void hsp3dish_error( void )
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
	hsp3dish_debugopen();
	hsp3dish_dialog( errmsg );
}



extern int code_execcmd_one( int& prev );

void hsp3dish_exec_one( void )
{
	// hgio_test();
	// return;
	int tick;
	switch( ctx->runmode ) {
	case RUNMODE_WAIT:
		tick = hgio_gettick();
		ctx->runmode = code_exec_wait( tick );
	case RUNMODE_AWAIT:
		tick = hgio_gettick();
		if ( code_exec_await( tick ) != RUNMODE_RUN ) {
			//printf("AWAIT %d < %d\n", tick, ctx->waittick);
			return;
		}
	}
	handleEvent();
	//		���s�̊J�n
	//
	static int code_execcmd_state = 0;
	int runmode;
	bool stop = false;
	for (int i = 0; !stop && i < hsp_limit_step_per_frame; i++) {
	//for (int i = 0; !stop; i++) {
		runmode = code_execcmd_one(code_execcmd_state);
		switch ( ctx->runmode ){
		case RUNMODE_RUN:
			break;
		case RUNMODE_WAIT:
		case RUNMODE_AWAIT:
			//printf("BREAK #%d %d %d\n", i, runmode, ctx->runmode);
			stop = true;
			return;
		}
	}
	//exit(-1);
	//printf("RUN %d %d\n", runmode, ctx->runmode);
	if ( runmode == RUNMODE_RUN ) {
		return;
	}
	if ( runmode == RUNMODE_ERROR ) {
		try {
			hsp3dish_error();
		}
		catch( ... ) {
		}
		exit(-1);
		return;
	}
	int endcode = ctx->endcode;
	hsp3dish_bye();
	exit(0);
}

int hsp3dish_exec( void )
{
	//		���s���C�����Ăяo��
	//
	hsp3dish_msgfunc( ctx );

	//		���s�̊J�n
	//
	emscripten_set_main_loop(hsp3dish_exec_one, hsp_fps, 1);
}
