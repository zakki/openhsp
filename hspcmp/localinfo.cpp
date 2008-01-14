
/*----------------------------------------------------------------*/
//		local info related routines
/*----------------------------------------------------------------*/

//#define USE_WINDOWS_API		// WINDOWS API‚ðŽg—p‚·‚é


#ifdef USE_WINDOWS_API
#include <windows.h>
#endif

#include <stdio.h>
#include <string.h>
#include "localinfo.h"

//-------------------------------------------------------------
//		Interfaces
//-------------------------------------------------------------

CLocalInfo::CLocalInfo()
{
}


CLocalInfo::~CLocalInfo()
{
}


//-------------------------------------------------------------
//		Routines
//-------------------------------------------------------------

int CLocalInfo::GetTime( int index )
{
/*
	Get system time entries
	index :
	    0 wYear
	    1 wMonth
	    2 wDayOfWeek
	    3 wDay
	    4 wHour
	    5 wMinute
	    6 wSecond
	    7 wMilliseconds
*/
#ifdef USE_WINDOWS_API
	SYSTEMTIME st;
	short *a;
	GetLocalTime( &st );
	a=(short *)&st;
	return (int)(a[index]);
#else
	return 0;
#endif
}


char *CLocalInfo::CurrentTime( void )
{
	sprintf( curtime, "\"%02d:%02d:%02d\"",
		GetTime(4),GetTime(5),GetTime(6) );
	return curtime;
}


char *CLocalInfo::CurrentDate( void )
{
	sprintf( curdate, "\"%04d/%02d/%02d\"",
		GetTime(0),GetTime(1),GetTime(3) );
	return curdate;
}

