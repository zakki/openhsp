
//
//	HspWnd,Bmscr(BMSCR) struct define
//
#ifndef __hspwnd_h
#define __hspwnd_h

#ifdef HSPWIN
#include "win32gui/hspwnd_win.h"
#endif

#ifdef HSPIOS
#include "ios/hspwnd_ios.h"
#endif

#ifdef HSPNDK
#include "ndk/hspwnd_ndk.h"
#endif

#ifdef HSPLINUX
#include "linux/hspwnd_linux.h"
#endif


#endif
