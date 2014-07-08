//
//		MMMAN : Multimedia manager source
//				for OpenSL/ES enviroment
//				onion software/onitama 2012/6
//
#include <stdio.h>
#include <stdlib.h>
#include "../../hsp3/hsp3config.h"
#include "../../hsp3/dpmread.h"
#include "../../hsp3/strbuf.h"
#include "../supio.h"

#include "mmman.h"

#define sndbank(a) (char *)(mem_snd[a].mempt)

//---------------------------------------------------------------------------

//	MMDATA structure
//
typedef struct MMM
{
	//	Multimedia Data structure
	//
	int		flag;			//	bank mode (0=none/1=wav/2=mid/3=cd/4=avi)
	int		opt;			//	option (0=none/1=loop/2=wait/16=fullscr)
	int		num;			//	request number
	short	track;			//	CD track No.
	short	lasttrk;		//	CD last track No.
	void	*mempt;			//	pointer to sound data
	char	*fname;			//	sound filename (sbstr)
	int		vol;
	int		pan;

	//	OpenSL/ES Objects
	//
	// SLObjectItf   playerObject;
	// SLPlayItf     playerPlay;
	// SLSeekItf     playerSeek;
	// SLVolumeItf   playerVolume;
	int pause_flag;

} MMM;

//---------------------------------------------------------------------------

MMMan::MMMan()
{
}


MMMan::~MMMan()
{
}

void MMMan::DeleteBank( int bank )
{
}


int MMMan::AllocBank( void )
{
	return 0;
}


int MMMan::SearchBank( int num )
{
	return -1;
}


MMM *MMMan::SetBank( int num, int flag, int opt, void *mempt, char *fname )
{
	return NULL;
}


void MMMan::ClearAllBank( void )
{
}


void MMMan::Reset( void *hwnd )
{
}


void MMMan::SetWindow( void *hwnd, int x, int y, int sx, int sy )
{
}


void MMMan::Pause( void )
{
}


void MMMan::Resume( void )
{
}


void MMMan::Stop( void )
{
}


void MMMan::StopBank( MMM *mmm )
{
}


void MMMan::PauseBank( MMM *mmm )
{
}


void MMMan::ResumeBank( MMM *mmm )
{
}


void MMMan::PlayBank( MMM *mmm )
{
}


void MMMan::SetLoopBank( MMM *mmm, int flag )
{
}


int MMMan::BankLoad( MMM *mmm, char *fname )
{
	return 0;
}


int MMMan::Load( char *fname, int num, int opt )
{
	return 0;
}


int MMMan::Play( int num )
{
	return 0;
}


void MMMan::Notify( void )
{
}


void MMMan::GetInfo( int bank, char **fname, int *num, int *flag, int *opt )
{
}


void MMMan::SetVol( int num, int vol )
{
}



void MMMan::SetPan( int num, int pan )
{
}


int MMMan::GetStatus( int num, int infoid )
{
	return 9;
}


void MMMan::StopBank( int num )
{
}
