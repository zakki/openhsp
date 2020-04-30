
//
//	HSP3 window object manager
//	onion software/onitama 2004/6
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../hsp3/hsp3config.h"
#include "../hsp3/hsp3debug.h"
#include "../hsp3/dpmread.h"
#include "../hsp3/strbuf.h"
#include "../hsp3/strnote.h"

#include "hgio.h"
#include "supio.h"
#include "hspwnd.h"


/*------------------------------------------------------------*/
/*
		Object base interface
*/
/*------------------------------------------------------------*/

Hsp3ObjBase::Hsp3ObjBase(void)
{
	messx = -1;
	messy = -1;
	value = 0;
}

Hsp3ObjBase::~Hsp3ObjBase(void)
{
}

/*------------------------------------------------------------*/
/*
		Object callback interface
*/
/*------------------------------------------------------------*/

static int *notice_ptr;
static int bmscr_obj_ival;
static double bmscr_obj_dval;

void SetObjectEventNoticePtr( int *ptr )
{
	//		�C�x���g���̒l�|�C���^��ݒ�(stat�l)
	//
	notice_ptr = ptr;
}

static void Object_JumpEvent(HSPOBJINFO *info, int wparam)
{
	if (info->enableflag == 0) return;
	*notice_ptr = info->owsize;				// stat���X�V

	Hsp3ObjButton *btn = (Hsp3ObjButton *)info->btnset;
	if (btn == NULL) return;

	if (btn->jumpmode & 1) {
		code_call((unsigned short *)btn->ptr);
	}
	else {
		code_setpci((unsigned short *)btn->ptr);
	}

}

static void Object_SendSetVar(HSPOBJINFO *obj)
{
	HSP3VARSET *var = obj->varset;
	if (var == NULL) return;
	code_setva(var->pval, var->aptr, var->type, var->ptr);
}

static void Object_ApplyFont(HSPOBJINFO *info)
{
	Bmscr *bm;
	char *fn = "";

	bm = (Bmscr *)info->bm;
#ifdef HSPWIN
	if (info->fontmode & HSPOBJ_FONTMODE_GUIFONT) {
		fn = "MS UI Gothic";
	}
#endif
	if (info->owmode & HSPOBJ_OPTION_SETFONT) {
		if (info->fontname) {
			fn = (char *)info->fontname->c_str();
		}
	}
	bm->SetFontInternal(fn, info->fontsize, info->fontstyle);
}

static void Object_ButtonDraw( HSPOBJINFO *info )
{
	Bmscr *bm;
	int col1,col2,tcol;
	int x1,x2,y1,y2;

	bm = (Bmscr *)info->bm;
	Object_ApplyFont(info);

	Hsp3ObjButton *btn = (Hsp3ObjButton *)info->btnset;
	if (btn == NULL) return;

	x1 = info->x; y1 = info->y;
	x2 = info->x + info->sx - 1; y2 = info->y + info->sy - 1;

	tcol = info->fontcolor & 0xffffff;
	//tcol = 0xffffff;
	if ( info->srcid < 0 ) {
		//	�O���f�[�V�����ɂ��W���{�^��
		if ( info->enableflag ) {
			if ( info->tapflag == 1 ) {
				col1 = 0x909090; col2 = 0xc0c0c0;
				//col1 = 0xff202020; col2 = 0xff404040;
			} else {
				col1 = 0xf0f0f0; col2 = 0xc0c0c0;
				//col1 = 0xff404040; col2 = 0xff606060;
			}
		} else {
			col1 = 0x808080; col2 = 0x606060; tcol = 0x404040;
		}
		bm->gmode = 0;
		bm->gfrate = 255;
		bm->GradFill( x1+1, y1+1, info->sx-2, info->sy-2, 1, col1, col2 );
		bm->Setcolor( 0x808080 );
		bm->cx = x1; bm->cy = y1;
		bm->Line( x2, y1 );
		bm->Line( x2, y2 );
		bm->Line( x1, y2 );
		bm->Line( x1, y1 );
	} else {
		//	�摜�ɂ��{�^��
		col1 = btn->normal_x; col2 = btn->normal_y;
		if ( info->enableflag ) {
			if ( info->tapflag == 1 ) {
				col1 = btn->push_x; col2 = btn->push_y;
			}
		} else {
			tcol = 0x808080;
		}
		bm->gmode = 3;
		bm->gfrate = 255;
		bm->Setcolor( tcol );
		bm->cx = x1;
		bm->cy = y1;
		HspWnd *wnd = (HspWnd *)bm->master_hspwnd;
		bm->Copy( wnd->GetBmscrSafe( info->srcid ), col1, col2, info->sx, info->sy );
	}

	bm->gmode = 3;
	bm->gfrate = 255;
	bm->Setcolor( tcol );
	bm->cx = info->x;
	bm->cy = info->y;
	bm->printoffsetx = info->sx;
	bm->printoffsety = info->sy;
	if ( info->tapflag == 1 ) {
		bm->cx++;
		bm->cy++;
	}
	bm->Print( (char *)info->btnset->name.c_str() );
}

static void Object_CheckBoxDraw(HSPOBJINFO *info)
{
	Bmscr *bm;
	int tcol;
	int bgcol;
	int x1, x2, y1, y2;
	int fontmode;

	Object_ApplyFont(info);

	bm = (Bmscr *)info->bm;
	Hsp3ObjButton *btn = (Hsp3ObjButton *)info->btnset;
	if (btn == NULL) return;

	tcol = info->fontcolor;
	if (info->enableflag == 0) tcol = 0xff808080;
	//if (info->tapflag == 1) tcol = 0xff808080;

	x1 = info->x; y1 = info->y;
	x2 = info->x + info->sx - 1; y2 = info->y + info->sy - 1;

	bgcol = 0;
	fontmode = info->fontmode & 3;
	switch (fontmode) {
	case HSPOBJ_FONTMODE_OPAQUE:
		bgcol = 0xff000000 | (info->backcolor & 0xffffff);
		break;
	case HSPOBJ_FONTMODE_TRANSPARENT:
		bgcol = 0x80000000 | ( info->backcolor & 0xffffff );
		break;
	default:
		break;
	}

	if (bgcol != 0) {
		bm->gmode = 3;
		bm->gfrate = bgcol >> 24;
		bm->Setcolor(bgcol);
		bm->Boxfill(x1, y1, x2, y2, 1);
	}

	//bm->gmode = 0;
	//bm->gfrate = 255;
	//bm->GradFill(x1 + 1, y1 + 1, info->sx - 2, info->sy - 2, 1, col1, col2);
	//bm->Setcolor(tcol);

	bm->gmode = 3;
	bm->gfrate = 255;
	bm->Setcolor(tcol);
	bm->cx = x1+ ( info->fontsize * 2 );
	bm->cy = y1;
	bm->printoffsety = info->sy;
	bm->Print((char *)info->btnset->name.c_str());

	int fsize = info->fontsize;
	int y = (info->sy - bm->printsizey)/2;
	if (y < 0) y = 0;
	x1 = x1 + fsize / 2;
	y1 = y1+y;
	x2 = x1 + fsize;
	y2 = y1 + bm->printsizey;

	bm->Boxfill(x1 - 1, y1 - 1, x2 + 1, y1);
	bm->Boxfill(x1 - 1, y2, x2 + 1, y2 + 1);
	bm->Boxfill(x1 - 1, y1 - 1, x1, y2 + 1);
	bm->Boxfill(x2, y1 - 1, x2 + 1, y2 + 1);

	if (btn->value) {
		bm->Boxfill(x1+2, y1+2, x2-2, y2-2);
	}

}

static void Object_CheckBox(HSPOBJINFO *info, int wparam)
{
	if (info->enableflag == 0) return;

	Hsp3ObjBase *btn = info->btnset;
	if (btn == NULL) return;

	if (btn->value) {
		bmscr_obj_ival = 0;
	}
	else {
		bmscr_obj_ival = 1;
	}
	btn->value = bmscr_obj_ival;
	Object_SendSetVar(info);

}

static void Object_InputBoxDraw(HSPOBJINFO *info)
{
	Bmscr *bm;
	int tcol;
	int bgcol;
	int x1, x2, y1, y2;
	int fontmode;

	Object_ApplyFont(info);

	bm = (Bmscr *)info->bm;
	Hsp3ObjInput *btn = (Hsp3ObjInput *)info->btnset;
	if (btn == NULL) return;

	tcol = info->fontcolor;
	if (info->enableflag == 0) tcol = 0xff808080;

	x1 = info->x; y1 = info->y;
	x2 = info->x + info->sx - 1; y2 = info->y + info->sy - 1;

	bgcol = 0;
	fontmode = info->fontmode & 3;
	switch (fontmode) {
	case HSPOBJ_FONTMODE_OPAQUE:
		bgcol = 0xff000000 | (info->backcolor & 0xffffff);
		break;
	case HSPOBJ_FONTMODE_TRANSPARENT:
		bgcol = 0x80000000 | (info->backcolor & 0xffffff);
		break;
	default:
		break;
	}

	if (bgcol != 0) {
		bm->gmode = 3;
		bm->gfrate = bgcol >> 24;
		bm->Setcolor(bgcol);
		bm->Boxfill(x1, y1, x2, y2, 1);

		bm->Setcolor(0);
		bm->Boxfill(x1, y1, x2, y1+1);
		bm->Boxfill(x1, y2-1, x2, y2);
		bm->Boxfill(x1, y1, x1+1, y2);
		bm->Boxfill(x2-1, y1, x2, y2);
	}

	bm->gmode = 3;
	bm->gfrate = 255;
	bm->Setcolor(tcol);
	bm->cx = x1+2;
	bm->cy = y1+2;
	bm->printoffsety = info->sy;
	bm->Print(&btn->tpos);
}


static void Object_SetValueName(HSPOBJINFO *info, int type, void *ptr)
{
	Hsp3ObjBase *btn = info->btnset;
	if (btn == NULL) return;

	switch (type) {
	case TYPE_STRING:
		btn->name = (char *)ptr;
		break;
	case TYPE_INUM:
	case TYPE_DNUM:
		btn->name = (char *)HspVarCoreCnv(type, TYPE_STRING, ptr);
		break;
	default:
		throw HSPERR_TYPE_MISMATCH;
	}
}

static void Object_SetValue(HSPOBJINFO *info, int type, void *ptr)
{
	Hsp3ObjBase *btn = info->btnset;
	if (btn == NULL) return;

	switch (type) {
	case TYPE_STRING:
		btn->name = (char *)ptr;
		break;
	case TYPE_INUM:
		btn->value = *(int *)ptr;
		bmscr_obj_ival = btn->value;
		Object_SendSetVar(info);
		break;
	case TYPE_DNUM:
		btn->dval = *(HSPREAL *)ptr;
		btn->value = (int)btn->dval;
		bmscr_obj_ival = btn->value;
		Object_SendSetVar(info);
		break;
	default:
		throw HSPERR_TYPE_MISMATCH;
	}
}

/*---------------------------------------------------------------------------*/

void Bmscr::ResetHSPObject( void )
{
	//		���ׂĂ�Object�����Z�b�g����
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


void Bmscr::EnableObject( int id, int sw )
{
	HSPOBJINFO *obj;
	obj = GetHSPObjectSafe( id );
	if ( obj->owmode == HSPOBJ_NONE ) throw HSPERR_ILLEGAL_FUNCTION;
	obj->enableflag = sw;
//	EnableWindow( obj->hCld, sw!=0 );
}


void Bmscr::SetObjectMode( int id, int owmode )
{
	HSPOBJINFO *obj;
	obj = GetHSPObjectSafe( id );
	if ( obj->owmode == HSPOBJ_NONE ) throw HSPERR_ILLEGAL_FUNCTION;
	if ( owmode <= 0 ) throw HSPERR_ILLEGAL_FUNCTION;
	obj->owmode = owmode;
}


void Bmscr::SetHSPObjectFont(int id)
{
	int a;
	HSPOBJINFO *obj;

	obj = GetHSPObjectSafe(id);
	if (obj->owmode == HSPOBJ_NONE) return;

	a = objmode & 3;
	switch (a) {
	case 0:
	default:
		obj->fontsize = 18;
		break;
	case 1:
		obj->fontmode |= HSPOBJ_FONTMODE_GUIFONT;
		obj->fontsize = 12;
		break;
	case 2:
		obj->fontsize = font_cursize;
		obj->fontstyle = font_curstyle;
		obj->owmode |= HSPOBJ_OPTION_SETFONT;
		obj->fontname = new std::string(font_curname);
		break;
	}
}


int Bmscr::NewHSPObject( void )
{
	//		��ID��T��
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


HSPOBJINFO *Bmscr::AddHSPObject( int id, int mode )
{
	HSPOBJINFO *obj;
	obj = &mem_obj[id];
	obj->hCld = NULL;
	obj->owmode = mode;
	obj->enableflag = 1;
	obj->bm = GetBMSCR();
	obj->func_notice = NULL;
	obj->func_objprm = NULL;
	obj->func_delete = NULL;
	obj->func_draw = NULL;
	obj->owid = 0;
	obj->owsize = 0;
	obj->btnset = NULL;
	obj->varset = NULL;

	obj->x = this->cx;
	obj->y = this->cy;
	obj->sx = this->ox;
	obj->sy = this->oy;
	obj->tapflag = 0;
	obj->srcid = -1;

	obj->fontmode = HSPOBJ_FONTMODE_OPAQUE;
	obj->fontedit = 0;
	obj->fontsize = 0;
	obj->fontstyle = 0;
	obj->fontname = NULL;

	if (objmode & 4) {
		obj->fontcolor = objcolor;
		obj->backcolor = color;
	}
	else {
		obj->fontcolor = 0;
		obj->backcolor = 0xe1e1e1;
	}

	if (objmode & 8) {
		obj->fontmode = HSPOBJ_FONTMODE_TRANSPARENT;
	}
	if (objmode & 16) {
		obj->fontmode = HSPOBJ_FONTMODE_NONE;
	}

	SetHSPObjectFont(id);

	return obj;
}


HSPOBJINFO *Bmscr::GetHSPObject( int id )
{
	return &mem_obj[id];
}


HSPOBJINFO *Bmscr::GetHSPObjectSafe( int id )
{
	if (( id < 0 )||( id >= objmax )) throw HSPERR_ILLEGAL_FUNCTION;
	return &mem_obj[id];
}


void Bmscr::DeleteHSPObject( int id )
{
	//		�I�u�W�F�N�g�폜
	//
	HSPOBJINFO *obj;
	obj = GetHSPObjectSafe( id );

	if ( obj->owmode == HSPOBJ_NONE ) return;
	if ( obj->func_delete != NULL ) obj->func_delete( obj );
	if (obj->btnset != NULL) {
		delete obj->btnset; obj->btnset = NULL;
	}
	if (obj->varset != NULL) {
		sbFree(obj->varset); obj->varset = NULL;
	}
	if (obj->fontname != NULL) {
		delete obj->fontname; obj->fontname = NULL;
	}
	obj->owmode = HSPOBJ_NONE;
}


void Bmscr::UpdateHSPObject(int id, int type, void *ptr)
{
	//		�I�u�W�F�N�g�ɒl��ݒ肷��
	//
	HSPOBJINFO *obj;
	obj = GetHSPObjectSafe(id);
	if (obj->func_objprm != NULL) {
		obj->func_objprm(obj, type, ptr);
	}
	else {
		throw HSPERR_UNSUPPORTED_FUNCTION;
	}
}


HSPOBJINFO *Bmscr::AddHSPVarEventObject(int id, int mode, PVal *pval, APTR aptr, int type, void *ptr)
{
	HSPOBJINFO *obj;
	HSP3VARSET *vset;
	obj = AddHSPObject(id, mode);

	vset = (HSP3VARSET *)sbAlloc(sizeof(HSP3VARSET));
	obj->varset = vset;

	vset->pval = pval;
	vset->aptr = aptr;
	vset->type = type;
	vset->ptr = ptr;
	return obj;
}


void Bmscr::SetButtonImage( int id, int bufid, int x1, int y1, int x2, int y2, int x3, int y3 )
{
	HSPOBJINFO *obj;
	Hsp3ObjButton *bset;

	obj = GetHSPObjectSafe( id );

	if ( obj->func_notice != Object_JumpEvent ) throw HSPERR_UNSUPPORTED_FUNCTION;

	obj->srcid = bufid;

	bset = (Hsp3ObjButton *)obj->btnset;
	if ( bset != NULL ) {
		bset->normal_x = x1;
		bset->normal_y = y1;
		bset->push_x = x2;
		bset->push_y = y2;
		bset->focus_x = x3;
		bset->focus_y = y3;
	}
}


int Bmscr::AddHSPObjectButton(char *name, int flag, void *callptr)
{
	//		create push button
	//
	int id;
	HSPOBJINFO *obj;
	Hsp3ObjButton *btn;

	id = NewHSPObject();
	obj = AddHSPObject(id, HSPOBJ_TAB_ENABLE | HSPOBJ_OPTION_SETFONT);

	obj->owid = -1;
	obj->owsize = id;

	btn = new Hsp3ObjButton;
	obj->btnset = btn;

	btn->name = name;
	btn->jumpmode = flag;
	btn->ptr = callptr;

	obj->func_draw = Object_ButtonDraw;
	obj->func_notice = Object_JumpEvent;
	obj->func_objprm = Object_SetValueName;
	//obj->func_delete = Object_WindowDelete;
	Posinc(oy);
	return id;
}


int Bmscr::AddHSPObjectCheckBox(char *name, PVal *pval, APTR aptr)
{
	//		create push button
	//
	int id;
	int *iptr;
	HSPOBJINFO *obj;
	Hsp3ObjBase *btn;

	id = NewHSPObject();
	obj = AddHSPVarEventObject(id, HSPOBJ_TAB_ENABLE | HSPOBJ_OPTION_SETFONT, pval, aptr, TYPE_INUM, (void *)&bmscr_obj_ival);

	btn = new Hsp3ObjButton;
	obj->btnset = btn;
	btn->name = name;

	obj->func_draw = Object_CheckBoxDraw;
	obj->func_notice = Object_CheckBox;
	obj->func_objprm = Object_SetValue;
	//obj->func_delete = Object_WindowDelete;
	Posinc(oy);

	iptr = (int *)HspVarCorePtrAPTR(pval, aptr);
	if (*iptr) btn->value = 1;

	return id;
}


int Bmscr::AddHSPObjectInput(PVal *pval, APTR aptr, int sizex, int sizey, char *defval, int limit, int mode)
{
	//		create input box
	//
	int id, max, tabstop, type;
	HSPOBJINFO *obj;
	Hsp3ObjInput *btn;

	id = NewHSPObject();
	max = 16;
	tabstop = HSPOBJ_TAB_ENABLE;
	type = mode & 15;
	if (type == HSPOBJ_INPUT_STR) max = limit;

//	if (mode & HSPOBJ_INPUT_HSCROLL) ws |= WS_HSCROLL;
	if (mode & HSPOBJ_INPUT_MULTILINE) {
		tabstop = HSPOBJ_TAB_DISABLE;
		//tabstop |= HSPOBJ_TAB_SKIP;
		max = 0;
	}
	else {
		tabstop |= HSPOBJ_TAB_SELALLTEXT;
	}

	if (mode & HSPOBJ_INPUT_READONLY) {
		tabstop = HSPOBJ_TAB_SKIP;
	}

	obj = AddHSPVarEventObject(id, tabstop | HSPOBJ_OPTION_SETFONT, pval, aptr, type, (void *)&bmscr_obj_ival);

	btn = new Hsp3ObjInput;
	obj->btnset = btn;
	//btn->name = defval;
	btn->tpos.setCaret(0);
	btn->tpos.setString(defval);

	obj->func_draw = Object_InputBoxDraw;
	//obj->func_delete = Object_WindowDelete;
	//obj->func_objprm = Object_SetInputBox;

	Posinc(sizey);
	return id;
}


//-------------------------------------------------------
//	Object Draw Service
//-------------------------------------------------------

int Bmscr::DrawAllObjects( void )
{

	//		DishSystemObject��`�悷��
	//
	int i;
	int bak_mulcolor;
	HSPOBJINFO *info;
	info = this->mem_obj;
	if ( info == NULL ) return -1;

	bak_mulcolor = this->mulcolor;
	SetMulcolor( 255,255,255 );				// ��Z�J���[��W���ɖ߂�

	for( i=0;i<this->objmax;i++ ) {
		if ( info->owmode != HSPOBJ_NONE ) {
			if ( info->func_draw != NULL ) info->func_draw( info );
		}
		info++;
	}

	SetMulcolor( (bak_mulcolor>>16)&0xff, (bak_mulcolor>>8)&0xff, (bak_mulcolor)&0xff );				// ��Z�J���[�����ɖ߂�
	return -1;
}


int Bmscr::UpdateAllObjects( void )
{
	//		DishSystemObject���X�V����
	//
	int i,x,y,msx,msy,tap;
	HSPOBJINFO *info;
	HSPOBJINFO *focus;
	int focustap;
	info = this->mem_obj;
	if ( info == NULL ) return -1;

	msx = savepos[BMSCR_SAVEPOS_MOSUEX];
	msy = savepos[BMSCR_SAVEPOS_MOSUEY];

	if ( this->tapinvalid ) {				// �{�^���̂Ȃ��ꏊ�ŉ�������͗����܂ő҂�
		if ( this->tapstat == 0 ) {
			this->tapinvalid = 0;
		}
		return -1;
	}

	if ( this->cur_obj != NULL ) {			// �{�^���Ƀt�H�[�J�X���Ă��鎞(��������)

		//Alertf( "[BtnHold]%d,%d,%d",msx,msy,tapstat );

		info = this->cur_obj;
		tap = -1;
		y = msy - info->y;
		if (( y>=0 )&&( y<info->sy )) {
			x = msx - info->x;
			if (( x>=0 )&&( x<info->sx )) {
				tap = this->tapstat;
			}
		}
		info->tapflag = tap;
		if ( this->tapstat == 0 ) {
			this->cur_obj = NULL;
			if ( tap >= 0 ) {
				info->func_notice( info, tap );
			}
		}
		return -1;
	}

	//		�܂����������Ă��Ȃ����
	//
	focus = NULL;
	focustap = 0;
	for( i=0;i<this->objmax;i++ ) {
		if ( info->owmode != HSPOBJ_NONE ) {
			if ( info->func_notice != NULL ) {
				tap = -1;
				y = msy - info->y;
				if (( y>=0 )&&( y<info->sy )) {
					x = msx - info->x;
					if (( x>=0 )&&( x<info->sx )) {
						tap = this->tapstat;
						focus = info;
						focustap = tap;
					}
				}
			}
		}
		info++;
	}

	//Alertf( "[BtnPush][%x,%d]%d,%d,%d",focus,msx,msy,tapstat );

	//		�������{�^���̔���
	//
	//if ( info->tapflag == 0 ) {
		if ( this->tapstat == 1 ) {
			if ( focus != NULL ) {
				this->tapinvalid = 0;
				this->cur_obj = focus;
				focus->tapflag = focustap;
			} else {
				this->tapinvalid = 1;
			}
		}
	//}

	return -1;
}


