//
//		Draw lib (android/opengl/ndk)
//			onion software/onitama 2011/11
//

#include "../../appengine.h"

#include <stdio.h>
#include <stdlib.h>

#include "stb_image.h"

#include "../hsp3config.h"
#include "../supio.h"
#include "../sysreq.h"
#include "../hgio.h"

#include "font_data.h"

/*-------------------------------------------------------------------------------*/

#define CIRCLE_DIV 20
#define DEFAULT_FONT_NAME ""
#define DEFAULT_FONT_SIZE 14
#define DEFAULT_FONT_STYLE 0

//�F
typedef struct{
    unsigned char r;
    unsigned char g;
    unsigned char b;
    unsigned char a;
} Color;

#define TEXINF_MAX 64
// �e�N�X�`�����
typedef struct
{
short mode;			// mode
short opt;			// option
short sx;			// x-size
short sy;			// y-size
short width;		// real x-size
short height;		// real y-size
GLuint texid;		// TexID
float ratex;		// 1/sx
float ratey;		// 1/sy

} TEXINF;

enum {
TEXMODE_NONE = 0,
TEXMODE_NORMAL,
TEXMODE_MES8,
TEXMODE_MES4,
TEXMODE_MAX,
};

static TEXINF texinf[TEXINF_MAX];
static int curtex;


//�e�N�X�`�����_���
GLfloat panelVertices[]={
     0,  0, //����
     0, -1, //����
     1,  0, //�E��
     1, -1, //�E��
};

//�e�N�X�`��UV���
const GLfloat panelUVs[]={
    0.0f, 0.0f, //����
    0.0f, 1.0f, //����
    1.0f, 0.0f, //�E��
    1.0f, 1.0f, //�E��
};

static GLbyte panelColors[]={
    0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff,
};

#define FVAL_BYTE1 (1.0f/256.0f)

//	�O���t�B�b�N�X�ݒ�
static int _bgsx, _bgsy;	//�w�i�T�C�Y
static Color _color;   	//�F
static int   _flipMode;	//�t���b�v
static int   _originX; 	//���_X
static int   _originY; 	//���_Y
static GLint  _filter;	//�t�B���^
static float _scaleX, _scaleY;	// �X�P�[��

static int		drawflag;
static engine	*appengine;
static BMSCR    *mainbm = NULL;

static int		mouse_x;
static int		mouse_y;
static int		mouse_btn;

static	int  font_texid;
static	int  font_sx, font_sy;

/*------------------------------------------------------------*/
/*
		Polygon Draw Routines
*/
/*------------------------------------------------------------*/

//�e�N�X�`�����_���
static GLfloat vert2D[]={
    0,  0, //����
    0, -1, //����
    1,  0, //�E��
    1, -1, //�E��
};

static GLfloat vertf2D[]={
    0,  0, //����
    0, -1, //����
    1,  0, //�E��
    1, -1, //�E��
};

//�e�N�X�`��UV���
static GLfloat uv2D[]={
    0.0f, 0.0f, //����
    0.0f, 1.0f, //����
    1.0f, 0.0f, //�E��
    1.0f, 1.0f, //�E��
};

static GLfloat uvf2D[]={
    0.0f, 0.0f, //����
    0.0f, 1.0f, //����
    1.0f, 0.0f, //�E��
    1.0f, 1.0f, //�E��
};

static void gluPerspective(double fovy, double aspect, double zNear, double zFar) {
    GLfloat xmin, xmax, ymin, ymax;
    ymax = zNear * tan(fovy * M_PI / 360.0);
    ymin = -ymax;
    xmin = ymin * aspect;
    xmax = ymax * aspect;
    glFrustumf(xmin, xmax, ymin, ymax, zNear, zFar);
}

/*-------------------------------------------------------------------------------*/
/*
		Texture Manage Routines
*/
/*-------------------------------------------------------------------------------*/

TEXINF *GetTex( int id )
{
	return &texinf[id];
}


void DeleteTex( int id )
{
	TEXINF *t;
	t = GetTex( id );
	if ( t->mode == TEXMODE_NONE ) return;
	glDeleteTextures( 1, &t->texid );
	t->mode = TEXMODE_NONE;
}


void TexReset( void )
{
	curtex = -1;
}


void TexInit( void )
{
	int i;
	for(i=0;i<TEXINF_MAX;i++) {
		texinf[i].mode = TEXMODE_NONE;
	}
	TexReset();
}


void TexTerm( void )
{
	int i;
	for(i=0;i<TEXINF_MAX;i++) {
		DeleteTex( i );
	}
}


void ChangeTex( int id )
{
	//	�e�N�X�`���ݒ�
	//	TexID�ł͂Ȃ�OpenGL��ID��n������
	if ( id < 0 ) {
		curtex = -1;
	    glBindTexture(GL_TEXTURE_2D,0);
		return;
	}
	curtex = id;
    glBindTexture( GL_TEXTURE_2D, id );
}


int GetNextTex( void )
{
	int i,sel;
	sel = -1;
	for(i=0;i<TEXINF_MAX;i++) {
		if ( texinf[i].mode == TEXMODE_NONE ) { sel=i;break; }
	}
	return sel;
}


int SetTex( int sel, short mode, short opt, short sx, short sy, short width, short height, GLuint texid )
{
	TEXINF *t;
	int myid;
	myid = sel;
	if ( sel >= 0 ) {
		t = GetTex( sel );
	} else {
		myid = GetNextTex();
		t = GetTex( myid );
	}
	t->mode = mode;
	t->opt = opt;
	t->sx = sx;
	t->sy = sy;
	t->width = width;
	t->height = height;
	t->ratex = 1.0f / (float)sx;
	t->ratey = 1.0f / (float)sy;
	t->texid = texid;
	return myid;
}


static int Get2N( int val )
{
	int res = 1;
	while(1) {
		if ( res >= val ) break;
		res<<=1;
	}
	return res;
}


int RegistTexMem( unsigned char *ptr, int size )
{
	GLuint id;
	int texid, tsx,tsy,comp;
	int sx,sy;
	unsigned char *pImg;
	unsigned char *pImg2;

	pImg = stbi_load_from_memory( ptr, size, &tsx, &tsy, &comp, 4 );

	id = -1;
	if ( pImg != NULL ) {
		sx = Get2N( tsx );
		sy = Get2N( tsy );
		if (( sx != tsx )||( sy != tsy )) {
			//	Exchange to 2N bitmap
			char *p;
			char *p2;
			int x,y;
			pImg2 = (unsigned char *)mem_ini( sx * sy * 4 );
			p = (char *)pImg;
			p2 = (char *)pImg2;
			for(y=0;y<tsy;y++) {
#if 0
 				p2 = (char *)pImg2 + (sx*y*4);
 				for(x=0;x<tsx;x++) {
					p2[0] = p[0];
					p2[1] = p[1];
					p2[2] = p[2];
					p2[3] = p[3];
					p+=4; p2+=4;
				}
#else
				memcpy( p2, p, tsx*4 );
				p+=tsx*4;
				p2+=sx*4;
#endif
			}
			mem_bye(pImg);
			pImg = pImg2;
		}
		glGenTextures( 1, &id );
		glBindTexture( GL_TEXTURE_2D, id );
		glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, sx, sy, 0, GL_RGBA, GL_UNSIGNED_BYTE, pImg );
		mem_bye(pImg);
		texid = SetTex( -1, TEXMODE_NORMAL, 0, sx, sy, tsx, tsy, id );
		Alertf( "Tex:ID%d (%d,%d)(%dx%d)",texid,sx,sy,tsx,tsy );
		return texid;
	}
	Alertf( "Tex:failed" );
	return -1;
}


int RegistTex( char *fname )
{
	char *ptr;
	int len;
	int id;

	len = dpm_exist( fname );
	if ( len < 0 ) return -1;
	ptr = mem_ini( len );
	dpm_read( fname, ptr, len, 0 );
	id = RegistTexMem( (unsigned char *)ptr, len );
	mem_bye( ptr );
	return id;
}


/*-------------------------------------------------------------------------------*/
/*
		Draw Service
*/
/*-------------------------------------------------------------------------------*/

void hgio_init( int mode, int sx, int sy, void *hwnd )
{
	//�e�N�X�`��������
	TexInit();

	//�w�i�T�C�Y
	_bgsx = sx;
	_bgsy = sy;
	_scaleX = 0.5f;
	_scaleY = 0.5f;
          
    //�F
    hgio_setColor( 0 );

	//�O���t�B�b�N�X�ݒ�
	_flipMode = GRAPHICS_FLIP_NONE;
	_originX = 0;
	_originY = 0;
	_filter = GL_NEAREST;
	drawflag = 0;
	mainbm = NULL;
	appengine = (engine *)hwnd;
	hgio_touch( 0,0,0 );

	//		�ݒ�̏�����
	//
	SetSysReq( SYSREQ_RESULT, 0 );
	SetSysReq( SYSREQ_RESVMODE, 0 );
	SetSysReq( SYSREQ_CLSMODE, CLSMODE_SOLID );
	SetSysReq( SYSREQ_CLSCOLOR, 0 );
//	SetSysReq( SYSREQ_CLSCOLOR, 0xffffff );

    //�N���A�F�̐ݒ�
	hgio_reset();
	Alertf( "Init:HGIOScreen(%d,%d)",sx,sy );

	//�t�H���g����
	font_texid = RegistTexMem( font_data, font_data_size );
	font_sx = 16;
	font_sy = 16;

/*
	char tmp[256];
	FILE *fp;
	fp = fopen("/data/data/com.example.hsptest1/lib/libhsp3dish.so", "rb" );
	if (fp!=NULL) {
		Alertf("Found!!!");
		fclose( fp );
	} else {
		Alertf("Not Found...");
	}
*/

}


void hgio_reset( void )
{
    //�r���[�|�[�g�ϊ�
    glViewport(0,0,_bgsx,_bgsy);
    
    //���e�ϊ�
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrthof( 0, _bgsx * _scaleX, -_bgsy * _scaleY, 0,-100,100);
//    glOrthof( 0, _bgsx, -_bgsy, 0,-100,100);
    //glTranslatef(engine->width/2,engine->height/2,0);

    //���f�����O�ϊ�    
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glDisable(GL_LIGHTING);
    glDisable(GL_CULL_FACE);
    glDisable(GL_DEPTH_BUFFER_BIT);
    glDisable(GL_DEPTH_TEST);
    //glClearColor(.7f, .7f, .9f, 1.f);
    //glShadeModel(GL_SMOOTH);

    
    //���_�z��̐ݒ�
    glVertexPointer(2,GL_FLOAT,0,panelVertices);
    glEnableClientState(GL_VERTEX_ARRAY);
    
    //UV�̐ݒ�
    glTexCoordPointer(2,GL_FLOAT,0,panelUVs);
        
    //�e�N�X�`���̐ݒ�
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnable(GL_TEXTURE_2D);
        
    //�u�����h�̐ݒ�
    glEnable(GL_BLEND);
    //glBlendEquationOES(GL_FUNC_ADD_OES);
    glBlendFunc(GL_ONE,GL_ONE_MINUS_SRC_ALPHA);

    //�|�C���g�̐ݒ�
    glEnable(GL_POINT_SMOOTH);

    //�O����
//    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR); 
//    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR); 
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_NEAREST); 
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_NEAREST); 

	//�e�N�X�`���ݒ胊�Z�b�g
	TexReset();

	//�t�H���g�`�惊�Z�b�g

}

void hgio_term( void )
{
	hgio_render_end();
	TexTerm();
}


/*-------------------------------------------------------------------------------*/

void hgio_clear( void )
{
	glClear(GL_COLOR_BUFFER_BIT); 
}


void hgio_setClear( int rval, int gval ,int bval )
{
	glClearColor((GLclampf)(FVAL_BYTE1 * (float)rval), (GLclampf)(FVAL_BYTE1 * (float)gval), (GLclampf)(FVAL_BYTE1 * (float)bval), 1 );
}


void hgio_setFilterMode( int mode )
{
    switch( mode ) {
        case 0:
            _filter = GL_NEAREST;
            break;
        default:
            _filter = GL_LINEAR;
            break;
    }
}

void hgio_setBlendMode( int mode, int aval )
{
    //�u�����h���[�h�ݒ�
    switch( mode ) {
        case 0:                     //no blend
            glDisable(GL_BLEND);
            break;
        case 3:                     //blend+alpha
        case 4:                     //blend+alpha
            glEnable(GL_BLEND);
            //glBlendEquationOES(GL_FUNC_ADD_OES);
            glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
            break;
        case 5:                     //add
            glEnable(GL_BLEND);
            //glBlendEquationOES(GL_FUNC_ADD_OES);
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        case 6:                     //sub
            glEnable(GL_BLEND);
            //glBlendEquationOES(GL_FUNC_REVERSE_SUBTRACT_OES);
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        default:                    //normal blend
            glEnable(GL_BLEND);
            //glBlendEquationOES(GL_FUNC_ADD_OES);
            glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
            //glBlendFunc(GL_ONE,GL_ONE_MINUS_SRC_ALPHA);
            break;
    }
    if ( mode >= 3 ) {
        panelColors[3] = panelColors[4+3] = panelColors[8+3] = panelColors[12+3] = aval;
        glEnableClientState(GL_COLOR_ARRAY);
        glColorPointer(4,GL_UNSIGNED_BYTE,0,panelColors);
    } else {
        glDisableClientState(GL_COLOR_ARRAY);
    }
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,_filter); 
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,_filter); 
}

void hgio_setBlendModeFlat( int mode )
{
    //�u�����h���[�h�ݒ�
    switch( mode ) {
        case 0:                     //no blend
            glDisable(GL_BLEND);
            break;
        case 3:                     //blend+alpha
        case 4:                     //blend+alpha
            glEnable(GL_BLEND);
            //glBlendEquationOES(GL_FUNC_ADD_OES);
            glBlendFunc(GL_ONE,GL_ONE_MINUS_SRC_ALPHA);
            break;
        case 5:                     //add
            glEnable(GL_BLEND);
            //glBlendEquationOES(GL_FUNC_ADD_OES);
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        case 6:                     //sub
            glEnable(GL_BLEND);
            //glBlendEquationOES(GL_FUNC_REVERSE_SUBTRACT_OES);
            glBlendFunc(GL_SRC_ALPHA,GL_ONE);
            break;
        default:                    //normal blend
            glEnable(GL_BLEND);
            //glBlendEquationOES(GL_FUNC_ADD_OES);
            glBlendFunc(GL_ONE,GL_ONE_MINUS_SRC_ALPHA);
            break;
    }
}

//�F�̎w��
void hgio_setColor( int color )
{
    _color.r = (color>>16)&0xff;
    _color.g = (color>>8)&0xff;
    _color.b = (color)&0xff;
    _color.a = 0xff;
}

//���C�����̎w��
void hgio_setLineWidth( int lineWidth )
{
    glLineWidth(lineWidth);
    glPointSize(lineWidth*0.6f);
}

//�t���b�v���[�h�̎w��
void hgio_setFlipMode( int flipMode )
{
    _flipMode=flipMode;
}

//���_�̎w��
void hgio_setOrigin( int x, int y )
{
    _originX=x;
    _originY=y;
}

/*-------------------------------------------------------------------------------*/

void hgio_clsmode( int mode, int color, int tex )
{
	SetSysReq( SYSREQ_CLSMODE, mode );
	SetSysReq( SYSREQ_CLSCOLOR, color );
	SetSysReq( SYSREQ_CLSTEX, tex );
}


int hgio_getWidth( void )
{
	return _bgsx;
}


int hgio_getHeight( void )
{
	return _bgsy;
}


void hgio_setfilter( int type, int opt )
{
	hgio_setFilterMode( type );
}


int hgio_dialog( int mode, char *str1, char *str2 )
{
	LOGW( str1 );
	return 0;
}


int hgio_title( char *str1 )
{
	return 0;
}


int hgio_stick( int actsw )
{
	int ckey = 0;
	if ( mouse_btn ) ckey|=256;	// mouse_l
    return ckey;
}


int hgio_font( char *fontname, int size, int style )
{
	return 0;
}


int hgio_mes( BMSCR *bm, char *str1 )
{
	hgio_putTexFont( bm->cx, bm->cy, str1 );
	bm->printsizey = font_sy;
	//LOGI( str1 );
	return 0;
}


int hgio_render_start( void )
{
	if ( drawflag ) {
		hgio_render_end();
	}

	if ( GetSysReq( SYSREQ_CLSMODE ) == CLSMODE_SOLID ) {
		int ccol = GetSysReq( SYSREQ_CLSCOLOR );
		hgio_setClear( (ccol>>16)&0xff, (ccol>>8)&0xff, (ccol)&0xff );
		hgio_clear();
	}

	hgio_reset();

	drawflag = 1;
	return 0;
}


int hgio_render_end( void )
{
	int res;
	res = 0;
	if ( drawflag == 0 ) return 0;

    //�㏈��
    if (appengine->display == NULL) {
        // display������
        return 0;
    }
    eglSwapBuffers(appengine->display, appengine->surface);

	drawflag = 0;
	return res;
}


void hgio_screen( BMSCR *bm )
{
    mainbm = bm;
}


void hgio_delscreen( BMSCR *bm )
{
	if ( bm->flag == BMSCR_FLAG_NOUSE ) return;
	if ( bm->texid != -1 ) {
		DeleteTex( bm->texid );
		//gb_delimage( bm->texid );
		bm->texid = -1;
	}
}


int hgio_redraw( BMSCR *bm, int flag )
{
	if ( bm == NULL ) return -1;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	if ( flag & 1 ) {
		hgio_render_end();
	} else {
		hgio_render_start();
	}
	return 0;
}


int hgio_texload( BMSCR *bm, char *fname )
{
	TEXINF *t;
	int texid;

	hgio_delscreen( bm );

	texid = RegistTex( fname );
	if ( texid < 0 ) return -1;

	t = GetTex( texid );
	if ( t->mode == TEXMODE_NONE ) return -1;

	bm->sx = t->sx;
	bm->sy = t->sy;
	bm->texid = texid;

	return texid;
}

/*-------------------------------------------------------------------------------*/

//�|�C���g�J���[�ݒ�
void hgio_panelcolor( int color, int aval )
{
    int rval,gval,bval;
    rval = (color>>16)&0xff;
    gval = (color>>8)&0xff;
    bval = (color)&0xff;
    
    for (int i=0;i<4;i++) {
        panelColors[i*4  ]=rval;
        panelColors[i*4+1]=gval;
        panelColors[i*4+2]=bval;
        panelColors[i*4+3]=aval;
    }
    glEnableClientState(GL_COLOR_ARRAY);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,panelColors);
}

//�|�C���g�`��
void hgio_pset( float x, float y )
{
    GLfloat _vertexs[16*3];
    GLbyte  _colors[16*4];

     //���_�z����
     _vertexs[0]= x;_vertexs[1]=-y;_vertexs[2]=0;
     
     //�J���[�z����
     _colors[0]=_color.r;
     _colors[1]=_color.g;
     _colors[2]=_color.b;
     _colors[3]=_color.a;

    hgio_setBlendModeFlat(0);
    glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_POINTS,0,1);
}

//���C���̕`��
void hgio_line( float x0, float y0, float x1, float y1 )
{
    GLfloat _vertexs[16*3];
    GLbyte  _colors[16*4];

     //���_�z����
     _vertexs[0]= x0;_vertexs[1]=-y0;_vertexs[2]=0;
     _vertexs[3]= x1;_vertexs[4]=-y1;_vertexs[5]=0;     
     
     //�J���[�z����
     for (int i=0;i<2;i++) {
         _colors[i*4  ]=_color.r;
         _colors[i*4+1]=_color.g;
         _colors[i*4+2]=_color.b;
         _colors[i*4+3]=_color.a;
     }

    //���C���̕`��
    hgio_setBlendModeFlat(0);
    glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_LINE_STRIP,0,2);
}

//��`�̕`��
void hgio_rect( float x, float y, float w, float h )
{
    GLfloat _vertexs[16*3];
    GLbyte  _colors[16*4];

    //���_�z����
    _vertexs[0]= x;  _vertexs[1] =-y;  _vertexs[2] =0;
    _vertexs[3]= x;  _vertexs[4] =-y-h;_vertexs[5] =0;  
    _vertexs[6]= x+w;_vertexs[7] =-y-h;_vertexs[8] =0;
    _vertexs[9]= x+w;_vertexs[10]=-y;  _vertexs[11]=0;  
    
    //�J���[�z����
    for (int i=0;i<4;i++) {
        _colors[i*4  ]=_color.r;
        _colors[i*4+1]=_color.g;
        _colors[i*4+2]=_color.b;
        _colors[i*4+3]=_color.a;
    }

    //���C���̕`��
    hgio_setBlendModeFlat(0);
    glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_LINE_LOOP,0,4);
}

//��`�̓h��ׂ�
void hgio_boxf( float x, float y, float w, float h )
{
    GLfloat _vertexs[16*3];
    GLbyte  _colors[16*4];

     //���_�z����
     _vertexs[0]= x;  _vertexs[1] =-y;  _vertexs[2] =0;
     _vertexs[3]= x;  _vertexs[4] =-y-h;_vertexs[5] =0;  
     _vertexs[6]= x+w;_vertexs[7] =-y;  _vertexs[8] =0;
     _vertexs[9]= x+w;_vertexs[10]=-y-h;_vertexs[11]=0;  
     
     //�J���[�z����
     for (int i=0;i<4;i++) {
         _colors[i*4  ]=_color.r;
         _colors[i*4+1]=_color.g;
         _colors[i*4+2]=_color.b;
         _colors[i*4+3]=_color.a;
     }

    //�O�p�`�̕`��
    hgio_setBlendModeFlat(0);
    glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}

//�~�̕`��
void hgio_circle( float x, float y, float rx, float ry )
{
    GLfloat _vertexs[256*3];
    GLbyte  _colors[256*4];
    int length=20;
    
     //���_�z����
     for (int i=0;i<length;i++) {
         float angle=2*M_PI*i/length;
         _vertexs[i*3+0]= x+cos(angle)*rx;
         _vertexs[i*3+1]=-y+sin(angle)*ry;
         _vertexs[i*3+2]=0;
     }
     
     //�J���[�z����
     for (int i=0;i<length;i++) {
         _colors[i*4  ]=_color.r;
         _colors[i*4+1]=_color.g;
         _colors[i*4+2]=_color.b;
         _colors[i*4+3]=_color.a;
     }

    //���C���̕`��
    hgio_setBlendModeFlat(0);
    glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_LINE_LOOP,0,length);
    glDrawArrays(GL_POINTS,0,length);
}

//�~�̓h��ׂ�
void hgio_circleFill( float x, float y, float rx, float ry )
{
    GLfloat _vertexs[256*3];
    GLbyte  _colors[256*4];
    int length=20+2;
    
     //���_�z����
     _vertexs[0]= x;
     _vertexs[1]=-y;
     _vertexs[2]=0;
     for (int i=1;i<length;i++) {
         float angle=2*M_PI*i/(length-2);
         _vertexs[i*3+0]= x+cos(angle)*rx;
         _vertexs[i*3+1]=-y+sin(angle)*ry;
         _vertexs[i*3+2]=0;
     }
     
     //�J���[�z����
     for (int i=0;i<length;i++) {
         _colors[i*4  ]=_color.r;
         _colors[i*4+1]=_color.g;
         _colors[i*4+2]=_color.b;
         _colors[i*4+3]=_color.a;
     }

    //���C���̕`��
    hgio_setBlendModeFlat(0);
    glBindTexture(GL_TEXTURE_2D,0);
    glEnableClientState(GL_COLOR_ARRAY);
    glVertexPointer(3,GL_FLOAT,0,_vertexs);
    glColorPointer(4,GL_UNSIGNED_BYTE,0,_colors);
    glDrawArrays(GL_TRIANGLE_FAN,0,length);
}


//		��`(��])�`��
//
void hgio_fillrot( BMSCR *bm, float x, float y, float sx, float sy, float ang )
{
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;
    
    GLfloat *flp;
	GLfloat x0,y0,x1,y1,ofsx,ofsy;
    int arate;
    
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
    
    flp = vertf2D;
    
	*flp++ = (-x0-x1) + x;
	*flp++ = -((-y0-y1) + y);

	*flp++ = (-x0+x1) + x;
	*flp++ = -((-y0+y1) + y);
    
	*flp++ = (x0-x1) + x;
	*flp++ = -((y0-y1) + y);
    
	*flp++ = (x0+x1) + x;
	*flp++ = -((y0+y1) + y);

    glBindTexture(GL_TEXTURE_2D,0);
    glVertexPointer(2,GL_FLOAT,0,vertf2D);
    arate = bm->gfrate;
    if ( bm->gmode < 3 ) arate = 255;

	hgio_panelcolor( bm->color, arate );
	hgio_setBlendModeFlat( bm->gmode );

    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}

/*-------------------------------------------------------------------------------*/

void hgio_fcopy( float distx, float disty, short xx, short yy, short srcsx, short srcsy, int texid )
{
	//		�摜�R�s�[(�t�H���g�p)
	//		texid����(xx,yy)-(xx+srcsx,yy+srcsy)�����݂̉�ʂɓ��{�ŃR�s�[
	//		�`�惂�[�h��3,100%�A�]�����distx,disty
	//
	TEXINF *tex = GetTex( texid );
	if ( tex->mode == TEXMODE_NONE ) return;

    GLfloat *flp;
    GLfloat x1,y1,x2,y2;
    float ratex,ratey;

    flp = vertf2D;
    x1 = (GLfloat)distx;
    y1 = (GLfloat)-disty;
    x2 = x1+srcsx;
    y2 = y1-srcsy;

    *flp++ = x1;
    *flp++ = y1;
    *flp++ = x1;
    *flp++ = y2;
    *flp++ = x2;
    *flp++ = y1;
    *flp++ = x2;
    *flp++ = y2;

    //ratex = 1.0f / image.width;
    //ratey = 1.0f / image.height;
    ratex = tex->ratex;
    ratey = tex->ratey;

    flp = uvf2D;
    x1 = ((GLfloat)xx) * ratex;
    y1 = ((GLfloat)yy) * ratey;
    x2 = ((GLfloat)(xx+srcsx)) * ratex;
    y2 = ((GLfloat)(yy+srcsy)) * ratey;
    
    *flp++ = x1;
    *flp++ = y1;
    *flp++ = x1;
    *flp++ = y2;
    *flp++ = x2;
    *flp++ = y1;
    *flp++ = x2;
    *flp++ = y2;

	ChangeTex( tex->texid );
//    glBindTexture( GL_TEXTURE_2D, tex->texid );
    glVertexPointer( 2, GL_FLOAT,0,vertf2D );
    glTexCoordPointer( 2,GL_FLOAT,0,uvf2D );

	hgio_setBlendMode( 3, 255 );
//    glDisableClientState(GL_COLOR_ARRAY);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}


void hgio_copy( BMSCR *bm, short xx, short yy, short srcsx, short srcsy, BMSCR *bmsrc, float psx, float psy )
{
	//		�摜�R�s�[
	//		texid����(xx,yy)-(xx+srcsx,yy+srcsy)�����݂̉�ʂ�(psx,psy)�T�C�Y�ŃR�s�[
	//		�J�����g�|�W�V�����A�`�惂�[�h��BMSCR����擾
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	TEXINF *tex = GetTex( bmsrc->texid );
	if ( tex->mode == TEXMODE_NONE ) return;

    GLfloat *flp;
    GLfloat x1,y1,x2,y2;
    float ratex,ratey;
    
    flp = vertf2D;
    x1 = (GLfloat)bm->cx;
    y1 = (GLfloat)-bm->cy;
    x2 = x1+psx;
    y2 = y1-psy;
    
    *flp++ = x1;
    *flp++ = y1;
    *flp++ = x1;
    *flp++ = y2;
    *flp++ = x2;
    *flp++ = y1;
    *flp++ = x2;
    *flp++ = y2;

    //ratex = 1.0f / image.width;
    //ratey = 1.0f / image.height;
    ratex = tex->ratex;
    ratey = tex->ratey;

    flp = uvf2D;
    x1 = ((GLfloat)xx) * ratex;
    y1 = ((GLfloat)yy) * ratey;
    x2 = ((GLfloat)(xx+srcsx)) * ratex;
    y2 = ((GLfloat)(yy+srcsy)) * ratey;
    
    *flp++ = x1;
    *flp++ = y1;
    *flp++ = x1;
    *flp++ = y2;
    *flp++ = x2;
    *flp++ = y1;
    *flp++ = x2;
    *flp++ = y2;

	ChangeTex( tex->texid );
//    glBindTexture( GL_TEXTURE_2D, tex->texid );
    glVertexPointer( 2, GL_FLOAT,0,vertf2D );
    glTexCoordPointer( 2,GL_FLOAT,0,uvf2D );

	hgio_setBlendMode( bm->gmode, bm->gfrate );
//    glDisableClientState(GL_COLOR_ARRAY);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}


void hgio_copyrot( BMSCR *bm, short xx, short yy, short srcsx, short srcsy, float s_ofsx, float s_ofsy, BMSCR *bmsrc, float psx, float psy, float ang )
{
	//		�摜�R�s�[
	//		texid����(xx,yy)-(xx+srcsx,yy+srcsy)�����݂̉�ʂ�(psx,psy)�T�C�Y�ŃR�s�[
	//		�J�����g�|�W�V�����A�`�惂�[�h��BMSCR����擾
	//
	if ( bm == NULL ) return;
	if ( bm->type != HSPWND_TYPE_MAIN ) throw HSPERR_UNSUPPORTED_FUNCTION;

	TEXINF *tex = GetTex( bmsrc->texid );
	if ( tex->mode == TEXMODE_NONE ) return;

    GLfloat *flp;
    float ratex,ratey;

	int texpx,texpy,texid;
	GLfloat x,y,x0,y0,x1,y1,ofsx,ofsy,mx0,mx1,my0,my1;
	GLfloat tx0,ty0,tx1,ty1,sx,sy;

    //Alertf( "(%d,%d)(%d,%d)(%f,%f)",xx,yy,srcsx,srcsy,psx,psy );
    
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
    
	/*-------------------------------*/
    
	//		��]���W�̎Z�o
	ofsx = -psx;
	ofsy = -psy;
	x0 = mx0 * ofsy;
	y0 = my0 * ofsy;
	x1 = mx1 * ofsx;
	y1 = my1 * ofsx;
    
	/*-------------------------------*/
    
	sx = tex->ratex;
	sy = tex->ratey;
    //sx = 1.0f / image.width;
    //sy = 1.0f / image.height;
	texpx = xx + srcsx;
	texpy = yy + srcsy;
    
	tx0 = ((float)xx) * sx;
	ty0 = ((float)yy) * sy;
	tx1 = ((float)(texpx)) * sx;
	ty1 = ((float)(texpy)) * sy;

    flp = uvf2D;
    *flp++ = tx0;
    *flp++ = ty0;
    *flp++ = tx0;
    *flp++ = ty1;
    *flp++ = tx1;
    *flp++ = ty0;
    *flp++ = tx1;
    *flp++ = ty1;

	/*-------------------------------*/

    flp = vertf2D;
    
	*flp++ = (x);
	*flp++ = -(y);
    
	/*-------------------------------*/

	*flp++ = ((-x0) + x);
	*flp++ = -((-y0) + y);
    
	/*-------------------------------*/
    
	*flp++ = ((x1) + x);
	*flp++ = -((y1) + y);
    
	/*-------------------------------*/

	*flp++ = ((-x0+x1) + x);
	*flp++ = -((-y0+y1) + y);
    
	/*-------------------------------*/
    
	ChangeTex( tex->texid );
    //glBindTexture(GL_TEXTURE_2D,image.name);

    glVertexPointer(2,GL_FLOAT,0,vertf2D);
    glTexCoordPointer(2,GL_FLOAT,0,uvf2D);

	hgio_setBlendMode( bm->gmode, bm->gfrate );
    //glDisableClientState(GL_COLOR_ARRAY);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
}


/*-------------------------------------------------------------------------------*/

void hgio_touch( int xx, int yy, int button )
{
	mouse_x = xx * _scaleX;
	mouse_y = yy * _scaleY;
	mouse_btn = button;
    if ( mainbm != NULL ) {
        mainbm->savepos[BMSCR_SAVEPOS_MOSUEX] = mouse_x;
        mainbm->savepos[BMSCR_SAVEPOS_MOSUEY] = mouse_y;
    }
}

int hgio_getmousex( void )
{
	return mouse_x;
}


int hgio_getmousey( void )
{
	return mouse_y;
}


int hgio_getmousebtn( void )
{
	return mouse_btn;
}

/*-------------------------------------------------------------------------------*/

void hgio_putTexFont( int x, int y, char *msg )
{
	int xx,yy,tx,ty;
	char a;
	char *p;

	p = msg;
	xx = x; yy = y;

	while(1) {
		a = (int)*p++;
		if ( a == 0 ) break;

		tx = ( a & 15 ) * font_sx;
		ty = ( a >> 4 ) * font_sy;
		hgio_fcopy( xx, yy, tx, ty, font_sx, font_sy, font_texid );
		xx += font_sx;
	}
}


void hgio_test(void)
{
    // �`�悷��
    hgio_render_start();
    //hgio_clear();
    
	hgio_setColor( 0xff00ff );
	hgio_boxf( 100,100,200,50 );
	hgio_setColor( 0xffffff );
	hgio_line( 0,0,400,300 );
	hgio_setColor( 0xffff00 );
	hgio_circleFill( 640,400,200,200 );

	hgio_putTexFont( 0,0, (char *)"This is Android Test." );
	//hgio_fcopy( 0,0,  0, 0, 256, 128, font_texid );

    hgio_render_end();
}


