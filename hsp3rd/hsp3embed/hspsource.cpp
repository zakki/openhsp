//
//	hsp3cnv(3.3a4) generated source
//	[bug_module.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2012/01/26"
#define _HSP3CNV_TIME "17:39:16"
#define _HSP3CNV_MAXVAR 3
#define _HSP3CNV_MAXHPI 0
#define _HSP3CNV_VERSION 0x301
#define _HSP3CNV_BOOTOPT 4096

/*-----------------------------------------------------------*/

static PVal *Var_0;
static PVal *Var_1;
static PVal *Var_2;

/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// Var initalize
	Var_0 = &mem_var[0];
	Var_1 = &mem_var[1];
	Var_2 = &mem_var[2];

	// goto *L0000
	TaskSwitch(0);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	// #deffunc a var _prm0, var _prm1
	// _prm0 =1.000000
	PushDouble(1.000000); 
	VarSet(FuncPrmVA(0),0);
	// _prm1 =2.000000
	PushDouble(2.000000); 
	VarSet(FuncPrmVA(1),0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(0);
}

static void L0000( void ) {
	// _HspVar0 =0.000000, 0.000000
	PushDouble(0.000000); 
	VarSet(Var_0,0);
	PushVarOffset(Var_0);
	PushDouble(0.000000); 
	VarSet2(Var_0);
	// a _HspVar0(0), _HspVar0(1)
		PushInt(1); 
	PushVAP(Var_0,1); 
		PushInt(0); 
	PushVAP(Var_0,1); 
	PushLabel(4);
	Modcmd(0,2);
	return;
}

static void L0004( void ) {
	// _HspVar1 ="abc\ndefg"
	PushStr("abc\r\ndefg"); 
	VarSet(Var_1,0);
	// getstr _HspVar2, _HspVar1, 0
	PushInt(0); 
	PushVAP(Var_1,0); 
	PushVAP(Var_2,0); 
	Intcmd(29,3);
	// repeat
	PushLabel(2); 
	PushLabel(5); Prgcmd(4,2); return;
	TaskSwitch(5);
}

static void L0005( void ) {
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	// mes _HspVar0(0)
		PushInt(0); 
	PushVAP(Var_0,1); 
	Extcmd(15,1);
	// mes _HspVar0(1)
		PushInt(1); 
	PushVAP(Var_0,1); 
	Extcmd(15,1);
	// mes _HspVar2
	PushVAP(Var_2,0); 
	Extcmd(15,1);
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// await 16
	PushInt(16); 
	Prgcmd(8,1);
	TaskSwitch(6);
}

static void L0006( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(2);
}

static void L0002( void ) {
	TaskSwitch(3);
}

static void L0003( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto 
	Prgcmd(0,0);
	return;
}

//-End of Source-------------------------------------------

CHSP3_TASK __HspTaskFunc[]={
(CHSP3_TASK) L0000,
(CHSP3_TASK) L0001,	// a
(CHSP3_TASK) L0002,
(CHSP3_TASK) L0003,
(CHSP3_TASK) L0004,
(CHSP3_TASK) L0005,
(CHSP3_TASK) L0006,
(CHSP3_TASK) 0,

};

/*-----------------------------------------------------------*/

STRUCTDAT __HspFuncInfo[]={
	{ -1,0, 0,2,0,0,1, (void *)0 },
};

STRUCTPRM __HspPrmInfo[]={
	{ -3, -1, 0 },
	{ -3, -1, 8 },
};

char __HspDataName[]="a\0"\
;


/*-----------------------------------------------------------*/

void __HspInit( Hsp3r *hsp3 ) {
	hsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );
	hsp3->SetDataName( __HspDataName );
	hsp3->SetFInfo( __HspFuncInfo, 28 );
	hsp3->SetLInfo( 0, 0 );
	hsp3->SetMInfo( __HspPrmInfo, 16 );
}

/*-----------------------------------------------------------*/

