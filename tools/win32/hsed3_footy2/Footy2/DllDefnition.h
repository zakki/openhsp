/*===================================================================
DllDefnition.cpp
DLL用の定義を行うヘッダファイル
===================================================================*/

#pragma once

#include "Footy.h"
#include <list>

typedef std::list<CFooty*>::iterator FootyPt;
CFooty *GetFooty(int nID);

/*デフォルトの文字セットの定義*/
#ifdef UNDER_CE
	#define CSM_DEFAULT CSM_SHIFT_JIS_2004
#else	/*UNDER_CE*/
	#define CSM_DEFAULT	CSM_PLATFORM
#endif	/*UNDER_CE*/

/*[EOF]*/
