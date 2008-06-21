/*===================================================================
DllDefnition.cpp
DLL�p�̒�`���s���w�b�_�t�@�C��
===================================================================*/

#pragma once

#include "Footy.h"
#include <list>

typedef std::list<CFooty*>::iterator FootyPt;
CFooty *GetFooty(int nID);

/*�f�t�H���g�̕����Z�b�g�̒�`*/
#ifdef UNDER_CE
	#define CSM_DEFAULT CSM_SHIFT_JIS_2004
#else	/*UNDER_CE*/
	#define CSM_DEFAULT	CSM_PLATFORM
#endif	/*UNDER_CE*/

/*[EOF]*/
