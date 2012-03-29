/*--------------------------------------------------------
	HSP3dish main (Windows DirectX8)
									  2011/5  onitama
  --------------------------------------------------------*/

#define _WIN32_DCOM 

#include <windows.h>
#include <stdio.h>
#include <string.h>
#include <objbase.h>
#include <commctrl.h>

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

typedef BOOL (CALLBACK *HSP3DBGFUNC)(HSP3DEBUG *,int,int,int);

/*----------------------------------------------------------*/

static Hsp3 *hsp = NULL;
static HSPCTX *ctx;
static HSPEXINFO *exinfo;								// Info for Plugins

static char fpas[]={ 'H'-48,'S'-48,'P'-48,'H'-48,
					 'E'-48,'D'-48,'~'-48,'~'-48 };
static char optmes[] = "HSPHED~~\0_1_________2_________3______";

static int hsp_wx, hsp_wy, hsp_wd, hsp_ss;
static int drawflag;

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

//-------------------------------------------------------------
//		Sync Timer Routines
//-------------------------------------------------------------

static int	timecnt;
static int	timer_period = -1;
static int	timerid = 0;

//
// TimerFunc --- �^�C�}�[�R�[���o�b�N�֐�
//
static void CALLBACK TimerFunc( UINT wID, UINT wUser, DWORD dwUser, DWORD dw1, DWORD dw2 )
{
	timecnt++;
}

/*----------------------------------------------------------*/

#define MAX_INIFILE_LINESTR 1024

static	char *mem_inifile = NULL;
static	CStrNote *note_ini = NULL;
static	int lines_inifile;
static	char s_inifile[MAX_INIFILE_LINESTR];

static void	CloseIniFile( void )
{
	if ( mem_inifile != NULL ) {
		mem_bye( mem_inifile );
		mem_inifile = NULL;
	}
	if ( note_ini != NULL ) {
		delete note_ini;
		note_ini = NULL;
	}
}

static int	OpenIniFile( char *fname )
{
	CloseIniFile();
	mem_inifile = dpm_readalloc( fname );
	if ( mem_inifile == NULL ) return -1;
	note_ini = new CStrNote;
	note_ini->Select( mem_inifile );
	lines_inifile = note_ini->GetMaxLine();
	return 0;
}

static char *GetIniFileStr( char *keyword )
{
	int i;
	char *s;
	for(i=0;i<lines_inifile;i++) {
		note_ini->GetLine( s_inifile, i, MAX_INIFILE_LINESTR );
		if ( strncmp( s_inifile, keyword, strlen(keyword) ) == 0 ) {
			s = strchr2( s_inifile, '=' ) + 1;
			return s;
		}
	}
	return NULL;
}

static int	GetIniFileInt( char *keyword )
{
	char *s;
	s = GetIniFileStr( keyword );
	if ( s == NULL ) return 0;
	return atoi( s );
}

/*----------------------------------------------------------*/

static	HWND m_hWnd;

LRESULT CALLBACK WndProc( HWND hwnd, UINT uMessage, WPARAM wParam, LPARAM lParam )
{
	switch (uMessage)
	{
	case WM_PAINT:
		//		Display �S�`��
		//
		break;
/*
	case WM_GETMINMAXINFO:
		{
		LPMINMAXINFO lpmm;
		bm = TrackBmscr( hwnd );
		if ( bm != NULL ) {
			lpmm = (LPMINMAXINFO)lParam;
			lpmm->ptMaxTrackSize.x = bm->sx + bm->framesx;
			lpmm->ptMaxTrackSize.y = bm->sy + bm->framesy;
		}
		break;
		}

	case WM_SIZE:
		bm = TrackBmscr( hwnd );
		if ( bm != NULL ) {
			bm->wx = lParam & 0xFFFF;				// x�T�C�Y
			bm->wy = (lParam >> 16) & 0xFFFF;		// y�T�C�Y
			bm->SetScroll( bm->viewx, bm->viewy );
		}
		break;
*/
	case WM_MOUSEMOVE:
		{
		BMSCR *bm;
		if ( exinfo != NULL ) {
			bm = (BMSCR *)exinfo->HspFunc_getbmscr(0);
			bm->savepos[BMSCR_SAVEPOS_MOSUEX] = LOWORD(lParam);
			bm->savepos[BMSCR_SAVEPOS_MOSUEY] = HIWORD(lParam);
		}
		return 0;
		}

	case MM_MCINOTIFY:
		if ( wParam == MCI_NOTIFY_SUCCESSFUL ) {
			hsp3notify_extcmd();
		}
		return 0;

	case WM_QUERYENDSESSION:
	case WM_CLOSE:
		ctx->runmode = RUNMODE_END;
		break;

	}

	return DefWindowProc (hwnd, uMessage, wParam, lParam) ;
}


static void hsp3dish_initwindow( HINSTANCE hInstance, int sx, int sy, char *windowtitle )
{
	// Register the windows class
	WNDCLASS wndClass = { 0, WndProc, 0, 0, hInstance,
							LoadIcon( hInstance, MAKEINTRESOURCE(128) ),
							LoadCursor( NULL, IDC_ARROW ),
							(HBRUSH)GetStockObject(WHITE_BRUSH),
							NULL, "HSP3DishWindow" };
	RegisterClass( &wndClass );

	// Set the window's initial style
	DWORD m_dwWindowStyle = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | /* WS_THICKFRAME | */
						WS_MINIMIZEBOX | /*WS_MAXIMIZEBOX |*/ WS_VISIBLE | WS_CLIPCHILDREN;

	// Set the window's initial width
	RECT rc;
	SetRect( &rc, 0, 0, sx, sy );
	AdjustWindowRect( &rc, m_dwWindowStyle, false );

	// Create the render window
	m_hWnd = CreateWindow( "HSP3DishWindow", windowtitle, m_dwWindowStyle,
								CW_USEDEFAULT, CW_USEDEFAULT,
								(rc.right-rc.left), (rc.bottom-rc.top), 0,
								NULL, hInstance, 0 );

	// �`��API�ɓn��
	hgio_init( 0, sx, sy, m_hWnd );
	hgio_clsmode( CLSMODE_SOLID, 0xffffff, 0 );

	// HWND��HSPCTX�ɕۑ�����
	ctx->wnd_parent = m_hWnd;
}


void hsp3dish_dialog( char *mes )
{
	MessageBox( NULL, mes, "Error",MB_ICONEXCLAMATION | MB_OK );
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
	//		�f�o�b�O�E�C���h�D�\��
	//
#ifdef HSPDEBUG
	if ( h_dbgwin != NULL ) return 0;
	h_dbgwin = LoadLibrary( "hsp3debug.dll" );
	if ( h_dbgwin != NULL ) {
		dbgwin = (HSP3DBGFUNC)GetProcAddress( h_dbgwin, "_debugini@16" );
		dbgnotice = (HSP3DBGFUNC)GetProcAddress( h_dbgwin, "_debug_notice@16" );
		if (( dbgwin == NULL )||( dbgnotice == NULL )) h_dbgwin = NULL;
	}
	if ( h_dbgwin == NULL ) {
		hsp3dish_dialog( "No debug module." );
		return -1;
	}
	dbginfo->get_value = hsp3dish_debug;
	dbgwin( dbginfo, 0, 0, 0 );
	dbgwnd = (HWND)( dbginfo->dbgwin );
#endif
	return 0;
}


static void hsp3dish_dispatch( MSG *msg )
{
	TranslateMessage( msg );
	DispatchMessage( msg );

#ifndef HSPDEBUG
	//		�X�N���[���Z�[�o�[�I���`�F�b�N
	//
	if ( ctx->hspstat & HSPSTAT_SSAVER ) {
		int x,y;
		if ( msg->message==WM_MOUSEMOVE ) {
			x = LOWORD(msg->lParam);
			y = HIWORD(msg->lParam);
			if ( hsp_sscnt == 0 ) {
				if (( hsp_ssx != x )||( hsp_ssy != y )) throw HSPERR_NONE;
			} else {
				hsp_ssx = x;
				hsp_ssy = y;
			}
		}
		if ( msg->message==WM_KEYDOWN ) {
			if ( hsp_sscnt == 0 ) throw HSPERR_NONE;
		}
	}
#endif

#if 0
	if ( msg->message==WM_KEYDOWN ) {	// ocheck onkey
		if ( msg->wParam == 9 ) {
//			hsp3gr_nextobj();
		}
		if ( code_isirq( HSPIRQ_ONKEY ) ) {
			code_sendirq( HSPIRQ_ONKEY, (int)MapVirtualKey( msg->wParam, 2 ), (int)msg->wParam, (int)msg->lParam );
		}
	}
#endif
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
	MSG msg;
	int tick;

	while(1) {
		// logmes �Ȃ��ɏ�������
		if ( hspctx->runmode == RUNMODE_LOGMES ) {
			hspctx->runmode = RUNMODE_RUN;
#ifdef HSPDEBUG
			if ( h_dbgwin != NULL ) dbgnotice( dbginfo, 1, 0, 0 );		// Debug Window Notice
#endif
			return;
		}
		if ( PeekMessage( &msg, NULL, 0, 0, PM_REMOVE ) ) {
			if (msg.message == WM_QUIT ) throw HSPERR_NONE;
			hsp3dish_dispatch( &msg );
			continue;
		}

		switch( hspctx->runmode ) {
		case RUNMODE_STOP:
#ifdef HSPDEBUG
			if ( h_dbgwin != NULL ) dbgnotice( dbginfo, 0, 0, 0 );		// Debug Window Notice
#endif
			while(1) {
				GetMessage( &msg, NULL, 0, 0 );
				if ( msg.message == WM_QUIT ) throw HSPERR_NONE;
				hsp3dish_dispatch( &msg );
				if ( hspctx->runmode != RUNMODE_STOP ) break;
			}

			MsgWaitForMultipleObjects(0, NULL, FALSE, 1000, QS_ALLINPUT );
			break;
		case RUNMODE_WAIT:
			if ( timer_period == -1 ) {
				//	�ʏ�̃^�C�}�[
				tick = GetTickCount();
				hspctx->runmode = code_exec_wait( tick );
			} else {
				//	�����x�^�C�}�[
				tick = timeGetTime();
				hspctx->runmode = hsp3dish_wait( tick );
			}
		case RUNMODE_AWAIT:
			if ( timer_period == -1 ) {
				//	�ʏ�̃^�C�}�[
				tick = GetTickCount();
				if ( code_exec_await( tick ) != RUNMODE_RUN ) {
					MsgWaitForMultipleObjects(0, NULL, FALSE, hspctx->waittick - tick, QS_ALLINPUT );
				}
			} else {
				//	�����x�^�C�}�[
				int ttl;
				tick = timeGetTime();
				hsp3dish_await( tick );
				ttl = ctx->waittick - tick;
				while( ttl > 5 ) {					// 5�ȏ�̃��O�͂����ŋz��
					if ( tick >= ctx->waittick ) break;
					Sleep(5);
					tick = timeGetTime();
					ttl -= 5;
				}
				while( tick < ctx->waittick ) {
					Sleep(1);
					tick = timeGetTime();
				}
				ctx->lasttick = tick;
				ctx->runmode = RUNMODE_RUN;
			}
			break;
		case RUNMODE_END:
			throw HSPERR_NONE;
			return;
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


int hsp3dish_init( HINSTANCE hInstance, char *startfile )
{
	//		�V�X�e���֘A�̏�����
	//		( mode:0=debug/1=release )
	//
	int a,orgexe, mode;
	int hsp_sum, hsp_dec;
	char a1;
	char fname[_MAX_PATH+1];
	char *ss;
#ifdef HSPDEBUG
	int i;
#endif

#ifndef HSP_COM_UNSUPPORTED
	if ( FAILED( CoInitializeEx( NULL, COINIT_APARTMENTTHREADED) ) ) {
		return 1;
	}
	OleInitialize( NULL );
#endif
	InitCommonControls();
	InitSysReq();

	//		HSP�֘A�̏�����
	//
	hsp = new Hsp3();
	hsp->hspctx.instance = (void *)hInstance;
#ifdef HSPDEBUG
	h_dbgwin = NULL;
	dbgwnd = NULL;
	m_hWnd = NULL;
	exinfo = NULL;

	ss = strsp_cmds( startfile );
	i = (int)( ss - startfile );
	ss = startfile;
	if ( ss[i-1] == 32 ) i--;
	if ( *ss == 0x22 ) {
		ss++;i-=2;
	}
	if ( i > 0 ) {
		strncpy( fname, ss, i );
		fname[i] = 0;
		hsp->SetFileName( fname );
	}
#else
	if ( startfile != NULL ) {
		hsp->SetFileName( startfile );
	}
#endif


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

	//		�N���t�@�C���̃f�B���N�g�����J�����g�ɂ���
	//
#ifndef HSPDEBUG
	if (( hsp_wd & 2 ) == 0 ) {
		GetModuleFileName( NULL, fname, _MAX_PATH );
		getpath( fname, fname, 32 );
		changedir( fname );
	}
#endif

	if ( hsp->Reset( mode ) ) {
		hsp3dish_dialog( "Startup failed." );
		return 1;
	}

#ifdef HSPDEBUG
	if ( OpenIniFile( "hsp3dish.ini" ) == 0 ) {
		hsp_wx = GetIniFileInt( "wx" );
		hsp_wy = GetIniFileInt( "wy" );
		CloseIniFile();
	}
#endif

	ctx = &hsp->hspctx;

	{
	//		�R�}���h���C���֘A
	ss = GetCommandLine();
	ss = strsp_cmds( ss );
#ifdef HSPDEBUG
	ss = strsp_cmds( ss );
#endif
	sbStrCopy( &ctx->cmdline, ss );					// �R�}���h���C���p�����[�^�[��ۑ�
	}

	//		SSaver proc
	//
#if 0
	if ( hsp_ss ) {
		ss = GetCommandLine();
		ss = strsp_cmds( ss );
		hsp_sscnt = 30;
		a1=tolower(*(ss+1));
		if( FindWindow("oniwndp",NULL) != NULL ) {
			return 2;
		}
		if (a1=='p') {
			HWND s_hwnd;
			RECT rPic;
			s_hwnd = (HWND)atoi( ss+3 );
			GetWindowRect( s_hwnd, &rPic );
			hsp_wx = rPic.right-rPic.left;
			hsp_wy = rPic.bottom-rPic.top;
			hsp_wd = 0x100;
			ctx->wnd_parent = s_hwnd;
		}
		if (a1=='s') {
			ShowCursor(FALSE);
		} else {
			hsp_ss = 0;								// �X�N���[���Z�[�o�[���ȊO�̓��[�hOFF
		}
		ctx->hspstat |= hsp_ss;
	}
#endif

	//		Register Type
	//
	drawflag = 0;
	ctx->msgfunc = hsp3dish_msgfunc;

	//		Initalize Window
	//
	hsp3dish_initwindow( hInstance, hsp_wx, hsp_wy, "HSPDish ver" hspver );


	//		Start Timer
	//
	// timerGetTime�֐��ɂ�鐸�x�A�b�v(�ʕb�P��)
	timer_period = -1;
#if 1
	TIMECAPS caps;
	if (timeGetDevCaps(&caps,sizeof(TIMECAPS)) == TIMERR_NOERROR){
		// �}���`���f�B�A�^�C�}�[�̃T�[�r�X���x���ő��
		timer_period = caps.wPeriodMin;
		timeBeginPeriod( timer_period );
		//timerid = timeSetEvent( timer_period, caps.wPeriodMin, TimerFunc, 0, (UINT)TIME_PERIODIC );
		timecnt = 0;
	}
#endif

#ifndef HSP_COM_UNSUPPORTED
//	HspVarCoreRegisterType( TYPE_COMOBJ, HspVarComobj_Init );
//	HspVarCoreRegisterType( TYPE_VARIANT, HspVarVariant_Init );
#endif

//	hsp3typeinit_dllcmd( code_gettypeinfo( TYPE_DLLFUNC ) );
//	hsp3typeinit_dllctrl( code_gettypeinfo( TYPE_DLLCTRL ) );

	//		Initalize GUI System
	//
	hsp3typeinit_extcmd( code_gettypeinfo( TYPE_EXTCMD ) );
	hsp3typeinit_extfunc( code_gettypeinfo( TYPE_EXTSYSVAR ) );
	exinfo = ctx->exinfo2;

#ifdef HSPDEBUG
	dbginfo = code_getdbg();
#endif
	return 0;
}


static void hsp3dish_bye( void )
{
	//		Window�֘A�̉��
	//
	hsp3dish_drawoff();

	//		�^�C�}�[�̊J��
	//
	if ( timer_period != -1 ) {
//		if( timerid != 0 ) {
//			timeKillEvent( timerid );
//			timerid = 0;
//		}
		timeEndPeriod( timer_period );
		timer_period = -1;
	}

	//		HSP�֘A�̉��
	//
	if ( hsp != NULL ) { delete hsp; hsp = NULL; }

	if ( m_hWnd != NULL ) {
		hgio_term();
		DestroyWindow( m_hWnd );
		m_hWnd = NULL;
	}

#ifdef HSPDEBUG
	//		�f�o�b�O�E�C���h�D�̉��
	//
	if ( h_dbgwin != NULL ) { FreeLibrary( h_dbgwin ); h_dbgwin = NULL; }
#endif

//	DllManager().free_all_library();

	//		�V�X�e���֘A�̉��
	//
#ifndef HSP_COM_UNSUPPORTED
//	OleUninitialize();
//	CoUninitialize();
#endif
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


int hsp3dish_exec( void )
{
	//		���s���C�����Ăяo��
	//
	int runmode;
	int endcode;

	hsp3dish_msgfunc( ctx );

	//		�f�o�b�O�E�C���h�D�p
	//
#ifdef HSPDEBUG
	if ( ctx->hsphed->bootoption & HSPHED_BOOTOPT_DEBUGWIN ) {
		if ( hsp3dish_debugopen() ) return -1;
	}
#endif

	//		���s�̊J�n
	//
	runmode = code_execcmd();
	if ( runmode == RUNMODE_ERROR ) {
		try {
			hsp3dish_error();
		}
		catch( ... ) {
		}
		hsp3dish_bye();
		return -1;
	}

#if 0
	if ( runmode == RUNMODE_EXITRUN ) {
		char fname[_MAX_PATH];
		char cmd[1024];
		HINSTANCE inst;
		int res;
		strncpy( fname, ctx->refstr, _MAX_PATH-1 );
		strncpy( cmd, ctx->stmp, 1023 );
		inst = (HINSTANCE)ctx->instance;

		hsp3dish_bye();
		res = hsp3dish_init( inst, fname );
		if ( res ) return res;

		strncpy( ctx->cmdline, cmd, 1023 );
		goto rerun;
	}
#endif
	endcode = ctx->endcode;
	hsp3dish_bye();
	return endcode;
}

