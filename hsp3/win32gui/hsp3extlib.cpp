
//
//	HSP3 External COM manager
//	onion software/onitama 2004/6
//	               chokuto 2005/3
//
#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <objbase.h>

#include <algorithm>

#include "../supio.h"
#include "../dpmread.h"
#include "../hsp3ext.h"
#include "hsp3extlib.h"
#include "hspvar_comobj.h"
#include "hsp3win.h"
#include "../hspwnd.h"
#include "../strbuf.h"

static HSPCTX *hspctx;		// Current Context
static HSPEXINFO *exinfo;	// Info for Plugins
static PVal **pmpval;

static int libmax, prmmax, hpimax;
static HPIDAT *hpidat;

#define GetPRM(id) (&hspctx->mem_finfo[id])
#define GetLIB(id) (&hspctx->mem_linfo[id])
#define strp(dsptr) &hspctx->mem_mds[dsptr]

typedef void (CALLBACK *DLLFUNC)(HSP3TYPEINFO *);
static DLLFUNC func;

//------------------------------------------------------------//

namespace hsp3 {

//------------------------------------------------------------//
/*
	CDllManager
*/
//------------------------------------------------------------//

CDllManager::CDllManager()
 : mModules(), mError( NULL )
{}


CDllManager::~CDllManager()
{
	typedef holder_type::iterator Iter;
	for ( Iter i = mModules.begin(); i != mModules.end(); ++i ) {
		FreeLibrary( *i );
	}
}


HMODULE CDllManager::load_library( LPCTSTR lpFileName )
{
	mError = NULL;
	HMODULE h = LoadLibrary( lpFileName );
	try {
		if ( h != NULL ) mModules.push_front( h );
	}
	catch ( ... ) {
		if ( !FreeLibrary( h ) ) mError = h;
		h = NULL;
	}
	return h;
}


BOOL CDllManager::free_library( HMODULE hModule )
{
	typedef holder_type::iterator Iter;
	mError = NULL;
	Iter i = std::find( mModules.begin(), mModules.end(), hModule );
	if ( i == mModules.end() ) return FALSE;
	BOOL res = FreeLibrary( hModule );
	if ( res ) {
		mModules.erase( i );
	} else {
		mError = hModule;
	}
	return res;
}


BOOL CDllManager::free_all_library()
{
	typedef holder_type::iterator Iter;
	for ( Iter i = mModules.begin(); i != mModules.end(); ++i ) {
		if ( FreeLibrary( *i ) ) *i = NULL;
	}
	mModules.erase( std::remove( mModules.begin(), mModules.end(),
	 static_cast< HMODULE >( NULL ) ), mModules.end() );
	return ( mModules.empty() ? TRUE : FALSE );
}


HMODULE CDllManager::get_error() const
{
	return mError;
}

//------------------------------------------------------------//

};	//namespace hsp3 {

//------------------------------------------------------------//

hsp3::CDllManager & DllManager()
{
	static hsp3::CDllManager dm;
	return dm;
}

/*------------------------------------------------------------*/
/*
		routines
*/
/*------------------------------------------------------------*/

static void BindLIB( LIBDAT *lib, char *name )
{
	//		���C�u�����̃o�C���h���s�Ȃ�
	//		(name:�ォ��^���鎞�̃��C�u������)
	//
	int i;
	char *n;
	HINSTANCE hd;
	if ( lib->flag != LIBDAT_FLAG_DLL ) return;
	i = lib->nameidx;
	if ( i < 0 ) {
		if ( name == NULL ) return;
		n = name;
	} else {
		n = strp(i);
	}
 	hd = DllManager().load_library( n );
	if ( hd == NULL ) return;
	lib->hlib = (void *)hd;
	lib->flag = LIBDAT_FLAG_DLLINIT;
}


static int BindFUNC( STRUCTDAT *st, char *name )
{
	//		�t�@���N�V�����̃o�C���h���s�Ȃ�
	//		(name:�ォ��^���鎞�̃t�@���N�V������)
	//
	int i;
	char *n;
	LIBDAT *lib;
	HINSTANCE hd;
	if (( st->subid != STRUCTPRM_SUBID_DLL )&&( st->subid != STRUCTPRM_SUBID_OLDDLL )) return 4;
	i = st->nameidx;
	if ( i < 0 ) {
		if ( name == NULL ) return 3;
		n = name;
	} else {
		n = strp(i);
	}
	lib = GetLIB( st->index );
	if ( lib->flag != LIBDAT_FLAG_DLLINIT ) {
		BindLIB( lib, NULL );
		if ( lib->flag != LIBDAT_FLAG_DLLINIT ) return 2;
	}
	hd = (HINSTANCE)(lib->hlib);
	st->proc = (void *)GetProcAddress( hd, n );
	if ( hd == NULL ) return 1;
	st->subid--;
	return 0;
}


static void ExitFunc( STRUCTDAT *st )
{
	//		�I�����֐��̌Ăяo��
	//
	int p[16];
	FARPROC pFn;
	BindFUNC( st, NULL );
	pFn = (FARPROC)st->proc;
	if ( pFn == NULL ) return;
	p[0] = p[1] = p[2] = p[3] = 0;
/*
	rev 43
	mingw : error : �֐��|�C���^�����֐��|�C���^�ւ̕ϊ�
	�ɑΏ�
*/
	call_extfunc( fpconv( pFn ), p, st->size / 4 );
}


static int Hsp3ExtAddPlugin( void )
{
	//		�v���O�C���̓o�^
	//
	int i;
	HSPHED *hed;
	char *ptr;
	char *libname;
	char *funcname;
	HPIDAT *hpi;
	HSP3TYPEINFO *info;
	HINSTANCE hd;
	char tmp[512];

	hed = hspctx->hsphed; ptr = (char *)hed;
	hpi = hpidat = (HPIDAT *)( ptr + hed->pt_hpidat );
	hpimax = hed->max_hpi / sizeof( HPIDAT );
	for ( i=0;i<hpimax;i++ ) {
		libname = strp(hpi->libname);
		funcname = strp(hpi->funcname);
		info = code_gettypeinfo(-1);

	 	hd = DllManager().load_library( libname );
		if ( hd == NULL ) {
			sprintf( tmp,"No DLL:%s",libname );
			hsp3win_dialog( tmp );
			return 1;
		}
		hpi->libptr = (void *)hd;
		func = (DLLFUNC)GetProcAddress( hd, funcname );
		if ( func == NULL ) {
			sprintf( tmp,"No DLL:%s:%s", libname, funcname );
			hsp3win_dialog( tmp );
			return 1;
		}
		func( info );
		code_enable_typeinfo( info );
		//Alertf( "%d_%d [%s][%s]", i, info->type, libname, funcname );
		hpi++;
	}
	return 0;
}


/*------------------------------------------------------------*/
/*
		window object support
*/
/*------------------------------------------------------------*/

static BMSCR *GetBMSCR( void )
{
	HSPEXINFO *exinfo;
	exinfo = hspctx->exinfo2;
	return (BMSCR *)exinfo->HspFunc_getbmscr( *(exinfo->actscr) );
}


/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

int Hsp3ExtLibInit( HSP3TYPEINFO *info )
{
	int i;
	STRUCTDAT *st;
	char tmp[1024];

	hspctx = info->hspctx;
	exinfo = info->hspexinfo;
	pmpval = exinfo->mpval;

	libmax = hspctx->hsphed->max_linfo / sizeof(LIBDAT);
	prmmax = hspctx->hsphed->max_finfo / sizeof(STRUCTDAT);

	if ( Hsp3ExtAddPlugin() ) return 1;

	for(i=0;i<prmmax;i++) {
		st = GetPRM(i);
		if ( BindFUNC( st, NULL ) == 1 ) {
			sprintf( tmp,"No FUNC:%s",strp(st->nameidx) );
			hsp3win_dialog( tmp );
		}
	}
	return 0;
}


void Hsp3ExtLibTerm( void )
{
	int i;
	LIBDAT *lib;
	STRUCTDAT *st;

	// �N���[���A�b�v�o�^����Ă��郆�[�U�[��`�֐��E���ߌĂяo��
	for(i=0;i<prmmax;i++) {
		st = GetPRM(i);
		if ( st->index >= 0 ) {
			if ( st->otindex & STRUCTDAT_OT_CLEANUP ) {
				ExitFunc( st );			// �N���[���A�b�v�֐����Ăяo��
			}
		}
	}
}


/*------------------------------------------------------------*/
/*
		code expand function
*/
/*------------------------------------------------------------*/

/*
	rev 43
	mingw(gcc) �p�̃R�[�h�ǉ�
*/
#if defined( _MSC_VER )

__declspec( naked ) int __cdecl call_extfunc( void *proc, int *prm, int prms )
{
	// �O���֐��Ăяo���iVC++ �̃C�����C���A�Z���u�����g�p�j
	//
	__asm {
		push	ebp
		mov		ebp,esp

		;# ebp+8	: �֐��̃|�C���^
		;# ebp+12	: ������������INT�̔z��
		;# ebp+16	: �����̐��ipush����񐔁j

		;# �p�����[�^��np��push����
		mov		eax, dword ptr [ebp+12]
		mov		ecx, dword ptr [ebp+16]
		jmp		_$push_chk

	_$push:
		push	dword ptr [eax+ecx*4]

	_$push_chk:
		dec		ecx
		jge		_$push

		;# �֐��Ăяo��
		call	dword ptr [ebp+8]

		;# �߂�l�� eax �ɓ���̂ł��̂܂܃��^�[��
		leave
		ret
	}
}

#elif defined( __GNUC__ )

int __cdecl call_extfunc( void * proc, int * prm, int prms )
{
	// �O���֐��Ăяo���iGCC �̊g���C�����C���A�Z���u�����g�p�j
    int ret = 0;
    __asm__ volatile (
		"pushl  %%ebp;"
		"movl   %%esp, %%ebp;"
		"jmp    _push_chk;"

		// �p�����[�^��prms��push����
	"_push:"
		"pushl  ( %2, %3, 4 );"

	"_push_chk:"
		"decl   %3;"
		"jge    _push;"

		"calll  *%1;"
		"leave;"

		: "=a" ( ret )
        : "r" ( proc ) , "r" ( prm ), "r" ( prms )
    );
    return ret;
}

#endif


int cnvwstr( void *out, char *in, int bufsize )
{
	//	sjis->unicode �ɕϊ�
	//
	return MultiByteToWideChar( CP_ACP, 0, in, -1, (LPWSTR)out, bufsize );
}


int cnvsjis( void *out, char *in, int bufsize )
{
	//	unicode->sjis �ɕϊ�
	//
	return WideCharToMultiByte( CP_ACP, 0, (LPCWSTR)in, -1, (LPSTR)out, bufsize, NULL, NULL);
}



static char *prepare_localstr( char *src, int mode )
{
	//	DLL �n���̂��߂̕��������������
	//		mode:0=ansi/1=unicode
	//
	//	�g�p��� sbFree() �ŉ�����邱��
	//
	int srcsize;
	char *dst;
	if ( mode ) {
		srcsize = (int)(( strlen(src) + 1 ) * 2);		// unicode�̃T�C�Y���T�Z
		dst = sbAlloc( srcsize );
		cnvwstr( dst, src, srcsize );
	} else {
		dst = sbAlloc( (int)strlen(src)+1 );
		strcpy( dst, src );
	}
	return dst;
}

static int code_expand_next( char *, const STRUCTDAT *, int );

int code_expand_and_call( const STRUCTDAT *st )
{
	//	�p�����[�^�̎擾����ъ֐��Ăяo���i�ċA�����ɂ��j
	//
	//	�ʏ�� DLL �֐��Ăяo���� COM ���\�b�h�Ăяo�����ǂ�����
	//	STRUCTDAT �̓��e���画�f���܂��B
	//
	//	DLL �֐��Ăяo������ st->proc �Ɋ֐��A�h���X���Z�b�g����
	//	�����Ȃ���΂Ȃ�܂���i BindFUNC() �ɂ��j�B
	//
	int result;
	char *prmbuf = sbAlloc( st->size );

	try {
		result = code_expand_next( prmbuf, st, 0 );
	}
	catch (...) {
		sbFree( prmbuf );
		throw;
	}
	sbFree( prmbuf );
	return result;
}

static int code_expand_next( char *prmbuf, const STRUCTDAT *st, int index )
{
	//	���̃p�����[�^���擾�i����ъ֐��Ăяo���j�i�ċA�����j
	//
	int result;
	if ( index == st->prmmax ) {
		// �֐��i�܂��̓��\�b�h�j�̌Ăяo��
		//if ( !code_getexflg() ) throw HSPERR_TOO_MANY_PARAMETERS;
		switch ( st->subid ) {
		case STRUCTPRM_SUBID_DLL:
		case STRUCTPRM_SUBID_DLLINIT:
		case STRUCTPRM_SUBID_OLDDLL:
		case STRUCTPRM_SUBID_OLDDLLINIT:
			// �O�� DLL �֐��̌Ăяo��
			result = call_extfunc( st->proc, (int*)prmbuf, (st->size / 4) );
			break;
#ifndef HSP_COM_UNSUPPORTED
		case STRUCTPRM_SUBID_COMOBJ:
			// COM ���\�b�h�̌Ăяo��
			result = call_method2( prmbuf, st );
			break;
#endif
		default:
			throw ( HSPERR_UNSUPPORTED_FUNCTION );
		}
		return result;
	}

	STRUCTPRM *prm = &hspctx->mem_minfo[ st->prmindex + index ];
	void *out = prmbuf + prm->offset;

	int srcsize;
	PVal *pval_dst, *mpval;
	APTR aptr;
	PVal *pval;
	int chk;
	// �ȉ��̃|�C���^�i�܂��̓I�u�W�F�N�g�j�͌ďo����ɉ��
	void *localbuf = NULL;
	IUnknown *punklocal = NULL;

	switch ( prm->mptype ) {

	case MPTYPE_INUM:
		*(int *)out = code_getdi(0);
		break;
	case MPTYPE_PVARPTR:
		aptr = code_getva( &pval );
		*(void **)out = HspVarCorePtrAPTR( pval, aptr );
		break;
	case MPTYPE_LOCALSTRING:
		localbuf = prepare_localstr( code_gets(), 0 );
		*(void **)out = localbuf;
		break;
	case MPTYPE_LOCALWSTR:
		localbuf = prepare_localstr( code_gets(), 1 );
		*(void **)out = localbuf;
		break;
	case MPTYPE_DNUM:
		*(double *)out = code_getdd(0.0);
		break;
	case MPTYPE_FLOAT:
		*(float *)out = (float)code_getdd(0.0);
		break;
	case MPTYPE_PPVAL:
		aptr = code_getva( &pval );
		localbuf = sbAlloc( sizeof(PVal) );
		pval_dst = (PVal *)localbuf;
		*pval_dst = *pval;
		if ( pval->flag & HSPVAR_SUPPORT_FLEXSTORAGE ) {	// ver2.5�݊��̂��߂̕ϊ�
			HspVarCoreGetBlockSize( pval, HspVarCorePtrAPTR( pval, aptr ), &srcsize );
			pval_dst->len[1] = (srcsize+3)/4;
			pval_dst->len[2] = 1;
			pval_dst->len[3] = 0;
			pval_dst->len[4] = 0;
		}
		*(void **)out = pval_dst;
		break;
	case MPTYPE_PBMSCR:
		*(void **)out = GetBMSCR();
		break;
	case MPTYPE_FLEXSPTR:
	case MPTYPE_FLEXWPTR:
		chk = code_get();
		if ( chk<=PARAM_END ) throw ( HSPERR_NO_DEFAULT );
		mpval = *pmpval;
		switch( mpval->flag ) {
		case HSPVAR_FLAG_INT:
			*(int *)out = *(int *)(mpval->pt);
			break;
		case HSPVAR_FLAG_STR:
			localbuf = prepare_localstr( mpval->pt, (prm->mptype==MPTYPE_FLEXWPTR) );
			*(void **)out = localbuf;
			break;
		default:
			throw ( HSPERR_TYPE_MISMATCH );
		}
		break;
	case MPTYPE_PTR_REFSTR:
		*(void **)out = hspctx->refstr;
		break;
	case MPTYPE_PTR_EXINFO:
		*(void **)out = exinfo;
		break;
	case MPTYPE_PTR_DPMINFO:
		dpm_getinf( hspctx->refstr );
		*(void **)out = hspctx->refstr;
		break;
	case MPTYPE_NULLPTR:
		*(int *)out = 0;
		break;
#ifndef HSP_COM_UNSUPPORTED
	case MPTYPE_IOBJECTVAR:
		aptr = code_getva( &pval );
		if ( pval->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		punklocal = *(IUnknown **)HspVarCorePtrAPTR( pval, aptr );
		if ( punklocal ) punklocal->AddRef();	// �ďo����ɉ������
		*(void **)out = (void *)punklocal;
		break;
#endif
	default:
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
	}

	// ���̃p�����[�^�̎��o���i�ċA�I�ɏ����j
	// (��O�����ɂ�蓮�I�m�ۂ����I�u�W�F�N�g���m���ɉ������)
	try {
		result = code_expand_next( prmbuf, st, index + 1 );
	}
	catch (...) {
		if ( localbuf ) sbFree( localbuf );
		if ( punklocal ) punklocal->Release();
		throw;
	}
	if ( localbuf ) sbFree( localbuf );
	if ( punklocal ) punklocal->Release();
	return result;
}

int exec_dllcmd( int cmd, int mask )
{
	STRUCTDAT *st;
	FARPROC pFn;
	int result;

	code_next();							// ���̃R�[�h���擾(�ŏ��ɕK���K�v�ł�)

	if ( cmd >= prmmax ) {
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
	}

	st = GetPRM(cmd);
	pFn = (FARPROC)st->proc;
	if ( pFn == NULL ) {
		if ( BindFUNC( st, NULL ) ) throw ( HSPERR_DLL_ERROR );
		pFn = (FARPROC)st->proc;
	}
	if (( st->otindex & mask ) == 0 ) throw ( HSPERR_SYNTAX );

	result = code_expand_and_call( st );

	if ( st->subid == STRUCTPRM_SUBID_OLDDLLINIT ) {
		if ( result > 0 ) {
			if ( result & 0x20000 ) {
				result &= 0x1ffff;
			} else if ( result & 0x10000 ) {
				result = ( result & 0xffff ) * 10;
			} else {
				throw ( HSPERR_DLL_ERROR );
			}
			hspctx->waitcount = result;
			hspctx->waittick = -1;
			hspctx->runmode = RUNMODE_AWAIT;
			return RUNMODE_AWAIT;
		}
		hspctx->stat = -result;
	} else {
		hspctx->stat = result;
	}

	return RUNMODE_RUN;
}

int cmdfunc_dllcmd( int cmd )
{
	//		cmdfunc : TYPE_DLLCMD
	//		(�g��DLL�R�}���h)
	//
	return exec_dllcmd( cmd, STRUCTDAT_OT_STATEMENT );
}

