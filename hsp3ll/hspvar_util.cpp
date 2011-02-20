
//
//	HSPVAR utility
//	onion software/onitama 2008/4
//
#include <stdio.h>
#include <stdlib.h>

#include "../hsp3/hsp3struct.h"
#include "../hsp3/stack.h"
#include "../hsp3/strbuf.h"
#include "../hsp3/hsp3code.h"
#include "hspvar_util.h"

/*------------------------------------------------------------*/
/*
		extra header
*/
/*------------------------------------------------------------*/

/*------------------------------------------------------------*/
/*
		system data
*/
/*------------------------------------------------------------*/

extern CHSP3_TASK *__HspTaskFunc;		// hsp3cnv�Ő��������^�X�N�֐����X�g
extern CHSP3_TASK *__HspTaskModFunc;	// hsp3cnv�Ő�������郆�[�U�[��`�֐����X�g
extern void __HspEntry( void );			// hsp3cnv�Ő��������G���g���[�|�C���g
extern HSPCTX *code_getctx( void );

static	HSPCTX *hspctx;					// HSP�̃R���e�L�X�g
static	CHSP3_TASK curtask;				// ���Ɏ��s�����^�X�N�֐�
static int curtaskId;
static int *c_type;
static int *c_val;
static HSPEXINFO *exinfo;				// Info for Plugins

PVal *mem_var;							// �ϐ��p�̃�����
int	prmstacks;							// �p�����[�^�[�X�^�b�N��(���W���[���Ăяo���p)

static	HSP3TYPEINFO *intcmd_info;
static	HSP3TYPEINFO *extcmd_info;
static	HSP3TYPEINFO *extsysvar_info;
static	HSP3TYPEINFO *intfunc_info;
static	HSP3TYPEINFO *sysvar_info;
static	HSP3TYPEINFO *progfunc_info;
static	HSP3TYPEINFO *modfunc_info;

static	HSP3_CMDFUNC intcmd_func;
static	HSP3_CMDFUNC extcmd_func;
static	HSP3_CMDFUNC progcmd_func;
static	HSP3_CMDFUNC modcmd_func;

/*------------------------------------------------------------*/

static HspVarProc *varproc;
static STMDATA *stm1;
static STMDATA *stm2;
static int tflag;
static int arrayobj_flag;


void HspVarCoreArray2( PVal *pval, int offset )
{
	//		�z��v�f�̎w�� (index)
	//		( Reset��Ɏ����������A���ŌĂ΂�܂� )
	//
	if ( pval->arraycnt >= 5 ) throw HSPVAR_ERROR_ARRAYOVER;
	if ( pval->arraycnt == 0 ) {
		pval->arraymul = 1;			// �ŏ��̒l
	} else {
		pval->arraymul *= pval->len[ pval->arraycnt ];
	}
	pval->arraycnt++;
	if ( offset < 0 ) throw HSPVAR_ERROR_ARRAYOVER;
	if ( offset >= (pval->len[ pval->arraycnt ]) ) {
		if ((pval->arraycnt >= 4 )||( pval->len[ pval->arraycnt+1 ]==0 )) {
			if ( pval->support & HSPVAR_SUPPORT_FLEXARRAY ) {
				//Alertf("Expand.(%d)",offset);
				HspVarCoreReDim( pval, pval->arraycnt, offset+1 );	// �z����g������
				pval->offset += offset * pval->arraymul;
				return;
			}
		}
		throw HSPVAR_ERROR_ARRAYOVER;
	}
	pval->offset += offset * pval->arraymul;
}


static inline char * PrepareCalc( void )
{
	//		�X�^�b�N����Q���ڎ��o���v�Z�̏������s�Ȃ�
	//
	char *calc_ptr;

	stm2 = StackPeek;
	stm1 = StackPeek2;
	tflag = stm1->type;

	mpval = HspVarCoreGetPVal( tflag );
	varproc = HspVarCoreGetProc( tflag );

	if ( mpval->mode == HSPVAR_MODE_NONE ) {					// �^�ɍ��킹���e���|�����ϐ���������
		if ( varproc->flag == 0 ) {
			throw HSPERR_TYPE_INITALIZATION_FAILED;
		}
		HspVarCoreClearTemp( mpval, tflag );					// �ŏ��T�C�Y�̃��������m��
	}

	varproc->Set( mpval, (PDAT *)mpval->pt, STM_GETPTR(stm1) );	// �e���|�����ϐ��ɏ����l��ݒ�

	calc_ptr = STM_GETPTR(stm2);
	if ( tflag != stm2->type ) {								// �^����v���Ȃ��ꍇ�͕ϊ�
		if ( stm2->type >= HSPVAR_FLAG_USERDEF ) {
			calc_ptr = (char *)HspVarCoreGetProc(stm2->type)->CnvCustom( calc_ptr, tflag );
		} else {
			calc_ptr = (char *)varproc->Cnv( calc_ptr, stm2->type );
		}
	}
	//calcprm( varproc, (PDAT *)mpval->pt, op, ptr );				// �v�Z���s�Ȃ�
	return calc_ptr;
}


static inline void AfterCalc( void )
{
	//		�v�Z��̃X�^�b�N����
	//
	int basesize;
	StackPop();
	StackPop();

	if ( varproc->aftertype != tflag ) {						// ���Z��Ɍ^���ς��ꍇ
		tflag = varproc->aftertype;
		varproc = HspVarCoreGetProc( tflag );
	}
	basesize = varproc->basesize;
	if ( basesize < 0 ) {
		basesize = varproc->GetSize( (PDAT *)mpval->pt );
	}
	StackPush( tflag, mpval->pt, basesize );
}


static inline void code_arrayint2( PVal *pval, int offset )
{
	//		�z��v�f�̎w�� (index)
	//		( Reset��Ɏ����������A���ŌĂ΂�܂� )
	//
	if ( pval->arraycnt >= 5 ) throw HSPVAR_ERROR_ARRAYOVER;
	if ( pval->arraycnt == 0 ) {
		pval->arraymul = 1;			// �ŏ��̒l
	} else {
		pval->arraymul *= pval->len[ pval->arraycnt ];
	}
	pval->arraycnt++;
	if ( offset < 0 ) throw HSPVAR_ERROR_ARRAYOVER;
	if ( offset >= (pval->len[ pval->arraycnt ]) ) {
		if ((pval->arraycnt >= 4 )||( pval->len[ pval->arraycnt+1 ]==0 )) {
			if ( pval->support & HSPVAR_SUPPORT_FLEXARRAY ) {
				//Alertf("Expand.(%d)",offset);
				HspVarCoreReDim( pval, pval->arraycnt, offset+1 );	// �z����g������
				pval->offset += offset * pval->arraymul;
				return;
			}
		}
		throw HSPVAR_ERROR_ARRAYOVER;
	}
	pval->offset += offset * pval->arraymul;
}


static APTR CheckArray( PVal *pval, int ar )
{
	//		Check PVal Array information
	//		(�z��v�f(int)�̎��o��)
	//
	int chk,i;
	int val;
	PVal temp;
	arrayobj_flag = 0;
	HspVarCoreReset( pval );							// �z��|�C���^�����Z�b�g����
	if ( pval->support & HSPVAR_SUPPORT_MISCTYPE ) {	// �A�z�z��̏ꍇ
		return 0;
	}

	for(i=0;i<ar;i++) {
		HspVarCoreCopyArrayInfo( &temp, pval );			// ��Ԃ�ۑ�
		chk = code_get();
		if ( chk<=PARAM_END ) { throw HSPERR_BAD_ARRAY_EXPRESSION; }
		if ( mpval->flag != HSPVAR_FLAG_INT ) { throw HSPERR_TYPE_MISMATCH; }
		HspVarCoreCopyArrayInfo( pval, &temp );			// ��Ԃ𕜋A
		val = *(int *)(mpval->pt);
		HspVarCoreArray2( pval, val );					// �z��v�f�w��(����)
	}
	return HspVarCoreGetAPTR( pval );
}


/*------------------------------------------------------------*/

void VarUtilInit( void )
{
	//		HSPVAR utility�̏�����
	//
	hspctx = code_getctx();
	mem_var = hspctx->mem_var;
	exinfo = hspctx->exinfo2;
	c_type = exinfo->nptype;
	c_val = exinfo->npval;

	//		typeinfo���擾���Ă���
	intcmd_info = code_gettypeinfo( TYPE_INTCMD );
	extcmd_info = code_gettypeinfo( TYPE_EXTCMD );
	extsysvar_info = code_gettypeinfo( TYPE_EXTSYSVAR );
	intfunc_info = code_gettypeinfo( TYPE_INTFUNC );
	sysvar_info = code_gettypeinfo( TYPE_SYSVAR );
	progfunc_info = code_gettypeinfo( TYPE_PROGCMD );
	modfunc_info = code_gettypeinfo( TYPE_MODCMD );

	//		���s�p�֐��𒊏o
	intcmd_func = intcmd_info->cmdfunc;
	extcmd_func = extcmd_info->cmdfunc;
	progcmd_func = progfunc_info->cmdfunc;
	modcmd_func = modfunc_info->cmdfunc;

	//		�ŏ��̃^�X�N���s�֐����Z�b�g
	curtask = (CHSP3_TASK)__HspEntry;
	curtaskId = -1;
}


void VarUtilTerm( void )
{
	//		HSPVAR utility�̏I������
	//
}


/*------------------------------------------------------------*/
/*
		stack operation
*/
/*------------------------------------------------------------*/

void PushInt( int val )
{
	StackPushi( val );
}

void PushDouble( double val )
{
	//StackPush( HSPVAR_FLAG_DOUBLE, (char *)&val, sizeof(double) );
	StackPushd( val );
}

void PushStr( char *st )
{
	StackPushStr( st );
}

void PushLabel( int val )
{
	//StackPush( HSPVAR_FLAG_LABEL, (char *)&val, sizeof(int)  );
	StackPushl( val );
}


void PushVar( PVal *pval, int aval )
{
	//	�ϐ��̒l��push����
	int basesize;
	APTR aptr;
	PDAT *ptr;

	aptr = CheckArray( pval, aval );
	ptr = HspVarCorePtrAPTR( pval, aptr );

	tflag = pval->flag;
	varproc = HspVarCoreGetProc( tflag );
	basesize = varproc->basesize;
	if ( basesize < 0 ) { basesize = varproc->GetSize( ptr ); }
	StackPush( tflag, (char *)ptr, basesize );
}


void PushVAP( PVal *pval, int aval )
{
	//	�ϐ����̂��̂̃|�C���^��push����
	APTR aptr;
	//PDAT *ptr;
	aptr = CheckArray( pval, aval );
	//ptr = HspVarCorePtrAPTR( pval, aptr );
	StackPushTypeVal( HSPVAR_FLAG_VAR, (int)pval, (int)aptr );
}


void PushDefault( void )
{
	StackPushTypeVal( HSPVAR_FLAG_DEFAULT, (int)'?', 0 );
}


void PushFuncEnd( void )
{
	StackPushTypeVal( HSPVAR_FLAG_MARK, (int)')', 0 );
}


void PushExtvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)extsysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}


void PushIntfunc( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)intfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}

double CallDoubleIntfunc( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)intfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	return *(double*)ptr;
}

int CallIntIntfunc( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)intfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	return *(int*)ptr;
}


void PushSysvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)sysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	StackPush( resflag, ptr, basesize );
}

int CallIntSysvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)sysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	return *(int*)ptr;
}

double CallDoubleSysvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)sysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	StackPop();																	// PushFuncEnd����菜��
	//code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	return *(double*)ptr;
}

void PushDllfunc( int val, int pnum )
{
}


void PushModule( int val )
{
}


void PushModcmd( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	prmstacks = pnum;
	ptr = (char *)modfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	if ( pnum > 1 )//FIXME
		StackPop();																	// PushFuncEnd����菜��
	//code_next();
	if ( resflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
	} else {
		basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
		StackPush( resflag, ptr, basesize );
	}
}


void CalcAddI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->AddI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcSubI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->SubI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcMulI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->MulI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcDivI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->DivI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcModI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->ModI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcAndI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->AndI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcOrI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->OrI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcXorI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->XorI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcEqI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->EqI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcNeI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->NeI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcGtI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->GtI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcLtI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->LtI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcGtEqI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->GtEqI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcLtEqI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->LtEqI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcRrI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->RrI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}


void CalcLrI( void )
{
	char *ptr;
	ptr = PrepareCalc();
	varproc->LrI( (PDAT *)mpval->pt, ptr );
	AfterCalc();
}



void VarSet( PVal *pval, int aval, int pnum )
{
	//	�ϐ����(var=???)
	//		aval=�z��v�f�̃X�^�b�N��
	//		pnum=�p�����[�^�[�̃X�^�b�N��
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int pleft;
	int baseaptr;

	aptr = CheckArray( pval, aval );
	proc = HspVarCoreGetProc( pval->flag );
	dst = HspVarCorePtrAPTR( pval, aptr );

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	ptr = mpval->pt;
	if ( pval->flag != mpval->flag ) {

		if ( pval->support & HSPVAR_SUPPORT_NOCONVERT ) {	// �^�ϊ��Ȃ��̏ꍇ
			if ( arrayobj_flag ) {
				proc->ObjectWrite( pval, ptr, mpval->flag );
				return;
			}
		}
		if ( aptr != 0 ) throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�̏ꍇ�͔z��v�f0�̂�
		HspVarCoreClear( pval, mpval->flag );		// �ŏ��T�C�Y�̃��������m��
		proc = HspVarCoreGetProc( pval->flag );
		dst = proc->GetPtr( pval );					// PDAT�|�C���^���擾
	}
	proc->Set( pval, dst, ptr );

	if ( pnum < 2 ) return;

	//	�����p�����[�^�[������ꍇ
	//
	pleft = pnum - 1;
	chk = pval->len[1];
	if ( chk == 0 ) baseaptr = aptr; else baseaptr = aptr % chk;
	aptr -= baseaptr;

	while(1) {
		if ( pleft == 0 ) break;

		chk = code_get();							// �p�����[�^�[�l���擾
		if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }
		if ( pval->flag != mpval->flag ) {
				throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�͂ł��Ȃ�
		}
		ptr = mpval->pt;
		baseaptr++;

		pval->arraycnt = 0;							// �z��w��J�E���^�����Z�b�g
		pval->offset = aptr;
		code_arrayint2( pval, baseaptr );			// �z��`�F�b�N

		dst = HspVarCorePtr( pval );
		proc->Set( pval, dst, ptr );				// ���̔z��ɂ���������
		pleft--;
	}
}


void VarSet( PVal *pval, int aval )
{
	//	�ϐ����(var=???)
	//		aval=�z��v�f�̃X�^�b�N��
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;
	int pleft;
	int baseaptr;

	aptr = CheckArray( pval, aval );
	proc = HspVarCoreGetProc( pval->flag );
	dst = HspVarCorePtrAPTR( pval, aptr );

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	ptr = mpval->pt;
	if ( pval->flag != mpval->flag ) {

		if ( pval->support & HSPVAR_SUPPORT_NOCONVERT ) {	// �^�ϊ��Ȃ��̏ꍇ
			if ( arrayobj_flag ) {
				proc->ObjectWrite( pval, ptr, mpval->flag );
				return;
			}
		}
		if ( aptr != 0 ) throw HSPERR_INVALID_ARRAYSTORE;	// �^�ύX�̏ꍇ�͔z��v�f0�̂�
		HspVarCoreClear( pval, mpval->flag );		// �ŏ��T�C�Y�̃��������m��
		proc = HspVarCoreGetProc( pval->flag );
		dst = proc->GetPtr( pval );					// PDAT�|�C���^���擾
	}

	proc->Set( pval, dst, ptr );
}


void VarInc( PVal *pval, int aval )
{
	//	�ϐ��C���N�������g(var++)
	//
	HspVarProc *proc;
	APTR aptr;
	int incval;
	void *ptr;
	PDAT *dst;

	aptr = CheckArray( pval, aval );
	proc = HspVarCoreGetProc( pval->flag );
	incval = 1;
	if ( pval->flag == HSPVAR_FLAG_INT ) { ptr = &incval; } else {
		ptr = (int *)proc->Cnv( &incval, HSPVAR_FLAG_INT );	// �^��INT�łȂ��ꍇ�͕ϊ�
	}
	dst = HspVarCorePtrAPTR( pval, aptr );
	proc->AddI( dst, ptr );
}


void VarDec( PVal *pval, int aval )
{
	//	�ϐ��f�N�������g(var--)
	//
	HspVarProc *proc;
	APTR aptr;
	int incval;
	void *ptr;
	PDAT *dst;

	aptr = CheckArray( pval, aval );
	proc = HspVarCoreGetProc( pval->flag );
	incval = 1;
	if ( pval->flag == HSPVAR_FLAG_INT ) { ptr = &incval; } else {
		ptr = (int *)proc->Cnv( &incval, HSPVAR_FLAG_INT );	// �^��INT�łȂ��ꍇ�͕ϊ�
	}
	dst = HspVarCorePtrAPTR( pval, aptr );
	proc->SubI( dst, ptr );
}


static inline int calcprmf( int mval, int exp, int p )
{
	//		Caluculate parameter args (int)
	//
	switch(exp) {
	case CALCCODE_ADD:
		return mval + p;
	case CALCCODE_SUB:
		return mval - p;
	case CALCCODE_MUL:
		return mval * p;
	case CALCCODE_DIV:
		if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
		return mval / p;
	case CALCCODE_MOD:						// '%'
		if ( p == 0 ) throw( HSPVAR_ERROR_DIVZERO );
		return mval % p;

	case CALCCODE_AND:
		return mval & p;
		break;
	case CALCCODE_OR:
		return mval | p;
	case CALCCODE_XOR:
		return mval ^ p;

	case CALCCODE_EQ:
		return (mval==p);
	case CALCCODE_NE:
		return (mval!=p);
	case CALCCODE_GT:
		return (mval>p);
	case CALCCODE_LT:
		return (mval<p);
	case CALCCODE_GTEQ:						// '>='
		return (mval>=p);
	case CALCCODE_LTEQ:						// '<='
		return (mval<=p);

	case CALCCODE_RR:						// '>>'
		return mval >> p;
	case CALCCODE_LR:						// '<<'
		return mval << p;

	case '(':
		throw HSPERR_INVALID_ARRAY;
	default:
		throw HSPVAR_ERROR_INVALID;
	}
}


void VarCalc( PVal *pval, int aval, int op )
{
	//	�ϐ����Z���(var*=???��)
	//		aval=�z��v�f�̃X�^�b�N��
	//		op=���Z�q�R�[�h
	//
	int chk;
	HspVarProc *proc;
	APTR aptr;
	void *ptr;
	PDAT *dst;

	aptr = CheckArray( pval, aval );

	proc = HspVarCoreGetProc( pval->flag );
	dst = HspVarCorePtrAPTR( pval, aptr );

	chk = code_get();									// �p�����[�^�[�l���擾
	if ( chk != PARAM_OK ) { throw HSPERR_SYNTAX; }

	ptr = mpval->pt;
	if ( pval->flag != mpval->flag ) {					// �^����v���Ȃ��ꍇ�͕ϊ�
		ptr = HspVarCoreCnvPtr( mpval, pval->flag );
	}

	switch(op) {
	case CALCCODE_ADD:
		proc->AddI( dst, ptr );
		break;
	case CALCCODE_SUB:
		proc->SubI( dst, ptr );
		break;
	case CALCCODE_MUL:
		proc->MulI( dst, ptr );
		break;
	case CALCCODE_DIV:
		proc->DivI( dst, ptr );
		break;
	case CALCCODE_MOD:						// '%'
		proc->ModI( dst, ptr );
		break;

	case CALCCODE_AND:
		proc->AndI( dst, ptr );
		break;
	case CALCCODE_OR:
		proc->OrI( dst, ptr );
		break;
	case CALCCODE_XOR:
		proc->XorI( dst, ptr );
		break;

	case CALCCODE_EQ:
		proc->EqI( dst, ptr );
		break;
	case CALCCODE_NE:
		proc->NeI( dst, ptr );
		break;
	case CALCCODE_GT:
		proc->GtI( dst, ptr );
		break;
	case CALCCODE_LT:
		proc->LtI( dst, ptr );
		break;
	case CALCCODE_GTEQ:						// '>='
		proc->GtEqI( dst, ptr );
		break;
	case CALCCODE_LTEQ:						// '<='
		proc->LtEqI( dst, ptr );
		break;

	case CALCCODE_RR:						// '>>'
		proc->RrI( dst, ptr );
		break;
	case CALCCODE_LR:						// '<<'
		proc->LrI( dst, ptr );
		break;
	case '(':
		throw HSPERR_INVALID_ARRAY;
	default:
		throw HSPVAR_ERROR_INVALID;
	}

	if ( proc->aftertype != pval->flag ) {				// ���Z��Ɍ^���ς��ꍇ
		throw HSPERR_TYPE_MISMATCH;
	}
}


void PushFuncPrm1( int num )
{
	//		����(num)���X�^�b�N��push����
	//
	STMDATA *stm;
	int tflag, basesize;
	char *ptr;
	HspVarProc *proc;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		PushVar( (PVal *)( stm->ival ), *(int *)stm->itemp );
		//PushVAP( (PVal *)( stm->ival ), *(int *)stm->itemp );
		return;
	}

	ptr = stm->ptr;
	varproc = HspVarCoreGetProc( tflag );
	basesize = varproc->basesize;
	if ( basesize < 0 ) { basesize = varproc->GetSize( (PDAT *)ptr ); }
	StackPush( tflag, ptr, basesize );
}


void PushFuncPrmI( int num )
{
	//		����(num)���X�^�b�N��push����(int)
	//
	STMDATA *stm;
	int tflag;
	int i_val;
	int *ptr;
	PVal *pval;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) {
		StackPushi( 0 ); return;
	}
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		pval = (PVal *)( stm->ival );
		tflag = pval->flag;
		ptr = (int *)HspVarCorePtrAPTR( pval, *(int *)stm->itemp );
	} else {
		ptr = (int *)stm->ptr;
	}

	if ( tflag != TYPE_INUM ) {
		if ( tflag != TYPE_DNUM ) throw HSPERR_TYPE_MISMATCH;
		i_val = (int)*(double *)ptr;
		ptr = &i_val;
	}
	StackPushi( *ptr );
}


void PushFuncPrmD( int num )
{
	//		����(num)���X�^�b�N��push����(double)
	//
	STMDATA *stm;
	int tflag;
	double d_val;
	double *ptr;
	PVal *pval;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) {
		d_val = 0.0;
		StackPush( TYPE_DNUM, (char *)&d_val, sizeof(double) );
		return;
	}
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		pval = (PVal *)( stm->ival );
		tflag = pval->flag;
		ptr = (double *)HspVarCorePtrAPTR( pval, *(int *)stm->itemp );
	} else {
		ptr = (double *)stm->ptr;
	}

	if ( tflag != TYPE_DNUM ) {
		if ( tflag != TYPE_INUM ) throw HSPERR_TYPE_MISMATCH;
		d_val = (double)*(int *)ptr;
		ptr = &d_val;
	}
	StackPush( TYPE_DNUM, (char *)ptr, sizeof(double) );
}


void PushFuncPrm( int num, int aval )
{
	//		���[�J���ϐ��̈���(num)���X�^�b�N��push����
	//		(PushVar����)
	STMDATA *stm;
	int tflag;
	PVal *pval;
	int basesize;
	APTR aptr;
	PDAT *ptr;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;
	tflag = stm->type;

	switch( tflag ) {
	case TYPE_EX_LOCAL_VARS:
		pval = (PVal *)( stm->ptr );
		break;
	case HSPVAR_FLAG_VAR:
		pval = (PVal *)( stm->ival );
		break;
	default:
		throw HSPVAR_ERROR_INVALID;
	}
	aptr = CheckArray( pval, aval );
	ptr = HspVarCorePtrAPTR( pval, aptr );

	tflag = pval->flag;
	if ( tflag == HSPVAR_FLAG_INT ) {
		StackPushi( *(int *)ptr );
		return;
	}

	varproc = HspVarCoreGetProc( tflag );
	basesize = varproc->basesize;
	if ( basesize < 0 ) { basesize = varproc->GetSize( ptr ); }
	StackPush( tflag, (char *)ptr, basesize );
}

int FuncPrmI( int num )
{
	//		����(num)���X�^�b�N��push����(int)
	//
	STMDATA *stm;
	int tflag;
	int i_val;
	int *ptr;
	PVal *pval;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) {
		return 0;
	}
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		pval = (PVal *)( stm->ival );
		tflag = pval->flag;
		ptr = (int *)HspVarCorePtrAPTR( pval, *(int *)stm->itemp );
	} else {
		ptr = (int *)stm->ptr;
	}

	if ( tflag != TYPE_INUM ) {
		if ( tflag != TYPE_DNUM ) throw HSPERR_TYPE_MISMATCH;
		i_val = (int)*(double *)ptr;
		ptr = &i_val;
	}
	return *ptr;
}


double FuncPrmD( int num )
{
	//		����(num)���X�^�b�N��push����(double)
	//
	STMDATA *stm;
	int tflag;
	double d_val;
	double *ptr;
	PVal *pval;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) {
		return 0.0;
	}
	stm -= num;

	tflag = stm->type;
	if ( tflag == HSPVAR_FLAG_VAR ) {
		pval = (PVal *)( stm->ival );
		tflag = pval->flag;
		ptr = (double *)HspVarCorePtrAPTR( pval, *(int *)stm->itemp );
	} else {
		ptr = (double *)stm->ptr;
	}

	if ( tflag != TYPE_DNUM ) {
		if ( tflag != TYPE_INUM ) throw HSPERR_TYPE_MISMATCH;
		d_val = (double)*(int *)ptr;
		ptr = &d_val;
	}
	return *ptr;
}

void PushFuncPAP( int num, int aval )
{
	//		���[�J���ϐ��̈���(num)���X�^�b�N��push����
	//		(PushVAP����)
	STMDATA *stm;
	int tflag;
	PVal *pval;
	APTR aptr;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;
	tflag = stm->type;

	switch( tflag ) {
	case TYPE_EX_LOCAL_VARS:
		pval = (PVal *)( stm->ptr );
		aptr = CheckArray( pval, aval );
		StackPushTypeVal( HSPVAR_FLAG_VAR, (int)pval, (int)aptr );
		break;
	case HSPVAR_FLAG_VAR:
		pval = (PVal *)( stm->ival );
		aptr = CheckArray( pval, aval );
		StackPushTypeVal( HSPVAR_FLAG_VAR, (int)pval, (int)aptr );
		break;
	default:
		throw HSPVAR_ERROR_INVALID;
	}
}


PVal *FuncPrm( int num )
{
	//		�ϐ��̈���(num)�𓾂�
	//
	STMDATA *stm;
	int tflag;
	//char *ptr;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;

	tflag = stm->type;
	if ( tflag != HSPVAR_FLAG_VAR ) throw HSPVAR_ERROR_INVALID;

	//ptr = stm->itemp;
	return (PVal *)( stm->ival );
}


PVal *LocalPrm( int num )
{
	//		���[�J���ϐ��̈���(num)�𓾂�
	//
	STMDATA *stm;
	int tflag;

	stm = (STMDATA *)hspctx->prmstack;
	if ( stm == NULL ) throw HSPERR_INVALID_FUNCPARAM;
	if ( num >= hspctx->prmstack_max ) throw HSPERR_INVALID_FUNCPARAM;
	stm -= num;

	tflag = stm->type;
	if ( tflag != TYPE_EX_LOCAL_VARS ) throw HSPVAR_ERROR_INVALID;

	return (PVal *)( stm->ptr );
}


/*------------------------------------------------------------*/
/*
		Program Control Process
*/
/*------------------------------------------------------------*/


void TaskSwitch( int label )
{
	//		���̃^�X�N�֐����Z�b�g
	//		(label=�^�X�N�֐�ID)
	//
	curtask = __HspTaskFunc[label];
	curtaskId = label;
}

void TaskExec( void )
{
	//		�Z�b�g���ꂽ�^�X�N�֐������s����
	//
	curtask();
}

int GetCurTaskId()
{
	return curtaskId;
}


/*------------------------------------------------------------*/
/*
		Normal HSP Process
*/
/*------------------------------------------------------------*/

static void HspPostExec( void )
{
	//		�R�}���h���s��̏���
	//
	if ( hspctx->runmode == RUNMODE_RETURN ) {
		//cmdfunc_return();
	} else {
		hspctx->msgfunc( hspctx );
	}
}

bool HspIf( void )
{
	//		�X�^�b�N����l�����o���Đ^�U��Ԃ�
	//		(�^�U���t�ɂȂ��Ă���̂Œ���)
	//
	int i;
	i = code_geti();
	return (i==0);
}


void Extcmd( int cmd, int pnum )
{
	//if ( extcmd_info->cmdfunc( cmd ) ) HspPostExec();
	if ( extcmd_func( cmd ) ) HspPostExec();
}


void Modcmd( int cmd, int pnum )
{
	int i;
	//if ( modfunc_info->cmdfunc( cmd ) ) HspPostExec();
	//Alertf("CMD=%d (lev%d)", cmd, StackGetLevel );
	prmstacks = pnum;							// hsp3code�ɓn���p�����[�^�[��
	if ( modcmd_func( cmd ) ) HspPostExec();
}


void Dllcmd( int cmd, int pnum )
{
}


void Prgcmd( int cmd, int pnum )
{
	//if ( progfunc_info->cmdfunc( cmd ) ) HspPostExec();
	if ( progcmd_func( cmd ) ) HspPostExec();
}


void Intcmd( int cmd, int pnum )
{
	//if ( intcmd_info->cmdfunc( cmd ) ) HspPostExec();
	if ( intcmd_func( cmd ) ) HspPostExec();
}


int GetOpTypeRet( int op, int tflagA, int tflagB )
{
	switch ( tflagA ) {
	case HSPVAR_FLAG_INT:
		{
			switch ( op ) {
			case CALCCODE_ADD:
			case CALCCODE_SUB:
			case CALCCODE_MUL:
			case CALCCODE_DIV:
			case CALCCODE_MOD:
				return HSPVAR_FLAG_INT;

			case CALCCODE_AND:
			case CALCCODE_OR:
			case CALCCODE_XOR:
				return HSPVAR_FLAG_INT;

			case CALCCODE_EQ:
			case CALCCODE_NE:
			case CALCCODE_GT:
			case CALCCODE_LT:
			case CALCCODE_GTEQ:
			case CALCCODE_LTEQ:
				return HSPVAR_FLAG_INT;

			case CALCCODE_RR:
			case CALCCODE_LR:
				return HSPVAR_FLAG_INT;

			default:
				throw 0;
			}
			break;
		}
	case HSPVAR_FLAG_DOUBLE:
		{
			switch ( op ) {
			case CALCCODE_ADD:
			case CALCCODE_SUB:
			case CALCCODE_MUL:
			case CALCCODE_DIV:
			case CALCCODE_MOD:
				return HSPVAR_FLAG_DOUBLE;

			case CALCCODE_AND:
			case CALCCODE_OR:
			case CALCCODE_XOR:
				return HSPVAR_FLAG_MAX;

			case CALCCODE_EQ:
			case CALCCODE_NE:
			case CALCCODE_GT:
			case CALCCODE_LT:
			case CALCCODE_GTEQ:
			case CALCCODE_LTEQ:
				return HSPVAR_FLAG_INT;

			case CALCCODE_RR:
			case CALCCODE_LR:
				return HSPVAR_FLAG_MAX;

			default:
				throw 0;
			}
			break;
		}
	}
	return HSPVAR_FLAG_MAX;
}

int GetFuncTypeRet( int type, int val, int pnum )
{
	switch ( type ) {
	case TYPE_INTFUNC:
		{
			switch( val >> 7 ) {
			case 2:
				return HSPVAR_FLAG_STR;
			case 3:
				return HSPVAR_FLAG_DOUBLE;
			default:
				return HSPVAR_FLAG_INT;
			}
			break;
		}
	case TYPE_SYSVAR:
		{
			switch( val ) {
			case 0x000:	// system
			case 0x001:	// hspstat
			case 0x002:	// hspver
			case 0x003:	// stat
			case 0x004:	// cnt
			case 0x005:	// err
			case 0x006:	// strsize
			case 0x007:	// looplev
			case 0x008:	// sublev
			case 0x009:	// iparam
			case 0x00a:	// wparam
			case 0x00b:	// lparam
				return HSPVAR_FLAG_INT;
			case 0x00c:	// refstr
				return HSPVAR_FLAG_STR;
			case 0x00d:	// refdval
				return HSPVAR_FLAG_DOUBLE;
			default:
				throw HSPERR_UNSUPPORTED_FUNCTION;
			}
			break;
		}
	}
	return HSPVAR_FLAG_MAX;
}
