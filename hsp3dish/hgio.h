
//
//	hgio(HSP graphics I/O) functions
//
#ifndef __hgio_h
#define __hgio_h

#include "hspwnd_dish.h"
#include "../hsp3/dpmread.h"

//		universal draw command function
//
void hgio_init( int mode, int sx, int sy, void *hwnd );
void hgio_term( void );

int hgio_render_start( void );
int hgio_render_end( void );
void hgio_screen( BMSCR *bm );
void hgio_delscreen( BMSCR *bm );
int hgio_redraw( BMSCR *bm, int flag );
int hgio_texload( BMSCR *bm, char *fname );

int hgio_dialog( int mode, char *str1, char *str2 );
int hgio_title( char *str1 );
int hgio_stick( int actsw );

int hgio_font( char *fontname, int size, int style );
int hgio_mes( BMSCR *bm, char *str1 );

void hgio_line( BMSCR *bm, float x, float y );
void hgio_line2( float x, float y );
void hgio_boxf( BMSCR *bm, float x1, float y1, float x2, float y2 );
void hgio_circle( BMSCR *bm, float x1, float y1, float x2, float y2, int mode );
void hgio_copy( BMSCR *bm, short xx, short yy, short srcsx, short srcsy, BMSCR *bmsrc, float psx, float psy );
void hgio_copyrot( BMSCR *bm, short xx, short yy, short srcsx, short srcsy, float ofsx, float ofsy, BMSCR *bmsrc, float psx, float psy, float ang );
void hgio_fillrot( BMSCR *bm, float x, float y, float sx, float sy, float ang );

void hgio_clsmode( int mode, int color, int tex );
int hgio_getWidth( void );
int hgio_getHeight( void );

enum {
CLSMODE_NONE = 0,
CLSMODE_SOLID,
CLSMODE_TEXTURE,
CLSMODE_BLUR,
CLSMODE_MAX,
};

#ifdef HSPWIN
#include "win32/hgiox.h"
#endif

#ifdef HSPIOS
#include "ios/hgio_ios.h"
#endif

#ifdef HSPNDK
#include "ndk/hgio_ndk.h"
#endif

#ifdef HSPLINUX
#include "linux/hgio_linux.h"
#endif


#endif

