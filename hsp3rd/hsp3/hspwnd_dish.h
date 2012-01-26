
//
//	hspwnd.cpp header (dish)
//
#ifndef __hspwnd_dish_h
#define __hspwnd_dish_h

#include "../hsp3/hsp3code.h"

#define HSPOBJ_LIMIT_DEFAULT	1024

#define HSPOBJ_INPUT_STR 2
#define HSPOBJ_INPUT_DOUBLE 3
#define HSPOBJ_INPUT_INT 4
#define HSPOBJ_INPUT_MULTILINE 0x100
#define HSPOBJ_INPUT_READONLY 0x200
#define HSPOBJ_INPUT_HSCROLL 0x400

#define HSPOBJ_NONE 0
#define HSPOBJ_TAB_ENABLE 1
#define HSPOBJ_TAB_DISABLE 2
#define HSPOBJ_TAB_SKIP 3
#define HSPOBJ_TAB_SELALLTEXT 4

#define BMSCR_FLAG_NOUSE	0
#define BMSCR_FLAG_INUSE	1
#define BMSCR_PALMODE_FULLCOLOR	0
#define BMSCR_PALMODE_PALETTECOLOR	1

#define HSPWND_TYPE_NONE 0
#define HSPWND_TYPE_BUFFER 1
#define HSPWND_TYPE_MAIN 2
#define HSPWND_TYPE_BGSCR 3
#define HSPWND_TYPE_SSPREVIEW 4

enum {
BMSCR_SAVEPOS_MOSUEX,
BMSCR_SAVEPOS_MOSUEY,
BMSCR_SAVEPOS_MOSUEZ,
BMSCR_SAVEPOS_MOSUEW,
BMSCR_SAVEPOS_MAX,
};

#define RESNAME_MAX 64

//	Bmscr class
//
class Bmscr {
public:
	//	Functions
	//
	Bmscr( void );
	~Bmscr( void );
	void *GetBMSCR( void ) { return (void *)(&this->flag); };
	void Init( int p_sx, int p_sy );
	void Init( char *fname );
	void Cls( int mode );

	void Posinc( int pp );
	void Width( int x, int y, int wposx, int wposy, int mode );
	void Title( char *str );
	void Setcolor( int a1, int a2, int a3 );
	void SetHSVColor( int hval, int sval, int vval );
	int BmpSave( char *fname );
	void GetClientSize( int *xsize, int *ysize );
	void SetFont( char *fontname, int size, int style );

	void Print( char *mes );
	void Boxfill( int x1,int y1,int x2,int y2 );
	void Circle( int x1,int y1,int x2,int y2, int mode );
	int Pget( int xx, int yy );
	void Pset( int xx,int yy );
	void Line( int xx,int yy );
	int Copy( Bmscr *src, int xx, int yy, int psx, int psy );
	int Zoom( int dx, int dy, Bmscr *src, int xx, int yy, int psx, int psy, int mode );

	void GradFill( int x, int y, int sx, int sy, int mode, int col1, int col2 );
	void GradFillEx( int *vx, int *vy, int *vcol );

	void SetCelDivideSize( int new_divsx, int new_divsy, int new_ofsx, int new_ofsy );
	int CelPut( Bmscr *src, int id );
	int CelPut( Bmscr *src, int id, float destx, float desty, float ang );

	void FillRot( int x, int y, int dst_sx, int dst_sy, float ang );

	void SetFilter( int type );

	//
	//		Window data structure
	//
	int		flag;				// used flag
	int		sx;					// X-size
	int		sy;					// Y-size
	int		palmode;			// palmode
//	HDC		hdc;				// buffer HDC
//	BYTE	*pBit;				// bitmap pointer
//	BITMAPINFOHEADER *pbi;		// infoheader
//	HBITMAP	dib;				// bitmap handle(DIB)
//	HBITMAP	old;				// bitmap handle(OLD)
//	RGBQUAD *pal;				// palette table
//	HPALETTE hpal;				// palette handle
//	HPALETTE holdpal;			// palette handle (old)
	int		pals;				// palette entries
//	HWND	hwnd;				// window handle
//	HINSTANCE hInst;			// Instance of program
	int		infsize;			// *pbi alloc memory size
	int		bmpsize;			// *pBit alloc memory size

	//		Window object setting
	//
	int		type;				// setting type
	int		wid;				// window ID
	short	fl_dispw;			// display window flag
	short	fl_udraw;			// update draw window
	int		wx,wy,wchg;			// actual window size x,y
	int		viewx,viewy;		// buffer view point x,y
	int		lx,ly;				// buffer view size x,y
	int		cx,cy;				// object cursor x,y
	int		ox,oy,py;			// object size x,y,py
	int		texty;				// text Y-axis size
	int		gx,gy,gmode;		// gcopy size
//	HBRUSH	hbr;				// BRUSH handle
//	HPEN	hpn;				// PEN handle
//	HFONT	hfont;				// FONT handle
//	HFONT	holdfon;			// FONT handle (old)
//	COLORREF color;				// text color code
	int		 color;				// text color code
	int		textspeed;			// slow text speed
	int		cx2,cy2;			// slow text cursor x,y
	int		tex,tey;			// slow text limit x,y
	char	*prtmes;			// slow message ptr
	int		focflg;				// focus set flag
	int		objmode;			// object set mode
//	LOGFONT	logfont;			// logical font
	int		style;				// extra window style
	int		gfrate;				// halftone copy rate
	int		tabmove;			// object TAB move mode
	int		sx2;				// actual bitmap X size
	short	printsizex;			// print,mes extent X size
	short	printsizey;			// print,mes extent Y size
//	SIZE	printsize;			// print,mes extent size

	//		Class depend data
	//
	int		objstyle;					// objects style
//	HSPOBJINFO *mem_obj;				// Window objects
	int objmax;							// Max number of obj
	int objlimit;						// Limit number of obj
	short savepos[BMSCR_SAVEPOS_MAX];	// saved position

	short	divx, divy;					// Divide value for CEL
	short	divsx, divsy;				// CEL size
	short	celofsx, celofsy;			// CEL center offset

	char	resname[RESNAME_MAX];		// Resource Name
	int		texid;						// Texture ID
private:
//	void Blt( int mode, Bmscr *src, int xx, int yy, int asx, int asy );
//	void CnvRGB16( PTRIVERTEX target, DWORD src );

};


//	HspWnd Base class
//

class HspWnd {
public:
	//	Functions
	//
	HspWnd( void );
	~HspWnd( void );

	void SetMasterSize( int m_sx, int m_sy );
	void SetMasterInstance( void *m_inst );

	void MakeBmscr( int id, int type, int x, int y, int sx, int sy );
	void MakeBmscrFromResource( int id, char *fname );
	inline Bmscr *GetBmscr( int id ) { return mem_bm[id]; };
	Bmscr *GetBmscrSafe( int id );
	int Picload( int id, char *fname, int mode );
	int GetActive( void );
	int GetBmscrMax( void ) { return bmscr_max; };
	int GetEmptyBufferId( void );

	//	Data
	//
	int mouse_x, mouse_y;
	int sys_iprm, sys_wprm, sys_lprm;

private:
	void Reset( void );
	void Dispose( void );
	void ExpandScreen( int id );

	//	Data
	//
	int m_sx, m_sy;		// Master Window Size
	int m_handle;		// Master Handle

	Bmscr **mem_bm;
	int bmscr_max;
	int bmscr_res;
};



//	Bmscr structure (same as Bmscr)
//
typedef struct BMSCR
{
	//
	//		Window data structure
	//
	int		flag;				// used flag
	int		sx;					// X-size
	int		sy;					// Y-size
	int		palmode;			// palmode
//	HDC		hdc;				// buffer HDC
//	BYTE	*pBit;				// bitmap pointer
//	BITMAPINFOHEADER *pbi;		// infoheader
//	HBITMAP	dib;				// bitmap handle(DIB)
//	HBITMAP	old;				// bitmap handle(OLD)
//	RGBQUAD *pal;				// palette table
//	HPALETTE hpal;				// palette handle
//	HPALETTE holdpal;			// palette handle (old)
	int		pals;				// palette entries
//	HWND	hwnd;				// window handle
//	HINSTANCE hInst;			// Instance of program
	int		infsize;			// *pbi alloc memory size
	int		bmpsize;			// *pBit alloc memory size

	//		Window object setting
	//
	int		type;				// setting type
	int		wid;				// window ID
	short	fl_dispw;			// display window flag
	short	fl_udraw;			// update draw window
	int		wx,wy,wchg;			// actual window size x,y
	int		viewx,viewy;		// buffer view point x,y
	int		lx,ly;				// buffer view size x,y
	int		cx,cy;				// object cursor x,y
	int		ox,oy,py;			// object size x,y,py
	int		texty;				// text Y-axis size
	int		gx,gy,gmode;		// gcopy size
//	HBRUSH	hbr;				// BRUSH handle
//	HPEN	hpn;				// PEN handle
//	HFONT	hfont;				// FONT handle
//	HFONT	holdfon;			// FONT handle (old)
//	COLORREF color;				// text color code
	int		 color;				// text color code
	int		textspeed;			// slow text speed
	int		cx2,cy2;			// slow text cursor x,y
	int		tex,tey;			// slow text limit x,y
	char	*prtmes;			// slow message ptr
	int		focflg;				// focus set flag
	int		objmode;			// object set mode
//	LOGFONT	logfont;			// logical font
	int		style;				// extra window style
	int		gfrate;				// halftone copy rate
	int		tabmove;			// object TAB move mode
	int		sx2;				// actual bitmap X size
	short	printsizex;			// print,mes extent X size
	short	printsizey;			// print,mes extent Y size
//	SIZE	printsize;			// print,mes extent size

	//		Class depend data
	//
	int		objstyle;					// objects style
//	HSPOBJINFO *mem_obj;				// Window objects
	int objmax;							// Max number of obj
	int objlimit;						// Limit number of obj
	short savepos[BMSCR_SAVEPOS_MAX];	// saved position

	short	divx, divy;					// Divide value for CEL
	short	divsx, divsy;				// CEL size
	short	celofsx, celofsy;			// CEL center offset

	char	resname[RESNAME_MAX];		// Resource Name
	int		texid;						// Texture ID
} BMSCR;

#endif
