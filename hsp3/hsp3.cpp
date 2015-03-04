
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


#define GetPRM(id) (&hspctx.mem_finfo[id])
#define strp(dsptr) &hspctx.mem_mds[dsptr]


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
	hspctx.mem_mcs = (unsigned short *)copy_DAT(ptr + hsphed->pt_cs, hsphed->max_cs);
	hspctx.mem_mds = (char *)( ptr + hsphed->pt_ds );
	hspctx.mem_ot = (int *)copy_DAT(ptr + hsphed->pt_ot, hsphed->max_ot);
	hspctx.mem_di = (unsigned char *)copy_DAT(ptr + hsphed->pt_dinfo, hsphed->max_dinfo);

	hspctx.mem_linfo = (LIBDAT *)copy_LIBDAT(hsphed, ptr + hsphed->pt_linfo, hsphed->max_linfo);
	hspctx.mem_minfo = (STRUCTPRM *)copy_DAT(ptr + hsphed->pt_minfo, hsphed->max_minfo);
	hspctx.mem_finfo = (STRUCTDAT *)copy_STRUCTDAT(hsphed, ptr + hsphed->pt_finfo, hsphed->max_finfo);

	HspVarCoreResetVartype( hsphed->max_varhpi );		// �^�̏�����
	code_resetctx( &hspctx );		// hsp3code setup

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


/*------------------------------------------------------------*/
/*
util
*/
/*------------------------------------------------------------*/

void* Hsp3::copy_DAT(char *ptr, size_t size)
{
	if (size <= 0) return ptr;

	void* dst = malloc(size);
	memcpy(dst, ptr, size);
	return dst;
}


LIBDAT *Hsp3::copy_LIBDAT(HSPHED *hsphed, void *ptr, size_t size )
{
	//	libdat�̏���
	int i,max;
	int newsize;
	LIBDAT *mem_dst;
	LIBDAT *dst;
	HED_LIBDAT *org_dat;

	max = (int)( size / sizeof(HED_LIBDAT));
	if (max <= 0) return (LIBDAT *)ptr;
	newsize = sizeof(LIBDAT)*max;
	mem_dst = (LIBDAT *)malloc( newsize );
	dst = mem_dst;
	org_dat = (HED_LIBDAT *)ptr;
	for (i = 0; i < max; i++) {

		dst->flag = org_dat->flag;
		dst->nameidx = org_dat->nameidx;
		dst->clsid = org_dat->clsid;
		dst->hlib = NULL;

		dst++;
		org_dat++;
	}
	hsphed->max_linfo = newsize;
	return mem_dst;
}


STRUCTDAT *Hsp3::copy_STRUCTDAT(HSPHED *hsphed, void *ptr, size_t size)
{
	//	structdat�̏���
	int i, max;
	int newsize;
	STRUCTDAT *mem_dst;
	STRUCTDAT *dst;
	HED_STRUCTDAT *org_dat;
	max = (int)(size / sizeof(HED_STRUCTDAT));
	if (max <= 0) return (STRUCTDAT *)ptr;
	newsize = sizeof(STRUCTDAT)*max;
	mem_dst = (STRUCTDAT *)malloc(sizeof(STRUCTDAT)*max);
	dst = mem_dst;
	org_dat = (HED_STRUCTDAT *)ptr;
	for (i = 0; i < max; i++) {

		dst->index = org_dat->index;
		dst->subid = org_dat->subid;
		dst->prmindex = org_dat->prmindex;
		dst->prmmax = org_dat->prmmax;
		dst->nameidx = org_dat->nameidx;
		dst->size = org_dat->size;
		dst->otindex = org_dat->otindex;
		dst->funcflag = org_dat->funcflag;
#ifdef PTR64BIT
		dst->proc = NULL;
#endif

#ifdef HSP64
		if ((dst->index == STRUCTDAT_INDEX_FUNC) ||
			(dst->index == STRUCTDAT_INDEX_CFUNC) ||
			(dst->index == STRUCTDAT_INDEX_STRUCT)) {
			//	STRUCT��offset,size�l�𒲐�����
			int j;
			STRUCTPRM *prm;
			prm = &hspctx.mem_minfo[dst->prmindex];
			dst->size *= 2;
			for (j = 0; j < dst->prmmax; j++) {
				if (prm->mptype == MPTYPE_STRUCTTAG) continue;
				//Alertf("INIT: type%d: subid:%d offset:%d", prm->mptype, prm->subid, prm->offset);
				prm->offset *= 2;
				prm++;
			}
		}
#endif

		dst++;
		org_dat++;
	}
	hsphed->max_finfo = newsize;
	return mem_dst;
}


