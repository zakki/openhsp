
//
//	hsp3embed.cpp header
//
#ifndef __hsp3embed_h
#define __hsp3embed_h

#ifdef __cplusplus
extern "C" {
#endif

int hsp3eb_init( void );
void hsp3eb_bye( void );
int hsp3eb_exec( void );
void hsp3eb_setstat( int stat );

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
