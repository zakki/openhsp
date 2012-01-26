//
//	a_graphics.cpp header
//
#ifndef __hgiox_h
#define __hgiox_h

#ifdef __cplusplus
extern "C" {
#endif

//�t���b�v�萔
#define GRAPHICS_FLIP_NONE       -1
#define GRAPHICS_FLIP_HORIZONTAL  0
#define GRAPHICS_FLIP_VERTICAL    2

struct BMSCR;

//	for public use

void hgio_init( int mode, int sx, int sy, void *hwnd );
void hgio_clear( void );
void hgio_reset( void );
void hgio_term( void );

void hgio_clsmode( int mode, int color, int tex );
int hgio_getWidth( void );
int hgio_getHeight( void );
void hgio_setfilter( int type, int opt );

int hgio_dialog( int mode, char *str1, char *str2 );
int hgio_title( char *str1 );
int hgio_stick( int actsw );

int hgio_font( char *fontname, int size, int style );
int hgio_mes( struct BMSCR *bm, char *str1 );

int hgio_render_start( void );
int hgio_render_end( void );
void hgio_screen( struct BMSCR *bm );
void hgio_delscreen( struct BMSCR *bm );
int hgio_redraw( struct BMSCR *bm, int flag );
int hgio_texload( struct BMSCR *bm, char *fname );

void hgio_fillrot( struct BMSCR *bm, float x, float y, float sx, float sy, float ang );
void hgio_fcopy( float distx, float disty, short xx, short yy, short srcsx, short srcsy, int texid );
void hgio_copy( struct BMSCR *bm, short xx, short yy, short srcsx, short srcsy, struct BMSCR *bmsrc, float psx, float psy );
void hgio_copyrot( struct BMSCR *bm, short xx, short yy, short srcsx, short srcsy, float ofsx, float ofsy, struct BMSCR *bmsrc, float psx, float psy, float ang );
void hgio_putTexFont( int x, int y, char *msg );


//	for internal use

void hgio_setClear( int rval, int gval ,int bval );
void hgio_setFilterMode( int mode );
void hgio_setBlendMode( int mode, int aval );
void hgio_setBlendModeFlat( int mode );

//�F�̎w��
void hgio_setColor( int color );
//���C�����̎w��
void hgio_setLineWidth( int lineWidth );
//�t���b�v���[�h�̎w��
void hgio_setFlipMode( int flipMode );
//���_�̎w��
void hgio_setOrigin( int x, int y );
//�|�C���g�J���[�ݒ�
void hgio_panelcolor( int color, int aval );


//�|�C���g�`��
void hgio_pset( float x, float y );
//���C���̕`��
void hgio_line( float x0, float y0, float x1, float y1 );
//��`�̕`��
void hgio_rect( float x, float y, float w, float h );
//��`�̓h��ׂ�
void hgio_boxf( float x, float y, float w, float h );
//�~�̕`��
void hgio_circle( float x, float y, float rx, float ry );
//�~�̓h��ׂ�
void hgio_circleFill( float x, float y, float rx, float ry );

void hgio_touch( int xx, int yy, int button );
int hgio_getmousex( void );
int hgio_getmousey( void );
int hgio_getmousebtn( void );

void hgio_test(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif



