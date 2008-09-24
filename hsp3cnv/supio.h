
//
//	supio.cpp functions
//

char *mem_ini( int size );
void mem_bye( void *ptr );
int mem_load( char *fname, void *mem, int msize );
int mem_save( char *fname, void *mem, int msize );
int filecopy( char *fname, char *sname );

//void prtini( char *mes );
//void prt( char *mes );

int tstrcmp( char *str1, char *str2 );
void strcase( char *str );
void strcase2( char *str, char *str2 );
void addext( char *st, char *exstr );
void cutlast( char *st );
void cutlast2( char *st );

void strsp_ini( void );
int strsp_getptr( void );
int strsp_get( char *srcstr, char *dststr, char splitchr, int len );


void Alert( char *mes );
void AlertV( char *mes, int val );
