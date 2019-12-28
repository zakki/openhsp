//
//	ios Bridge for HGIMG4
//

#include <stdio.h>
#include <math.h>

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <QuartzCore/CAEAGLLayer.h>

#import "iOSgpBridge.h"

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

int gpb_dialog( int type, char *msg, char *msg_sub )
{
    //Alertf( "dialog: %s,%d", msg, type);
    //[hspview dispDialog:type Msg:msg MsgSub:msg_sub];
    return 0;
}

int gpb_exec( int type, char *name )
{
	NSString *fname = [[NSString alloc] initWithUTF8String:name];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:fname]];
    [fname release];
    return 0;
}

void gpb_getSysModel( char *outbuf )
{
	NSString *dev = [[UIDevice currentDevice]model];
    sprintf( outbuf, "%s", [dev cStringUsingEncoding:1] );
}

void gpb_getSysVer( char *outbuf )
{
	NSString *version = [[UIDevice currentDevice]systemVersion];
    sprintf( outbuf, "iOS %s", [version cStringUsingEncoding:1] );
}


static int mestext_sx;
static int mestext_sy;

void gpb_textsize( char *msg, int fontsize, int fontstyle, int *out_x, int *out_y )
{
	NSString *text = [[NSString alloc] initWithUTF8String:msg];

	UIFont *font = [UIFont systemFontOfSize:fontsize];
    CGSize size=[text sizeWithFont:font constrainedToSize:CGSizeMake(1024,CGFLOAT_MAX)
    lineBreakMode:NSLineBreakByWordWrapping];
	mestext_sx = size.width;
	mestext_sy = size.height;
	*out_x = mestext_sx;
	*out_y = mestext_sy;
}


void gpb_textbitmap( char *msg, int fontsize, int fontstyle, char *buffer, int pitch )
{
	NSString *text = [[NSString alloc] initWithUTF8String:msg];
	UIFont *font = [UIFont systemFontOfSize:fontsize];

    //ラベルの生成
    UILabel* label=[[[UILabel alloc] init] autorelease]; 
	CGSize size=[text sizeWithFont:font constrainedToSize:CGSizeMake(1024,CGFLOAT_MAX)
        lineBreakMode:NSLineBreakByWordWrapping];

	mestext_sx = size.width;
	mestext_sy = size.height;

    [label setFrame:CGRectMake(0,0,size.width,size.height)];
    [label setText:text];
    [label setFont:font];
    //[label setTextColor:color];
    [label setTextAlignment:NSTextAlignmentLeft];
    //[label setBackgroundColor:bgcolor];
    [label setNumberOfLines:0];

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(buffer,
                                             pitch,
                                             mestext_sy,
                                             8,
                                             4 * pitch,
                                             colorSpace,
                                             kCGImageAlphaPremultipliedFirst);

    //コンテキストの設定
    UIGraphicsPushContext(context);
    CGContextTranslateCTM(context,0,mestext_sy);
    CGContextScaleCTM(context,1,-1);    
    
    //ラベルの描画
    [label.layer renderInContext:context];
    
    //コンテキストの設定解放
    UIGraphicsPopContext();
    
    //コンテキストの解放
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
}


