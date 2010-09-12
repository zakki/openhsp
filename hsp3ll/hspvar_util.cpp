
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
void __HspEntry( void );				// hsp3cnv�Ő��������G���g���[�|�C���g

static	HSPCTX *hspctx;					// HSP�̃R���e�L�X�g
static	CHSP3_TASK curtask;				// ���Ɏ��s�����^�X�N�֐�
static int curtaskId;
static int *c_type;
static int *c_val;
static HSPEXINFO *exinfo;				// Info for Plugins

PVal *mem_var;							// �ϐ��p�̃�����

static	HSP3TYPEINFO *intcmd_info;
static	HSP3TYPEINFO *extcmd_info;
static	HSP3TYPEINFO *extsysvar_info;
static	HSP3TYPEINFO *intfunc_info;
static	HSP3TYPEINFO *sysvar_info;
static	HSP3TYPEINFO *progfunc_info;

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

void VarUtilInit( HSPCTX *ctx )
{
	//		HSPVAR utility�̏�����
	//
	hspctx = ctx;
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


void PushStr( char *st )
{
	StackPushStr( st );
}


void PushDouble( double val )
{
	StackPush( HSPVAR_FLAG_DOUBLE, (char *)&val, sizeof(double) );
}


void PushLabel( int val )
{
	StackPush( HSPVAR_FLAG_LABEL, (char *)&val, sizeof(int)  );
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
	StackPushTypeVal( HSPVAR_FLAG_MARK, (int)'?', 0 );
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
	code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	StackPush( resflag, ptr, basesize );
}


void PushIntfunc( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)intfunc_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	StackPush( resflag, ptr, basesize );
}


void PushSysvar( int val, int pnum )
{
	char *ptr;
	int resflag;
	int basesize;

	*c_type = TYPE_MARK;
	*c_val = '(';
	ptr = (char *)sysvar_info->reffunc( &resflag, val );						// �^�C�v���Ƃ̊֐��U�蕪��
	code_next();
	basesize = HspVarCoreGetProc( resflag )->GetSize( (PDAT *)ptr );
	StackPush( resflag, ptr, basesize );
}


void PushDllfunc( int val, int pnum )
{
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
	if ( extcmd_info->cmdfunc( cmd ) ) HspPostExec();
}


void Modcmd( int cmd, int pnum )
{
}


void Dllcmd( int cmd, int pnum )
{
}


void Prgcmd( int cmd, int pnum )
{
	if ( progfunc_info->cmdfunc( cmd ) ) HspPostExec();
}


void Intcmd( int cmd, int pnum )
{
	if ( intcmd_info->cmdfunc( cmd ) ) HspPostExec();
}
