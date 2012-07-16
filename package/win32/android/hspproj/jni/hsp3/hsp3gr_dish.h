
//
//	hsp3gr_dish.cpp header
//
#ifndef __hsp3gr_dish_h
#define __hsp3gr_dish_h

#include "../hsp3/hsp3struct.h"

void hsp3typeinit_extcmd( HSP3TYPEINFO *info );
void hsp3typeinit_extfunc( HSP3TYPEINFO *info );
void hsp3notify_extcmd( void );

void hsp3gr_dbg_gui( void );
void hsp3extcmd_pause( void );
void hsp3extcmd_resume( void );

#endif
