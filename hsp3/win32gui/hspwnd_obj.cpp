
//
//	HSP3 window manager
//	onion software/onitama 2004/6
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../hsp3config.h"
#include "../hsp3debug.h"
#include "../hspwnd.h"
#include "../dpmread.h"
#include "../strbuf.h"
#include "../strnote.h"
#include "../supio.h"

/*------------------------------------------------------------*/
/*
		Object callback interface
*/
/*------------------------------------------------------------*/

static int *notice_ptr;
static int bmscr_obj_ival;
static double bmscr_obj_dval;
static WNDPROC DefEditProc;


LRESULT CALLBACK MyEditProc( HWND hwnd , UINT msg , WPARAM wp , LPARAM lp ) {
	if ( msg==WM_CHAR ) {
		if (( wp==13 )||( wp==9 )) {
			return 0;
		}
	}
	return CallWindowProc( DefEditProc , hwnd , msg , wp , lp);
}

void SetObjectEventNoticePtr( int *ptr )
{
	//		イベント時の値ポインタを設定
	//
	notice_ptr = ptr;
}

static void Object_WindowDelete( HSPOBJINFO *info )
{
	DestroyWindow( info->hCld );
	info->hCld = NULL;
}

static void Object_JumpEvent( HSPOBJINFO *info, int wparam )
{
	*notice_ptr = info->owsize;
	if ( info->owid == 0 ) {
		code_setpci( (unsigned short *)info->varset.ptr );
	} else {
		code_call( (unsigned short *)info->varset.ptr );
	}
}

static void Object_SendSetVar( HSPOBJINFO *obj )
{
	code_setva( obj->varset.pval, obj->varset.aptr, obj->varset.type, obj->varset.ptr );
}

static void Object_CheckBox( HSPOBJINFO *info, int wparam )
{
	HWND hwnd;
	BMSCR *bm;
	int val, cid;

	bm = (BMSCR *)info->bm;
	hwnd = bm->hwnd;
	cid = GetDlgCtrlID( info->hCld );
	val = IsDlgButtonChecked( hwnd, cid );
	bmscr_obj_ival = val;
	Object_SendSetVar( info );
}

static void Object_IntInput( HSPOBJINFO *info, int wparam )
{
	HWND hwnd;
	BMSCR *bm;
	char minp[64];
	int val, cid, notify;

	bm = (BMSCR *)info->bm;
	hwnd = bm->hwnd;
	notify = wparam>>16;
	if ( notify != EN_UPDATE ) return;
	cid = GetDlgCtrlID( info->hCld );
	val = GetDlgItemText( hwnd, cid, minp, 63 );
	if ( val == 0 ) {
		bmscr_obj_ival = 0;
	} else {
		bmscr_obj_ival = atoi( minp );
	}
	info->varset.ptr = (void *)&bmscr_obj_ival;
	Object_SendSetVar( info );
}

static void Object_DoubleInput( HSPOBJINFO *info, int wparam )
{
	HWND hwnd;
	BMSCR *bm;
	char minp[64];
	int val, cid, notify;

	bm = (BMSCR *)info->bm;
	hwnd = bm->hwnd;
	notify = wparam>>16;
	if ( notify != EN_UPDATE ) return;
	cid = GetDlgCtrlID( info->hCld );
	val = GetDlgItemText( hwnd, cid, minp, 63 );
	if ( val == 0 ) {
		bmscr_obj_dval = 0.0;
	} else {
		bmscr_obj_dval = atof( minp );
	}
	info->varset.ptr = (void *)&bmscr_obj_dval;
	Object_SendSetVar( info );
}

static void Object_StrInput( HSPOBJINFO *info, int wparam )
{
	HWND hwnd;
	BMSCR *bm;
	char minp[0x8000];
	int val, cid, notify;

	bm = (BMSCR *)info->bm;
	hwnd = bm->hwnd;
	notify = wparam>>16;
	if ( notify != EN_UPDATE ) return;
	cid = GetDlgCtrlID( info->hCld );
	val = GetDlgItemText( hwnd, cid, minp, 0x7fff );
	if ( val == 0 ) {
		bmscr_obj_ival = 0;
		info->varset.ptr = (void *)&bmscr_obj_ival;
	} else {
		info->varset.ptr = minp;
	}
	Object_SendSetVar( info );
}

static void Object_ComboBox( HSPOBJINFO *info, int wparam )
{
	int notify;
	notify = wparam>>16;
	if ( notify != CBN_SELENDOK ) return;
	bmscr_obj_ival = (int)SendMessage( info->hCld, CB_GETCURSEL,0,0L );;
	Object_SendSetVar( info );
}

static void Object_ListBox( HSPOBJINFO *info, int wparam )
{
	bmscr_obj_ival = (int)SendMessage( info->hCld, LB_GETCURSEL,0,0L );;
	Object_SendSetVar( info );
}

static void Object_SetMultiBox( HSPOBJINFO *info, int type, void *ptr )
{
	int i,max;
	char res[256];
	UINT m_ini,m_add;
	HWND hw;
	CStrNote note;

	hw = info->hCld;

	switch( type ) {
	case TYPE_STRING:
		if ( info->owid ) {
			m_ini=CB_RESETCONTENT;
	        m_add=CB_ADDSTRING;
		} else {
			m_ini=LB_RESETCONTENT;
			m_add=LB_ADDSTRING;
		}
		note.Select( (char *)ptr );
		max = note.GetMaxLine();
		SendMessage( hw, m_ini, 0, 0L );
		for( i=0;i<max;i++ ) {
			note.GetLine( res, i, 255 );
			SendMessage( hw, m_add, 0, (long)res );
		}
		break;
	case TYPE_INUM:
		if ( info->owid ) {
			m_ini=CB_SETCURSEL;
		} else {
			m_ini=LB_SETCURSEL;
		}
		SendMessage( hw, m_ini, *(int *)ptr, 0L );
		break;
	default:
		throw HSPERR_TYPE_MISMATCH;
	}
}


static void Object_SetInputBox( HSPOBJINFO *info, int type, void *ptr )
{
	HWND hw;
	hw = info->hCld;
	switch( type ) {
	case TYPE_STRING:
		SetWindowText( hw, (char *)ptr );
		break;
	case TYPE_INUM:
	case TYPE_DNUM:
		SetWindowText( hw, (char *)HspVarCoreCnv( type, TYPE_STRING, ptr ) );
		break;
	default:
		throw HSPERR_TYPE_MISMATCH;
	}
}


static void Object_SetCheckBox( HSPOBJINFO *info, int type, void *ptr )
{
	int a;
	HWND hw;
	hw = info->hCld;
	if ( type != TYPE_INUM ) throw HSPERR_TYPE_MISMATCH;
	a=0;if ( *((int *)ptr) ) a++;
	SendMessage( hw, BM_SETCHECK,a,0 );
	Object_CheckBox( info, NULL );
}


/*---------------------------------------------------------------------------*/

void Bmscr::ResetHSPObject( void )
{
	//		すべてのObjectをリセットする
	//
	int i;
	if ( mem_obj != NULL ) {
		for( i=0;i<objmax;i++ ) {
			DeleteHSPObject( i );
		}
		sbFree( mem_obj );
	}
	mem_obj = NULL;
	objmax = 0;
	objlimit = HSPOBJ_LIMIT_DEFAULT;
}


int Bmscr::ActivateHSPObject( int id )
{
	//		フォーカスをONにする
	//
	int a,cid;
	HWND ow;
	HSPOBJINFO *obj;

	if (id>=0) {
		obj = &mem_obj[ id ];
		ow = obj->hCld;
		if ( ow == NULL ) return -2;
		SetFocus( ow );
		return 0;
	}
	cid = -1;
	ow = GetFocus();
	if ( ow != NULL) {
		for( a=0; a<objmax; a++ ) {
			if ( ow == mem_obj[ a ].hCld ) cid = a;
		}
	}
	return cid;
}



void Bmscr::NextObject( int plus )
{
	//		[TAB]を押して次のobjectを選択
	//
	HWND hw;
	HSPOBJINFO *obj;
	int a,cid,ts;

	cid = ActivateHSPObject(-1);
	obj = &mem_obj[ cid ];
	if ( cid>=0 ) if ( ( obj->owmode & 3 ) == HSPOBJ_TAB_DISABLE ) return;

	for( a=0; a<objmax; a++ ) {
		cid+=plus;
		if ( cid>=objmax ) cid = 0;
		if ( cid<0 ) cid = objmax - 1;
		obj = &mem_obj[ cid ];
		hw = obj->hCld;
		if ( hw != NULL ) {
			ts = obj->owmode & 3;
			if ( ts != HSPOBJ_TAB_SKIP ) {
				if ( IsWindowEnabled( hw ) ) {
					if ( obj->owmode & HSPOBJ_TAB_SELALLTEXT ) {
						SendMessage( hw, EM_SETSEL, 0, -1);
					}
					SetFocus( hw );
					return;
				}
			}
		}
	}
}



int Bmscr::NewHSPObject( void )
{
	//		空きIDを探す
	//
	int i,id;
	id = 0;
	if ( mem_obj == NULL ) {
		mem_obj = (HSPOBJINFO *) sbAlloc( sizeof(HSPOBJINFO) );
		objmax++;
	} else {
		if ( objmax ) {
			for( i=0; i<objmax; i++ ) {
				if ( mem_obj[i].owmode == HSPOBJ_NONE ) return i;
			}
		}
		if ( objmax >= objlimit ) throw HSPERR_WINDOW_OBJECT_FULL;
		id = objmax++;
		mem_obj = (HSPOBJINFO *) sbExpand( (char *)mem_obj, sizeof(HSPOBJINFO) * objmax );
	}
	return id;
}


HSPOBJINFO *Bmscr::AddHSPObject( int id, HWND handle, int mode )
{
	HSPOBJINFO *obj;
	obj = &mem_obj[id];
	obj->hCld = handle;
	obj->owmode = mode;
	obj->option = 0;
	obj->bm = GetBMSCR();
	obj->func_notice = NULL;
	obj->func_objprm = NULL;
	obj->func_delete = NULL;
	obj->owid = 0;
	obj->owsize = 0;
	SetHSPObjectFont( id );
	return obj;
}


HSPOBJINFO *Bmscr::AddHSPJumpEventObject( int id, HWND handle, int mode, int val, void *ptr )
{
	HSPOBJINFO *obj;
	obj = AddHSPObject( id, handle, mode );
	obj->owid = val;
	obj->owsize = id;
	obj->varset.ptr = ptr;
	obj->func_notice = Object_JumpEvent;
	return obj;
}


HSPOBJINFO *Bmscr::AddHSPVarEventObject( int id, HWND handle, int mode, PVal *pval, APTR aptr, int type, void *ptr )
{
	HSPOBJINFO *obj;
	obj = AddHSPObject( id, handle, mode );
	obj->varset.pval = pval;
	obj->varset.aptr = aptr;
	obj->varset.type = type;
	obj->varset.ptr = ptr;
	return obj;
}


HSPOBJINFO *Bmscr::GetHSPObject( int id )
{
	return &mem_obj[id];
}


void Bmscr::DeleteHSPObject( int id )
{
	//		オブジェクト削除
	//
	HFONT hf;
	HSPOBJINFO *obj;
	obj = &mem_obj[id];

	if ( obj->owmode == HSPOBJ_NONE ) return;
	if ( obj->hCld != NULL ) {
		if ( obj->owmode & HSPOBJ_OPTION_SETFONT ) {
			hf=(HFONT)SendMessage( obj->hCld, WM_GETFONT, 0, 0 );
			if (hf!=NULL) DeleteObject( hf );
		}
		if ( obj->func_delete != NULL ) obj->func_delete( obj );
	}
	obj->owmode = HSPOBJ_NONE;
}


void Bmscr::UpdateHSPObject( int id, int type, void *ptr )
{
	//		オブジェクトに値を設定する
	//
	HSPOBJINFO *obj;
	obj = &mem_obj[id];
	if ( obj->func_objprm != NULL ) {
		obj->func_objprm( obj, type, ptr );
	} else {
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}
}


void Bmscr::SetHSPObjectFont( int id )
{
	int a;
	HWND hw;
	HFONT hf;
	PLOGFONT plf;
	HSPOBJINFO *obj;

	obj = &mem_obj[id];
	if ( obj->owmode == HSPOBJ_NONE ) return;
	if (( obj->owmode & HSPOBJ_OPTION_SETFONT ) == 0 ) return;

	a = objmode;
	if (a) {
		hw = obj->hCld;
		if ( hw == NULL ) return;
		if (a==1) hf=(HFONT)GetStockObject(17);
		else {
			plf=(PLOGFONT) &logfont;
			hf=CreateFontIndirect( plf );
		}
		PostMessage( hw,WM_SETFONT,(WPARAM)hf,TRUE );
	}
}


void Bmscr::SendHSPObjectNotice( int wparam )
{
	int id;
	HWND hw;
	HSPOBJINFO *obj;
	id = wparam & (MESSAGE_HSPOBJ-1);
	obj = &mem_obj[id];
	if ( obj->owmode == HSPOBJ_NONE ) return;
	hw = obj->hCld;
	if ( hw == NULL ) return;

	if ( obj->func_notice != NULL ) {
		obj->func_notice( obj, wparam );
	}
}


int Bmscr::AddHSPObjectButton( char *name, int flag, void *callptr )
{
	//		create push button
	//
	HWND hw;
	int id,ws;
	HSPOBJINFO *obj;

	id = NewHSPObject();
	ws = objstyle | BS_PUSHBUTTON;
	hw = CreateWindow( "button", name, ws,
				cx, cy, ox, oy, hwnd,
				(HMENU)(short)( MESSAGE_HSPOBJ + id ), hInst, NULL );

	obj = AddHSPJumpEventObject( id, hw, HSPOBJ_TAB_ENABLE|HSPOBJ_OPTION_SETFONT, flag, callptr );
	obj->func_delete = Object_WindowDelete;
	obj->func_objprm = Object_SetInputBox;
	Posinc( oy );
	return id;
}


int Bmscr::AddHSPObjectCheckBox( char *name, PVal *pval, APTR aptr )
{
	//		create push button
	//
	HWND hw;
	int id,ws;
	int *iptr;
	HSPOBJINFO *obj;

	id = NewHSPObject();
	ws = objstyle | BS_AUTOCHECKBOX;
	hw = CreateWindow( "button", name, ws,
				cx, cy, ox, oy, hwnd,
				(HMENU)(short)( MESSAGE_HSPOBJ + id ), hInst, NULL );

	obj = AddHSPVarEventObject( id, hw, HSPOBJ_TAB_ENABLE|HSPOBJ_OPTION_SETFONT, pval, aptr, TYPE_INUM, (void *)&bmscr_obj_ival );
	obj->func_notice = Object_CheckBox;
	obj->func_objprm = Object_SetCheckBox;
	obj->func_delete = Object_WindowDelete;
	Posinc( oy );

	iptr = (int *)HspVarCorePtrAPTR( pval, aptr );
	if ( *iptr ) SendMessage( hw, BM_SETCHECK, 1, 0 );

	return id;
}


int Bmscr::AddHSPObjectInput( PVal *pval, APTR aptr, int sizex, int sizey, char *defval, int limit, int mode )
{
	//		create input box
	//
	HWND hwedit;
	int id,ws,ws2,max,tabstop,type,subcl;
	HSPOBJINFO *obj;

	id = NewHSPObject();
	ws = objstyle;
	ws2 = WS_EX_CLIENTEDGE;
	max = 16;
	subcl = 0;
	tabstop = HSPOBJ_TAB_ENABLE;
	type = mode & 15;
	if ( type == HSPOBJ_INPUT_STR ) max = limit;

	if ( mode & HSPOBJ_INPUT_HSCROLL ) ws|=WS_HSCROLL;
	if ( mode & HSPOBJ_INPUT_MULTILINE ) {
		ws|=ES_LEFT|ES_MULTILINE|ES_WANTRETURN|WS_VSCROLL|ES_AUTOVSCROLL;
		//tabstop = HSPOBJ_TAB_DISABLE;
		tabstop = HSPOBJ_TAB_SKIP;
		max = 0;
	}
	else {
		//if ( bm->objmode & 32 ) ws2=WS_EX_WINDOWEDGE;
		ws|=ES_AUTOHSCROLL;
		tabstop |= HSPOBJ_TAB_SELALLTEXT;
		subcl = 1;
	}

	if ( mode & HSPOBJ_INPUT_READONLY ) {
		ws|=ES_READONLY;
		tabstop = HSPOBJ_TAB_SKIP;
	}
	else {
		ws|=WS_TABSTOP;
	}

	hwedit = CreateWindowEx( ws2, "edit", NULL, ws,
					cx, cy, sizex, sizey,
					hwnd, (HMENU)(short)( MESSAGE_HSPOBJ + id ), hInst, NULL );

	if ( subcl ) {
		DefEditProc = (WNDPROC)GetWindowLong( hwedit , GWL_WNDPROC );
		SetWindowLong( hwedit , GWL_WNDPROC , (LONG)MyEditProc );
	}

	obj = AddHSPVarEventObject( id, hwedit, tabstop|HSPOBJ_OPTION_SETFONT, pval, aptr, type, (void *)&bmscr_obj_ival );
	switch( type ) {
	case HSPOBJ_INPUT_STR:
		obj->func_notice = Object_StrInput;
		break;
	case HSPOBJ_INPUT_DOUBLE:
		obj->func_notice = Object_DoubleInput;
		break;
	case HSPOBJ_INPUT_INT:
		obj->func_notice = Object_IntInput;
		break;
	default:
		throw HSPERR_TYPE_MISMATCH;
	}
	obj->func_delete = Object_WindowDelete;
	obj->func_objprm = Object_SetInputBox;
	Posinc( sizey );

	SendMessage( hwedit, EM_LIMITTEXT, limit, 0L );
	SetWindowText( hwedit,defval );
	if ( focflg == 0 ) SetFocus( hwedit );
	focflg++;

	return id;
}


int Bmscr::AddHSPObjectMultiBox( PVal *pval, APTR aptr, int psize, char *defval, int mode )
{
	//		create combo/list box
	//
	HWND hw;
	HSPOBJINFO *obj;
	int id,sizex,sizey;
	int *iptr;

	id = NewHSPObject();
	sizex = ox; sizey = oy;
	iptr = (int *)HspVarCorePtrAPTR( pval, aptr );

	if ( mode ) {
		hw = CreateWindowEx( WS_EX_CLIENTEDGE, "combobox", "",
			objstyle|WS_VSCROLL|CBS_DROPDOWNLIST,
			cx, cy, sizex, sizey + psize, hwnd,
			(HMENU)(short)( MESSAGE_HSPOBJ + id ), hInst, NULL );
	} else {
		sizey += psize;
		hw = CreateWindowEx( WS_EX_CLIENTEDGE, "listbox", "",
			objstyle|WS_VSCROLL|LBS_NOTIFY,
			cx, cy, sizex, sizey, hwnd,
			(HMENU)(short)( MESSAGE_HSPOBJ + id ), hInst, NULL );
	}

	obj = AddHSPVarEventObject( id, hw, HSPOBJ_TAB_ENABLE|HSPOBJ_OPTION_SETFONT, pval, aptr, TYPE_INUM, (void *)&bmscr_obj_ival );
	obj->owid = mode;

	if ( mode ) {
		obj->func_notice = Object_ComboBox;
	} else {
		obj->func_notice = Object_ListBox;
	}
	obj->func_objprm = Object_SetMultiBox;
	obj->func_delete = Object_WindowDelete;
	Posinc( sizey );
	Object_SetMultiBox( obj, TYPE_STRING, defval );
	Object_SetMultiBox( obj, TYPE_INUM, iptr );
	return id;
}

