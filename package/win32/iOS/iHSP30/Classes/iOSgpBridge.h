
//
//	iOSgpBridge.cpp structures
//
#ifndef __iosgpbridge_h
#define __iosgpbridge_h

int gb_dialog( int type, char *msg, char *msg2 );
int gb_exec( int type, char *name );

void gb_getSysModel( char *outbuf );
void gb_getSysVer( char *outbuf );
void gb_getLocale( char *outbuf );

void gpb_textsize( char *msg, int size, int style, int *out_x, int *out_y );
void gpb_textbitmap( char *msg, int fontsize, int fontstyle, char *buffer, int pitch );

#endif
