
/*----------------------------------------------------------------*/
//		notepad object related routines
/*----------------------------------------------------------------*/

#include <string.h>
#include "strnote.h"

//-------------------------------------------------------------
//		Interfaces
//-------------------------------------------------------------

CStrNote::CStrNote()
{
	base = NULL;
}


CStrNote::~CStrNote()
{
}


void CStrNote::Select( char *str )
{
	base = str;
}


int CStrNote::GetSize( void )
{
	return strlen( base );
}


//-------------------------------------------------------------
//		Routines
//-------------------------------------------------------------

int CStrNote::nnget( char *nbase, int line )
{
	int a,i;
	char a1;
	a=0;
	lastcr=0;
	nn=nbase;
	if (line<0) {
		i=strlen(nbase);if (i==0) return 0;
		nn+=i;a1=*(nn-1);
		if ((a1==10)||(a1==13)) lastcr++;
		return 0;
	}
	if (line) {
		while(1) {
			a1=*nn;if (a1==0) return 1;
			nn++;
			if (a1==13) {
				if (*nn==10) nn++;
				a++;if (a==line) break;
			}
		}
	}
	lastcr++;
	return 0;
}


int CStrNote::GetLine( char *nres, int line )
{
	//		Get specified line from note
	//				result:0=ok/1=no line
	//
	char a1;
	char *pp;
	pp=nres;
	if ( nnget( base,line ) ) return 1;
	if (*nn==0) return 1;
	while(1) {
		a1=*nn++;
		if ((a1==0)||(a1==13)) break;
		*pp++=a1;
	}
	*pp=0;
	return 0;
}


int CStrNote::GetLine( char *nres, int line, int max )
{
	//		Get specified line from note
	//				result:0=ok/1=no line
	//
	char a1;
	char *pp;
	int cnt;
	pp=nres;
	cnt = 0;
	if ( nnget( base,line ) ) return 1;
	if (*nn==0) return 1;
	while(1) {
		if ( cnt>=max ) break;
		a1=*nn++;
		if ((a1==0)||(a1==13)) break;
		*pp++=a1;
		cnt++;
	}
	*pp=0;
	return 0;
}


int CStrNote::GetMaxLine( void )
{
	int a,b;
	char a1;
	a=1;b=0;
	nn=base;
	while(1) {
		a1=*nn++;if (a1==0) break;
		if (a1==13) {
			if (*nn==10) nn++;
			a++;b=0;
		}
		else b++;
	}
	if (b==0) a--;
	return a;
}


int CStrNote::PutLine( char *nstr, int line, int ovr )
{
	//		Pet specified line to note
	//				result:0=ok/1=no line
	//
	int a,ln,la,lw;
	char a1;
	char *pp;
	char *p1;
	char *p2;
	if ( nnget( base,line ) ) return 1;
	if (lastcr==0) { strcat( base,"\r\n" );nn+=2; }

	pp=nstr;
	if (*nstr!=0) strcat(nstr,"\r\n");
	ln=strlen(nstr);			// base new str + cr/lf
	la=strlen(base);
	lw=la-(nn-base)+1;
	//
	if (ovr) {					// when overwrite mode
		p1=nn;a=0;
		while(1) {
			a1=*p1++;if (a1==0) break;
			a++;
			if (a1==13) {
				if (*p1==10) { p1++;a++; }
				break;
			}
		}
		ln=ln-a;
		lw=lw-a;if (lw<1) lw=1;
	}
	//
	if (ln>=0) {
		p1=base+la+ln; p2=base+la;
		for(a=0;a<lw;a++) { *p1--=*p2--; }
	}
	 else {
		p1=nn+a+ln;p2=nn+a;
		for(a=0;a<lw;a++) { *p1++=*p2++; }
	}
	//
	while(1) {
		a1=*pp++;if (a1==0) break;
		*nn++=a1;
	}
	return 0;
}

