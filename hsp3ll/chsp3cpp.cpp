
//
//			HSP3 script generator
//			onion software/onitama 2008/5
//
#include <stdio.h>
#include <string>
#include <map>

#include "llvm/LLVMContext.h"
#include "llvm/Module.h"
#include "llvm/Constants.h"
#include "llvm/DerivedTypes.h"
#include "llvm/Instructions.h"
#include "llvm/Assembly/Parser.h"
#include "llvm/Analysis/Verifier.h"
#include "llvm/Bitcode/ReaderWriter.h"
#include "llvm/ExecutionEngine/JIT.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/Target/TargetSelect.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TypeBuilder.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/IRBuilder.h"

#include "supio.h"
#include "chsp3cpp.h"
#include "hsp3r.h"

using namespace llvm;


//
static char* PROTOTYPES = 
	"declare void @Prgcmd(i32, i32)\n"
	"declare void @PushVar(%struct.PVal*, i32)\n"
	"declare void @CalcMulI()\n"
	"declare void @VarSet(%struct.PVal*, i32, i32)\n"
	"declare void @PushInt(i32)\n"
	"declare void @CalcSubI()\n"
	"declare void @PushDouble(double)\n"
	"declare void @PushFuncEnd()\n"
	"declare void @CalcAddI()\n"
	"declare void @PushIntfunc(i32, i32)\n"
	"declare void @CalcDivI()\n"
	"declare void @PushVAP(%struct.PVal*, i32)\n"
	"declare void @VarCalc(%struct.PVal*, i32, i32)\n"
	"declare void @VarInc(%struct.PVal*, i32)\n"
	"declare void @TaskSwitch(i32)\n"
	"declare void @CalcEqI()\n"
	"declare i8 @HspIf() zeroext\n"
	"declare void @CalcGtI()\n"
	"declare void @PushLabel(i32)\n"
	"declare void @CalcLtI()\n"
	"declare void @PushSysvar(i32, i32)\n"
	"declare void @Extcmd(i32, i32)\n"
	"declare void @PushStr(i8*)\n"
	"declare void @CalcAndI()\n"
	"declare void @CalcNeI()\n"
	"declare void @CalcGtEqI()\n"
	"declare void @CalcXorI()\n"
	"declare void @PushExtvar(i32, i32)\n"
	"declare void @CalcRrI()\n"
	"declare void @PushDefault()\n"
	"declare void @Intcmd(i32, i32)\n"
	"declare i32 @Hsp3rReset(%struct.Hsp3r*, i32, i32)";

// 
static Module *M;
static ExecutionEngine* EE;
static IRBuilder<> Builder(getGlobalContext());

static Function *sCurTaskF;
static BasicBlock *sCurBB;
static bool sReachable;

static std::map<std::string, Function*> sTasks;

// Runtime
CHSP3_TASK *__HspTaskFunc;
static GlobalVariable **sVariables;

static int sMaxVar;
static int sMaxHpi;
static int sLabMax;

static PVal **Var__HspVars;

void __HspInit( Hsp3r *hsp3 ) {
	char mes[256];

	hsp3->Reset( sMaxVar, sMaxHpi );

	__HspTaskFunc = new CHSP3_TASK[sLabMax];

	for (int i=0;i<sLabMax;i++) {
		sprintf( mes, "L%04x", i );
		Function* func = sTasks[mes];
		if ( func ) {
			void *fp = EE->getPointerToFunction(func);
			__HspTaskFunc[i] = (CHSP3_TASK)fp;
		} else {
			__HspTaskFunc[i] = NULL;
		}
	}
}

void __HspEntry( void ) {
	Var__HspVars = new PVal*[sMaxVar];
	for(int i=0;i<sMaxVar;i++) {
		Var__HspVars[i] = mem_var + i;
		EE->updateGlobalMapping( sVariables[i], Var__HspVars + i );
	}

	Function* func = sTasks["__HspEntry"];
	void *fp = EE->getPointerToFunction(func);
	CHSP3_TASK t = (CHSP3_TASK)fp;
	t();

//	exit(0);
}


// LLVM utilities

static const StructType *getPVal() {
	LLVMContext &Context = getGlobalContext();

	//	%struct.PVal = type { i16, i16, [5 x i32], i32, i8*, i8*, i16, i16, i32, i32 }
    std::vector<const Type*> st;
	//short   flag;           // type of val
    st.push_back(TypeBuilder<types::i<16>, false>::get(Context));
	//short   mode;           // mode (0=normal/1=clone/2=alloced)
    st.push_back(TypeBuilder<types::i<16>, false>::get(Context));
	//int             len[5];         // length of array 4byte align (dim)
    st.push_back(TypeBuilder<types::i<32>[5], false>::get(Context));
	//int             size;           // size of Val
    st.push_back(TypeBuilder<types::i<32>, false>::get(Context));
	//char    *pt;            // ptr to array
    st.push_back(TypeBuilder<types::i<8>*, false>::get(Context));
	//void    *master;                        // Master pointer for data
    st.push_back(TypeBuilder<types::i<8>*, false>::get(Context));
	//unsigned short  support;        // Support Flag
    st.push_back(TypeBuilder<types::i<16>, false>::get(Context));
	//short   arraycnt;                       // Array Set Count
    st.push_back(TypeBuilder<types::i<16>, false>::get(Context));
	//int             offset;                         // Array Data Offset
    st.push_back(TypeBuilder<types::i<32>, false>::get(Context));
	//int             arraymul;                       // Array Multiple Value
    st.push_back(TypeBuilder<types::i<32>, false>::get(Context));

    static const StructType *const result = StructType::get(Context, st);
    return result;
}

Value* createCallImm( const std::string& name )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function* f = M->getFunction( name );
	
	std::vector<Value*> args;

	return Builder.CreateCall( f, args.begin(), args.end() );
}

Value* createCallImm( const std::string& name, int a )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function* f = M->getFunction( name );
	
	std::vector<Value*> args;
	
	args.push_back( ConstantInt::get( Type::getInt32Ty( Context ), a ) );
	
	return Builder.CreateCall( f, args.begin(), args.end() );
}

Value* createCallImm( const std::string& name, int a, int b )
{
	if (!sReachable)
		return NULL;

	LLVMContext &Context = getGlobalContext();
	Function* f = M->getFunction( name );
	
	std::vector<Value*> args;
	
	args.push_back(ConstantInt::get( Type::getInt32Ty( Context ), a ) );
	args.push_back(ConstantInt::get( Type::getInt32Ty( Context ), b ) );
	
	return Builder.CreateCall( f, args.begin(), args.end() );
}

void* HspLazyFunctionCreator( const std::string &Name )
{
	if ("Prgcmd" == Name) return Prgcmd;
	if ("PushVar" == Name) return PushVar;
	if ("CalcMulI" == Name) return CalcMulI;
	if ("VarSet" == Name) return VarSet;
	if ("PushInt" == Name) return PushInt;
	if ("CalcSubI" == Name) return CalcSubI;
	if ("PushDouble" == Name) return PushDouble;
	if ("PushFuncEnd" == Name) return PushFuncEnd;
	if ("CalcAddI" == Name) return CalcAddI;
	if ("PushIntfunc" == Name) return PushIntfunc;
	if ("CalcDivI" == Name) return CalcDivI;
	if ("PushVAP" == Name) return PushVAP;
	if ("VarCalc" == Name) return VarCalc;
	if ("VarInc" == Name) return VarInc;
	if ("TaskSwitch" == Name) return TaskSwitch;
	if ("CalcEqI" == Name) return CalcEqI;
	if ("HspIf" == Name) return HspIf;
	if ("CalcGtI" == Name) return CalcGtI;
	if ("PushLabel" == Name) return PushLabel;
	if ("CalcLtI" == Name) return CalcLtI;
	if ("PushSysvar" == Name) return PushSysvar;
	if ("Extcmd" == Name) return Extcmd;
	if ("PushStr" == Name) return PushStr;
	if ("CalcAndI" == Name) return CalcAndI;
	if ("CalcNeI" == Name) return CalcNeI;
	if ("CalcGtEqI" == Name) return CalcGtEqI;
	if ("CalcXorI" == Name) return CalcXorI;
	if ("PushExtvar" == Name) return PushExtvar;
	if ("CalcRrI" == Name) return CalcRrI;
	if ("PushDefault" == Name) return PushDefault;
	if ("Intcmd" == Name) return Intcmd;
	//	if ("Hsp3rReset" == Name) return Hsp3rReset;
	return NULL;
}
/*------------------------------------------------------------*/
CHsp3Cpp::CHsp3Cpp() {
	visitor = new CHsp3VisitorCpp(this, out);
}

void CHsp3Cpp::MakeCPPVarName( char *outbuf, int varid )
{
	//		�ϐ�����outbuf�ɃR�s�[����
	//
	strcpy( outbuf, CPPHED_HSPVAR );
	strcat( outbuf, GetHSPVarName( varid ).c_str() );
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
		sprintf( mes, "%s%s", CPPHED_HSPVAR, GetHSPVarName(val).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		break;
	case TYPE_STRUCT:
		{
		const STRUCTPRM *prm;
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
		strcpy( mes, GetHSPName( type, val ).c_str() );
		if ( opt != NULL ) strcat( mes, opt );
		if ( *mes == 0 ) return -1;
		break;
	}
	return 0;
}


void CHsp3Cpp::MakeCPPTask( const char *funcdef, const char *name, int nexttask )
{
	//		�^�X�N�̋�؂�
	//			funcdef=�V�����֐���`
	//			nextttask=���̃^�X�N(���x��ID)
	//
	LLVMContext &Context = getGlobalContext();

	if ( tasknum ) {
		if ( nexttask >= 0 ) {
			OutLine( "TaskSwitch(%d);\r\n", nexttask );
			createCallImm( "TaskSwitch", nexttask );
		}
		Builder.CreateRetVoid();
		OutMes( "}\r\n\r\n" );
	}
	OutMes( "%s {\r\n", funcdef );

	Function *sCurTaskF =
		cast<Function>(M->getOrInsertFunction(funcdef, Type::getVoidTy(Context),
											  (Type *)0));

	sTasks[name] = sCurTaskF;
	sCurBB = BasicBlock::Create(Context, "entry", sCurTaskF);
	Builder.SetInsertPoint(sCurBB);
	sReachable = true;

	tasknum++;
}


void CHsp3Cpp::MakeCPPTask( int nexttask )
{
	//		�P���^�X�N�̐���
	//
	char name[256];
	sprintf( name,"L%04x", nexttask );
	char mes[256];
	sprintf( mes,"static void L%04x( void )", nexttask );
	MakeCPPTask( mes, name, nexttask );
}


void CHsp3Cpp::MakeCPPTask2( int nexttask, int newtask )
{
	//		�P���^�X�N�̐���
	//
	char name[256];
	sprintf( name,"L%04x", newtask );
	char mes[256];
	sprintf( mes,"static void L%04x( void )", newtask );
	MakeCPPTask( mes, name, nexttask );
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


void CHsp3Cpp::GetCPPExpressionSub( CMemBuf *eout )
{
	//		C/C++�̌v�Z���t�H�[�}�b�g�Ńp�����[�^�[��W�J����(�Z����)
	//		eout : �o�͐�
	//
	char mes[8192];								// �W�J����鎮�̍ő啶����
	int op;
	LLVMContext &Context = getGlobalContext();

	*mes = 0;
	switch(cstype) {
		case TYPE_MARK:
			//		�L��(�X�^�b�N������o���ĉ��Z)
			//
			op = csval;
			sprintf( mes,"Calc%s(); ", GetHSPOperator2(op).c_str() );
			eout->PutStr( mes );
			if (sReachable)
				createCallImm( "Calc" + GetHSPOperator2(op) );
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
			if (sReachable) {
				Function* f = M->getFunction("PushVar");
				
				std::vector<Value*> args;
				Value *var = M->getNamedValue(varname);
				if (!var)
					Alert(varname);

				LoadInst *ld = Builder.CreateLoad(var, "a");

				args.push_back(ld);
				args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
				
				Builder.CreateCall(f, args.begin(), args.end());
			}
			break;
			}
		case TYPE_DNUM:
			{
			//		�������l���X�^�b�N�ɐς�
			//
			sprintf( mes,"Push%s(%f); ", GetHSPCmdTypeName(cstype).c_str(), GetDSf(csval) );
			eout->PutStr( mes );
			if (sReachable) {
				Function* f = M->getFunction("Push" + GetHSPCmdTypeName(cstype));
				
				std::vector<Value*> args;
				args.push_back(ConstantFP::get(Type::getDoubleTy(Context), GetDSf(csval)));
				
				Builder.CreateCall(f, args.begin(), args.end());
			}
			getCS();
			break;
			}
		case TYPE_INUM:
		case TYPE_STRUCT:
		case TYPE_LABEL:
			//		���l���X�^�b�N�ɐς�
			//
			sprintf( mes,"Push%s(%d); ", GetHSPCmdTypeName(cstype).c_str(), csval );
			eout->PutStr( mes );

			createCallImm( "Push" + GetHSPCmdTypeName(cstype), csval );

			getCS();
			break;
		case TYPE_STRING:
			//		��������X�^�b�N�ɐς�
			//
			sprintf( mes,"Push%s(\"%s\"); ", GetHSPCmdTypeName(cstype).c_str(), GetDS( csval ) );
			eout->PutStr( mes );
			if (sReachable) {
				Function* f = M->getFunction("Push" + GetHSPCmdTypeName(cstype));
				
				std::vector<Value*> args;

				Constant* constInt = ConstantInt::get(Type::getInt32Ty(Context), (int)GetDS(csval));
				Constant* constPtr = ConstantExpr::getIntToPtr(constInt, TypeBuilder<types::i<8>*, false>::get(Context));
				args.push_back(constPtr);
				
				Builder.CreateCall(f, args.begin(), args.end());
			}
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
			createCallImm( "PushFuncEnd" );
			va = MakeCPPVarExpression( &arname );
			eout->PutStr( arname.GetBuffer() );
			sprintf( mes, "Push%s(%d,%d); ", GetHSPCmdTypeName(fnctype).c_str(), fncval, va );
			eout->PutStr( mes );
			createCallImm( "Push" + GetHSPCmdTypeName(fnctype), fncval, va );
			break;
			}
	}
}


int CHsp3Cpp::GetCPPExpression( CMemBuf *eout, int *result )
{
	//		C/C++�̌v�Z���t�H�[�}�b�g�Ńp�����[�^�[��W�J����
	//		eout : �o�͐�
	//		result : ���ʂ̊i�[��(-2=��͂Ȃ�/-1=�������̌v�Z��/other=�P��̃p�����[�^�[type)
	//
	int res;
	int tres;

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
		default:
			GetCPPExpressionSub( eout );
			break;
		}

		if ( exflag ) {								// �p�����[�^�[�I�[�`�F�b�N
			exflag&=~EXFLG_2;
			break;
		}
	}
	*result = tres;
	return res;
}


int CHsp3Cpp::MakeCPPParam( int addprm )
{
	//		�p�����[�^�[�̃g���[�X
	//
	int i;
	int prm;
	int len;
	int result;
	int curidx;
	CMemBuf tmpbuf;
	char *p;

	prm = 0;
	tmpbuf.AddIndexBuffer();

	int j;
	for(j=0;j<addprm;j++) {
		if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
		if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N
		if ( prm ) {
			tmpbuf.Put(0);
		}
		tmpbuf.RegistIndex( tmpbuf.GetSize() );
		GetCPPExpressionSub( &tmpbuf );
		prm++;
	}

	while(1) {
		if ( exflag & EXFLG_1) break;		// �p�����[�^�[��I�[
		if ( mcs > mcs_end ) break;			// �f�[�^�I�[�`�F�b�N
		if ( prm ) {
			tmpbuf.Put(0);
		}
		curidx = tmpbuf.GetIndexBufferSize();
		tmpbuf.RegistIndex( tmpbuf.GetSize() );
		i = GetCPPExpression( &tmpbuf, &result );
		if ( i > 0 ) break;
		if ( i < -1 ) return i;
		if ( i == -1 ) {
			tmpbuf.PutStr( "PushDefault();" );
		}
		if ( result == TYPE_VAR ) {			// �P�ꍀ�ŕϐ����w�肳��Ă����ꍇ
			p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
			p = strstr2( p, "PushVar" );
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
			out->PutStr( GetHSPOperator(op).c_str() );
			out->PutStr( GetHSPOperator(op).c_str() );
			MakeProgramInfoParam2();
			if ( op == CALCCODE_ADD ) return -2;
			return -3;
		}
		out->PutStr( GetHSPOperator(op).c_str() );
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
	int curidx;
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
				curidx = tmpbuf.GetIndexBufferSize();
				tmpbuf.RegistIndex( tmpbuf.GetSize() );
				i = GetCPPExpression( &tmpbuf, &result );
				if ( i > 0 ) break;
				if ( i < -1 ) return i;
				if ( i == -1 ) {
					tmpbuf.PutStr( "PushDefault();" );
				}
				//if ( result == TYPE_VAR ) {			// �P�ꍀ�ŕϐ����w�肳��Ă����ꍇ
				//	p = tmpbuf.GetBuffer() + tmpbuf.GetIndex( curidx );
				//	p[5] = 'A'; p[6] = 'P';			// PushVar -> PushVAP�ɒ���
				//}
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

void CHsp3Cpp::MakeCPPSub( int cmdtype, int cmdval )
{
	//		�ʏ햽�߂ƃp�����[�^�[��W�J
	//
	int pnum;
	MCSCONTEXT ctxbak;

	OutLine( "// %s ", GetHSPName( cmdtype, cmdval ).c_str() );
	getCS();
	GetContext( &ctxbak );
	MakeProgramInfoParam2();
	SetContext( &ctxbak );
	pnum = MakeCPPParam();
	OutLine( "%s(%d,%d);\r\n", GetHSPCmdTypeName(cmdtype).c_str(), cmdval, pnum );

	createCallImm(GetHSPCmdTypeName(cmdtype), cmdval, pnum);
}


int CHsp3Cpp::MakeCPPMain( void )
{
	//		�v���O�����̃g���[�X
	//
	int i;
	int op;
	int cmdtype, cmdval;
	char mes[4096];
	MCSCONTEXT ctxbak;
	int maxvar;
	LLVMContext &Context = getGlobalContext();
	const Type* pvalType = getPVal();
	const Type* ppvalType = PointerType::getUnqual(pvalType);

	//		������
	//
	tasknum = 0;

	OutMes( "void __HspInitEntry( void );\r\n\r\n" );
	MakeCPPTask( "void __HspEntry( void )", "__HspEntry" );

	OutMes( "\t// Var initalize\r\n" );
	maxvar = hsphed->max_val;
	for(i=0;i<maxvar;i++) {
		OutMes( "\t%s%s = &mem_var[%d];\r\n", CPPHED_HSPVAR, GetHSPVarName(i).c_str(), i );
	}
	OutMes( "\r\n" );

	OutLine( "__HspInitEntry();\r\n" );
	OutMes( "}\r\n\r\n" );
	OutMes( "void __HspInitEntry( void ) {\r\n" );

	//		�R�[�h�̕ϊ�
	//
	while(1) {
		if ( mcs > mcs_end ) break;

		//		endif�̃`�F�b�N
		//
		if ( ifmode[iflevel]>=2 ) {		// if end
			if ( mcs_last>=ifptr[iflevel] ) {
				ifmode[iflevel] = 0;
				if ( iflevel == 0 ) { Alert( "Invalid endif." ); return -1; }
				i = iftaskid[iflevel];
				iflevel--;
				//SetIndent( iflevel );
				//OutLine( "}\n" );
				MakeCPPTask( i );
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
		//printf( "#%06x:CSTYPE%d VAL%d\n", mcs_last - mcs_start, cstype, csval );
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

				if (sReachable) {
					Function* f = M->getFunction("VarSet");
					const FunctionType* ft = f->getFunctionType();

					if (ft->getNumParams() != 3) {
						Alert("bad sig");
					}
				
					std::vector<Value*> args;

//					Value *var = M->getOrInsertGlobal(mes, pvalType);
					Value *var = M->getNamedValue(mes);
					LoadInst *ld = Builder.CreateLoad(var, "a");
					if (!var) {
						Alert(mes);
					}
					args.push_back(ld);
					args.push_back(ConstantInt::get(Type::getInt32Ty(Context), va));
					args.push_back(ConstantInt::get(Type::getInt32Ty(Context), pnum));
				
					Builder.CreateCall(f, args.begin(), args.end());
				}
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
				sprintf( mes, "if (HspIf()) { TaskSwitch(%d); return; }\r\n", curot );
				if ( iflevel >= MAX_IFLEVEL ) {
					Alert( "Stack(If) overflow." );
					return -2;
				}
				ifmode[iflevel] = 1;
				iftaskid[iflevel] = curot;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				ifmode[iflevel]++;
				curot++;
			} else {
				strcpy( mes, "// else\r\n" );
				ifmode[iflevel] = 3;
				i = (int)*mcs;
				ifptr[iflevel] = mcs + i + 1;
				//SetIndent( iflevel-1 );
				i = iftaskid[iflevel];
				MakeCPPTask2( curot, i );
				iftaskid[iflevel] = curot;
				curot++;
			}
			mcs++;
			getCS();
			MakeCPPParam();
			OutLine( mes );
			//SetIndent( iflevel );
			break;
		case TYPE_PROGCMD:						// �v���O�������䖽��
			switch( cmdval ) {
			case 0x00:								// goto
			case 0x02:								// return
			case 0x03:								// break
			case 0x05:								// loop
			case 0x06:								// continue
			case 0x0b:								// foreach
			case 0x0c:								// (hidden)foreach check
			case 0x10:								// end
			case 0x1b:								// assert
			case 0x11:								// stop
			case 0x19:								// on
				//		���return��t����
				//
				MakeCPPSub( cmdtype, cmdval );
				OutLine( "return;\r\n" );
				sReachable = false;
				break;
			case 0x01:								// gosub
			case 0x18:								// exgoto
				//		gosub�̓W�J
				//
				{
				int pnum;
				OutLine( "// %s\r\n", GetHSPName(cmdtype,cmdval).c_str() );
				getCS();
				pnum = MakeCPPParam();
				OutLine( "PushLabel(%d); %s(%d,%d); return;\r\n", curot, GetHSPCmdTypeName(cmdtype).c_str(), cmdval, pnum+1 );
				MakeCPPTask( curot );
				curot++;
				break;
				}
			case 0x04:								// repeat
				//		repeat�̓W�J
				//
				{
				int pnum;
				OutLine( "// repeat\r\n" );
				getCS();
				pnum = MakeCPPParam(1);
				OutLine( "PushLabel(%d); %s(%d,%d); return;\r\n", curot, GetHSPCmdTypeName(cmdtype).c_str(), cmdval, pnum+1 );
				MakeCPPTask( curot );
				curot++;
				break;
				}

			case 0x07:								// wait
			case 0x08:								// await
			case 0x17:								// run
				//		�^�X�N����؂�
				//
				MakeCPPSub( cmdtype, cmdval );
				MakeCPPTask( curot );
				curot++;
				break;
			default:
				MakeCPPSub( cmdtype, cmdval );
				break;
			}
			break;
		default:
			//		�ʏ햽��
			//
			MakeCPPSub( cmdtype, cmdval );
			break;
		}
	}

	Builder.CreateRetVoid();
	OutMes( "}\r\n\r\n" );
	OutMes( "//-End of Source-------------------------------------------\r\n" );
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
	LLVMContext &Context = getGlobalContext();

	makeoption = option;

	maxvar = hsphed->max_val;

  
	// Create some module to put our function into it.
	M = new Module("test", Context);
  
	OutMes( "//\r\n//\thsp3cnv generated source\r\n//\t[%s]\r\n//\r\n", orgname );

	OutMes( "#include \"hsp3r.h\"\r\n" );
	OutMes( "\r\n#define _HSP3CNV_DATE %s\n#define _HSP3CNV_TIME %s\r\n", localinfo.CurrentDate(), localinfo.CurrentTime() );
	OutMes( "#define _HSP3CNV_MAXVAR %d\r\n", hsphed->max_val );
	OutMes( "#define _HSP3CNV_MAXHPI %d\r\n", hsphed->max_hpi );
	OutMes( "#define _HSP3CNV_VERSION 0x%x\r\n", hsphed->version );
	OutMes( "#define _HSP3CNV_BOOTOPT %d\r\n", hsphed->bootoption );
	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );


	sMaxVar = hsphed->max_val;
	sMaxHpi = hsphed->max_hpi;

	maxvar = hsphed->max_val;

	const Type* pvalType = getPVal();
	const Type* ppvalType = PointerType::getUnqual(pvalType);
	M->addTypeName("struct.PVal", pvalType);

	// �֐��̏���
	SMDiagnostic Err;
	ParseAssemblyString(PROTOTYPES, M, Err, Context);
	//Function *F = Function::Create(FT, Function::ExternalLinkage, Name, TheModule);

	// �ϐ��̏���
	sVariables = new GlobalVariable*[maxvar];
	for(i=0;i<maxvar;i++) {
		OutMes( "static PVal *%s%s;\r\n", CPPHED_HSPVAR, GetHSPVarName(i).c_str(), i );

		Constant* constInt = ConstantInt::get(Type::getInt32Ty(Context), (int)0);
		Constant* constPtr = ConstantExpr::getIntToPtr(constInt, ppvalType);

//		sVariables[i] = new GlobalVariable(ppvalType, false, GlobalValue::ExternalLinkage, constPtr,
//										   CPPHED_HSPVAR + GetHSPVarName(i), M);
		sVariables[i] = (GlobalVariable*)M->getOrInsertGlobal(CPPHED_HSPVAR + GetHSPVarName(i), ppvalType);
	}

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	//		�������t�@���N�V�������쐬����
	//
	OutMes( "void __HspInit( Hsp3r *hsp3 ) {\r\n" );
	OutMes( "\thsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );\r\n" );
	OutMes( "}\r\n" );

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	otmax = GetOTCount();
	curot = otmax;

	i = MakeCPPMain();
	if ( i ) return i;

	//		�^�X�N(���x��)�e�[�u�����쐬����
	//
	OutMes( "\r\nCHSP3_TASK __HspTaskFunc[]={\r\n" );

	labindex = 0;
	while(1) {
		if ( labindex>=otmax ) break;
		if ( GetOTInfo( labindex ) == -1 ) {
			OutMes( "(CHSP3_TASK) L%04x,\r\n", labindex );
		} else {
			OutMes( "(CHSP3_TASK) 0,\r\n" );
		}
		labindex++;
	}
	while(1) {
		if ( labindex>=curot ) break;
		OutMes( "(CHSP3_TASK) L%04x,\r\n", labindex );
		labindex++;
	}
	OutMes( "\r\n};\r\n" );
	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	sLabMax = labindex;

	std::string ErrorInfo;
	std::auto_ptr<raw_fd_ostream> 
		Out(new raw_fd_ostream("dump.ll", ErrorInfo,
							   raw_fd_ostream::F_Binary));
	if (!ErrorInfo.empty()) {
		errs() << ErrorInfo << '\n';
		return -1;
	}
	
	*Out << *M;

    std::string ErrMsg;
//	if (verifyModule(*M, ReturnStatusAction, &ErrMsg)) {
//		Alert((char*)ErrMsg.c_str());
//	}


	EE = EngineBuilder(M)
		.setEngineKind(EngineKind::JIT)
		.setOptLevel(CodeGenOpt::Default)
		.create();

	EE->InstallLazyFunctionCreator(HspLazyFunctionCreator);

	return 0;
}
