//
//		fontsystem lib (iOS/android/opengl/ndk/emscripten)
//			onion software/onitama 2019
//


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>

#if defined(HSPLINUX) || defined(HSPEMSCRIPTEN)
#include <unistd.h>
#include "../../hsp3/hsp3config.h"
#else
#if defined(HSPNDK) || defined(HSPIOS)
#include "../hsp3config.h"
#else
#include "../../hsp3/hsp3config.h"
#endif
#endif

#ifdef HSPWIN
#define STRICT
#include <windows.h>
#endif

#ifdef HSPNDK
#define USE_JAVA_FONT
#define FONT_TEX_SX 512
#define FONT_TEX_SY 128
#include "../../appengine.h"
#include "../../javafunc.h"
#include "font_data.h"
#endif

#ifdef HSPIOS
//#include <OpenGLES/EAGL.h>
#include <OpenGLES/ES1/gl.h>
#include <OpenGLES/ES1/glext.h>
#include <CoreFoundation/CoreFoundation.h>
#include "iOSBridge.h"
#include "appengine.h"
#endif

#if defined(HSPEMSCRIPTEN)
#define USE_JAVA_FONT
#define FONT_TEX_SX 512
#define FONT_TEX_SY 128
#endif

#if defined(HSPLINUX)
#include <SDL2/SDL_ttf.h>
#define TTF_FONTFILE "/ipaexg.ttf"
#define USE_JAVA_FONT
#define FONT_TEX_SX 512
#define FONT_TEX_SY 128
//#include "font_data.h"
#endif

#if defined(HSPLINUX) || defined(HSPEMSCRIPTEN)
#ifdef HSPRASPBIAN
#include "bcm_host.h"
#include "GLES/gl.h"
#include "EGL/egl.h"
#include "EGL/eglext.h"
#include "SDL2/SDL.h"


#else

//#include <GLES2/gl2.h>
//#include <GLES2/gl2ext.h>
//#include <EGL/egl.h>

#define GL_GLEXT_PROTOTYPES
#include <GL/gl.h>
#include <GL/glext.h>

//#include <GL/glut.h>

#ifdef HSPEMSCRIPTEN
#include "SDL/SDL.h"
#include "SDL/SDL_image.h"
#include "SDL/SDL_opengl.h"
#else
#include "SDL2/SDL.h"
#include "SDL2/SDL_image.h"
#include "SDL2/SDL_opengl.h"
#endif

#endif

#include "appengine.h"
extern bool get_key_state(int sym);
extern SDL_Window *window;
#endif

#include "../supio.h"
#include "../sysreq.h"
#include "../hgio.h"

/*------------------------------------------------------------*/
/*
		Windows Font Service
*/
/*------------------------------------------------------------*/

#ifdef HSPWIN

static		HWND master_wnd;	// 表示対象Window

static		HFONT htexfont = NULL;	// TEXTURE用のフォント
static		HFONT htexfont_old;		// TEXTURE用のフォント(保存用)
static		HDC htexdc;				// Device Context
static		int drawsx, drawsy;		// 描画サイズ
static		int fontsystem_sx;		// 横のサイズ
static		int fontsystem_sy;		// 縦のサイズ
static		int fontsystem_space;	// spaceの横サイズ
static		int fontsystem_zspace;	// 全角spaceの横サイズ
static		TEXTMETRIC tm;
static		bool tbl_init = false;	// AlphaTbl初期化フラグ
static		BYTE lpFont[0x10000];	// フォント取得用のワーク
static		DWORD AlphaTbl[34];
static		char *def_zspace = "　";
static		int fontsystem_size;
static		int fontsystem_style;

void hgio_fontsystem_win32_init(HWND wnd)
{
	master_wnd = wnd;
}


long hgio_fontsystem_getcode(unsigned char* pt)
{
	//		文字コードを返す(SJIS)
	unsigned char a1 = *pt;

	//		全角チェック
	if (a1 >= 129) {					// 全角文字チェック
		if ((a1 <= 159) || (a1 >= 224)) {
			long i = (long)a1;
			return (i << 8) + (long)pt[1];
		}
	}
	return (long)a1;
}

void hgio_fontsystem_term(void)
{
	//		フォントレンダリング解放
	//
	if (htexfont == NULL) return;

	SelectObject(htexdc, htexfont_old);
	DeleteObject(htexfont);
	ReleaseDC(master_wnd, htexdc);
	htexfont = NULL;
}


void hgio_fontsystem_init(char* fontname, int size, int style)
{
	//		フォントレンダリング初期化
	//
	hgio_fontsystem_term();

	htexdc = GetDC(master_wnd);
	htexfont = NULL;

	if (size >= 0) {
		int fw;
		fw = FW_REGULAR;
		if (style & 1) {
			fw = FW_BOLD;
		}
		htexfont = CreateFont(
			size,						// フォント高さ
			0,							// 文字幅
			0,							// テキストの角度	
			0,							// ベースラインとｘ軸との角度
			fw,							// フォントの重さ（太さ）
			((style & 2) != 0),			// イタリック体
			((style & 4) != 0),			// アンダーライン
			((style & 8) != 0),			// 打ち消し線
			DEFAULT_CHARSET,			// 文字セット
			OUT_TT_PRECIS,				// 出力精度
			CLIP_DEFAULT_PRECIS,		// クリッピング精度
			PROOF_QUALITY,				// 出力品質
			DEFAULT_PITCH | FF_MODERN,	// ピッチとファミリー
			fontname					// 書体名
		);
		fontsystem_size = size;
		fontsystem_style = style;
	}

	if (htexfont == NULL) return;

	htexfont_old = (HFONT)SelectObject(htexdc, htexfont);
	GetTextMetrics(htexdc, &tm);
	fontsystem_sx = 0;
	fontsystem_sy = tm.tmHeight;

	long code = 0x20;
	GetCharWidth(htexdc, code, code, &fontsystem_space);
	code = hgio_fontsystem_getcode((unsigned char*)def_zspace);
	GetCharWidth(htexdc, code, code, &fontsystem_zspace);

	if (tbl_init == false) {
		for (int i = 0; i < 32; i++) {
			DWORD aval = i;
			if (aval > 15) aval = 15;
			AlphaTbl[i] = (aval << 28) + 0xffffff;
		}
		AlphaTbl[0] = 0;
		tbl_init = true;
	}
}


int hgio_fontsystem_execsub(long code, unsigned char* buffer, int pitch, int offsetx)
{
	//		フォントバッファ取得
	MAT2 mat;
	DWORD Size;
	GLYPHMETRICS gm;
	GLYPHMETRICS* pgm;
	int px, ybase;
	int width, height;
	//	int tmpy;

	if (buffer == NULL) {
		GetCharWidth(htexdc, code, code, &width);
		return width;
	}
	if (fontsystem_sx <= 0) return 0;

	pgm = &gm;
	ZeroMemory(pgm, sizeof(GLYPHMETRICS));

	long m11 = (long)(1.0 * 65536.0);	long m12 = (long)(0.0 * 65536.0);
	long m21 = (long)(0.0 * 65536.0);	long m22 = (long)(1.0 * 65536.0);
	mat.eM11 = *((FIXED*)&m11);	mat.eM12 = *((FIXED*)&m12);
	mat.eM21 = *((FIXED*)&m21);	mat.eM22 = *((FIXED*)&m22);


	if (fontsystem_style & 16) {
		// バッファサイズ受信
		Size = GetGlyphOutline(htexdc, code, GGO_GRAY4_BITMAP, pgm, 0, NULL, &mat);
		// バッファ取得
		GetGlyphOutline(htexdc, code, GGO_GRAY4_BITMAP, pgm, Size, lpFont, &mat);
	}
	else {
		// バッファサイズ受信
		Size = GetGlyphOutline(htexdc, code, GGO_BITMAP, pgm, 0, NULL, &mat);
		// バッファ取得
		GetGlyphOutline(htexdc, code, GGO_BITMAP, pgm, Size, lpFont, &mat);
	}

	// フォントピッチ
	DWORD fontPitch = (Size / gm.gmBlackBoxY) & ~0x03;

	// サイズ取得
	width = (int)gm.gmBlackBoxX;
	height = (int)gm.gmBlackBoxY;
	//Alertf("%d[%d,%d] +%d", code,width,height,pitch);

	// 描画位置を進める量
	px = gm.gmCellIncX;
	ybase = tm.tmAscent - gm.gmptGlyphOrigin.y;

	LPDWORD p1 = (LPDWORD)buffer;
	LPBYTE p2 = lpFont;

	// 転送先のサーフェイスの始点
	p1 += (offsetx + gm.gmptGlyphOrigin.x) + (ybase * pitch);

	if (fontsystem_style & 16) {
		if (fontsystem_style & 2) {
			for (int y = 0; y < height; y++)
			{
				for (int x = 0; x < width; x++)
				{
					p1[x] |= AlphaTbl[p2[x]];
				}
				p1 += pitch;
				p2 += fontPitch;
			}
		}
		else {
			for (int y = 0; y < height; y++)
			{
				for (int x = 0; x < width; x++)
				{
					p1[x] = AlphaTbl[p2[x]];
				}
				p1 += pitch;
				p2 += fontPitch;
			}
		}
		return px;
	}

	for (int y = 0; y < height; y++)
	{
		LPBYTE pp;
		int bmask;
		bmask = 0x80; pp = p2;
		for (int x = 0; x < width; x++)
		{
			if (bmask == 0) { bmask = 0x80; pp++; }
			if (*pp & bmask) { p1[x] = 0xffffffff; }
			bmask >>= 1;
		}
		p1 += pitch;
		p2 += fontPitch;
	}

	return px;
}


int hgio_fontsystem_exec(char* msg, unsigned char* buffer, int pitch, int* out_sx, int* out_sy)
{
	//		msgの文字列をテクスチャバッファにレンダリングする
	//		(bufferがNULLの場合はサイズだけを取得する)
	//
	if (htexfont == NULL) return -1;

	int x = 0;
	long code;
	unsigned char *p = (unsigned char*)msg;
	unsigned char a1;

	while (1) {
		a1 = *p++;
		if (a1 == 0) break;
		if (a1 < 32) continue;

		//		全角チェック
		code = (long)a1;
		if (a1 >= 129) {					// 全角文字チェック
			if ((a1 <= 159) || (a1 >= 224)) {
				long i = (long)a1;
				code = (i << 8) + (long)*p;
				p++;
			}
		}

		x += hgio_fontsystem_execsub(code, buffer, pitch, x);
	}

	fontsystem_sx = x;

	*out_sx = fontsystem_sx;
	*out_sy = fontsystem_sy;
	return 0;
}

#endif


/*-------------------------------------------------------------------------------*/
/*
		SDL Font Manage Routines
*/
/*-------------------------------------------------------------------------------*/

#if defined(HSPLINUX)||defined(HSPEMSCRIPTEN)
static	char fontpath[HSP_MAX_PATH+1];
static	TTF_Font *font = NULL;
static	int font_defsize;
static	SDL_Surface *sdlsurf;
static	int fontsystem_sx;		// 横のサイズ
static	int fontsystem_sy;		// 縦のサイズ

void TexFontTerm( void )
{
	if ( font != NULL ) {
	    TTF_CloseFont(font);
	    font = NULL;
	}
}

int TexFontInit( char *path, int size )
{
	if ( font != NULL ) TexFontTerm();

	if (*path != 0) {
		strcpy ( fontpath, path );
	}
	font = TTF_OpenFont( fontpath, size );
	font_defsize = size;

	if (font == NULL){
		Alertf( "Init:TTF_OpenFont error" );
		return -2;
	}
	Alertf( "Init:TTF_Init:%s (%x)",fontpath,font );
	return 0;
}

int hgio_fontsystem_exec(char* msg, unsigned char* buffer, int pitch, int* out_sx, int* out_sy)
{
	//		msgの文字列をテクスチャバッファにレンダリングする
	//		(bufferがNULLの場合はサイズだけを取得する)
	//

	if (buffer == NULL) {

		SDL_Color dcolor={255,255,255,255};
		sdlsurf = TTF_RenderUTF8_Blended(font, msg, dcolor );

	    if (sdlsurf == NULL) {
			Alertf( "TTF_Render : error" );
			return -1;
		}

		fontsystem_sx = sdlsurf->w;
		fontsystem_sy = sdlsurf->h;

		//GetCacheMesTextureID(msg,m_tstyle,m_tstyle,&tsx,&tsy,false);
		*out_sx = fontsystem_sx;
		*out_sy = fontsystem_sy;
		return -1;
	}

    if (sdlsurf == NULL) {
		return -1;
	}

	int colors;
	GLuint texture_format = 0;
	colors = sdlsurf->format->BytesPerPixel;

	unsigned char *p1 = buffer;
	unsigned char *p2 = (unsigned char *)sdlsurf->pixels;

	//printf( "Init:Surface(%d,%d) %d destpitch%d pitch%d\r\n",fontsystem_sx,fontsystem_sy,colors,pitch,sdlsurf->pitch );

	if (colors == 4) {   // alpha
		for (int y = 0; y < fontsystem_sy; y++)
		{
			unsigned char *p1x = p1;
			for (int x = 0; x < sdlsurf->pitch; x++)
			{
				//*p1x++ = 0xff;
				*p1x++ = *p2++;
			}
			p1 += pitch * sizeof(int);
		}
	} else {			// alphaなし
		int sx = sdlsurf->pitch / colors;
		for (int y = 0; y < fontsystem_sy; y++)
		{
			unsigned char *p1x = p1;
			for (int x = 0; x < sx; x++)
			{
				*p1x++ = *p2++;
				*p1x++ = *p2++;
				*p1x++ = *p2++;
				*p1x++ = 0xff;
			}
			p1 += pitch * sizeof(int);
		}
	}

    SDL_FreeSurface(sdlsurf);

	return 0;
}

#endif


/*-------------------------------------------------------------------------------*/
/*
		android Font Manage Routines
*/
/*-------------------------------------------------------------------------------*/

#if defined(HSPNDK)
static	int fontsystem_flag = 0;
static	int fontsystem_sx;		// 横のサイズ
static	int fontsystem_sy;		// 縦のサイズ
static	unsigned char *fontdata_pix;
static	int fontdata_size;
static	int fontdata_color;
static	int fontsystem_size;
static	int fontsystem_style;


void hgio_fontsystem_term(void)
{
	//		フォントレンダリング解放
	//
	if (fontsystem_flag) {
		fontsystem_flag = 0;
	}
}

void hgio_fontsystem_init(char* fontname, int size, int style)
{
	//		フォントレンダリング初期化
	//
	hgio_fontsystem_term();
	fontsystem_flag = 1;
	fontsystem_size = size;
	fontsystem_style = style;
}

int hgio_fontsystem_exec(char* msg, unsigned char* buffer, int pitch, int* out_sx, int* out_sy)
{
	//		msgの文字列をテクスチャバッファにレンダリングする
	//		(bufferがNULLの場合はサイズだけを取得する)
	//

	if (buffer == NULL) {
		fontsystem_sx = 0;
		fontsystem_sy = 0;
		fontdata_pix = (unsigned char *)j_callFontBitmap_s( (const char *)msg, fontsystem_size, fontsystem_style, &fontsystem_sx, &fontsystem_sy, &fontdata_size, &fontdata_color );
		*out_sx = fontsystem_sx;
		*out_sy = fontsystem_sy;
		if (fontdata_pix==NULL) return -1;
		return 0;
	}

	//Alertf( "Init:Surface(%d,%d) %d destpitch%d",fontsystem_sx,fontsystem_sy,fontdata_color,pitch );

	unsigned char *p1 = buffer;
	unsigned char *p2 = fontdata_pix;

	switch(fontdata_color) {
	case 4:
		for (int y = 0; y < fontsystem_sy; y++)
		{
			unsigned char *p1x = p1;
			for (int x = 0; x < fontsystem_sx*4; x++)
			{
				*p1x++ = *p2++;
			}
			p1 += pitch * sizeof(int);
		}
		break;
	case 2:
		for (int y = 0; y < fontsystem_sy; y++)
		{
			unsigned char *p1x = p1;
			unsigned char a1,a2,a3,a4;
			for (int x = 0; x < fontsystem_sx; x++)
			{
				a1 = *p2++;
				a2 = a1 & 0xf0; a1=(a1&15)<<4;
				a3 = *p2++;
				a4 = a3 & 0xf0; a3=(a3&15)<<4;
				*p1x++ = a1;
				*p1x++ = a2;
				*p1x++ = a3;
				*p1x++ = a4;
			}
			p1 += pitch * sizeof(int);
		}
		break;
	case 1:
		for (int y = 0; y < fontsystem_sy; y++)
		{
			unsigned char *p1x = p1;
			unsigned char a1;
			for (int x = 0; x < fontsystem_sx; x++)
			{
				a1 = *p2++;
				*p1x++ = a1;
				*p1x++ = a1;
				*p1x++ = a1;
				*p1x++ = a1;
			}
			p1 += pitch * sizeof(int);
		}
		break;
	default:
		break;
	}

	j_callFontBitmap_e();

	return 0;
}

#endif


/*-------------------------------------------------------------------------------*/
/*
		iOS Font Manage Routines
*/
/*-------------------------------------------------------------------------------*/

#ifdef HSPIOS
static	int fontsystem_sx;		// 横のサイズ
static	int fontsystem_sy;		// 縦のサイズ

int hgio_fontsystem_exec(char* msg, unsigned char* buffer, int pitch, int* out_sx, int* out_sy)
{
	//		msgの文字列をテクスチャバッファにレンダリングする
	//		(bufferがNULLの場合はサイズだけを取得する)
	//

	if (buffer == NULL) {
		fontsystem_sx = 0;
		fontsystem_sy = 0;
		gpb_textsize( msg, m_tsize, m_tstyle, &fontsystem_sx, &fontsystem_sy );
		*out_sx = fontsystem_sx;
		*out_sy = fontsystem_sy;
		if (fontsystem_sx==0) return -1;
		return 0;
	}

	//Alertf( "Init:Surface(%d,%d) %d destpitch%d",fontsystem_sx,fontsystem_sy,fontdata_color,pitch );
    gpb_textbitmap( msg, m_tsize, m_tstyle, (char *)buffer, pitch );
	return 0;
}
#endif






