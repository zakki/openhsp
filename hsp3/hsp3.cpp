
//
//	HSP3 manager
//	onion software/onitama 2004/6
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hsp3.h"
#include "hsp3config.h"
#include "hsp3debug.h"
#include "dpmread.h"
#include "supio.h"

#ifdef HSP3IMP
#include "../hspinet/czcrypt.h"
#endif

static char startax[]={ 'S'-40,'T'-40,'A'-40,'R'-40,'T'-40,
			 '.'-40,'A'-40,'X'-40, 0 };

/*------------------------------------------------------------*/
/*
		constructor
*/
/*------------------------------------------------------------*/

Hsp3::Hsp3()
{
	//		������
	//
	memset( &hspctx, 0, sizeof(HSPCTX) );
	code_setctx( &hspctx );
	code_init();
	hspctx.mem_mcs = NULL;
	axfile = NULL;
	axname = NULL;
}

Hsp3::~Hsp3()
{
	//		���ׂĔj��
	//
	code_termfunc();
	Dispose();
	code_bye();
}

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

void Hsp3::SetFileName( char *name )
{
	if ( *name == 0 ) { axname = NULL; return; }
	axname = name;
}


void Hsp3::Dispose( void )
{
	//		ax��j��
	//
	if ( hspctx.mem_mcs == NULL ) return;
	if ( hspctx.mem_var != NULL ) {
		int i;
		for(i=0;i<maxvar;i++) {
			HspVarCoreDispose( &hspctx.mem_var[i] );
		}
		delete [] hspctx.mem_var;	hspctx.mem_var = NULL;
	}

	hspctx.mem_mcs = NULL;
	if ( axfile != NULL ) {
		mem_bye( axfile );
		axfile = NULL;
	}
}

int Hsp3::Reset( int mode )
{
	//		ax��������
	//		mode: 0 = normal(debug) mode
	//		      other = packfile PTR
	//
	int i;
	char *ptr;
	char fname[512];
	HSPHED *hsphed;
	if ( hspctx.mem_mcs != NULL ) Dispose();

	//		load HSP execute object
	//
	axtype = HSP3_AXTYPE_NONE;
	if ( mode ) {									// "start.ax"���Ăяo��
		i = dpm_ini( "", mode, hsp_sum, hsp_dec );	// customized EXE mode
		//axname = NULL;
	} else {
		dpm_ini( "data.dpm",0,-1,-1 );				// original EXE mode
	}

#ifdef HSP3IMP
	//		HSP3IMP�p�ǂݍ���(�Í���ax�Ή�)
	if ( axname == NULL ) {
		ptr = dpm_readalloc( "start.ax" );
		if ( ptr == NULL ) {
			int sz;
			CzCrypt crypt;
			if ( crypt.DataLoad( "start.axe" ) ) return -1;
			crypt.SetSeed( hsp_sum, hsp_dec );
			crypt.Decrypt();
			sz = crypt.GetSize();
			ptr = mem_ini( sz );
			memcpy( ptr, crypt.GetData(), sz );
			axtype |= HSP3_AXTYPE_ENCRYPT;
		}
	} else {
		ptr = dpm_readalloc( axname );
		if ( ptr == NULL ) return -1;
	}
#else
	//		start.ax�ǂݍ���
	if ( axname == NULL ) {
		unsigned char *p;
		unsigned char *s;
		unsigned char ap;
		int sum;
		sum = 0;
		p = (unsigned char *)fname;
		s = (unsigned char *)startax;
		while(1) {
			ap = *s++;if ( ap==0 ) break;
			ap += 40; *p++ = ap;
			sum = sum*17 + (int)ap;
		}
		*p = 0;
		if ( sum != 0x6cced385 ) return -1;
		if ( mode ) {
			if ( dpm_filebase( fname ) != 1 ) return -1;	// DPM,packfile����̂�start.ax��ǂݍ���
		}
	} else {
		strcpy( fname, axname );
	}

	ptr = dpm_readalloc( fname );
	if ( ptr == NULL ) return -1;
#endif

	axfile = ptr;

	//		memory location set
	//
	hsphed = (HSPHED *)ptr;

	if ((hsphed->h1!='H')||(hsphed->h2!='S')||(hsphed->h3!='P')||(hsphed->h4!='3')) {
		mem_bye( axfile );
		return -1;
	}

	maxvar = hsphed->max_val;
	hspctx.hsphed = hsphed;
	hspctx.mem_mcs = (unsigned short *)( ptr + hsphed->pt_cs );
	hspctx.mem_mds = (char *)( ptr + hsphed->pt_ds );
	hspctx.mem_ot = (int *)( ptr + hsphed->pt_ot );
	hspctx.mem_di = (unsigned char *)( ptr + hsphed->pt_dinfo );

	hspctx.mem_linfo = (LIBDAT *)( ptr + hsphed->pt_linfo );
	hspctx.mem_minfo = (STRUCTPRM *)( ptr + hsphed->pt_minfo );
	hspctx.mem_finfo = (STRUCTDAT *)( ptr + hsphed->pt_finfo );

	code_resetctx( &hspctx );		// hsp3code setup
	HspVarCoreResetVartype( hsphed->max_varhpi );		// �^�̏�����

	//		HspVar setup
	hspctx.mem_var = NULL;
	if ( maxvar ) {
		int i;
		hspctx.mem_var = new PVal[maxvar];

		for(i=0;i<maxvar;i++) {
			PVal *pval = &hspctx.mem_var[i];
			pval->mode = HSPVAR_MODE_NONE;
			pval->flag = HSPVAR_FLAG_INT;				// ���̌^
			HspVarCoreClear( pval, HSPVAR_FLAG_INT );	// �O���[�o���ϐ���0�Ƀ��Z�b�g
		}
	}

	//		debug
	//Alertf( "#HSP objcode initalized.(CS=%d/DS=%d/OT=%d/VAR=%d)\n",hsphed->max_cs, hsphed->max_ds, hsphed->max_ot, hsphed->max_val );
	code_setpc( hspctx.mem_mcs );
	code_debug_init();
	return 0;
}


void Hsp3::SetPackValue( int sum, int dec )
{
	hsp_sum = sum;
	hsp_dec = dec;
}


