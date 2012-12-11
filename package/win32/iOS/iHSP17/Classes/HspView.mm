#import "HspView.h"
#import "iOSBridge.h"
#include "../hsp3/hsp3config.h"
#include "../hsp3/hgio.h"
#include "../hsp3embed/hsp3embed.h"
#include "../hsp3/sysreq.h"

void gb_setogl( EAGLContext *context, GLuint viewRenderBuff, GLuint viewFrameBuff );

//HspViewの実装
@implementation HspView

//フレームの初期化
- (id)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        InitSysReq();
        //グラフィックスの生成
        int sx,sy;
        sx = frame.size.width;
        sy = frame.size.height;
        disp_sx = sx;
        disp_sy = sy;
        _screenx = sx;
        _screeny = sy;
       
        _scalefix = [UIScreen mainScreen].scale;
        _scaleuse = 1.0f;

        NSLog(@"Init HspView(%d,%d)",sx,sy);
        hgio_init( 0, sx, sy, NULL );

        accelerometer = nil;
    }
    act_mode = 0;
    return self;
}

//メモリ解放
- (void)dealloc {
	hsp3eb_bye();
	hgio_term();
    if ( accelerometer != nil ) [accelerometer release];
    [super dealloc];
}

//セットアップ
- (void)setup {
    //グラフィックスのセットアップ
    gb_sethspview( self );
    gb_setogl( _context, _viewRenderBuff, _viewFrameBuff );
    gb_reset( _screenx, _screeny );
//    gb_reset( self.bgWidth, self.bgHeight );
	hsp3eb_init();
    act_mode = 1;
}

//定期処理
- (void)onTick {

    if ( act_mode == ACTMODE_NORMAL ) {
        //hsp3eb_exec();
        hsp3eb_exectime( hgio_gettick() );
        //	gb_dbgtest();
    }
}


- (void)clsMode:(int)mode color:(int)color
{
    hgio_clsmode( mode, color, 0 );
    cls_mode = mode;
    cls_color = color;
}


- (void)actMode:(int)amode
{
    if ( act_mode & ACTMODE_LOCK ) {
        if ( amode & ACTMODE_LOCK ) {
            act_mode = amode & ACTMODE_NORMAL;
        }
    } else {
        act_mode = amode;
    }
}

- (void)UseAccelerometer:(float)freq
{
    accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.updateInterval = freq;
    accelerometer.delegate = self;
}


- (void)useRetina {

    CAEAGLLayer* eaglLayer=(CAEAGLLayer*)self.layer;

    if ( _scalefix > 1.0f ) {
        _scaleuse = _scalefix;
        self.contentScaleFactor = _scalefix;
        eaglLayer.contentsScale = _scalefix;
        _screenx = (int)((float)disp_sx * _scalefix);
        _screeny = (int)((float)disp_sy * _scalefix);
    
        hgio_size( _screenx, _screeny );
        hgio_scale( _scalefix, _scalefix );
    }
}


- (void)dispMode:(int)dmode
{
    disp_mode = dmode;
}


- (void)dispRotate:(int)rmode
{
    CGAffineTransform tf;
    float adj;
    adj = ((float)abs( disp_sx - disp_sy )) * 0.5f;
    //NSLog(@"Init Adj(%f)(%d,%d)",adj,disp_sx , disp_sy);
    switch( rmode ) {
        case 1:
            tf = CGAffineTransformMakeRotation(M_PI * 1.5f);
            tf = CGAffineTransformTranslate( tf, -adj, -adj );
            self.transform = tf;
            break;
        case 2:
            tf = CGAffineTransformMakeRotation(M_PI);
            self.transform = tf;
            break;
        case 3:
            tf = CGAffineTransformMakeRotation(M_PI * 0.5f);
            tf = CGAffineTransformTranslate( tf, adj, adj );
            self.transform = tf;
            break;
        default:
            break;
    }
}


- (void)dispDialog:(int)type Msg:(char *)msg MsgSub:(char *)msg_sub
{
	NSString *msg1 = [[NSString alloc] initWithUTF8String:msg];
	NSString *msg2 = nil;
    UIAlertView *view_alert;
    if ( *msg_sub != 0 ) {
        msg2 = [[NSString alloc] initWithUTF8String:msg_sub];
    }
    
    dialog_type = type;
    if ( type&2 ) {
        view_alert = [[UIAlertView alloc] initWithTitle:msg2
                                                message:msg1
                                               delegate:self
                                      cancelButtonTitle:@"いいえ"
                                      otherButtonTitles:@"はい",nil
                      ];
    } else {
        view_alert = [[UIAlertView alloc] initWithTitle:msg2
                                                message:msg1
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil
                      ];
    }

    [self actMode:ACTMODE_LOCK|ACTMODE_STOP];
    
    [view_alert show];
    [view_alert release];
    [msg1 release];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ( dialog_type & 2 ) {
        if ( buttonIndex == 0 )  hsp3eb_setstat(7);
        if ( buttonIndex == 1 )  hsp3eb_setstat(6);
    } else {
        hsp3eb_setstat(0);
    }
    [self actMode:ACTMODE_LOCK|ACTMODE_NORMAL];
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];
	NSInteger taps = [touch tapCount];
	
	[super touchesBegan:touches withEvent:event];

	hgio_touch( location.x * _scaleuse, location.y * _scaleuse, 1 );
	//NSLog(@"タップ開始 %f, %f  タップ数：%d", location.x, location.y, taps);
}


- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint oldLocation = [touch previousLocationInView:self];
	CGPoint newLocation = [touch locationInView:self];
	
	[super touchesMoved:touches withEvent:event];
	
	hgio_touch( newLocation.x * _scaleuse, newLocation.y * _scaleuse, 1 );
	//NSLog(@"指の動き：%f , %f から %f, %f", oldLocation.x, oldLocation.y, newLocation.x, newLocation.y);
}


- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {	
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];
	
	[super touchesEnded:touches withEvent:event];
	
	hgio_touch( location.x * _scaleuse, location.y * _scaleuse, 0 );
	//NSLog(@"タップ終了 %f, %f", location.x, location.y);	
}

- (void) accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
    hgio_setinfo( HGIO_INFO_ACCEL_X, (HSPREAL)acceleration.x );
    hgio_setinfo( HGIO_INFO_ACCEL_Y, (HSPREAL)acceleration.y );
    hgio_setinfo( HGIO_INFO_ACCEL_Z, (HSPREAL)acceleration.z );
	//[view SetAccel_x:acceleration.x accy:acceleration.y accz:acceleration.z];
	//NSLog(@"---%g,%g,%g", x,y,z );
	//[glView updateAccelerometer:accelerometer.x Y:accelerometer.y Z:accelerometer.z];
}


- (void)dispViewX:(int)x Y:(int)y
{
    hgio_view(x,y);
}

- (void)dispScaleX:(int)x Y:(int)y
{
    hgio_scale(x, y);
}

- (void)dispAutoScale:(int)mode
{
    hgio_autoscale(mode);
}


@end
