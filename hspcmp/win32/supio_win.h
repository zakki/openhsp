
//
//	supio.cpp functions
//

char *mem_ini( int size );
void mem_bye( void *ptr );
char *mem_alloc( void *base, int newsize, int oldsize );
int mem_load( char *fname, void *mem, int msize );
int mem_save( char *fname, void *mem, int msize );
int filecopy( char *fname, char *sname );

//void prtini( char *mes );
//void prt( char *mes );

int tstrcmp( char *str1, char *str2 );
void strcase( char *str );
void strcase2( char *str, char *str2 );
void addext( char *st, char *exstr );
void cutext( char *st );
void cutlast( char *st );
void cutlast2( char *st );
void strcpy2( char *dest, const char *src, size_t size );
char *strchr2( char *target, char code );

void getpath( char *stmp, char *outbuf, int p2 );

void ExecFile( char *stmp, char *ps, int mode );
void dirinfo( char *p, int id );

void Alert( char *mes );
void AlertV( char *mes, int val );
void Alertf( char *format, ... );

inline int issjisleadbyte( unsigned char c )
{
	return ( c >= 0x81 && c <= 0x9F ) || ( c >= 0xE0 && c <= 0xFC );
}
