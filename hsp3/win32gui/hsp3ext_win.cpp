
//
//	HSP3 External DLL manager
//	onion software/onitama 2004/6
//
#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <ocidl.h>

//	Atl�̃w�b�_
//#include <atlbase.h>
//#include <atlwin.h>
//#include <atlhost.h>

//	Atl��DLL���烊���N����ꍇ
#if 0
#pragma comment(lib, "atl.lib")
#include <atldef.h>
#define _ATL_DLL_IMPL
#include <atliface.h>
#endif

#include "../supio.h"
#include "../hsp3ext.h"
#include "hsp3extlib.h"
#include "../hspwnd.h"

#ifdef HSPDISH
#include "../../hsp3/strbuf.h"
#else
#include "../strbuf.h"
#include "hsp3win.h"
#endif


static HSPCTX *hspctx;		// Current Context
static HSPEXINFO *exinfo;	// Info for Plugins
static int *type;
static int *val;
static int *exflg;
static int reffunc_intfunc_ivalue;
//static PVal **pmpval;


#ifndef HSP_COM_UNSUPPORTED

#include "hspvar_comobj.h"
#include "hspvar_variant.h"
#include "comobj_event.h"

static PVal *comres_pval;
static APTR comres_aptr;

typedef void (CALLBACK *_ATXDLL_INIT)(void);
typedef HRESULT (CALLBACK *_ATXDLL_GETCTRL)( HWND, void **res );
static _ATXDLL_INIT fn_atxinit = NULL;
static _ATXDLL_GETCTRL fn_atxgetctrl = NULL;
static HINSTANCE hinst_atxdll = NULL;
static LPTSTR atxwndclass = NULL;

#endif	// !defined(HSP_COM_UNSUPPORTED)


#define GetPRM(id) (&hspctx->mem_finfo[id])
#define strp(dsptr) &hspctx->mem_mds[dsptr]

/*------------------------------------------------------------*/
/*
		ATL initialization / unitialization routines
*/
/*------------------------------------------------------------*/

#ifndef HSP_COM_UNSUPPORTED


static void InitAtxDll( void )
{
	if ( hinst_atxdll != NULL ) return;

	hinst_atxdll = LoadLibrary( TEXT("Atl71.dll") );
	if ( hinst_atxdll ) {
		atxwndclass = TEXT("AtlAxWin71");
	} else {
		hinst_atxdll = LoadLibrary( TEXT("Atl.dll") );
		if ( hinst_atxdll == NULL ) return;
		atxwndclass = TEXT("AtlAxWin");
	}

	fn_atxinit = (_ATXDLL_INIT)GetProcAddress( hinst_atxdll, "AtlAxWinInit" );
	fn_atxgetctrl = (_ATXDLL_GETCTRL)GetProcAddress( hinst_atxdll, "AtlAxGetControl" );
	if ( fn_atxinit != NULL) fn_atxinit();
}

static void TermAtxDll( void )
{
	// Atl.dll �̉��
	//
	// �����ŉ������Ƌ����I������ꍇ�����邩��
	// (�ϐ��̃N���[���A�b�v����Ɏ��s�����̂������H)
	//
	if ( hinst_atxdll == NULL ) return;
	FreeLibrary( hinst_atxdll );
	hinst_atxdll = NULL;
}

#endif	// !defined(HSP_COM_UNSUPPORTED)


/*------------------------------------------------------------*/
/*
		window object support
*/
/*------------------------------------------------------------*/

#ifndef HSPDISH

static BMSCR *GetBMSCR( void )
{
	HSPEXINFO *exinfo;
	exinfo = hspctx->exinfo2;
	return (BMSCR *)exinfo->HspFunc_getbmscr( *(exinfo->actscr) );
}


static void Object_WindowDelete( HSPOBJINFO *info )
{
	DestroyWindow( info->hCld );
	info->hCld = NULL;
}


// static int AddHSPObject( HWND handle, int mode, int addy, PVal *pv, APTR aptr )
static int AddHSPObject( HWND handle, int mode, int addy )
{
	//		�E�C���h�D�I�u�W�F�N�g��ǉ�����
	//
	HSPEXINFO *exinfo;
	HSPOBJINFO obj;
	BMSCR *bm;
	int wid, entry, ppy;

	entry = -1;

	if ( handle != NULL ) {

		exinfo = hspctx->exinfo2;
		wid = *(exinfo->actscr);				// �A�N�e�B�u�ȃE�C���h�DID
		entry = exinfo->HspFunc_addobj( wid );	// �G���g���[ID�𓾂�
		bm = GetBMSCR();

		obj.hCld = handle;
		obj.owmode = mode;
		obj.option = 0;
		obj.bm = bm;
		obj.func_notice = NULL;
		obj.func_objprm = NULL;
		obj.func_delete = Object_WindowDelete;

		exinfo->HspFunc_setobj( wid, entry, &obj );

		ppy = addy; if ( ppy < bm->py ) ppy = bm->py;
		bm->cy += ppy;
	}

	hspctx->stat = entry;					// �V�X�e���ϐ�stat��ID������
	return entry;
}

#endif

/*------------------------------------------------------------*/
/*
		COM Object interface
*/
/*------------------------------------------------------------*/

#ifndef HSP_COM_UNSUPPORTED

// �ꎞ�̈�Ƃ��Ďg�p���� VARIANT
static VARIANT comconv_var;

void *comget_variant( VARIANT *var, int *restype, BOOL fvariantret /* = FALSE*/ )
{
	//	VARIANT�^��HSP�̌^�ɕϊ�����
	//
	int size;
	BSTR bstr;
/*
	rev 43
	mingw : warning : �萔�ւ̃|�C���^���萔�ւ̃|�C���^�ɑ��
	�ɑΏ�
*/
	void const *ptr;
	if ( fvariantret ) {
		VariantCopy( &comconv_var, var );
		*restype = HSPVAR_FLAG_VARIANT;
		return &comconv_var;
	}

	VariantCopyInd( &comconv_var, var );
	switch ( comconv_var.vt ) {

	case VT_R4:
		VariantChangeType( &comconv_var, &comconv_var, VARIANT_NOVALUEPROP, VT_R8 );
	case VT_R8:
		*restype = HSPVAR_FLAG_DOUBLE;
		return &comconv_var.dblVal;

	case VT_BSTR:
		// ������S�̂�Ԃ����߁AANSI��������o�C�i���f�[�^BSTR�Ƃ��Ċi�[
		ptr = comconv_var.bstrVal;
		if ( ptr == NULL ) ptr = L"";
		size = cnvsjis( NULL, (char *)ptr, 0 );
		bstr = SysAllocStringByteLen( NULL, size );
		if ( bstr == NULL ) throw HSPERR_OUT_OF_MEMORY;
		cnvsjis( (char *)bstr, (char *)ptr, size );
		SysFreeString( comconv_var.bstrVal );
		comconv_var.bstrVal = bstr;
		*restype = HSPVAR_FLAG_STR;
		return comconv_var.bstrVal;

	case VT_DISPATCH:
	case VT_UNKNOWN:
		*restype = HSPVAR_FLAG_COMSTRUCT;
		return &comconv_var.punkVal;

	case VT_I2:
	case VT_UI2:
	case VT_I1:
	case VT_UI1:
	case VT_I8:
	case VT_UI8:
	case VT_BOOL:
		VariantChangeType( &comconv_var, &comconv_var, VARIANT_NOVALUEPROP, VT_I4 );
	case VT_I4:
	case VT_UI4:
	case VT_ERROR:
	case VT_INT:
	case VT_UINT:
		*restype = HSPVAR_FLAG_INT;
		return &comconv_var.lVal;

	default:
		if ( comconv_var.vt & VT_ARRAY ) {
			*restype = HSPVAR_FLAG_VARIANT;		// SafeArray �� Variant �^�ϐ��ň���
			return &comconv_var;
		}
		throw HSPERR_INVALID_TYPE;
	}
}

void comset_variant( VARIANT *var, void *data, int vtype )
{
	//		HSP�̌^��VARIANT �^�ɕϊ�����
	//
	IUnknown *punk;

	VariantClear( var );
	switch( vtype ) {
	case HSPVAR_FLAG_INT:
		var->vt = VT_I4;
		var->lVal = *(int *)data;
		break;
	case HSPVAR_FLAG_DOUBLE:
		var->vt = VT_R8;
		var->dblVal = *(double *)data;
		break;
	case HSPVAR_FLAG_STR:
		var->vt = VT_BSTR;
		var->bstrVal = comget_bstr( (char *)data );
		break;
	case HSPVAR_FLAG_COMSTRUCT:
		var->vt = VT_UNKNOWN;
		var->punkVal = NULL;
		punk = *(IUnknown **)data;
		if ( punk == NULL ) break;
		punk->QueryInterface( IID_IDispatch, (void**)&var->pdispVal );
		if ( var->pdispVal != NULL ) {
			var->vt = VT_DISPATCH;
		} else {
			var->punkVal = punk;
			punk->AddRef();
		}
		break;
	case HSPVAR_FLAG_VARIANT:
		VariantCopy( var, (VARIANT *)data );
		break;
	default:
		throw HSPERR_INVALID_TYPE;
	}
}

void comget_variantres( VARIANT *var, HRESULT hr, BOOL noconv )
{
	//		�Ԓl��VARIANT��ϐ��ɔ��f������
	//
	void *ptr;
	int restype;
	hspctx->stat = (int)hr;
	if ( comres_pval == NULL ) return;
	if ( noconv ) {
		// Variant �̂܂ܕԂ�
		code_setva( comres_pval, comres_aptr, HSPVAR_FLAG_VARIANT, var );
	} else {
		// �ϐ���Ή�����^�ɕϊ�
		if ( var->vt != VT_EMPTY ) {
			ptr = comget_variant( var, &restype );
			code_setva( comres_pval, comres_aptr, restype, ptr );
		}
	}
}

DISPID get_dispid( IUnknown* punk, char *propname, BOOL *bVariant )
{
	//		IDispatch �� DISPID ���擾����
	//
	HRESULT hr;
	IDispatch *disp;
	DISPID dispid;
	char *name = propname;
	LPOLESTR list[]={ (LPOLESTR)(hspctx->stmp) };

	if ( name[0] == '\0' ) return DISPID_VALUE;

	if ( bVariant != NULL ) *bVariant = ( name[0] == '.' );
	if ( name[0] == '.' ) name++;

	disp = (IDispatch *)punk;
	cnvwstr( hspctx->stmp, name, HSPCTX_REFSTR_MAX/sizeof(WCHAR)-1 );
	hr = disp->GetIDsOfNames( IID_NULL, list, 1, LOCALE_SYSTEM_DEFAULT, &dispid );

	if ( FAILED(hr) || dispid == DISPID_UNKNOWN ) throw HSPERR_INVALID_PARAMETER;
	return dispid;
}

BSTR comget_bstr( char *ps )
{
	int size;
	BSTR bstr;
	void *temp;
	size = cnvwstr( NULL, ps, 0 ) + 1;
	if ( size * sizeof(WCHAR) > HSPCTX_REFSTR_MAX ) {
		temp = sbAlloc( size * sizeof(WCHAR) );
		cnvwstr( temp, ps, size );
		bstr = SysAllocString( (LPOLESTR)temp );
		sbFree( temp );
	} else {
		cnvwstr( hspctx->stmp, ps, size );
		bstr = SysAllocString( (LPOLESTR)hspctx->stmp );
	}
	return bstr;
}


int call_method( void *iptr, int index, int *prm, int count )
{
	int *proc;
	proc = (*(int **)iptr);
	proc += index;
	//Alertf( "%x:%x:%d",proc,*proc,index );
	return call_extfunc( (void*)*proc, prm, count );
}

int call_method2( char *prmbuf, const STRUCTDAT *st )
{
	// �w�� IID ���擾���ă��\�b�h�Ăяo��
	// (code_expand_next() ����Ă΂��)
	//
	const LIBDAT *lib;
	const IID *piid;
	IUnknown *punk, *punk2;
	int result;
	HRESULT hr;
	// IID ��������Ă���
	lib = &hspctx->mem_linfo[ st->index ];
	piid = (IID *)strp( lib->nameidx );
	punk = *(IUnknown **)prmbuf;
	if ( st->otindex < 0 || punk == NULL ) throw ( HSPERR_COMDLL_ERROR );
	hr = punk->QueryInterface( *piid, (void**)&punk2 );
	if ( FAILED(hr) || punk2 == NULL ) throw ( HSPERR_COMDLL_ERROR );
	*(IUnknown **)prmbuf = punk2;
	result = call_method( punk2, st->otindex, (int*)prmbuf, st->size / 4 );
	punk2->Release();
	return result;
}

static BOOL GetIIDFromString( IID *iid, char *ps, bool fClsid = false )
{
	//		SJIS������ IID ���� IID �\���̂𓾂�
	//
	//		fClsid ���^�̂Ƃ��AProgID ����� CLSID �擾�����݂�
	//		ProgID �̕ϊ��Ɏ��s�����ꍇ�� FALSE ��Ԃ�
	//		(����ȊO�̃G���[�̓G���[�� throw)
	//
	HRESULT hr;
	cnvwstr( hspctx->stmp, ps, HSPCTX_REFSTR_MAX/sizeof(WCHAR)-1 );
	if ( *ps == '{' ) {
		// GUID ������ �� GUID �\����
		hr = IIDFromString( (LPOLESTR)hspctx->stmp, iid );
		if ( SUCCEEDED(hr) ) return TRUE;
	}
	if ( fClsid ) {
		// ProgID ������ �� GUID �\����
		hr = CLSIDFromProgID( (LPOLESTR)hspctx->stmp, iid );
		if ( SUCCEEDED(hr) ) return TRUE;
		return FALSE;
	}
	throw ( HSPERR_ILLEGAL_FUNCTION );
	return FALSE;
}

#endif	// !defined(HSP_COM_UNSUPPORTED)


/*------------------------------------------------------------*/
/*
		type function
*/
/*------------------------------------------------------------*/

static int cmdfunc_ctrlcmd( int cmd )
{
	//		cmdfunc : TYPE_DLLCTRL
	//		(�g��DLL�R���g���[���R�}���h)
	//
	code_next();							// ���̃R�[�h���擾(�ŏ��ɕK���K�v�ł�)

	if ( cmd >= TYPE_OFFSET_COMOBJ ) {
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		// COM �C���^�[�t�F�[�X���\�b�h�̌Ăяo��
		STRUCTDAT *st;
		st = GetPRM( cmd - TYPE_OFFSET_COMOBJ );
		hspctx->stat = code_expand_and_call( st );
		return RUNMODE_RUN;
#endif
	}

	switch( cmd ) {							// �T�u�R�}���h���Ƃ̕���


	case 0x00:								// newcom
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		IUnknown **ppunkNew, *punkDef;
		CLSID clsid;
		char *clsid_name;
		const IID *piid, *piid2;
		void *iptr;
		LIBDAT *lib;
		STRUCTDAT *st;
		int inimode;

		// ��P�p�����[�^�F�V�����C���^�[�t�F�[�X�|�C���^���i�[����ϐ�
		// (�ϐ���NULL�|�C���^���i�[)
		aptr = code_getva( &pval );
		iptr = NULL;
		code_setva( pval, aptr, TYPE_COMOBJ, &iptr );
		ppunkNew = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );

		// CLSID / IID �����擾
		if ( !code_getexflg() && *type == TYPE_DLLCTRL ) {
			// ��Q�p�����[�^�F#usecom �o�^���
			st = code_getcomst();
			if ( st->otindex != -1 ) throw HSPERR_TYPE_MISMATCH;
			lib = &hspctx->mem_linfo[ st->index ];
			if ( lib->clsid == -1 ) throw HSPERR_INVALID_PARAMETER;
			clsid_name = strp(lib->clsid);
			piid  = (IID *)strp( lib->nameidx );
			piid2 = NULL;
		} else {
			// ��Q�p�����[�^�F������ CLSID
			// (IID �̓f�t�H���g�� IID_IDispatch, �T�|�[�g����Ă��Ȃ���� IID_IUnknown )
			clsid_name = code_getds("");
			piid  = &IID_IDispatch;
			piid2 = &IID_IUnknown;
		}
		inimode = code_getdi(0);				// ���������[�h
		punkDef = (IUnknown *)code_getdi(0);	// �f�t�H���g�I�u�W�F�N�g

		// �V�KCLSID����C���X�^���X���쐬
		hspctx->stat = 0;
		switch ( inimode ) {
		 case 0:
			// �V�K�Ƀ��[�h
			if ( clsid_name[0]!='\0' ) {
				if ( GetIIDFromString(&clsid,clsid_name,true) != FALSE &&
					 SUCCEEDED( CoCreateInstance( clsid, NULL, CLSCTX_SERVER, *piid, (void**)ppunkNew )) &&
					 *ppunkNew != NULL )
				{
					break;
				}
				if ( piid2 != NULL &&
					 SUCCEEDED( CoCreateInstance( clsid, NULL, CLSCTX_SERVER, *piid2, (void**)ppunkNew )) &&
					 *ppunkNew != NULL )
				{
					break;
				}
				hspctx->stat = 1;
			}
			break;
		 case -2:
			// �I�u�W�F�N�g�𖾎��I�Ɏw�肷��ꍇ ( AddRef() ����)
			if ( punkDef != NULL ) punkDef->AddRef();
		 case -1:
			// �I�u�W�F�N�g�𖾎��I�Ɏw�肷��ꍇ ( AddRef() �Ȃ�)
			*ppunkNew = punkDef;
			break;
		 default:
			throw HSPERR_UNSUPPORTED_FUNCTION;
		}
	#ifdef HSP_COMOBJ_DEBUG
		COM_DBG_MSG( "newcom : pObj=%p : &pObj=%p\n", *ppunkNew, ppunkNew);
	#endif
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x01:								// querycom
#ifdef HSP_COM_UNSUPPORTED
		throw HSPERR_UNSUPPORTED_FUNCTION;
#else
		{
		PVal *pval, *pvalNew;
		APTR aptr, aptrNew;
		IUnknown **ppunkDst, **ppunkSrc;
		IID iid;
		const IID *piid;
		void *iptr;
		STRUCTDAT *st;
		LIBDAT *lib;

		// ��P�p�����[�^�F�V�����C���^�[�t�F�[�X�|�C���^���i�[����ϐ�
		aptrNew = code_getva( &pvalNew );

		// ��Q�p�����[�^�F������COM�I�u�W�F�N�g
		aptr = code_getva( &pval );
		if ( pval->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		ppunkSrc = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );
		if ( ! IsVaridComPtr(ppunkSrc) ) throw ( HSPERR_COMDLL_ERROR );

		// IID �����擾
		if ( *type == TYPE_DLLCTRL ) {
			// ��R�p�����[�^�F#usecom �o�^���
			st = code_getcomst();
			if ( st->otindex != -1 ) throw ( HSPERR_TYPE_MISMATCH );
			lib = &hspctx->mem_linfo[ st->index ];
			piid = (IID *)strp( lib->nameidx );
		} else {
			// ��R�p�����[�^�F������ IID
			GetIIDFromString( &iid, code_gets() );
			piid = &iid;
		}

		if ( pvalNew->flag != TYPE_COMOBJ ) {
			// ����ɂ��^�ϊ�
			iptr = NULL;
			code_setva( pvalNew, aptrNew, TYPE_COMOBJ, &iptr );
		}
		ppunkDst = (IUnknown **)HspVarCorePtrAPTR( pvalNew, aptrNew );

		// query �ɂ��C���X�^���X�𓾂�
		QueryComPtr( ppunkDst, *ppunkSrc, piid );
		if ( IsVaridComPtr(ppunkSrc) )
			hspctx->stat = 0;
		else
			hspctx->stat = 1;
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x02:								// delcom
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		IUnknown **ppunk;
		VARIANT *var;
		void *ptr;

		// ��P�p�����[�^�F�������COM�I�u�W�F�N�g�ϐ�
		aptr = code_getva( &pval );
		ptr = HspVarCorePtrAPTR( pval, aptr );
		switch ( pval->flag ) {
		case TYPE_COMOBJ:
			ppunk = (IUnknown **)ptr;
			ReleaseComPtr( ppunk );
			break;
		case TYPE_VARIANT:
			var = (VARIANT *)ptr;
			VariantClear( var );
			break;
		default:
			throw HSPERR_TYPE_MISMATCH;
		}

		// ���̃^�C�~���O�ňꎞ�I�u�W�F�N�g���폜�����Ⴄ
		if ( comconv_var.vt != VT_EMPTY ) VariantClear( &comconv_var );
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x03:								// 	cnvstow
		{
		PVal *pval;
		char *ptr;
		char *ps;
		int size;
		ptr = code_getvptr( &pval, &size );
		ps = code_gets();
		cnvwstr( ptr, ps, size/2 );
		break;
		}

	case 0x04:								// 	comres
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		if ( code_getexflg() ) {
			comres_pval = NULL;
			comres_aptr = 0;
		} else {
			comres_aptr = code_getva( &comres_pval );
		}
		break;
#endif	// HSP_COM_UNSUPPORTED

	case 0x05:								// 	axobj
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		const IID *piid;
		void *iptr;
		BMSCR *bm;
		HWND hwnd;
		int id,sx,sy;
		char clsid_name8[1024];
		HSPAPICHAR *clsid_name;
		IUnknown **ppunk, *punkObj, *punkObj2;
		STRUCTDAT *st;
		LIBDAT *lib;
		HRESULT hr;

		bm = GetBMSCR();

		// ��P�p�����[�^�F�V�����C���^�[�t�F�[�X�|�C���^���i�[����ϐ�
		// (���炩���ߕϐ���NULL���i�[)
		aptr = code_getva( &pval );
		iptr = NULL;
		code_setva( pval, aptr, TYPE_COMOBJ, &iptr );
		ppunk = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );

		// �I�u�W�F�N�g�� CLSID, ProgID, etc.
		if ( *type == TYPE_DLLCTRL ) {
			// ��Q�p�����[�^�F#usecom �o�^��񂩂�擾
			st = code_getcomst();
			if ( st->otindex != -1 ) throw ( HSPERR_TYPE_MISMATCH );
			lib = &hspctx->mem_linfo[ st->index ];
			piid = (IID *)strp( lib->nameidx );
			if ( lib->clsid == -1 ) throw ( HSPERR_INVALID_PARAMETER );
			strncpy( clsid_name8, strp(lib->clsid), sizeof(clsid_name8)-1 );
		} else {
			// ��Q�p�����[�^�F������ CLSID or ProgID ���擾 (IID �� IDispatch)
			piid = &IID_IDispatch;
			strncpy( clsid_name8, code_gets(), sizeof(clsid_name8)-1 );
		}

		// �R���g���[���̃T�C�Y
		sx = code_getdi( bm->sx );
		sy = code_getdi( bm->sy );

		//		ActiveX�Ƃ��ă��[�h
		//
		if ( fn_atxinit == NULL ) throw ( HSPERR_UNSUPPORTED_FUNCTION );
		hwnd = CreateWindow( atxwndclass, chartoapichar(clsid_name8,&clsid_name),
				WS_CHILD, 			// �ŏ��� WS_VISIBLE �Ȃ� (��� ShowWindow() )
				bm->cx, bm->cy, sx, sy,
				bm->hwnd, (HMENU)0, (HINSTANCE)hspctx->instance, NULL );
		freehac(&clsid_name);

		punkObj2 = NULL;
		if ( hwnd ) {
			punkObj = NULL;
			fn_atxgetctrl( hwnd, (void**)&punkObj );
			if ( punkObj ) {
				// �w�� IID �����݂��邩�ǂ���
				hr = punkObj->QueryInterface( *piid, (void**)&punkObj2 );
				punkObj->Release();
			}
		}
		if ( punkObj2 == NULL ) {
			// �ړI�I�u�W�F�N�g�ł͂Ȃ��Ƃ��R���g���[�����폜
			if (hwnd) { DestroyWindow( hwnd ); }
			hspctx->stat = -1;
			break;
		}
		// COM �^�ϐ��Ɋi�[
		*ppunk = punkObj2;

		// HSP�̃E�C���h�D�I�u�W�F�N�g�Ƃ��ēo�^����
		ShowWindow( hwnd, SW_SHOW );
		id = AddHSPObject( hwnd, HSPOBJ_TAB_SKIP, sy );
#ifdef HSP_COMOBJ_DEBUG
		Alertf( "axobj : pObj=%p : &pObj=%p\n", *ppunk, ppunk);
	#endif
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x06:								// 	winobj
		{
#ifdef HSPDISH
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		char clsname8[1024];
		HSPAPICHAR *clsname;
		char winname8[1024];
		HSPAPICHAR *winname;
		HWND hwnd;
		char *ps;
		BMSCR *bm;
		int i;
		int prm[6];

		ps = code_gets(); strncpy( clsname8, ps, 1023 );
		ps = code_gets(); strncpy( winname8, ps, 1023 );

		bm = GetBMSCR();
		for(i=0;i<6;i++) {
			prm[i] = code_getdi(0);
		}
		if ( prm[2] <= 0 ) prm[2] = bm->ox;
		if ( prm[3] <= 0 ) prm[3] = bm->oy;

		hwnd = CreateWindowEx(
		    (DWORD) prm[0],			// �g���E�B���h�E�X�^�C��
		    chartoapichar(clsname8,&clsname),	// �E�B���h�E�N���X��
		    chartoapichar(winname8,&winname),	// �E�B���h�E��
		    (DWORD) prm[1],			// �E�B���h�E�X�^�C��
			bm->cx, bm->cy, prm[2], prm[3],		// X,Y,SIZEX,SIZEY
			bm->hwnd,				// �e�E�B���h�E�̃n���h��
		    (HMENU) prm[4],			// ���j���[�n���h���܂��͎q�E�B���h�EID
			bm->hInst,				// �C���X�^���X�n���h��
		    (PVOID) prm[5]			// �E�B���h�E�쐬�f�[�^
			);
			freehac(&clsname);
			freehac(&winname);

		// AddHSPObject( hwnd, HSPOBJ_TAB_SKIP, prm[3], NULL, 0 );			// HSP�̃E�C���h�D�I�u�W�F�N�g�Ƃ��ēo�^����
		AddHSPObject( hwnd, HSPOBJ_TAB_SKIP, prm[3] );
		break;
#endif	// HSPDISH
		}

	case 0x07:								// 	sendmsg
		{
		int hw,p1,p2,p3,p4,fl,sz;
		char *vptr;
		HSPAPICHAR *hactmp1 = 0;
		HSPAPICHAR *hactmp2 = 0;
		hw = code_getdi(0);
		p1 = code_getdi(0);

		vptr = code_getsptr( &fl );
		if ( fl == TYPE_STRING ) {
			p2 = (int)chartoapichar(code_stmpstr( vptr ),&hactmp1);
		} else {
			p2 = *(int *)vptr;
		}

		vptr = code_getsptr( &fl );
		if ( fl == TYPE_STRING ) {
			p3 = (int)chartoapichar(vptr,&hactmp2);
		} else {
			p3 = *(int *)vptr;
		}

		//Alertf( "SEND[%x][%x][%x]",p1,p2,p3 );
		hspctx->stat = (int)SendMessage( (HWND)hw, p1, p2, p3 );
		freehac(&hactmp1);
		freehac(&hactmp2);
		break;
		}

	case 0x08:								// 	comevent
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		void* iptr;
		char *ps;
		IID iid, *piid;
		unsigned short *subr;
		IUnknown **ppunk, **ppunkEvent;

		// ��P�p�����[�^�F�C�x���g�n���h���I�u�W�F�N�g (IEventHandler) ���i�[����ϐ�
		// (���炩���� NULL �ŏ�����)
		aptr = code_getva( &pval );
		iptr = NULL;
		code_setva( pval, aptr, TYPE_COMOBJ, &iptr );
		ppunkEvent = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );

		// ��Q�p�����[�^�FCOM�I�u�W�F�N�g���i�[�����ϐ�
		aptr = code_getva( &pval );
		if ( pval->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		ppunk = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );
		if ( ! IsVaridComPtr(ppunk) ) throw ( HSPERR_COMDLL_ERROR );

		// ��R�p�����[�^�F�R�l�N�V�����|�C���gIID (������`��)
		ps = code_getds("");
		if ( ps[0] != '\0' ) {
			piid = &iid;
			GetIIDFromString( piid, ps );
		} else {
			piid = NULL;	// NULL �̂Ƃ��f�t�H���gIID �������I�Ɏ擾�����
		}

		// ��S�p�����[�^�F�R�[���o�b�N�p�̃T�u���[�`�����x��
		subr = code_getlb2();

		// �C�x���g�n���h���쐬�E�ڑ�
		SetComEvent( ppunkEvent, ppunk, piid, subr );
	#ifdef HSP_COMOBJ_DEBUG
		COM_DBG_MSG( "comevent : pEvent=%p : pObj=%p\n", *ppunkEvent, *ppunk);
	#endif
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x09:								// 	comevarg
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval, *pval2;
		APTR aptr, aptr2;
		VARIANT *v;
		void *ptr;
		int p1,p2;
		int res;
		IUnknown **ppunk;
		VARIANT varTemp;

		// ��P�p�����[�^�F�C�x���g�̃p�����[�^���i�[����ϐ�
		aptr = code_getva( &pval );

		// ��Q�p�����[�^�F�C�x���g�n���h���I�u�W�F�N�g�ϐ�
		aptr2 = code_getva( &pval2 );
		if ( pval2->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		ppunk = (IUnknown **)HspVarCorePtrAPTR( pval2, aptr2 );
		if ( ! IsVaridComPtr(ppunk) ) throw ( HSPERR_COMDLL_ERROR );

		// ��R�p�����[�^�F�p�����[�^�C���f�b�N�X
		p1 = code_getdi(0);

		// ��S�p�����[�^�F������ϊ��t���O
		p2 = code_getdi(0);

		// �C�x���g�̃p�����[�^�擾
		v = GetEventArg( *ppunk, p1 );
		if ( v == NULL ) throw ( HSPERR_ILLEGAL_FUNCTION );
		switch ( p2 ) {
		case 0:
			VariantInit( &varTemp );
			VariantCopyInd( &varTemp, v );
			ptr = comget_variant( &varTemp, &res );
			VariantClear( &varTemp );
			break;
		case 1:
			VariantInit( &varTemp );
			if FAILED( VariantChangeType( &varTemp, v, VARIANT_ALPHABOOL, VT_BSTR ) )
				throw ( HSPERR_TYPE_INITALIZATION_FAILED );
			ptr = comget_variant( &varTemp, &res );
			VariantClear( &varTemp );
			break;
		case 2:
			ptr = v;
			res = HSPVAR_FLAG_VARIANT;
			break;
		default:
			throw ( HSPERR_ILLEGAL_FUNCTION );
		}
		code_setva( pval, aptr, res, ptr );
		hspctx->stat = res;
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x0a:								// 	sarrayconv
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval1, *pval2;
		APTR aptr1, aptr2;
		int convdir, size;
		VARIANT *variant, varTemp;
		VARTYPE vt;
		SAFEARRAY *psa;
		long lbound, ubound;
		HRESULT hr;

		aptr1 = code_getva( &pval1 );
		aptr2 = code_getva( &pval2 );
		convdir = code_getdi(0);
		size = code_getdi(0);

		switch ( convdir ) {
		case 0:
		case 2:
		case 4:
			// �z��ϐ����� SafeArray �ɕϊ�
			VariantInit( &varTemp );
			code_setva( pval1, aptr1, HSPVAR_FLAG_VARIANT, &varTemp );
			variant = (VARIANT *)HspVarCorePtrAPTR( pval1, aptr1 );
			VariantClear( variant );		// �ꉞ
			if ( convdir == 2 ) {
				// �o�C�i���f�[�^�i�ꎟ���̂݁j
				void *ptr = HspVarCorePtrAPTR( pval2, aptr2 );
				psa = CreateBinarySafeArray( ptr, size, &vt );
			} else {
				BOOL bVariant = ( convdir == 4 );
				psa = ConvVar2SafeArray( pval2, bVariant, &vt );
			}
			variant->vt = vt | VT_ARRAY;
			variant->parray = psa;
			break;
		case 1:
		case 3:
			// SafeArray ����z��ϐ��ɕϊ�
			if ( pval2->flag != HSPVAR_FLAG_VARIANT ) throw HSPERR_INVALID_TYPE;
			variant = (VARIANT *)HspVarCorePtrAPTR( pval2, aptr2 );
			if ( (variant->vt & VT_ARRAY) == 0 ) throw HSPERR_INVALID_TYPE;
			psa = variant->parray;
			if ( psa == NULL ) throw HSPERR_ARRAY_OVERFLOW;
			vt = variant->vt & VT_TYPEMASK;
			if ( vt == VT_EMPTY ) {
				hr = SafeArrayGetVartype( psa, &vt );
				if ( FAILED(hr) || vt == VT_EMPTY ) throw HSPERR_INVALID_ARRAYSTORE;
			}
			if ( convdir == 1 ) {
				ConvSafeArray2Var( pval1, psa, vt );
			} else {
				// �o�C�i���f�[�^�i�ꎟ���̂݁j
				int varsize;
				void *ptr = HspVarCorePtrAPTR( pval1, aptr1 );				if ( vt != VT_UI1 && vt != VT_I1 ) throw HSPERR_INVALID_TYPE;
				SafeArrayGetLBound( psa, 1, &lbound );
				hr = SafeArrayGetUBound( psa, 1, &ubound );
				if ( FAILED(hr) ) throw HSPERR_ARRAY_OVERFLOW;
				size = ubound - lbound + 1;
				HspVarCoreGetBlockSize( pval1, (PDAT*)ptr, &varsize );
				if ( varsize < size ) throw HSPERR_BUFFER_OVERFLOW;
				GetBinarySafeArray( ptr, size, psa );
			}
			break;
		default:
			throw ( HSPERR_UNSUPPORTED_FUNCTION );
		}
		break;
		}
#endif	// HSP_COM_UNSUPPORTED
	case 0x0c:								//  cnv8tow
#ifndef HSPUTF8
		throw (HSPERR_UNSUPPORTED_FUNCTION);
#else
		{
		PVal *pval;
		char *ptr;
		char *ps;
		int size;
		int sizew;
		HSPAPICHAR *hactmp1;
		ptr = code_getvptr(&pval, &size);
		ps = code_gets();
		chartoapichar(ps, &hactmp1);
		sizew = wcslen(hactmp1);
		if (size < sizew*(int)sizeof(HSPAPICHAR)){
			memcpy(ptr, hactmp1, size);
			hspctx->stat = -sizew*sizeof(HSPAPICHAR);
		}
		else{
			memcpy(ptr, hactmp1, sizew*sizeof(HSPAPICHAR));
			hspctx->stat = sizew;
		}
		freehac(&hactmp1);
		break;
		}
#endif
	default:
		throw ( HSPERR_SYNTAX );
	}
	return RUNMODE_RUN;
}


static void *reffunc_ctrlfunc( int *type_res, int arg )
{
	//		reffunc : TYPE_DLLCTRL
	//		(�g��DLL�R���g���[���֐�)
	//
	void *ptr;
	int p1,p2;

	//			'('�Ŏn�܂邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) throw ( HSPERR_INVALID_FUNCPARAM );
	code_next();

	ptr = &reffunc_intfunc_ivalue;
	*type_res = HSPVAR_FLAG_INT;

	switch( arg ) {							// �T�u�R�}���h���Ƃ̕���
	case 0x100:								// callfunc
		{
		PVal *pval;
		PDAT *p;
		pval = code_getpval();
		p = HspVarCorePtrAPTR( pval, 0 );
		p1 = code_geti();
		p2 = code_geti();
		reffunc_intfunc_ivalue = call_extfunc( (void *)p1, (int *)p, p2 );
		break;
		}
	case 0x101:								// cnvwtos
		{
		PVal *pval;
		char *sptr;
		int size;
		sptr = code_getvptr( &pval, &size );
		hspctx->stmp = sbExpand( hspctx->stmp, size );
		ptr = hspctx->stmp;
		cnvsjis( ptr, sptr, size  );
		*type_res = HSPVAR_FLAG_STR;
		break;
		}

	case 0x102:								// 	comevdisp
#ifdef HSP_COM_UNSUPPORTED
		throw ( HSPERR_UNSUPPORTED_FUNCTION );
#else
		{
		PVal *pval;
		APTR aptr;
		IUnknown **ppunk;
		// ��P�p�����[�^�FCOM�I�u�W�F�N�g�ϐ�
		aptr = code_getva( &pval );
		if ( pval->flag != TYPE_COMOBJ ) throw ( HSPERR_TYPE_MISMATCH );
		ppunk = (IUnknown **)HspVarCorePtrAPTR( pval, aptr );
		if ( !IsVaridComPtr(ppunk) ) throw ( HSPERR_COMDLL_ERROR );

		// �C�x���g�� DISPID �擾
		reffunc_intfunc_ivalue = GetEventDispID( *ppunk );
		break;
		}
#endif	// HSP_COM_UNSUPPORTED

	case 0x103:								// 	libptr
		{
		//LIBDAT *lib;
		STRUCTDAT *st;
		switch( *type ) {
		case TYPE_DLLFUNC:
		case TYPE_MODCMD:
			p1 = *val;
			break;
		case TYPE_DLLCTRL:
			p1 = *val;
			if ( p1 >= TYPE_OFFSET_COMOBJ ) {
				p1 -= TYPE_OFFSET_COMOBJ;
				break;
			}
		default:
			throw ( HSPERR_TYPE_MISMATCH );
		}
		code_next();
		st = GetPRM( p1 );
		//lib = &hspctx->mem_linfo[ st->index ];
		reffunc_intfunc_ivalue = (int)st;
		break;
		}

	case 0x104:								//  cnvwto8
#ifndef HSPUTF8
		throw (HSPERR_UNSUPPORTED_FUNCTION);
#else
		{
			PVal *pval;
			char *sptr;
			int size;
			sptr = code_getvptr(&pval, &size);
			hspctx->stmp = sbExpand(hspctx->stmp, size*3);
			ptr = hspctx->stmp;
			cnvu8(ptr, sptr, size*3);
			*type_res = HSPVAR_FLAG_STR;
			break;
		}
#endif

	default:
		throw ( HSPERR_SYNTAX );
	}

	//			')'�ŏI��邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != ')' ) throw ( HSPERR_INVALID_FUNCPARAM );
	code_next();

	return ptr;
}


static void *reffunc_dllcmd( int *type_res, int arg )
{
	//		reffunc : TYPE_DLLFUNC
	//		(�g��DLL�֐�)
	//

	//			'('�Ŏn�܂邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != '(' ) throw ( HSPERR_INVALID_FUNCPARAM );

	*type_res = HSPVAR_FLAG_INT;
	exec_dllcmd( arg, STRUCTDAT_OT_FUNCTION );
	reffunc_intfunc_ivalue = hspctx->stat;

	//			')'�ŏI��邩�𒲂ׂ�
	//
	if ( *type != TYPE_MARK ) throw ( HSPERR_INVALID_FUNCPARAM );
	if ( *val != ')' ) throw ( HSPERR_INVALID_FUNCPARAM );
	code_next();

	return &reffunc_intfunc_ivalue;
}


static int termfunc_dllcmd( int option )
{
	//		termfunc : TYPE_DLLCMD
	//
#ifndef HSP_COM_UNSUPPORTED
	VariantClear( &comconv_var );
	// TermAtxDll();
#endif

	Hsp3ExtLibTerm();
	return 0;
}

void hsp3typeinit_dllcmd( HSP3TYPEINFO *info )
{
#ifndef HSP_COM_UNSUPPORTED
#ifdef HSP_COMOBJ_DEBUG
	if (fpComDbg == NULL) fpComDbg = fopen( "comobj_dbg.txt", "w");
#endif
	InitAtxDll();
	VariantInit( &comconv_var );
	comres_pval = NULL;
#endif	// !defined( HSP_COM_UNSUPPORTED )

	hspctx = info->hspctx;
	exinfo = info->hspexinfo;
	type = exinfo->nptype;
	val = exinfo->npval;
	exflg = exinfo->npexflg;

	info->cmdfunc = cmdfunc_dllcmd;
	info->reffunc = reffunc_dllcmd;
	info->termfunc = termfunc_dllcmd;

	Hsp3ExtLibInit( info );
}

void hsp3typeinit_dllctrl( HSP3TYPEINFO *info )
{
	info->cmdfunc = cmdfunc_ctrlcmd;
	info->reffunc = reffunc_ctrlfunc;
}

