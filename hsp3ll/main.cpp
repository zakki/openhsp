
//
//	HSP3CNV : HSP Code Converter Manager
//				   onion software 2008/4
//

#include <stdio.h>
#include <windows.h>
#include <direct.h>

#include "chsp3.h"
#include "chsp3rev.h"
#include "chsp3llvm.h"
#include "../hsp3/win32gui/hsp3win.h"


//#define HSP3CNV_DEBUG			// デバッグモード用
extern void DumpResult();

CHsp3Op* hsp3;

/*----------------------------------------------------------*/

int GetFilePath( char *bname )
{
	//		フルパス名から、ファイルパスの取得(\を残す)
	//
	int a,b,len;
	char a1;
	b=-1;
	len=(int)strlen(bname);
	for(a=0;a<len;a++) {
		a1=bname[a];
		if (a1=='\\') b=a;
		if (a1<0) a++; 
	}
	if (b<0) return 1;
	bname[b+1]=0;
	return 0;
}

/*----------------------------------------------------------*/

void usage1( void )
{
static char *p[] = {
	"usage: hsp3cnv [options] [filename]",
	"       -o??? set output file to ???",
	NULL };
	int i;
	for(i=0; p[i]; i++)
		printf( "%s\n", p[i]);
	return;
}


static int initHsp( char *fname )
{
	int st = 0;

	if (fname[0]==0) {
		printf("No file name selected.\n");
		return 1;
	}

	hsp3 = new CHsp3Op();
	int i = hsp3->LoadObjectFile( fname );
	if (i) {
		char buffer[1024];
		sprintf(buffer,  "File open error.[%s](%d)\n", fname, i );
		MessageBox(NULL , buffer, TEXT("hsp") , MB_ICONINFORMATION);
		return 1;
	}
	hsp3->MakeSource( 0, NULL );
	MakeSource( hsp3, 0, NULL );
/*
#ifndef HSP3CNV_DEBUG
		hsp3->SaveOutBuf( oname2 );
#else
		hsp3->SaveOutBuf( "test.cpp" );
		puts( hsp3->GetOutBuf() );
#endif
*/
	return st;
}


/*----------------------------------------------------------*/

int APIENTRY WinMain ( HINSTANCE hInstance,
					   HINSTANCE hPrevInstance,
					   LPSTR lpCmdParam,
					   int iCmdShow )
{
	initHsp(lpCmdParam);

	int res;
//#ifdef HSPDEBUG
	res = hsp3win_init( hInstance, lpCmdParam );
//#else
//	res = hsp3win_init( hInstance, NULL );
//#endif
	if ( res == 0 ) {
		res = hsp3win_exec();
	}

	DumpResult();

	return res;
}
