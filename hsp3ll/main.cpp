
//
//	HSP3CNV : HSP Code Converter Manager
//				   onion software 2008/4
//

#include "llvm/LLVMContext.h"
#include "llvm/Module.h"
#include "llvm/Constants.h"
#include "llvm/DerivedTypes.h"
#include "llvm/Instructions.h"
#include "llvm/ExecutionEngine/JIT.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/Target/TargetSelect.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/raw_ostream.h"

#include <stdio.h>
#include <windows.h>
#include <direct.h>

#include "chsp3.h"
#include "chsp3rev.h"
#include "chsp3llvm.h"
#include "../hsp3/win32gui/hsp3win.h"


using namespace llvm;

//#define HSP3CNV_DEBUG			// デバッグモード用
extern void DumpResult();

CHsp3LLVM* hsp3;

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
static 	char *p[] = {
	"usage: hsp3cnv [options] [filename]",
	"       -o??? set output file to ???",
	NULL };
	int i;
	for(i=0; p[i]; i++)
		printf( "%s\n", p[i]);
	return;
}


int readAx( char *fname )
{
	int st;
	int cmpopt,ppopt;
	//char fname[_MAX_PATH];
	char fname2[_MAX_PATH];
	char oname[_MAX_PATH];
	//char oname2[_MAX_PATH];

	//	check switch and prm

	st = 0; ppopt = 0; cmpopt = 0;
//	fname[0]=0;
	fname2[0]=0;
	oname[0]=0;

#ifndef HSP3CNV_DEBUG

	int b;
	char a1,a2;

	if (fname[0]==0) { printf("No file name selected.\n"); return 1; }
#else
	strcpy( fname,"test" );
#endif

	if (oname[0]==0) {
		memset(oname, 0, _MAX_PATH);
		for (char* dest = oname, *src = fname; *src && *src != '.';)
			*(dest++) = *(src++);
		addext( oname,"hs" );

/*
		memset(oname2, 0, _MAX_PATH);
		for (char* dest = oname2, *src = fname; *src && *src != '.';)
			*(dest++) = *(src++);
		addext( oname2,"cpp" );
*/
	}
	strcpy( fname2, fname ); addext( fname2,"hsp" );
	addext( fname,"ax" );

	//		call main
	{
		int i;
//		CHsp3Cpp hsp3;
		CHsp3 hsp3;
		i = hsp3.LoadObjectFile( fname );
		if (i) {
			char buffer[1024];
			sprintf(buffer,  "File open error.[%s](%d)\n", fname, i );
			MessageBox(NULL , buffer, TEXT("hsp") , MB_ICONINFORMATION);
			return 1;
		}
		hsp3.MakeSource( 0, NULL );


//	MessageBox(NULL , fname, TEXT("hsp") , MB_ICONINFORMATION);
//	MessageBox(NULL , oname, TEXT("hsp") , MB_ICONINFORMATION);
#ifndef HSP3CNV_DEBUG
		//		hsp3.SaveOutBuf( oname );
#else
		hsp3.SaveOutBuf( "test.cpp" );
		puts( hsp3.GetOutBuf() );
#endif

	}
	{
		int i;
		hsp3 = new CHsp3LLVM();
		i = hsp3->LoadObjectFile( fname );
		if (i) {
			char buffer[1024];
			sprintf(buffer,  "File open error.[%s](%d)\n", fname, i );
			MessageBox(NULL , buffer, TEXT("hsp") , MB_ICONINFORMATION);
			return 1;
		}
		hsp3->MakeSource( 0, NULL );
/*
#ifndef HSP3CNV_DEBUG
		hsp3->SaveOutBuf( oname2 );
#else
		hsp3->SaveOutBuf( "test.cpp" );
		puts( hsp3->GetOutBuf() );
#endif
*/
	}

	return st;
}


/*----------------------------------------------------------*/

int APIENTRY WinMain ( HINSTANCE hInstance,
					   HINSTANCE hPrevInstance,
					   LPSTR lpCmdParam,
					   int iCmdShow )
{
  
	InitializeNativeTarget();

	readAx(lpCmdParam);

	int res;
#ifdef HSPDEBUG
	res = hsp3win_init( hInstance, lpCmdParam );
#else
	res = hsp3win_init( hInstance, NULL );
#endif
	if ( res == 0 ) {
		res = hsp3win_exec();
	}
	
	DumpResult();

	return res;
}
