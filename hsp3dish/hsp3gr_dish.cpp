
//
//	HSP3 dish graphics command
//	(GUI関連コマンド・関数処理)
//	onion software/onitama 2011/3
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../hsp3/hsp3config.h"
#include "../hsp3/hsp3code.h"
#include "../hsp3/hsp3debug.h"
#include "../hsp3/strbuf.h"

#include "hsp3gr.h"
#include "hspwnd.h"
#include "hgio.h"
#include "supio.h"

#define USE_MMAN

/*------------------------------------------------------------*/
/*
		system data
*/
/*------------------------------------------------------------*/

static HspWnd *wnd;
static Bmscr *bmscr;
static HSPCTX *ctx;
static int *type;
static int *val;
static int cur_window;
static int p1,p2,p3,p4,p5,p6;
static int ckey,cklast,cktrg;
static int msact;
static int dispflg;

extern int resY0, resY1;

#ifdef USE_MMAN
#include "win32/mmman.h"
static MMMan *mmman;
#endif

/*----------------------------------------------------------*/
//					HSP system support
/*----------------------------------------------------------*/

static void ExecFile( char *stmp, char *ps, int mode )
{
	//	外部ファイル実行
}
		
static char *getdir( int id )
{
	//		dirinfo命令の内容をstmpに設定する
	//
	char *p;
//	char *ss;
//	char fname[HSP_MAX_PATH+1];
	p = ctx->stmp;

	*p = 0;

	switch( id ) {
	case 0:				//    カレント(現在の)ディレクトリ
		break;
	case 1:				//    HSPの実行ファイルがあるディレクトリ
		break;
	case 2:				//    Windowsディレクトリ
		break;
	case 3:				//    Windowsのシステムディレクトリ
		break;
	case 4:				//    コマンドライン文字列
		break;
	default:
		throw HSPERR_ILLEGAL_FUNCTION;
	}

	return p;
}


static int sysinfo( int p2 )
{
	//		System strings get
	//
	int fl;
	char *p1;

	fl = HSPVAR_FLAG_INT;
	p1 = ctx->stmp;
	*p1 = 0;

	return fl;
}


void *ex_getbmscr( int wid )
{
	Bmscr *bm;
	bm = wnd->GetBmscr( wid );
	return bm;
}

void ex_mref( PVal *pval, int prm )
{
	int t,size;
	void *ptr;
	const int GETBM=0x60;
	t = HSPVAR_FLAG_INT;
	size = 4;
	if ( prm >= GETBM ) {
		throw HSPERR_UNSUPPORTED_FUNCTION;
	} else {
		switch( prm ) {
		case 0x40:
			ptr = &ctx->stat;
			break;
		case 0x41:
			ptr = ctx->refstr;
			t = HSPVAR_FLAG_STR;
			size = 1024;
			break;
		case 0x44:
			ptr = ctx; size = sizeof(HSPCTX);
			break;
		default:
			throw HSPERR_UNSUPPORTED_FUNCTION;
		}
	}
	HspVarCoreDupPtr( pval, t, ptr, size );
}


/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

static void cmdfunc_dialog( void )
{
	// dialog
	int i;
	char *ptr;
	char *ps;
	char stmp[0x4000];
	ptr = code_getdsi( "" );
	strncpy( stmp, ptr, 0x4000-1 );
	p1 = code_getdi( 0 );
	ps = code_getds("");
	hgio_dialog( p1, stmp, ps );
}


static int cmdfunc_extcmd( int cmd )
{
	//		cmdfunc : TYPE_EXTCMD
	//		(内蔵GUIコマンド)
	//
	code_next();							// 次のコードを取得(最初に必ず必要です)
	switch( cmd ) {							// サブコマンドごとの分岐

	case 0x02:								// exec
		{
		char *ps;
		char fname[HSP_MAX_PATH];
		strncpy( fname, code_gets(), HSP_MAX_PATH-1 );
		p1 = code_getdi( 0 );
		ps = code_getds( "" );
		ExecFile( fname, ps, p1 );
		break;
		}

	case 0x03:								// dialog
		cmdfunc_dialog();
		break;

#ifdef USE_MMAN
	case 0x08:								// mmload
		{
		int i;
		char fname[_MAX_PATH];
		strncpy( fname, code_gets(), _MAX_PATH-1 );
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );
		i = mmman->Load( fname, p1, p2 );
		if (i) throw HSPERR_FILE_IO;
		break;
		}
	case 0x09:								// mmplay
		p1 = code_getdi( 0 );
		//mmman->SetWindow( bmscr->hwnd, bmscr->cx, bmscr->cy, bmscr->sx, bmscr->sy );
		mmman->Play( p1 );
		break;

	case 0x0a:								// mmstop
		mmman->Stop();
		break;
#endif


#if 0
	case 0x0d:								// pget
		p1 = code_getdi( bmscr->cx );
		p2 = code_getdi( bmscr->cy );
		bmscr->Pget( p1, p2 );
		break;
#endif

	case 0x0c:								// pset
		p1 = code_getdi( bmscr->cx );
		p2 = code_getdi( bmscr->cy );
		bmscr->Pset( p1, p2 );
		break;

	case 0x0f:								// mes,print
		{
		//char stmp[1024];
		char *ptr;
		int chk;
		chk = code_get();
		if ( chk<=PARAM_END ) {
			//printf( "\n" );
			break;
		}
		ptr = (char *)(HspVarCorePtr(mpval));
		if ( mpval->flag != HSPVAR_FLAG_STR ) {
			ptr = (char *)HspVarCoreCnv( mpval->flag, HSPVAR_FLAG_STR, ptr );	// 型が一致しない場合は変換
		}
		bmscr->Print( ptr );
		//Alertf( "%s\n",ptr );
		//strsp_ini();
		//while(1) {
		//	chk = strsp_get( ptr, stmp, 0, 1022 );
		//	bmscr->Print( stmp );
		//	  printf( "%s\n",stmp );
		//	if ( chk == 0 ) break;
		//}
		break;
		}
	case 0x10:								// title
		{
		char *p;
		p = code_gets();
		bmscr->Title( p );
		break;
		}
	case 0x11:								// pos
		bmscr->cx = code_getdi( bmscr->cx );
		bmscr->cy = code_getdi( bmscr->cy );
		break;

	case 0x12:								// circle
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );
		p3 = code_getdi( bmscr->sx );
		p4 = code_getdi( bmscr->sy );
		p5 = code_getdi( 1 );
		bmscr->Circle( p1,p2,p3,p4,p5 );
		break;
	case 0x13:								// cls
		p1 = code_getdi( 0 );
		bmscr->Cls( p1 );
		break;
	case 0x14:								// font
		{
		char fontname[256];
		strncpy( fontname, code_gets(), 255 );
		p1 = code_getdi( 12 );
		p2 = code_getdi( 0 );
		bmscr->SetFont( fontname, p1, p2 );
		break;
		}
	case 0x16:								// objsize
		p1 = code_getdi( 64 );
		p2 = code_getdi( 24 );
		p3 = code_getdi( 0 );
		bmscr->ox=p1;bmscr->oy=p2;bmscr->py=p3;
		break;

	case 0x17:								// picload
		{
		int wid;
		char fname[64];
		strncpy( fname, code_gets(), 63 );
		p1 = code_getdi( 0 );
		wid = bmscr->wid;
		wnd->Picload( wid, fname, p1 );
		//if ( i ) throw HSPERR_PICTURE_MISSING;
		//bmscr = wnd->GetBmscr( wid );
		//cur_window = wid;
		break;
		}
	case 0x18:								// color
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );
		p3 = code_getdi( 0 );
		bmscr->Setcolor(p1,p2,p3);
		break;
	case 0x1b:								// redraw
		p1 = code_getdi( 1 );
		p2 = code_getdi( 0 );
		p3 = code_getdi( 0 );
		p4 = code_getdi( 0 );
		p5 = code_getdi( 0 );
		ctx->stat = hgio_redraw( (BMSCR *)bmscr, p1 );
		break;

	case 0x1c:								// width
		p1 = code_getdi( -1 );
		p2 = code_getdi( -1 );
		p3 = code_getdi( -1 );
		p4 = code_getdi( -1 );
		bmscr->Width( p1, p2, p3, p4, 1 );
		break;

	case 0x1d:								// gsel
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );

		bmscr = wnd->GetBmscrSafe( p1 );
		cur_window = p1;
		break;

	case 0x1e:								// gcopy
		{
		Bmscr *src;
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );
		p3 = code_getdi( 0 );
		p4 = code_getdi( bmscr->gx );
		p5 = code_getdi( bmscr->gy );
		src = wnd->GetBmscrSafe( p1 );
		if ( bmscr->Copy( src, p2, p3, p4, p5 ) ) throw HSPERR_UNSUPPORTED_FUNCTION;
		break;
		}

	case 0x1f:								// gzoom
		{
		int p7,p8;
		Bmscr *src;
		p1 = code_getdi( bmscr->sx );
		p2 = code_getdi( bmscr->sy );
		p3 = code_getdi( 0 );
		p4 = code_getdi( 0 );
		p5 = code_getdi( 0 );
		p6 = code_getdi( bmscr->gx );
		p7 = code_getdi( bmscr->gy );
		p8 = code_getdi( 0 );
		src = wnd->GetBmscrSafe( p3 );
		if ( bmscr->Zoom( p1, p2, src, p4, p5, p6, p7, p8 ) ) throw HSPERR_UNSUPPORTED_FUNCTION;
		break;
		}

	case 0x20:								// gmode
		p1 = code_getdi( 0 );
		p2 = code_getdi( 32 );
		p3 = code_getdi( 32 );
		p4 = code_getdi( 0 );
		//Alertf( "gmode %d,%d,%d,%d(%x)\n", p1, p2, p3, p4, bmscr );
		bmscr->gmode = p1;
		bmscr->gx = p2;
		bmscr->gy = p3;
		bmscr->gfrate = p4;
		//Alertf("OK");
		break;


	case 0x21:								// bmpsave
		if ( bmscr->BmpSave( code_gets() ) ) throw HSPERR_FILE_IO;
		break;

	case 0x22:								// hsvcolor
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );
		p3 = code_getdi( 0 );
		bmscr->SetHSVColor( p1, p2, p3 );
		break;

	case 0x23:								// getkey
		{
		PVal *pval;
		APTR aptr;
		aptr = code_getva( &pval );
		p1=code_getdi(1);
//		if ( code_event( HSPEVENT_GETKEY, p1, 0, &p2 ) == 0 ) {
//			if ( GetAsyncKeyState(p1)&0x8000 ) p2=1; else p2=0;
//		}
		p2 = 0;
		code_setva( pval, aptr, TYPE_INUM, &p2 );
		break;
		}

	case 0x27:								// input (console)
		{
		PVal *pval;
		APTR aptr;
		char *pp2;
		char *vptr;
		int strsize;
		int a;
		strsize = 0;
		aptr = code_getva( &pval );
		//pp2 = code_getvptr( &pval, &size );
		p2 = code_getdi( 0x4000 );
		p3 = code_getdi( 0 );

		if ( p2 < 64 ) p2 = 64;
		pp2 = code_stmp( p2+1 );

		switch( p3 & 15 ) {
		case 0:
			while(1) {
				if ( p2<=0 ) break;
				a = getchar();
				if ( a==EOF ) break;
				*pp2++ = a;
				p2--;
				strsize++;
			}
			break;
		case 1:
			while(1) {
				if ( p2<=0 ) break;
				a = getchar();
				if (( a==EOF )||( a=='\n' )) break;
				*pp2++ = a;
				p2--;
				strsize++;
			}
			break;
		case 2:
			while(1) {
				if ( p2<=0 ) break;
				a = getchar();
				if ( a == '\r' ) {
					int c = getchar();
					if( c != '\n' ) {
						ungetc(c, stdin);
					}
					break;
				}
				if (( a==EOF )||( a=='\n' )) break;
				*pp2++ = a;
				p2--;
				strsize++;
			}
			break;
		}

		*pp2 = 0;
		ctx->strsize = strsize + 1;

		if ( p3 & 16 ) {
			if (( pval->support & HSPVAR_SUPPORT_FLEXSTORAGE ) == 0 ) throw HSPERR_TYPE_MISMATCH;
			//HspVarCoreAllocBlock( pval, (PDAT *)vptr, strsize );
			vptr = (char *)HspVarCorePtrAPTR( pval, aptr );
			memcpy( vptr, ctx->stmp, strsize );
		} else {
			code_setva( pval, aptr, TYPE_STRING, ctx->stmp );
		}
		break;
		}

	case 0x29:								// buffer
	case 0x2a:								// screen
	case 0x2b:								// bgscr
		{
		int p7,p8;
		p1 = code_getdi( 0 );
		p2 = code_getdi( 640 );
		p3 = code_getdi( 480 );
		p4 = code_getdi( 0 );
		p5 = code_getdi( -1 );
		p6 = code_getdi( -1 );
		p7 = code_getdi( p2 );
		p8 = code_getdi( p3 );

		if ( cmd == 0x29 ) {
			if ( p1 == 0 ) throw HSPERR_ILLEGAL_FUNCTION;
			wnd->MakeBmscr( p1, HSPWND_TYPE_BUFFER, p5, p6, p2, p3 );
		}
		bmscr = wnd->GetBmscr( p1 );
		cur_window = p1;
		//
		//Alertf("screen---(%x)\n",bmscr);
		break;
		}

	case 0x2f:								// line
		p1=code_getdi(0);
		p2=code_getdi(0);
		bmscr->cx=code_getdi(bmscr->cx);
		bmscr->cy=code_getdi(bmscr->cy);
		bmscr->Line( p1, p2 );
		break;

	case 0x31:								// boxf
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );
		p3 = code_getdi( bmscr->sx );
		p4 = code_getdi( bmscr->sy );
		bmscr->Boxfill( p1, p2, p3, p4 );
		break;

	case 0x34:								// stick
		{
		PVal *pval;
		APTR aptr;
		int res;
		aptr = code_getva( &pval );
		p1 = code_getdi(0);
		p2 = code_getdi(1);

		res = 0;

		ckey = hgio_stick( p2 );
		cktrg = (ckey^cklast)&ckey;
		cklast = ckey;
		res = cktrg|(ckey&p1);
		code_setva( pval, aptr, TYPE_INUM, &res );
		break;
		}

	case 0x35:								// grect
		{
		double rot;
		p1 = code_getdi(0);				// パラメータ1:数値
		p2 = code_getdi(0);				// パラメータ2:数値
		rot = code_getdd(0.0);			// パラメータ5:数値
		p3 = code_getdi(bmscr->gx);		// パラメータ3:数値
		p4 = code_getdi(bmscr->gy);		// パラメータ4:数値
		bmscr->FillRot( p1, p2, p3, p4, (float)rot );
		break;
		}

	case 0x38:								// gradf
		{
		int gradmode;
//		int col;
		p1 = code_getdi( 0 );
		p2 = code_getdi( 0 );
		p3 = code_getdi( bmscr->sx );
		p4 = code_getdi( bmscr->sy );
		gradmode = code_getdi( 0 );
//		col = CnvRGB( bmscr->color );
		p5 = code_getdi( 0 );
		p6 = code_getdi( 0 );
		bmscr->GradFill( p1, p2, p3, p4, gradmode, p5, p6 );
		break;
		}
	case 0x3c:								// celload
		{
		//int i;
		char fname[64];
		strncpy( fname, code_gets(), 63 );
		p1 = code_getdi( -1 );
		p2 = code_getdi( 0 );
		if ( p1 < 0 ) p1 = wnd->GetEmptyBufferId();
		//Alertf( "celload[%s],%d,%d\n", fname, p1, p2 );

		wnd->MakeBmscrFromResource( p1, fname );
		//i = wnd->Picload( p1, fname, 0 );
		//if ( i ) throw HSPERR_PICTURE_MISSING;

		ctx->stat = p1;
		break;
		}
	case 0x3d:								// celdiv
		{
		Bmscr *bm2;
		p1=code_getdi(1);
		p2=code_getdi(0);
		p3=code_getdi(0);
		p4=code_getdi(0);
		p5=code_getdi(0);
		//Alertf("celdiv %d,%d,%d,%d,%d\n",p1,p2,p3,p4,p5);

		bm2 = wnd->GetBmscrSafe( p1 );
		bm2->SetCelDivideSize( p2, p3, p4, p5 );
		break;
		}
	case 0x3e:								// celput
		{
		Bmscr *bm2;
		double zx,zy,rot;

		p1=code_getdi(1);
		p2=code_getdi(0);
		zx = code_getdd(1.0);
		zy = code_getdd(1.0);
		rot = code_getdd(0.0);
		bm2 = wnd->GetBmscrSafe( p1 );	// 転送元のBMSCRを取得

		if (( rot == 0.0 )&&( zx == 1.0 )&&( zy == 1.0 )) {
			//		変形なし
			bmscr->CelPut( bm2, p2 );
			break;
		}

		//	変形あり
		bmscr->CelPut( bm2, p2, (float)zx, (float)zy, (float)rot );
		break;
		}
	default:
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}
	return RUNMODE_RUN;
}


static int get_ginfo( int arg )
{
	//HDC hdc;
	//RECT rect;
	//POINT pt;
	int i,j;

	//if (( arg>=4 )&&( arg<=11 )) GetWindowRect( bmscr->hwnd, &rect);

	switch( arg ) {
	case 0:
		//GetCursorPos(&pt);
		//return pt.x;
		return 0;
	case 1:
		//GetCursorPos(&pt);
		//return pt.y;
		return 0;
	case 2:
		return wnd->GetActive();
	case 3:
		return cur_window;
	case 4:
		//return rect.left;
	case 5:
		//return rect.top;
	case 6:
		//return rect.right;
	case 7:
		//return rect.bottom;
		return 0;
	case 8:
	case 9:
		//return bmscr->viewx;
		//return bmscr->viewy;
		return 0;
	case 10:
		//return rect.right - rect.left;
	case 11:
		//return rect.bottom - rect.top;
		return 0;
	case 12:
		//if ( bmscr->type != HSPWND_TYPE_BUFFER ) {
		//	bmscr->GetClientSize( &i, &j );
		//	return i;
		//}
	case 26:
		return bmscr->sx;
	case 13:
		//if ( bmscr->type != HSPWND_TYPE_BUFFER ) {
		//	bmscr->GetClientSize( &i, &j );
		//	return j;
		//}
	case 27:
		return bmscr->sy;
	case 14:
		return bmscr->printsizex;
	case 15:
		return bmscr->printsizey;
	case 16:
		//return GetRValue( bmscr->color );
		return ( (bmscr->color>>16)&0xff );
	case 17:
		//return GetGValue( bmscr->color );
		return ( (bmscr->color>>8)&0xff );
	case 18:
		//return GetBValue( bmscr->color );
		return ( (bmscr->color)&0xff );
	case 19:
//		hdc=GetDC(NULL);
//		i = 0;
//		if ( GetDeviceCaps( hdc,RASTERCAPS ) & RC_PALETTE ) i = 1;
//		ReleaseDC( NULL, hdc );
//		return i;
		return 0;
	case 20:
		//return GetSystemMetrics( SM_CXSCREEN );
		return 0;
	case 21:
		//return GetSystemMetrics( SM_CYSCREEN );
		return 0;
	case 22:
		return bmscr->cx;
	case 23:
		return bmscr->cy;
	case 24:
		//return ctx->intwnd_id;
		return 0;
	case 25:
		return wnd->GetEmptyBufferId();

	default:
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}
	return 0;
}


static int reffunc_intfunc_ivalue;

static void *reffunc_function( int *type_res, int arg )
{
	void *ptr;

	//		返値のタイプを設定する
	//
	*type_res = HSPVAR_FLAG_INT;			// 返値のタイプを指定する
	ptr = &reffunc_intfunc_ivalue;			// 返値のポインタ

	//			'('で始まるかを調べる
	//
	if ( *type != TYPE_MARK ) throw HSPERR_INVALID_FUNCPARAM;
	if ( *val != '(' ) throw HSPERR_INVALID_FUNCPARAM;
	code_next();

	switch( arg & 0xff ) {

	//	int function
	case 0x000:								// ginfo
		reffunc_intfunc_ivalue = get_ginfo( code_geti() );
		break;


	case 0x002:								// dirinfo
		p1 = code_geti();
		ptr = getdir( p1 );
		*type_res = HSPVAR_FLAG_STR;
		break;

	case 0x003:								// sysinfo
		p1 = code_geti();
		*type_res = sysinfo( p1 );
		ptr = ctx->stmp;
		break;

	default:
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}

	//			')'で終わるかを調べる
	//
	if ( *type != TYPE_MARK ) throw HSPERR_INVALID_FUNCPARAM;
	if ( *val != ')' ) throw HSPERR_INVALID_FUNCPARAM;
	code_next();

	return ptr;
}


static void *reffunc_sysvar( int *type_res, int arg )
{
	//		reffunc : TYPE_EXTSYSVAR
	//		(拡張システム変数)
	//
	void *ptr;
	if ( arg & 0x100 ) return reffunc_function( type_res, arg );

	//		返値のタイプを設定する
	//
	*type_res = HSPVAR_FLAG_INT;			// 返値のタイプを指定する
	ptr = &reffunc_intfunc_ivalue;			// 返値のポインタ

	switch( arg ) {

	//	int function
	case 0x000:								// mousex
		reffunc_intfunc_ivalue = bmscr->savepos[ BMSCR_SAVEPOS_MOSUEX ];
		//reffunc_intfunc_ivalue = gb_getmousex();
		break;
	case 0x001:								// mousey
		//reffunc_intfunc_ivalue = gb_getmousey();
		reffunc_intfunc_ivalue = bmscr->savepos[ BMSCR_SAVEPOS_MOSUEY ];
		break;
	case 0x002:								// mousew
		reffunc_intfunc_ivalue = bmscr->savepos[ BMSCR_SAVEPOS_MOSUEW ];
		bmscr->savepos[ BMSCR_SAVEPOS_MOSUEW ] = 0;
		break;
	case 0x003:								// hwnd
		//ptr = (void *)(&(bmscr->hwnd));
		reffunc_intfunc_ivalue = 0;
		break;
	case 0x004:								// hinstance
		//ptr = (void *)(&(bmscr->hInst));
		reffunc_intfunc_ivalue = 0;
		break;
	case 0x005:								// hdc
		//ptr = (void *)(&(bmscr->hdc));
		reffunc_intfunc_ivalue = 0;
		break;

	default:
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}
	return ptr;
}


static int termfunc_extcmd( int option )
{
	//		termfunc : TYPE_EXTCMD
	//		(内蔵GUI)
	//
#ifdef USE_MMAN
	delete mmman;
#endif
	delete wnd;
	return 0;
}

void hsp3typeinit_extcmd( HSP3TYPEINFO *info )
{
	HSPEXINFO *exinfo;								// Info for Plugins

	ctx = info->hspctx;
	exinfo = info->hspexinfo;
	type = exinfo->nptype;
	val = exinfo->npval;
	wnd = new HspWnd();
	bmscr = wnd->GetBmscr( 0 );

#ifdef USE_MMAN
	mmman = new MMMan;
	mmman->Reset( ctx->wnd_parent );
#endif

	//		function register
	//
	info->cmdfunc = cmdfunc_extcmd;
	info->termfunc = termfunc_extcmd;

	//		HSPEXINFOに関数を登録する
	//
	exinfo->actscr = &cur_window;					// Active Window ID
	exinfo->HspFunc_getbmscr = ex_getbmscr;
	exinfo->HspFunc_mref = ex_mref;

	//		バイナリモードを設定
	//
	//_setmode( _fileno(stdin),  _O_BINARY );
}

void hsp3typeinit_extfunc( HSP3TYPEINFO *info )
{
	info->reffunc = reffunc_sysvar;
}

