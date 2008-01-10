
//	strnote.cpp functions

#ifndef __strnote_h
#define __strnote_h

//  class
class CStrNote {
public:
	CStrNote();
	~CStrNote();

	void Select( char *str );
	int GetSize( void );
	char *GetStr( void );
	int GetMaxLine( void );
	int GetLine( char *nres, int line );
	int GetLine( char *nres, int line, int max );
	int PutLine( char *nstr, int line, int ovr );

private:
	int nnget( char *nbase, int line );

	char *base;
	int lastcr;
	char *nn;
};

#endif
