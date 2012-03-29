
//
//		MMMAN : Multimedia manager source
//				for iOS enviroment
//				onion software/onitama 2011/9
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
} MMM;

static void SoundInit(void)
{
}

static void SoundTerm(void)
{
}

static void SoundDelete( MMM *mmm )
{
	if ( mmm->flag != MMDATA_MCIVOICE ) return;
}

static void SoundPlay( MMM *mmm )
{
	if ( mmm->flag != MMDATA_MCIVOICE ) return;
	if ( mmm->opt == 1 ) {
//		alSourcei( mmm->source, AL_LOOPING, AL_TRUE );
	} else {
//		alSourcei( mmm->source, AL_LOOPING, AL_FALSE );
	}
//	alSourcePlay( mmm->source );
    //Alertf("Play.");
}

static void SoundPause( MMM *mmm )
{
	if ( mmm->flag != MMDATA_MCIVOICE ) return;
//	alSourcePause( mmm->source );
}

static void SoundStop( MMM *mmm )
{
	if ( mmm->flag != MMDATA_MCIVOICE ) return;
//	alSourceStop( mmm->source );
}

static void SoundParam( MMM *mmm, float pan, float gain, float pitch )
{
	if ( mmm->flag != MMDATA_MCIVOICE ) return;
//	alSource3f( mmm->source, AL_POSITION, pan, 0.0f, 0.0f );
//	alSourcef( mmm->source, AL_GAIN, gain );
//	alSourcef( mmm->source, AL_PITCH, pitch );
}

static int SoundState( MMM *mmm )
{
//	ALint state;
	if ( mmm->flag != MMDATA_MCIVOICE ) return 0;
//	alGetSourcei( mmm->source, AL_SOURCE_STATE, &state );
//	if(state == AL_PLAYING) {
//		return 1;
//	}
	return 0;
}

static int SoundLoad( MMM *mmm, char *fname )
{
    char *fext;
/*
    char fname1[256];
    char fname2[64];
    getpath( fname, fname1, 17 );       // ファイル名
    getpath( fname, fname2, 18 );       // 拡張子
    fext = "";//fname2+1;
	Alertf("#%s[%s] load",fname1,fname2);
*/    
    fext = "";


	mmm->flag = MMDATA_MCIVOICE;
	//Alertf("#%s rate:%d size:%d ok.",fname,sampleRate,dataSize);
	return 0;
}

//---------------------------------------------------------------------------

MMMan::MMMan()
{
	//		initalize MM manager
	//
	mem_snd = NULL;
	mm_cur = 0;
    SoundInit();
}


MMMan::~MMMan()
{
	//		terminate MM manager
	//
	ClearAllBank();
    SoundTerm();
}

void MMMan::DeleteBank( int bank )
{
	MMM *m;
	char *lpSnd;

	m = &(mem_snd[bank]);
	if ( m->flag == MMDATA_MCIVOICE ) {
		SoundDelete( m );
	}

	lpSnd = sndbank( bank );
	if ( lpSnd != NULL ) {
		free( lpSnd );
	}
	mem_snd[bank].mempt=NULL;
}


int MMMan::SearchBank( int num )
{
	int a;
	for(a=0;a<mm_cur;a++) {
		if ( mem_snd[a].num == num ) return a;
	}
	return -1;
}


MMM *MMMan::SetBank( int num, int flag, int opt, void *mempt, char *fname )
{
	int bank;
	MMM *m;

	bank = SearchBank( num );
	if ( bank < 0 ) {
		bank = AllocBank();
	} else {
		DeleteBank( bank );
	}

	m = &(mem_snd[bank]);
	m->flag = flag;
	m->opt = opt;
	m->num = num;
	m->mempt = mempt;
	m->fname = NULL;

	return m;
}


int MMMan::AllocBank( void )
{
	int ids,sz;
	ids = mm_cur++;
	sz = mm_cur * sizeof(MMM);
	if ( mem_snd == NULL ) {
		mem_snd = (MMM *)sbAlloc( sz );
	} else {
		mem_snd = (MMM *)sbExpand( (char *)mem_snd, sz );
	}
	mem_snd[ids].flag = MMDATA_NONE;
	mem_snd[ids].num = -1;
	return ids;
}


void MMMan::ClearAllBank( void )
{
	int a;
	if ( mem_snd != NULL ) {
		Stop();
		for(a=0;a<mm_cur;a++) {
			DeleteBank( a );
		}
		sbFree( mem_snd );
		mem_snd = NULL;
		mm_cur = 0;
	}
}


void MMMan::Reset( void *hwnd )
{
	ClearAllBank();
	//hwm = hwnd;
	//avi_wnd = hwnd;
	//curmus=-1;
}


void MMMan::SetWindow( void *hwnd, int x, int y, int sx, int sy )
{
}


void MMMan::Stop( void )
{
	//		stop playing sound
	//
	MMM *m;
	int a;
	m = &(mem_snd[0]);
	for(a=0;a<mm_cur;a++) {
		SoundStop( m );
		m++;
	}
}


int MMMan::Load( char *fname, int num, int opt )
{
	//		Load sound to bank
	//			opt : 0=normal/1=loop/2=wait/3=continuous
	//
	int flag;
	MMM *mmm;

	flag = MMDATA_MCIVOICE;
	mmm = SetBank( num, flag, opt, NULL, fname );

	if ( SoundLoad( mmm, fname ) ) {
		mmm->flag = MMDATA_NONE;
		return -1;
	}
	return 0;
}


int MMMan::Play( int num )
{
	//		Play sound
	//
    int bank;
	MMM *m;
    bank = SearchBank(num);
    if ( bank < 0 ) return 1;
	m = &(mem_snd[bank]);
	SoundPlay( m );
	return 0;
}


void MMMan::Notify( void )
{
	//		callback from windows message
	//			"MM_MCINOTIFY"
	//
}


void MMMan::GetInfo( int bank, char **fname, int *num, int *flag, int *opt )
{
	//		Get MMM info
	//
	MMM *mmm;
	mmm=&mem_snd[bank];
	*fname = mmm->fname;
	*opt=mmm->opt;
	*flag=mmm->flag;
	*num=mmm->num;
}






