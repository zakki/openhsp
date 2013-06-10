//
//		Draw lib (gameplay)
//			onion software/onitama 2013/3
//
#include "gamehsp.h"

#include <stdio.h>
#include <math.h>

#define STRICT

#include <windows.h>
#include <mmsystem.h>
#include <string.h>
#include <objbase.h>
#include <commctrl.h>
#include <shellapi.h>

#include "../../hsp3/hsp3config.h"
#include "../hgio.h"
#include "../supio.h"
#include "../sysreq.h"

#define RELEASE(x) 	if(x){x->Release();x=NULL;}

#pragma comment(lib, "d3d8.lib")
#pragma comment(lib, "dxguid.lib")

#pragma comment(lib, "OpenGL32.lib")
#pragma comment(lib, "GLU32.lib")
#pragma comment(lib, "glew32.lib")
#pragma comment(lib, "libpng16.lib")
#pragma comment(lib, "zlib.lib")
#pragma comment(lib, "gameplay.lib")
#pragma comment(lib, "BulletDynamics.lib")
#pragma comment(lib, "BulletCollision.lib")
#pragma comment(lib, "LinearMath.lib")

extern gamehsp *game;
extern gameplay::Platform *platform;

#define M_PI	(3.14159265358979323846f)

/*------------------------------------------------------------*/
/*
		HSP File Service
*/
/*------------------------------------------------------------*/

#define MFPTR_MAX 8
static char *mfptr[MFPTR_MAX];
static int mfptr_depth;

void InitMemFile( void )
{
	mfptr_depth = 0;
	mfptr[0] = NULL;
}


int OpenMemFilePtr( char *fname )
{
	int fsize;
	fsize = dpm_exist( fname );		// �t�@�C���̃T�C�Y���擾
	if ( fsize <= 0 ) return -1;
	mfptr_depth++;
	if ( mfptr_depth >= MFPTR_MAX ) return -1;
	mfptr[mfptr_depth] = (char *)malloc( fsize );
	dpm_read( fname, mfptr[mfptr_depth], fsize, 0 );	// �t�@�C���ǂݍ���
	return fsize;
}


char *GetMemFilePtr( void )
{
	return mfptr[mfptr_depth];
}


void CloseMemFilePtr( void )
{
	if ( mfptr_depth == 0 ) return;
	if ( mfptr[mfptr_depth] != NULL ) {
		free( mfptr[mfptr_depth] ); mfptr[mfptr_depth]=NULL;
		mfptr_depth--;
	}
}

/*------------------------------------------------------------*/
/*
		gameplay Service
*/
/*------------------------------------------------------------*/

//		Settings
//
static		int nDestWidth;		// �`����W��
static		int nDestHeight;	// �`����W����

static		HWND master_wnd;	// �\���Ώ�Window
static		int drawflag;		// �����_�[�J�n�t���O
static		BMSCR mestexbm;		// �e�L�X�g�\���p�_�~�[BMSCR

static		BMSCR *mainbm;		// ���C���X�N���[����BMSCR
static		HSPREAL infoval[HGIO_INFO_MAX];

static		char m_tfont[256];	// �e�L�X�g�g�p�t�H���g
static		int m_tsize;		// �e�L�X�g�g�p�t�H���g�̃T�C�Y
static		int m_tstyle;		// �e�L�X�g�g�p�t�H���g�̃X�^�C���w��

static		float center_x,center_y;
static		float linebasex,linebasey;

#define CIRCLE_DIV 16
#define DEFAULT_FONT_NAME ""
#define DEFAULT_FONT_SIZE 18
#define DEFAULT_FONT_STYLE 0


/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

void hgio_init( int mode, int sx, int sy, void *hwnd )
{
	//		�t�@�C���T�[�r�X�ݒ�
	//
	InitMemFile();

	//		�ݒ�̏�����
	//
	SetSysReq( SYSREQ_RESULT, 0 );
	SetSysReq( SYSREQ_RESVMODE, 0 );

	master_wnd = (HWND)hwnd;
	mainbm = NULL;
	drawflag = 0;
	nDestWidth = sx;
	nDestHeight = sy;

	//		infoval�����Z�b�g
	//
	int i;
	for(i=0;i<HGIO_INFO_MAX;i++) {
		infoval[i] = 0.0;
	}
}


void hgio_clsmode( int mode, int color, int tex )
{
	SetSysReq( SYSREQ_CLSMODE, mode );
	SetSysReq( SYSREQ_CLSCOLOR, color );
	SetSysReq( SYSREQ_CLSTEX, tex );
}


int hgio_device_restore( void )
{
	//	�f�o�C�X�̏C��
	//		(0=OK/1=NG)
	//
	return 0;
}


void hgio_resume( void )
{
	hgio_device_restore();
}


int hgio_render_end( void )
{
	int res;

	if ( drawflag == 0 ) return 0;

	res = 0;

	if ( platform ) platform->swapBuffers();

	drawflag = 0;
	return res;
}


int hgio_render_start( void )
{
	if ( drawflag ) {
		hgio_render_end();
	}

	//	��ʃN���A
	//ClearDest( GetSysReq( SYSREQ_CLSMODE ), GetSysReq( SYSREQ_CLSCOLOR ), GetSysReq( SYSREQ_CLSTEX ) );

	//�V�[�������_�[�J�n
	if ( game ) game->frame();

	drawflag = 1;
	return 0;
}


void hgio_screen( BMSCR *bm )
{
	//		�X�N���[���Đݒ�
	//		(cls����)
	//
	mainbm = bm;
	hgio_font( DEFAULT_FONT_NAME, DEFAULT_FONT_SIZE, DEFAULT_FONT_STYLE );
}


void hgio_delscreen( BMSCR *bm )
{
	//		�X�N���[����j��
	//		(Bmscr�N���X��delete��)
	//
	if ( bm->flag == BMSCR_FLAG_NOUSE ) return;
	if ( bm->texid != -1 ) {
		game->deleteMat( bm->texid );
		bm->texid = -1;
	}
}


int hgio_getWidth( void )
{
	return nDestWidth;
}


int hgio_getHeight( void )
{
	return nDestHeight;
}


void hgio_term( void )
{
	hgio_render_end();
}


int hgio_stick( int actsw )
{
	//		stick�p�̓��͂�Ԃ�
	//
	HWND hwnd;
	int ckey = 0;

	if ( actsw ) {
		hwnd = GetActiveWindow();
		if ( hwnd != master_wnd ) return 0;
	}

	if ( GetAsyncKeyState(37)&0x8000 ) ckey|=1;		// [left]
	if ( GetAsyncKeyState(38)&0x8000 ) ckey|=2;		// [up]
	if ( GetAsyncKeyState(39)&0x8000 ) ckey|=4;		// [right]
	if ( GetAsyncKeyState(40)&0x8000 ) ckey|=8;		// [down]
	if ( GetAsyncKeyState(32)&0x8000 ) ckey|=16;	// [spc]
	if ( GetAsyncKeyState(13)&0x8000 ) ckey|=32;	// [ent]
	if ( GetAsyncKeyState(17)&0x8000 ) ckey|=64;	// [ctrl]
	if ( GetAsyncKeyState(27)&0x8000 ) ckey|=128;	// [esc]
	if ( GetAsyncKeyState(1)&0x8000 )  ckey|=256;	// mouse_l
	if ( GetAsyncKeyState(2)&0x8000 )  ckey|=512;	// mouse_r
	if ( GetAsyncKeyState(9)&0x8000 )  ckey|=1024;	// [tab]
	return ckey;
}


int hgio_redraw( BMSCR *bm, int flag )
{
	//		redraw���[�h�ݒ�
	//		(�K��redraw 0�`redraw 1���y�A�ɂ��邱��)
	//
	if ( bm == NULL ) return -1;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	if ( flag & 1 ) {
		hgio_render_end();
	} else {
		hgio_render_start();
	}
	return 0;
}


int hgio_dialog( int mode, char *str1, char *str2 )
{
	//		dialog�\��
	//
	int i,res;
	i = 0;
	if (mode&1) i|=MB_ICONEXCLAMATION; else i|=MB_ICONINFORMATION;
	if (mode&2) i|=MB_YESNO; else i|=MB_OK;
	res = MessageBox( master_wnd, str1, str2, i );
	return res;
}


int hgio_title( char *str1 )
{
	//		title�ύX
	//
	SetWindowText( master_wnd, str1 );
	return 0;
}


int hgio_texload( BMSCR *bm, char *fname )
{
	//		�e�N�X�`���ǂݍ���
	//
	gpmat *mat;

	bm->texid = game->makeNewMat2D( fname, 0 );
	if ( bm->texid < 0 ) return bm->texid;

	mat = game->getMat( bm->texid );

	bm->sx = mat->_sx;
	bm->sy = mat->_sy;

	return 0;
}


int hgio_mes( BMSCR *bm, char *str1 )
{
	//		mes,print �����\��
	//
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	if ( game ) {
		bm->printsizex = game->drawFont( bm->cx, bm->cy, str1, (gameplay::Vector4 *)bm->colorvalue, m_tsize );
	}
	bm->printsizey = m_tsize;

	//DrawTexString( bm->cx, bm->cy, str1 );

	//bm->printsizex = TexGetDrawSizeX();
	//bm->printsizey = TexGetDrawSizeY();
	//if ( bm->printsizey <= 0 ) {
	//	bm->printsizey = m_tsize;
	//}
	//Alertf( "%s[%d,%d]",str1,bm->printsizex,bm->printsizey );

	return 0;
}


int hgio_font( char *fontname, int size, int style )
{
	//		�����t�H���g�w��
	//
	strncpy( m_tfont, fontname, 254 );
	m_tsize = size;
	m_tstyle = style;
	return 0;
}


/*------------------------------------------------------------*/
/*
		Universal Draw Service
*/
/*------------------------------------------------------------*/

void hgio_line( BMSCR *bm, float x, float y )
{
	//		���C���`��
	//		(bm!=NULL �̏ꍇ�A���C���`��J�n)
	//		(bm==NULL �̏ꍇ�A���C���`�抮��)
	//		(���C���̍��W�͕K�v�Ȑ�����hgio_line2���Ăяo��)
	//
	if ( bm == NULL ) {
		return;
	}
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	float r_val = bm->colorvalue[0];
	float g_val = bm->colorvalue[1];
	float b_val = bm->colorvalue[2];
	game->setPolyDiffuse2D( r_val, g_val, b_val, 1.0f );

	linebasex = x + 0.5f;
	linebasey = y + 0.5f;
}


void hgio_line2( float x, float y )
{
	//		���C���`��
	//		(hgio_line�ŊJ�n��ɕK�v�ȉ񐔌ĂԁAhgio_line(NULL)�ŏI�����邱��)
	//

	float *v = game->startLineColor2D();

	*v++ = linebasex; *v++ = linebasey; v++;
	v+=4;
	linebasex = x + 0.5f;
	linebasey = y + 0.5f;
	*v++ = linebasex; *v++ = linebasey; v++;

	game->drawLineColor2D();

}


void hgio_boxf( BMSCR *bm, float x1, float y1, float x2, float y2 )
{
	//		��`�`��
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	float *v = game->startPolyColor2D();
	float r_val = bm->colorvalue[0];
	float g_val = bm->colorvalue[1];
	float b_val = bm->colorvalue[2];
	//float a_val = bm->colorvalue[3];

	float a_val = game->setPolyColorBlend( 0, 0 );
	game->setPolyDiffuse2D( r_val, g_val, b_val, a_val );

	*v++ = x1; *v++ = y2; v++;
	v+=4;
	//*v++ = r_val; *v++ = g_val; *v++ = b_val; *v++ = a_val;
	*v++ = x1; *v++ = y1; v++;
	v+=4;
	//*v++ = r_val; *v++ = g_val; *v++ = b_val; *v++ = a_val;
	*v++ = x2; *v++ = y2; v++;
	v+=4;
	//*v++ = r_val; *v++ = g_val; *v++ = b_val; *v++ = a_val;
	*v++ = x2; *v++ = y1; v++;
	//*v++ = r_val; *v++ = g_val; *v++ = b_val; *v++ = a_val;

	game->drawPolyColor2D();
}


void hgio_circle( BMSCR *bm, float x1, float y1, float x2, float y2, int mode )
{
	//		�~�`��
	//
	float x,y,rx,ry,sx,sy,rate;
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	float *v;
	float *v_master = game->startPolyColor2D();
	float r_val = bm->colorvalue[0];
	float g_val = bm->colorvalue[1];
	float b_val = bm->colorvalue[2];
	float a_val = game->setPolyColorBlend( 0, 0 );
	game->setPolyDiffuse2D( r_val, g_val, b_val, a_val );

	rate = M_PI * 2.0f / (float)CIRCLE_DIV;
	sx = abs(x2-x1); sy = abs(y2-y1);
	rx = sx * 0.5f;
	ry = sy * 0.5f;
	x = x1 + rx;
	y = y1 + ry;

	for(int i = 1; i<=CIRCLE_DIV; i ++) {

		v = v_master;

		*v++ = x;
		*v++ = y;
		v++;
		v+=4;

		*v++ = x + cos((float)i * rate)*rx;
		*v++ = y + sin((float)i * rate)*ry;
		v++;
		v+=4;

		*v++ = x + cos((float)(i+1) * rate)*rx;
		*v++ = y + sin((float)(i+1) * rate)*ry;
		v++;
		v+=4;

		game->addPolyColor2D( 3 );
	}

	game->finishPolyColor2D();


	/*
	D3DTLVERTEXC *v;
	D3DTLVERTEXC arScreen[CIRCLE_DIV + 2];
	int col;
	float x,y,rx,ry,sx,sy,rate;

	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	rate = D3DX_PI * 2.0f / (float)CIRCLE_DIV;
	sx = abs(x2-x1); sy = abs(y2-y1);
	rx = sx * 0.5f;
	ry = sy * 0.5f;
	x = x1 + rx;
	y = y1 + ry;

	ChangeTex( -1 );
	SetAlphaMode( 0 );
	col = bm->color;

	v = arScreen;
	for(int i = 1; i<=CIRCLE_DIV + 1; i ++) {
		v->x = x + cos((float)i * rate)*rx;
		v->y = y + sin((float)i * rate)*ry;
		v->z = 0.0f;
		v->rhw = 1.0f;
		v->color = col;
		v++;
	}

	//�f�o�C�X�Ɏg�p���钸�_�t�H�[�}�b�g���Z�b�g����
	d3ddev->SetVertexShader(D3DFVF_TLVERTEXC);
	// �Ƃ肠�������ڕ`��(�l�p�`)
	d3ddev->SetRenderState( D3DRS_CULLMODE, D3DCULL_CCW );
	d3ddev->DrawPrimitiveUP(D3DPT_TRIANGLEFAN,CIRCLE_DIV,arScreen,sizeof(D3DTLVERTEXC));
	d3ddev->SetRenderState( D3DRS_CULLMODE, D3DCULL_CW );
	*/
}


void hgio_fillrot( BMSCR *bm, float x, float y, float sx, float sy, float ang )
{
	//		��`(��])�`��
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	float x0,y0,x1,y1,ofsx,ofsy;
	float *v = game->startPolyColor2D();
	float r_val = bm->colorvalue[0];
	float g_val = bm->colorvalue[1];
	float b_val = bm->colorvalue[2];
	//float a_val = bm->colorvalue[3];

	float a_val = game->setPolyColorBlend( bm->gmode, bm->gfrate );

	ofsx = sx;
	ofsy = sy;
	x0 = -(float)sin( ang );
	y0 = (float)cos( ang );
	x1 = -y0;
	y1 = x0;

	ofsx *= -0.5f;
	ofsy *= -0.5f;
	x0 *= ofsy;
	y0 *= ofsy;
	x1 *= ofsx;
	y1 *= ofsx;

	*v++ = (-x0+x1) + x;
	*v++ = (-y0+y1) + y;
	v++;
	*v++ = r_val; *v++ = g_val; *v++ = b_val; *v++ = a_val;

	*v++ = (-x0-x1) + x;
	*v++ = (-y0-y1) + y;
	v++;
	*v++ = r_val; *v++ = g_val; *v++ = b_val; *v++ = a_val;

	*v++ = (x0+x1) + x;
	*v++ = (y0+y1) + y;
	v++;
	*v++ = r_val; *v++ = g_val; *v++ = b_val; *v++ = a_val;

	*v++ = (x0-x1) + x;
	*v++ = (y0-y1) + y;
	v++;
	*v++ = r_val; *v++ = g_val; *v++ = b_val; *v++ = a_val;

	game->drawPolyColor2D();
}


void hgio_copy( BMSCR *bm, short xx, short yy, short srcsx, short srcsy, BMSCR *bmsrc, float s_psx, float s_psy )
{
	//		�摜�R�s�[
	//		texid����(xx,yy)-(xx+srcsx,yy+srcsy)�����݂̉�ʂ�(psx,psy)�T�C�Y�ŃR�s�[
	//		�J�����g�|�W�V�����A�`�惂�[�h��BMSCR����擾
	//
	float psx,psy;
	float x1,y1,x2,y2,sx,sy;
	float tx0,ty0,tx1,ty1;

	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	gpmat *mat = game->getMat( bmsrc->texid );
	if ( mat == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	float *v = game->startPolyTex2D( mat );
	if ( v == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	float a_val = game->setMaterialBlend( mat->_material, bm->gmode, bm->gfrate );

	game->setPolyDiffuseTex2D( 1.0f, 1.0f, 1.0f, a_val );

	if ( s_psx < 0.0 ) {
		psx = -s_psx;
		tx1 = ((float)xx);
		tx0 = ((float)(xx + srcsx));
	} else {
		psx = s_psx;
		tx0 = ((float)xx);
		tx1 = ((float)(xx + srcsx));
	}
	if ( s_psy < 0.0 ) {
		psy = -s_psy;
		ty1 = ((float)yy);
		ty0 = ((float)(yy + srcsy));
	} else {
		psy = s_psy;
		ty0 = ((float)yy);
		ty1 = ((float)(yy + srcsy));
	}

	x1 = ((float)bm->cx);
	y1 = ((float)bm->cy);
	x2 = x1 + psx;
	y2 = y1 + psy;

	sx = mat->_texratex;
	sy = mat->_texratey;

	tx0 *= sx;
	tx1 *= sx;
	ty0 = 1.0f - ty0 * sy;
	ty1 = 1.0f - ty1 * sy;

	*v++ = x1; *v++ = y2; v++;
	*v++ = tx0; *v++ = ty1;
	v+=4;
	//*v++ = c_val; *v++ = c_val; *v++ = c_val; *v++ = a_val;
	*v++ = x1; *v++ = y1; v++;
	*v++ = tx0; *v++ = ty0;
	v+=4;
	//*v++ = c_val; *v++ = c_val; *v++ = c_val; *v++ = a_val;
	*v++ = x2; *v++ = y2; v++;
	*v++ = tx1; *v++ = ty1;
	v+=4;
	//*v++ = c_val; *v++ = c_val; *v++ = c_val; *v++ = a_val;
	*v++ = x2; *v++ = y1; v++;
	*v++ = tx1; *v++ = ty0;
	//v+=4;
	//*v++ = c_val; *v++ = c_val; *v++ = c_val; *v++ = a_val;

	game->drawPolyTex2D( mat );
}


int hgio_celputmulti( BMSCR *bm, int *xpos, int *ypos, int *cel, int count, BMSCR *bmsrc )
{
	//		�}���`�摜�R�s�[
	//		int�z�����X,Y,CelID�����ɓ��{�R�s�[���s�Ȃ�(count=��)
	//		�J�����g�|�W�V�����A�`�惂�[�h��BMSCR����擾
	//
	int psx,psy;
	float f_psx,f_psy;
	float x1,y1,x2,y2,sx,sy;
	float tx0,ty0,tx1,ty1;
	float *master_v;
	float *v;
	int i;
	int id;
	int *p_xpos;
	int *p_ypos;
	int *p_cel;
	int xx,yy;
	int total;

	if ( bm == NULL ) return 0;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	gpmat *mat = game->getMat( bmsrc->texid );
	if ( mat == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	master_v = game->startPolyTex2D( mat );
	if ( master_v == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	float a_val = game->setMaterialBlend( mat->_material, bm->gmode, bm->gfrate );
	game->setPolyDiffuseTex2D( 1.0f, 1.0f, 1.0f, a_val );

	total =0;

	p_xpos = xpos;
	p_ypos = ypos;
	p_cel = cel;

	sx = mat->_texratex;
	sy = mat->_texratey;
	psx = bmsrc->divsx;
	psy = bmsrc->divsy;
	f_psx = (float)psx;
	f_psy = (float)psy;

	for(i=0;i<count;i++) {

		id = *p_cel;

		if ( id >= 0 ) {

			xx = ( id % bmsrc->divx ) * psx;
			yy = ( id / bmsrc->divx ) * psy;

			tx0 = ((float)xx);
			tx1 = tx0 + f_psx;

			ty0 = ((float)yy);
			ty1 = ty0 + f_psy;

			x1 = (float)(*p_xpos - bmsrc->celofsx);
			y1 = (float)(*p_ypos - bmsrc->celofsy);
			x2 = x1 + f_psx;
			y2 = y1 + f_psy;

			tx0 *= sx;
			tx1 *= sx;
			ty0 = 1.0f - ty0 * sy;
			ty1 = 1.0f - ty1 * sy;

			v = master_v;

			*v++ = x1; *v++ = y2; v++;
			*v++ = tx0; *v++ = ty1;
			v+=4;
			*v++ = x1; *v++ = y1; v++;
			*v++ = tx0; *v++ = ty0;
			v+=4;
			*v++ = x2; *v++ = y2; v++;
			*v++ = tx1; *v++ = ty1;
			v+=4;
			*v++ = x2; *v++ = y1; v++;
			*v++ = tx1; *v++ = ty0;

			game->addPolyTex2D( mat );
			total++;
		}

		p_xpos++;
		p_ypos++;
		p_cel++;

	}

	game->finishPolyTex2D( mat );
	return total;
}


void hgio_copyrot( BMSCR *bm, short xx, short yy, short srcsx, short srcsy, float s_ofsx, float s_ofsy, BMSCR *bmsrc, float psx, float psy, float ang )
{
	//		�摜�R�s�[
	//		texid����(xx,yy)-(xx+srcsx,yy+srcsy)�����݂̉�ʂ�(psx,psy)�T�C�Y�ŃR�s�[
	//		�J�����g�|�W�V�����A�`�惂�[�h��BMSCR����擾
	//
	float x,y,x0,y0,x1,y1,ofsx,ofsy,mx0,mx1,my0,my1;
	float tx0,ty0,tx1,ty1,sx,sy;

	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	gpmat *mat = game->getMat( bmsrc->texid );
	if ( mat == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	float *v = game->startPolyTex2D( mat );
	if ( v == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	float a_val = game->setMaterialBlend( mat->_material, bm->gmode, bm->gfrate );

	game->setPolyDiffuseTex2D( 1.0f, 1.0f, 1.0f, a_val );

	mx0=-(float)sin( ang );
	my0=(float)cos( ang );
	mx1 = -my0;
	my1 = mx0;

	ofsx = -s_ofsx;
	ofsy = -s_ofsy;
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;

	//		��_�̎Z�o
	x = ( (float)bm->cx - (-x0+x1) );
	y = ( (float)bm->cy - (-y0+y1) );

	//		��]���W�̎Z�o
	ofsx = -psx;
	ofsy = -psy;
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;

	sx = mat->_texratex;
	sy = mat->_texratey;

	tx0 = (float)xx;
	ty0 = (float)yy;
	tx1 = (float)(xx+srcsx);
	ty1 = (float)(yy+srcsy);

	tx0 *= sx;
	tx1 *= sx;
	ty0 = 1.0f - ty0 * sy;
	ty1 = 1.0f - ty1 * sy;

	*v++ = ((-x0) + x);
	*v++ = ((-y0) + y);
	v++;
	*v++ = tx0;
	*v++ = ty1;
	v+=4;

	*v++ = ((-x0+x1) + x);
	*v++ = ((-y0+y1) + y);
	v++;
	*v++ = tx1;
	*v++ = ty1;
	v+=4;

	*v++ = (x);
	*v++ = (y);
	v++;
	*v++ = tx0;
	*v++ = ty0;
	v+=4;

	*v++ = ((x1) + x);
	*v++ = ((y1) + y);
	v++;
	*v++ = tx1;
	*v++ = ty0;

	game->drawPolyTex2D( mat );
}


void hgio_setfilter( int type, int opt )
{
	/*
	int ft;
	switch( type ) {
	case HGIO_FILTER_TYPE_LINEAR:
		ft = D3DTEXF_LINEAR;
		break;
	case HGIO_FILTER_TYPE_LINEAR2:
		ft = D3DTEXF_FLATCUBIC;
		break;
	default:
		ft = D3DTEXF_POINT;
		break;
	}
	d3ddev->SetTextureStageState( 0, D3DTSS_MAGFILTER, ft  );
	d3ddev->SetTextureStageState( 0, D3DTSS_MINFILTER, ft  );
	*/
}


#if 1

void hgio_setcenter( float x, float y )
{
	center_x = x;
	center_y = y;
}

void hgio_drawsprite( hgmodel *mdl, HGMODEL_DRAWPRM *prm )
{
	//		�摜�R�s�[(DG�p)
	//		texid����(xx,yy)-(xx+srcsx,yy+srcsy)�����݂̉�ʂ�(psx,psy)�T�C�Y�ŃR�s�[
	//		�J�����g�|�W�V�����A�`�惂�[�h��BMSCR����擾
	//
	/*
	D3DTLVERTEX *v;
	TEXINF *tex;
	int texid;
	short ua_ofsx, ua_ofsy;
	float ang,x,y,x0,y0,x1,y1,ofsx,ofsy,mx0,mx1,my0,my1;
	float tx0,ty0,tx1,ty1,sx,sy;

	ang = prm->rot.z;
	mx0=-(float)sin( ang );
	my0=(float)cos( ang );
	mx1 = -my0;
	my1 = mx0;

	ofsx = mdl->center_x * (prm->scale.x);
	ofsy = mdl->center_y * (prm->scale.y);
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;

	//		��_�̎Z�o
	x = ( prm->pos.x - (-x0+x1) ) + center_x;
	y = ( prm->pos.y - (-y0+y1) ) + center_y;

	//		��]���W�̎Z�o
	ofsx = -( mdl->sizex * (prm->scale.x) );
	ofsy = -( mdl->sizey * (prm->scale.y) );
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;

	texid = prm->tex;
	ChangeTex( texid );
	tex = GetTex( texid );
	sx = tex->ratex;
	sy = tex->ratey;

	//Alertf( "%d (%f,%f)",texid, x,y );

	ua_ofsx = prm->ua_ofsx;
	ua_ofsy = prm->ua_ofsy;
	tx0 = ((float)(mdl->uv[0]+ua_ofsx) ) * sx;
	ty0 = ((float)(mdl->uv[1]+ua_ofsy) ) * sy;
	tx1 = ((float)(mdl->uv[2]+ua_ofsx) ) * sx;
	ty1 = ((float)(mdl->uv[3]+ua_ofsy) ) * sy;

	v = vertex2D;
	v[0].color = v[1].color = v[2].color = v[3].color = SetAlphaModeDG( (int)prm->efx.x ) | 0xffffff;

	v->x = ((-x0+x1) + x);
	v->y = ((-y0+y1) + y);
	v->tu0 = tx1;
	v->tv0 = ty1;
	v++;

	v->x = ((x1) + x);
	v->y = ((y1) + y);
	v->tu0 = tx1;
	v->tv0 = ty0;
	v++;

	v->x = (x);
	v->y = (y);
	v->tu0 = tx0;
	v->tv0 = ty0;
	v++;

	v->x = ((-x0) + x);
	v->y = ((-y0) + y);
	v->tu0 = tx0;
	v->tv0 = ty1;
	v++;

	//�f�o�C�X�Ɏg�p���钸�_�t�H�[�}�b�g���Z�b�g����
	d3ddev->SetVertexShader(D3DFVF_TLVERTEX);
	// �Ƃ肠�������ڕ`��(�l�p�`)
	d3ddev->DrawPrimitiveUP(D3DPT_TRIANGLEFAN,2,vertex2D,sizeof(D3DTLVERTEX));
	*/
}


void hgio_square_tex( BMSCR *bm, int *posx, int *posy, BMSCR *bmsrc, int *uvx, int *uvy )
{
	//		�l�p�`(square)�e�N�X�`���`��
	//
	float sx,sy;
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	gpmat *mat = game->getMat( bmsrc->texid );
	if ( mat == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	float *v = game->startPolyTex2D( mat );
	if ( v == NULL ) throw HSPERR_ILLEGAL_FUNCTION;

	float a_val = game->setMaterialBlend( mat->_material, bm->gmode, bm->gfrate );

	game->setPolyDiffuseTex2D( 1.0f, 1.0f, 1.0f, a_val );

	sx = mat->_texratex;
	sy = mat->_texratey;

	*v++ = (float)posx[3];
	*v++ = (float)posy[3];
	v++;
	*v++ = ((float)uvx[3]) * sx;
	*v++ = ((float)uvy[3]) * sy;
	v+=4;

	*v++ = (float)posx[0];
	*v++ = (float)posy[0];
	v++;
	*v++ = ((float)uvx[0]) * sx;
	*v++ = ((float)uvy[0]) * sy;
	v+=4;

	*v++ = (float)posx[2];
	*v++ = (float)posy[2];
	v++;
	*v++ = ((float)uvx[2]) * sx;
	*v++ = ((float)uvy[2]) * sy;
	v+=4;

	*v++ = (float)posx[1];
	*v++ = (float)posy[1];
	v++;
	*v++ = ((float)uvx[1]) * sx;
	*v++ = ((float)uvy[1]) * sy;

	game->drawPolyTex2D( mat );
}


void hgio_square( BMSCR *bm, int *posx, int *posy, int *color )
{
	//		�l�p�`(square)�P�F�`��
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	gameplay::Vector4 colvec;
	float *v = game->startPolyColor2D();
	float valw = game->setPolyColorBlend( bm->gmode, bm->gfrate );

	game->colorVector3( color[3], colvec );
	*v++ = (float)posx[3];
	*v++ = (float)posy[3];
	v++;
	*v++ = colvec.x; *v++ = colvec.y; *v++ = colvec.z; *v++ = valw;

	game->colorVector3( color[0], colvec );
	*v++ = (float)posx[0];
	*v++ = (float)posy[0];
	v++;
	*v++ = colvec.x; *v++ = colvec.y; *v++ = colvec.z; *v++ = valw;

	game->colorVector3( color[2], colvec );
	*v++ = (float)posx[2];
	*v++ = (float)posy[2];
	v++;
	*v++ = colvec.x; *v++ = colvec.y; *v++ = colvec.z; *v++ = valw;

	game->colorVector3( color[1], colvec );
	*v++ = (float)posx[1];
	*v++ = (float)posy[1];
	v++;
	*v++ = colvec.x; *v++ = colvec.y; *v++ = colvec.z; *v++ = valw;

	game->drawPolyColor2D();
}


int hgio_gettick( void )
{
	return timeGetTime();
}


int hgio_exec( char *stmp, char *option, int mode )
{
	int i,j;
	j=SW_SHOWDEFAULT;if (mode&2) j=SW_SHOWMINIMIZED;

	if ( *option != 0 ) {
		SHELLEXECUTEINFO exinfo;
		memset( &exinfo, 0, sizeof(SHELLEXECUTEINFO) );
		exinfo.cbSize = sizeof(SHELLEXECUTEINFO);
		exinfo.fMask = SEE_MASK_INVOKEIDLIST;
		exinfo.hwnd = master_wnd;
		exinfo.lpVerb = option;
		exinfo.lpFile = stmp;
		exinfo.nShow = SW_SHOWNORMAL;
		if ( ShellExecuteEx( &exinfo ) == false ) throw HSPERR_EXTERNAL_EXECUTE;
		return 0;
	}
		
	if ( mode&16 ) {
		i = (int)ShellExecute( NULL,NULL,stmp,"","",j );
	}
	else if ( mode&32 ) {
		i = (int)ShellExecute( NULL,"print",stmp,"","",j );
	}
	else {
		i=WinExec( stmp,j );
	}
	if (i<32) throw HSPERR_EXTERNAL_EXECUTE;
	return 0;
}


HSPREAL hgio_getinfo( int type )
{
	int i;
	i = type - HGIO_INFO_BASE;
	if (( i >= 0 )&&( i < HGIO_INFO_MAX)) {
		return infoval[i];
	}
	return 0.0;
}

void hgio_setinfo( int type, HSPREAL val )
{
	int i;
	i = type - HGIO_INFO_BASE;
	if (( i >= 0 )&&( i < HGIO_INFO_MAX)) {
		infoval[i] = val;
	}
}

char *hgio_sysinfo( int p2, int *res, char *outbuf )
{
	//		System strings get
	//
	int fl;
	char pp[128];
	char *p1;
	BOOL success;
	DWORD version;
	DWORD size;
	DWORD *mss;
	SYSTEM_INFO si;
	MEMORYSTATUS ms;

	fl = HSPVAR_FLAG_INT;
	p1 = outbuf;
	size = HSP_MAX_PATH;

	if (p2&16) {
		GetSystemInfo(&si);
	}
	if (p2&32) {
		GlobalMemoryStatus(&ms);
		mss=(DWORD *)&ms;
		*(int *)p1 = (int)mss[p2&15];
		*res = fl;
		return p1;
	}

	switch(p2) {
	case 0:
		strcpy(p1,"Windows");
		version = GetVersion();
		if ((version & 0x80000000) == 0) strcat(p1,"NT");
									else strcat(p1,"9X");
		sprintf( pp," ver%d.%d", static_cast< int >( version&0xff ), static_cast< int >( (version&0xff00)>>8 ) );
		strcat( p1, pp );
		fl=HSPVAR_FLAG_STR;
		break;
	case 1:
		success = GetUserName( p1,&size );
		fl = HSPVAR_FLAG_STR;
		break;
	case 2:
		success = GetComputerName(p1, &size );
		fl = HSPVAR_FLAG_STR;
		break;
	case 16:
		*(int *)p1 = (int)si.dwProcessorType;
		break;
	case 17:
		*(int *)p1 = (int)si.dwNumberOfProcessors;
		break;
	default:
		return NULL;
	}
	*res = fl;
	return p1;
}

HWND hgio_gethwnd( void )
{
	return master_wnd;
}

#endif