#import "Canvas.h"
#import "Graphics.h"
#import "Image.h"

//HspViewの宣言
@interface HspView : Canvas <UIAlertViewDelegate,UIAccelerometerDelegate> {
    int act_mode;
    int disp_mode;
	int cls_mode;
	int cls_color;

    int dialog_type;
    int disp_sx, disp_sy;
    CGFloat      _scalefix;
    CGFloat      _scaleuse;
    int          _screenx;
    int          _screeny;
//  Graphics* _g;
//	Image*    _image;
    UIAccelerometer *accelerometer;
}
- (void)actMode:(int)amode;
- (void)dispMode:(int)dmode;
- (void)dispRotate:(int)rmode;
- (void)clsMode:(int)mode color:(int)color;
- (void)dispDialog:(int)type Msg:(char *)msg MsgSub:(char *)msg2;
- (void)dispViewX:(int)x Y:(int)y;
- (void)dispScaleX:(int)x Y:(int)y;
- (void)dispAutoScale:(int)mode;
- (void)UseAccelerometer:(float)freq;
- (void)useRetina;

#define ACTMODE_LOCK 2
#define ACTMODE_NORMAL 1
#define ACTMODE_STOP 0

@end
