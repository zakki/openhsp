/**
 * @file Macros.h
 * @brief マクロを記述するファイル
 * @author Shinji Watanabe
 * @version 1.0
 */

#pragma once

#define SAFE_DELETE(p)			if(p){delete [] p;p=NULL;}
#define SAFE_FREE(p)			if(p){free(p);p=NULL;}
#define SAFE_DELETEOBJECT(p)	if(p){DeleteObject(p);(p)=NULL;}
#define	forever					for(;;)

#ifdef UNDER_CE
#	define MYSTRCPY(dest,src,size)	strncpy(dest, src, size)
#	define MYSPRINTF _snwprintf
#else	/*UNDER_CE*/
#	define MYSTRCPY(dest,src,size)	strcpy_s(dest, size, src)
#	define MYSPRINTF swprintf_s
#endif	/*UNDER_CE*/

/*[EOF]*/
