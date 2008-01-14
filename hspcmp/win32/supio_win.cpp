
//
//	Basic I/O and Message buffer support
//	For both console and Windows application development
//	"supio.cpp"
//	onion software/onitama 1997
//
#include "../../hsp3/hsp3config.h"

#ifdef HSPWIN
#define USE_WINDOWS_API		// WINDOWS APIを使用する
#endif

#ifdef USE_WINDOWS_API
#include <windows.h>
#include <shlobj.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <direct.h>
#include <ctype.h>

#include "supio_win.h"

//
//		basic C I/O support
//

char *mem_ini( int size ) { return (char *)malloc(size); }
void mem_bye( void *ptr ) { free(ptr); }
int mem_load( char *fname, void *mem, int msize )
{
	FILE *fp;
	int flen;
	fp=fopen(fname,"rb");
	if (fp==NULL) return -1;
	flen = fread( mem, 1, msize, fp );
	fclose(fp);
	return flen;
}
int mem_save( char *fname, void *mem, int msize )
{
	FILE *fp;
	int flen;
	fp=fopen(fname,"wb");
	if (fp==NULL) return -1;
	flen = fwrite( mem, 1, msize, fp );
	fclose(fp);
	return flen;
}

int filecopy( char *fname, char *sname )
{
	FILE *fp;
	FILE *fp2;
	int flen, rval;
	int max=0x8000;
	char *mem;
	rval=1;
	mem=mem_ini(max);
	fp=fopen(fname,"rb");if (fp==NULL) goto jobov;
	fp2=fopen(sname,"wb");if (fp2==NULL) goto jobov;
	while(1) {
		flen = fread( mem, 1, max, fp );
		if (flen==0) break;
		fwrite( mem, 1, flen, fp2 );
		if (flen<max) break;
	}
	fclose(fp2);fclose(fp);
	rval=0;
jobov:
	mem_bye(mem);
	return rval;
}

void strcase( char *str )
{
	//	string case to lower
	//
	unsigned char a1;
	unsigned char *ss;
	ss=(unsigned char *)str;
	while(1) {
		a1=*ss;
		if (a1==0) break;
		if (a1>=0x80) {
			*ss++;
			a1=*ss++;
			if (a1==0) break;
		}
		else {
			*ss++=tolower(a1);
		}
	}
}


void strcase2( char *str, char *str2 )
{
	//	string case to lower and copy
	//
	unsigned char a1;
	unsigned char *ss;
	unsigned char *ss2;
	ss=(unsigned char *)str;
	ss2=(unsigned char *)str2;
	while(1) {
		a1=*ss;
		if (a1==0) break;
		if (a1>=0x80) {
			*ss++;
			*ss2++=a1;
			a1=*ss++;
			if (a1==0) break;
			*ss2++=a1;
		}
		else {
			a1=tolower(a1);
			*ss++=a1;
			*ss2++=a1;
		}
	}
	*ss2=0;
}


int tstrcmp( char *str1, char *str2 )
{
	//	string compare (0=not same/-1=same)
	//
	int ap;
	char as;
	ap=0;
	while(1) {
		as=str1[ap];
		if (as!=str2[ap]) return 0;
		if (as==0) break;
		ap++;
	}
	return -1;
}


void getpath( char *src, char *outbuf, int p2 )
{
	char *p;
	char stmp[_MAX_PATH];
	char p_drive[_MAX_PATH];
	char p_dir[_MAX_DIR];
	char p_fname[_MAX_FNAME];
	char p_ext[_MAX_EXT];

#ifdef USE_WINDOWS_API
	p = outbuf;
	strcpy( stmp, src );
	if (p2&16) strcase( stmp );
	_splitpath( stmp, p_drive, p_dir, p_fname, p_ext );
	strcat( p_drive, p_dir );
	if ( p2&8 ) {
		strcpy( stmp, p_fname ); strcat( stmp, p_ext );
	} else if ( p2&32 ) {
		strcpy( stmp, p_drive );
	}
	switch( p2&7 ) {
	case 1:			// Name only ( without ext )
		stmp[ strlen(stmp)-strlen(p_ext) ] = 0;
		strcpy( p, stmp );
		break;
	case 2:			// Ext only
		strcpy( p, p_ext );
		break;
	default:		// Direct Copy
		strcpy( p, stmp );
		break;
	}
#else
	*outbuf = 0;
#endif
}


void strcpy2( char *str, char *str2, int max )
{
	//	string case to lower and copy
	//
	int i;
	unsigned char a1;
	unsigned char *ss;
	unsigned char *ss2;
	ss=(unsigned char *)str;
	ss2=(unsigned char *)str2;
	i = 1;
	while(1) {
		if ( i >= max ) break;
		a1=*ss2++;
		if (a1==0) break;
		*ss++=a1;
	}
	*ss=0;
}



/*----------------------------------------------------------*/

void addext( char *st, char *exstr )
{
	//	add extension of filename

	int a1;
	char c1;
	a1=0;while(1) {
		c1=st[a1];if (c1==0) break;
		if (c1=='.') return;
		a1++;
	}
	st[a1]='.'; st[a1+1]=0;
	strcat(st,exstr);
}

void cutext( char *st )
{
	//	cut extension of filename

	int a1;
	char c1;
	a1=0;while(1) {
		c1=st[a1];if (c1==0) break;
		if (c1=='.') break;
		a1++;
	}
	st[a1]=0;
}

void cutlast( char *st )
{
	//	cut last characters

	int a1;
	unsigned char c1;
	a1=0;while(1) {
		c1=st[a1];if (c1<33) break;
		st[a1]=tolower(c1);
		a1++;
	}
	st[a1]=0;
}


void cutlast2( char *st )
{
	//	cut last characters

	int a1;
	char c1;
	char ts[256];

	strcpy(ts,st);
	a1=0;
	while(1) {
		c1=ts[a1];if (c1<33) break;
		ts[a1]=tolower(c1);
		a1++;
	}
	ts[a1]=0;

	while(1) {
		a1--;c1=ts[a1];
		if (c1==0x5c) { a1++;break; }
		if (a1==0) break;
	}
	strcpy(st,ts+a1);
}


char *strchr2( char *target, char code )
{
	//		str中最後のcode位置を探す(全角対応版)
	//
	unsigned char *p;
	unsigned char a1;
	char *res;
	p=(unsigned char *)target;
	res = NULL;
	while(1) {
		a1=*p;if ( a1==0 ) break;
		if ( a1==code ) res=(char *)p;
		p++;							// 検索位置を移動
		if (a1>=129) {					// 全角文字チェック
			if ((a1<=159)||(a1>=224)) p++;
		}
	}
	return res;
}


void CutLastChr( char *p, char code )
{
	//		最後の'\\'を取り除く
	//
	char *ss;
	char *ss2;
	int i;
	ss = strchr2( p, '\\' );
	if ( ss != NULL ) {
		i = (int)strlen( p ); ss2 = p + i -1;
		if (( i > 3 )&&( ss == ss2 )) *ss = 0;
	}
}

/*----------------------------------------------------------*/
//					HSP system support
/*----------------------------------------------------------*/

void dirinfo( char *p, int id )
{
	//		dirinfo命令の内容をstmpに設定する
	//
#ifdef USE_WINDOWS_API
	char fname[_MAX_PATH+1];

	switch( id ) {
	case 0:				//    カレント(現在の)ディレクトリ
		_getcwd( p, _MAX_PATH );
		break;
	case 1:				//    実行ファイルがあるディレクトリ
		GetModuleFileName( NULL,fname,_MAX_PATH );
		getpath( fname, p, 32 );
		break;
	case 2:				//    Windowsディレクトリ
		GetWindowsDirectory( p, _MAX_PATH );
		break;
	case 3:				//    Windowsのシステムディレクトリ
		GetSystemDirectory( p, _MAX_PATH );
		break;
	default:
		if ( id & 0x10000 ) {
			SHGetSpecialFolderPath( NULL, p, id & 0xffff, FALSE );
			break;
		}
		*p = 0;
		return;
	}

	//		最後の'\\'を取り除く
	//
	CutLastChr( p, '\\' );
#else
	*p = 0;
#endif
}


/*----------------------------------------------------------*/

//
//		Memory Manager
//
char *mem_alloc( void *base, int newsize, int oldsize )
{
	char *p;
	if ( base == NULL ) {
		p = (char *)calloc( newsize, 1 );
		return p;
	}
	if ( newsize <= oldsize ) return (char *)base;
	p = (char *)calloc( newsize, 1 );
	memcpy( p, base, oldsize );
	free( base );
	return p;
}


//
//		windows debug support
//
#ifdef USE_WINDOWS_API

void Alert( char *mes )
{
	MessageBox( NULL, mes, "error",MB_ICONINFORMATION | MB_OK );
}

void AlertV( char *mes, int val )
{
	char ss[128];
	sprintf( ss, "%s%d",mes,val );
	MessageBox( NULL, ss, "error",MB_ICONINFORMATION | MB_OK );
}

void Alertf( char *format, ... )
{
	char textbf[1024];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);
	MessageBox( NULL, textbf, "error",MB_ICONINFORMATION | MB_OK );
}

#endif

