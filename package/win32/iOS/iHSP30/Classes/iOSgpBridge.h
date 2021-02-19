
//
//	iOSgpBridge.cpp structures
//
#ifndef __iosgpbridge_h
#define __iosgpbridge_h

int gpb_dialog( int type, char *msg, char *msg2 );
int gpb_exec( int type, char *name );

void gpb_getSysModel( char *outbuf );
void gpb_getSysVer( char *outbuf );

void gpb_textsize( char *msg, int size, int style, int *out_x, int *out_y );
void gpb_textbitmap( char *msg, int fontsize, int fontstyle, char *buffer, int pitch );

#endif
