
//
//			HSP3 script generator
//			onion software/onitama 2008/5
//
#include <stdio.h>
#include <string.h>

#include "supio.h"
#include "chsp3cpp.h"

/*------------------------------------------------------------*/

void CHsp3Cpp::MakeCPPVarName( char *outbuf, int varid )
{
	//		�ϐ�����outbuf�ɃR�s�[����
	//
	strcpy( outbuf, CPPHED_HSPVAR );
	strcat( outbuf, GetHSPVarName( varid ) );
}


int CHsp3Cpp::MakeImmidiateCPPName( char *mes, int type, int val, char *opt )
{
	//		���l(int,double,str)��ǉ�
	//		(�ǉ��ł��Ȃ��^�̏ꍇ��-1��Ԃ�)
	//
	int i;
	i = MakeImmidiateName( mes, type, val );
	if ( i == 0 ) return 0;
	switch( type ) {
	case TYPE_VAR:
		sprintf( mes, "%s%s", CPPHED_HSPVAR, GetHSPVarName(val) );
		if ( opt != NULL ) strcat( mes, opt );
		break;
	case TYPE_STRUCT:
		{
		STRUCTPRM *prm;
		prm = GetMInfo( val );
		if ( prm->subid != STRUCTPRM_SUBID_STACK ) {
			sprintf( mes, "_modprm%d", val );
		} else {
			sprintf( mes, "_prm%d", val );
		}
		break;
		}
	case TYPE_LABEL:
		sprintf( mes, "*L%04x", val );
		break;
	default:
		strcpy( mes, GetHSPName( type, val ) );
		if ( opt != NULL ) strcat( mes, opt );
		if ( *mes == 0 ) return -1;
		break;
	}
	return 0;
}


void CHsp3Cpp::MakeCPPTask( char *funcdef, int nexttask )
{
	//		�^�X�N�̋�؂�
	//			funcdef=�V�����֐���`
	//			nextttask=���̃^�X�N(���x��ID)
	//
	if ( tasknum ) {
		if ( nexttask >= 0 ) {
			OutLine( "TaskSwitch(%d);\r\n", nexttask );
		}
		OutMes( "}\r\n\r\n" );
	}
	OutMes( "%s {\r\n", funcdef );
	tasknum++;
}


void CHsp3Cpp::MakeCPPTask( int nexttask )
{
	//		�P���^�X�N�̐���
	//
	char mes[256];
	sprintf( mes,"static void L%04x( void )", nexttask );
	MakeCPPTask( mes, nexttask );
}


void CHsp3Cpp::MakeCPPLabel( void )
{
	//		���x���𐶐�
	//
	int otmax;
	int labindex;
	int myot;

	otmax = GetOTCount();
	if ( otmax == 0 ) return;
	myot = (int)(mcs_last - mcs_start);

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( myot == GetOT( labindex ) ) {
			if ( GetOTInfo( labindex ) == -1 ) {
				MakeCPPTask( labindex );
			} else {
				MakeProgramInfoFuncParam( GetOTInfo( labindex ) );
			}
		}
		labindex++;
	}
}


int CHsp3Cpp::GetCPPExpression( CMemBuf *eout, int *result )
{
	//		C/C++�̌v�Z���t�H�[�}�b�g�Ńp�����[�^�[��W�J����
	//		eout : �o�͐�
	//		result : ���ʂ̊i�[��(-2=��͂Ȃ�/-1=�������̌v�Z��/other=�P��̃p�����[�^�[type)
	//
	int op;
	int res;
	int tres;
	char mes[8192];								// �W�J����鎮�̍ő啶����

	*result = -2;

	if (exflag&EXFLG_1) return 1;				// �p�����[�^�[�I�[
	if (exflag&EXFLG_2) {						// �p�����[�^�[��؂�(�f�t�H���g��)
		exflag^=EXFLG_2;
		return -1;
	}
	if ( cstype == TYPE_MARK ) {
		if ( csval == 63 ) {					// �p�����[�^�[�ȗ���('?')
			getCS();
			exflag&=~EXFLG_2;
			return -1;
		}
		if ( csval == ')' ) {					// �֐����̃p�����[�^�[�ȗ���
			exflag&=~EXFLG_2;
			return 2;
		}
	}

	*mes = 0;
	res = 0;
	tres = cstype;

	while(1) {
		if ( mcs > mcs_end ) {
			res = 1;			// �f�[�^�I�[�`�F�b�N
			break;
		}
		if ( tres >= 0 ) {
			if ( tres != cstype ) { tres = -1; }
		}

		switch(cstype) {
		case TYPE_MARK:
			//		�L��(�X�^�b�N������o���ĉ��Z)
			//
			if ( csval == ')' ) {					// �����̏I���}�[�N
				exflag |= EXFLG_2;
				res = 2;
				break;
			}
			op = csval;
			sprintf( mes,"Calc%s(); ", GetHSPOperator2(op) );
			eout->PutStr( mes );
			getCS();
			break;
		case TYPE_VAR:
			{
			//		�ϐ����X�^�b�N�ɐς�
			//
			CMemBuf arname;
			int va;
			char varname[256];
			MakeImmidiateCPPName( varname, cstype, csval );
			getCS();
			//		�z��v�f��t������
			va = MakeCPPVarExpression( &arname );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes,"PushVar(%s,%d); ", varname, va );
			eout->PutStr( mes );
			break;
			}
		case TYPE_INUM:
		case TYPE_DNUM:
		case TYPE_STRUCT:
		case TYPE_LABEL:
			//		���l���X�^�b�N�ɐς�
			//
			sprintf( mes,"Push%s(%d); ", GetHSPCmdTypeName(cstype), csval );
			eout->PutStr( mes );
			getCS();
			break;
		case TYPE_STRING:
			//		��������X�^�b�N�ɐς�
			//
			sprintf( mes,"Push%s(\"%s\"); ", GetHSPCmdTypeName(cstype), GetDS( csval ) );
			eout->PutStr( mes );
			getCS();
			break;
		default:
			{
			//		�֐��Ƃ��ēW�J����
			//
			int va;
			int fnctype;
			int fncval;
			CMemBuf arname;
			fnctype = cstype;
			fncval = csval;
			getCS();
			//		������t������
			eout->PutStr( "PushFuncEnd(); " );
			va = MakeCPPVarExpression( &arname );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes, "Push%s(%d,%d); ", GetHSPCmdTypeName(fnctype), fncval, va );
			eout->PutStr( mes );
			break;
			}
		}

		if ( exflag ) {								// �p�����[�^�[�I�[�`�F�b�N
			exflag&=~EXFLG_2;
			break;
		}
	}
	*result = tres;
	return res;
}


int CHsp3Cpp::MakeCPPParam( void )
{
	//		�p�����[�^�[�̃g���[�X
	//
	int i;
	int prm;
	int len;
	int result;
	CMemBuf tmpbuf;
	char *p;

	prm = 0;
	tmpbuf.AddIndexBuffer();

	while(1) {
		if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
		if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N
		if ( prm ) {
			tmpbuf.Put(0);
		}
		tmpbuf.RegistIndex( tmpbuf.GetSize() );
		i = GetCPPExpression( &tmpbuf, &result );
		if ( i > 0 ) break;
		if ( i < -1 ) return i;
		if ( i == -1 ) {
			tmpbuf.PutStr( "PushDefault();" );
		}
		if ( result == TYPE_VAR ) {			// �P�ꍀ�ŕϐ����w�肳��Ă����ꍇ
			p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( tmpbuf.GetIndexBufferSize() - 1 );
			p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAP�ɒ���
		}
		prm++;
	}

	//		�p�����[�^�[���t���œo�^����
	//		(stack��pop���Đ���ȏ��ԂɂȂ�悤��)
	//
	i=tmpbuf.GetIndexBufferSize();
	while(1) {
		if ( i == 0 ) break;
		i--;
		p = tmpbuf.GetBuffer() + tmpbuf.GetIndex(i);
		len = (int)strlen( p );
		if ( len ) {
			int a1;
			char lnbuf[4096];
			strsp_ini();
			while(1) {
				a1 = strsp_get( p, lnbuf, 0, 4090 );
				OutLine( "%s\r\n", lnbuf );
				if ( a1 == 0 ) break;
			}
		}
	}

	return prm;
}


int CHsp3Cpp::MakeCPPVarForHSP( void )
{
	//		�R�����g�p��HSP�`���̑�����쐬
	//		(�����ɑ���̎�ނ����ʂ��ĕԂ�)
	//		(retval:-1=�ʏ����A-2,-3=++or--�A���̑�=���Z�q)
	//
	int i;
	int op;
	char arbuf[VAREXP_BUFFER_MAX];
	i = GetHSPVarExpression( arbuf );
	if ( i ) { out->PutStr( arbuf ); }
	if ( cstype == TYPE_MARK ) {
		if ( csval == CALCCODE_EQ ) {
			out->PutStr( "=" );
			getCS();
			MakeProgramInfoParam2();
			return -1;
		}
		op = csval;
		getCS();
		if ( exflag & EXFLG_1) {		// ++ or --
			out->PutStr( GetHSPOperator(op) );
			out->PutStr( GetHSPOperator(op) );
			MakeProgramInfoParam2();
			if ( op == CALCCODE_ADD ) return -2;
			return -3;
		}
		out->PutStr( GetHSPOperator(op) );
		out->PutStr( "=" );
		//getCS();
		MakeProgramInfoParam2();
		return op;
	}
	Alert( "CHsp3:Var Syntax unknown." );
	return -4;
}


int CHsp3Cpp::MakeCPPVarExpression( CMemBuf *arname )
{
	//	�ϐ�������ɑ����p�����[�^�[(�z��)��W�J����
	//	arname : �z��ݒ�W�J�p�̃o�b�t�@
	//	ret : 0=�z��Ȃ�/1�`=�z�񂠂�
	//
	int i;
	int prm;
	int len;
	int result;
	CMemBuf tmpbuf;
	char *p;
	tmpbuf.AddIndexBuffer();

	if ( cstype == TYPE_MARK ) {
		if ( csval == '(' ) {
			getCS();
			prm = 1;
			while(1) {
				if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
				if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N
				if ( prm > 1 ) {
					tmpbuf.Put(0);
				}
				tmpbuf.RegistIndex( tmpbuf.GetSize() );
				i = GetCPPExpression( &tmpbuf, &result );
				if ( i > 0 ) break;
				if ( i < -1 ) return i;
				if ( i == -1 ) {
					tmpbuf.PutStr( "PushDefault();" );
				}
				if ( result == TYPE_VAR ) {			// �P�ꍀ�ŕϐ����w�肳��Ă����ꍇ
					p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( tmpbuf.GetIndexBufferSize() - 1 );
					p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAP�ɒ���
				}
				prm++;
			}
			getCS();

			//		�p�����[�^�[���t���œo�^����
			//		(stack��pop���Đ���ȏ��ԂɂȂ�悤��)
			//
			i=tmpbuf.GetIndexBufferSize();
			while(1) {
				if ( i == 0 ) break;
				i--;
				p = tmpbuf.GetBuffer() + tmpbuf.GetIndex(i);
				len = (int)strlen( p );
				if ( len ) {
					OutLineBuf( arname, "%s\r\n", p );
				}
			}
			return prm;
		}
	}
	return 0;
}


/*------------------------------------------------------------*/

int CHsp3Cpp::MakeCPPMain( void )
{
	//		�v���O�����̃g���[�X
	//
	int i;
	int op;
	int cmdtype, cmdval;
	char mes[4096];
	MCSCONTEXT ctxbak;

	//		������
	//
	tasknum = 0;
	MakeCPPTask( "void __HspEntry( void )" );

	//		�R�[�h�̕ϊ�
	//
	while(1) {
		if ( mcs > mcs_end ) break;

		//		endif�̃`�F�b�N
		//
		if ( ifmode[iflevel]==2 ) {		// if end
			if ( mcs_last>=ifptr[iflevel] ) {
				ifmode[iflevel] = 0;
				if ( iflevel == 0 ) { Alert( "Invalid endif." ); return -1; }
				i = iftaskid[iflevel];
				iflevel--;
				SetIndent( iflevel );
				OutLine( "}\n" );
				//MakeCPPTask( i );
				continue;
			}
		}

		//		���x���`�F�b�N
		//
		MakeCPPLabel();

		//		�s���̃R�[�h
		//
		cmdtype = cstype;
		cmdval = csval;
		//MakeProgramInfoHSPName();
		//sprintf( mes,"#%06x:CSTYPE%d VAL%d\n", mcs_last - mcs_start, cstype, csval );
		//Alert( mes );
		//out->PutStr( mes );

		//		�p�����[�^�[
		//
		switch( cmdtype ) {
		case TYPE_STRUCT:						// ��֕ϐ�(struct)
		case TYPE_VAR:							// �ϐ����
			{
			CMemBuf arname;
			int va,pnum;
			MakeImmidiateHSPName( mes, cmdtype, cmdval );
			OutLine( "// %s ", mes );
			getCS();
			GetContext( &ctxbak );
			op = MakeCPPVarForHSP();
			SetContext( &ctxbak );
			MakeImmidiateCPPName( mes, cmdtype, cmdval );
			va = MakeCPPVarExpression( &arname );
			getCS();

			switch( op ) {
			case -1:		// �ʏ�̑��
				pnum = MakeCPPParam();
				OutMes( arname.GetBuffer() );
				OutLine( "VarSet(%s,%d,%d);\r\n", mes, va, pnum );
				break;
			case -2:		// ++
				OutMes( arname.GetBuffer() );
				OutLine( "VarInc(%s,%d);\r\n", mes, va );
				break;
			case -3:		// --
				OutMes( arname.GetBuffer() );
				OutLine( "VarDec(%s,%d);\r\n", mes, va );
				break;
			case -4:		// �G���[
				break;
			default:		// ���Z�q�t�����
				pnum = MakeCPPParam();
				if ( pnum > 1 ) {
					Alert( "Too much parameters(VarCalc)." );
				}
				OutMes( arname.GetBuffer() );
				OutLine( "VarCalc(%s,%d,%d);\r\n", mes, va, op );
				break;
			}
			break;
			}
		case TYPE_CMPCMD:						// ��r����
			//	HSP�\�[�X�R�����g
			if ( cmdval == 0 ) {
				GetContext( &ctxbak );
				OutLine( "// if " );
				mcs++;
				getCS();
				MakeProgramInfoParam2();
				SetContext( &ctxbak );
			}
			// C�`���̏o��
			if ( cmdval == 0 ) {
				iflevel++;
				strcpy( mes, "if (HspIf()) {\r\n" );
				if ( iflevel >= MAX_IFLEVEL ) {
					Alert( "Stack(If) overflow." );
					return -2;
				}
				ifmode[iflevel] = 1;
				//iftaskid[iflevel] = curot;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				ifmode[iflevel]++;
				//curot++;
			} else {
				strcpy( mes, "} else {\r\n" );
				ifmode[iflevel] = 3;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				SetIndent( iflevel-1 );
			}
			mcs++;
			getCS();
			MakeCPPParam();
			OutLine( mes );
			SetIndent( iflevel );
			break;
		default:
			//		�ʏ햽��
			//
			{
			int pnum;
			OutLine( "// %s ", GetHSPName( cmdtype, cmdval ) );
			getCS();
			GetContext( &ctxbak );
			MakeProgramInfoParam2();
			SetContext( &ctxbak );
			pnum = MakeCPPParam();
			OutLine( "%s(%d,%d);\r\n", GetHSPCmdTypeName(cmdtype), cmdval, pnum );
			break;
			}
		}
	}

	OutMes( "}\r\n\r\n" );
	OutMes( "//-End of Source-------------------------------------------\n" );
	return 0;
}

/*------------------------------------------------------------*/


int CHsp3Cpp::MakeSource( int option, void *ref )
{
	//		C/C++�\�[�X���o�͂���
	//
	int i;
	int otmax;
	int labindex;
	int maxvar;
	makeoption = option;

	OutMes( "//\n//\thsp3cnv generated source\n//\t[%s]\n//\n", orgname );
	OutMes( "#include \"hsp3r.h\"\n" );
	OutMes( "\n#define _HSP3CNV_DATE %s\n#define _HSP3CNV_TIME %s\n", localinfo.CurrentDate(), localinfo.CurrentTime() );
	OutMes( "#define _HSP3CNV_MAXVAR %d\n", hsphed->max_val );
	OutMes( "#define _HSP3CNV_MAXHPI %d\n", hsphed->max_hpi );
	OutMes( "#define _HSP3CNV_VERSION 0x%x\n", hsphed->version );
	OutMes( "#define _HSP3CNV_BOOTOPT %d\n", hsphed->bootoption );
	OutMes( "\n/*-----------------------------------------------------------*/\n\n" );

	maxvar = hsphed->max_val;
	for(i=0;i<maxvar;i++) {
		OutMes( "#define %s%s (&mem_var[%d])\n", CPPHED_HSPVAR, GetHSPVarName(i), i );
	}

	OutMes( "\n/*-----------------------------------------------------------*/\n\n" );

	otmax = GetOTCount();
	curot = otmax;

	i = MakeCPPMain();
	if ( i ) return i;

	//		�^�X�N(���x��)�e�[�u�����쐬����
	//
	OutMes( "\nCHSP3_TASK __HspTaskFunc[]={\n" );

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( GetOTInfo( labindex ) == -1 ) {
			OutMes( "(CHSP3_TASK) L%04x,\n", labindex );
		} else {
			OutMes( "(CHSP3_TASK) NULL,\n" );
		}
		labindex++;
	}
	while(1) {
		if ( labindex>=curot ) break;
		OutMes( "(CHSP3_TASK) L%04x,\n", labindex );
		labindex++;
	}
	OutMes( "\n};\n" );
	OutMes( "\n/*-----------------------------------------------------------*/\n\n" );

	return 0;
}
