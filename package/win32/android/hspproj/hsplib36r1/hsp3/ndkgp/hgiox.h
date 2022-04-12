
//
//	hgiox.cpp structures
//
#ifndef __hgiox_h
#define __hgiox_h


int hgio_device_restore( void );
void hgio_text_render( void );

int hgio_file_exist( char *fname );
int hgio_file_read( char *fname, void *ptr, int size, int offset );

FILE *hgio_android_fopen( char *fname, int offset );
int hgio_android_fread( FILE* ptr, void *mem, int size );
void hgio_android_fclose(FILE* ptr);


#endif
