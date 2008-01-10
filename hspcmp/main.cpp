
//
//	HSPCC : HSP Code Compiler Manager
//				onion software 2002/12
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "supio.h"

#include "hsc3.h"
#include "token.h"

/*----------------------------------------------------------*/

static void addext( char *st, char *exstr )
{
	//	add extension of filename

	int a1;
	char c1;
	a1=0;while(1) {
		c1=st[a1];if (c1==0) break;
		if (c1=='.') break;
		a1++;
	}
	st[a1]='.'; st[a1+1]=0;
	strcat(st,exstr);
}

static int GetFilePath( char *bname )
{
	//		フルパス名から、ファイルパスの取得(\を残す)
	//
	int a,b,len;
	char a1;
	b=-1;
	len=strlen(bname);
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

static void usage1( void )
{
static 	char *p[] = {
	"usage: hspcmp [options] [filename]",
	"       -o??? set output file to ???",
	"       -d    add debug information",
	"       -p    preprocessor only",
	"       -c    HSP2.55 compatible mode",
	NULL };
	int i;
	for(i=0; p[i]; i++)
		printf( "%s\n", p[i]);
}

/*----------------------------------------------------------*/

int main( int argc, char *argv[] )
{
	char a1,a2;
	int b,st;
	int cmpopt,ppopt;
	char fname[_MAX_PATH];
	char fname2[_MAX_PATH];
	char oname[_MAX_PATH];
	char compath[_MAX_PATH];
	CHsc3 *hsc3=NULL;

	//	check switch and prm

	if (argc<2) { usage1();return -1; }

	st = 0; ppopt = 0; cmpopt = 0;
	fname[0]=0;
	fname2[0]=0;
	oname[0]=0;

	for (b=1;b<argc;b++) {
		a1=*argv[b];a2=tolower(*(argv[b]+1));
		if ((a1!='/')&&(a1!='-')) {
			strcpy(fname,argv[b]);
		} else {
			switch (a2) {
			case 'c':
				ppopt=1;break;
			case 'p':
				cmpopt=2;break;
			case 'd':
				cmpopt=1;break;
			case 'o':
				strcpy( oname,argv[b]+2 );
				break;
			default:
				st=1;break;
			}
		}
	}

	if (st) { printf("Illegal switch selected.\n");return 1; }
	if (fname[0]==0) { printf("No file name selected.\n");return 1; }


	if (oname[0]==0) {
		strcpy( oname,fname );addext( oname,"ax" );
	}
	strcpy( fname2, fname ); addext( fname2,"i" );
	addext( fname,"hsp" );

	//		call main

	hsc3 = new CHsc3;
	strcpy( compath,"common\\" );
	hsc3->SetCommonPath( compath );

	st = hsc3->PreProcess( fname, fname2, ppopt, fname );
	if (( cmpopt < 2 )&&( st == 0 )) {
		st = hsc3->Compile( fname2, oname, cmpopt );
	}
	puts( hsc3->GetError() );
	if ( hsc3 == NULL ) { delete hsc3; hsc3=NULL; }
	return st;
}

