//
//	hsp3cnv generated source
//	[test.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2011/01/27"
#define _HSP3CNV_TIME "20:03:26"
#define _HSP3CNV_MAXVAR 4
#define _HSP3CNV_MAXHPI 0
#define _HSP3CNV_VERSION 0x301
#define _HSP3CNV_BOOTOPT 0

/*-----------------------------------------------------------*/

static PVal *Var_aMm0;
static PVal *Var_bMm0;
static PVal *Var_i;
static PVal *Var_j;

/*-----------------------------------------------------------*/

void __HspInit( Hsp3r *hsp3 ) {
	hsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );
}

/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// Var initalize
	Var_aMm0 = &mem_var[0];
	Var_bMm0 = &mem_var[1];
	Var_i = &mem_var[2];
	Var_j = &mem_var[3];

	// goto *L0000
	PushLabel(0); 
	Prgcmd(0,1);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	// #deffunc testini 
	// a@m0 =0
	PushInt(0); 
	VarSet(Var_aMm0,0);
	// b@m0 =1
	PushInt(1); 
	VarSet(Var_bMm0,0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(2);
}

static void L0002( void ) {
	// #deffunc testadd int _prm0
	// a@m0 =a@m0+_prm0
	PushVar(Var_aMm0,0); PushFuncPrm(0); CalcAddI(); 
	VarSet(Var_aMm0,0);
	// b@m0 +=_prm0
	PushFuncPrm(0); 
	VarCalc(Var_bMm0,0,0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(3);
}

static void L0003( void ) {
	// #deffunc testvar var _prm1, var _prm2
	// _prm1 =a@m0
	PushVAP(Var_aMm0,0); 
	VarSet(FuncPrm(0),0);
	// _prm2 =b@m0
	PushVAP(Var_bMm0,0); 
	VarSet(FuncPrm(1),0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(4);
}

static void L0004( void ) {
	// #deffunc testmes str _prm3
	// mes ((("A="+a@m0)+"(")+_prm3)+")"
	PushStr("A="); PushVar(Var_aMm0,0); CalcAddI(); PushStr("("); CalcAddI(); PushFuncPrm(0); CalcAddI(); PushStr(")"); CalcAddI(); 
	Extcmd(15,1);
	// mes ((("B="+b@m0)+"(")+_prm3)+")"
	PushStr("B="); PushVar(Var_bMm0,0); CalcAddI(); PushStr("("); CalcAddI(); PushFuncPrm(0); CalcAddI(); PushStr(")"); CalcAddI(); 
	Extcmd(15,1);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(0);
}

static void L0000( void ) {
	// testini 
	PushLabel(7);
	Modcmd(0,0);
	return;
}

static void L0007( void ) {
	// testadd 1
	PushInt(1); 
	PushLabel(8);
	Modcmd(1,1);
	return;
}

static void L0008( void ) {
	// testmes "OK"
	PushStr("OK"); 
	PushLabel(9);
	Modcmd(3,1);
	return;
}

static void L0009( void ) {
	// testvar i, j
	PushVAP(Var_j,0); 
	PushVAP(Var_i,0); 
	PushLabel(10);
	Modcmd(2,2);
	return;
}

static void L0010( void ) {
	// mes "I(a)="+i
	PushStr("I(a)="); PushVar(Var_i,0); CalcAddI(); 
	Extcmd(15,1);
	// mes "J(b)="+j
	PushStr("J(b)="); PushVar(Var_j,0); CalcAddI(); 
	Extcmd(15,1);
	TaskSwitch(5);
}

static void L0005( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto *L0005
	PushLabel(5); 
	Prgcmd(0,1);
	return;
	TaskSwitch(6);
}

static void L0006( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto 
	PushLabel(6); 
	Prgcmd(0,0);
	return;
}

//-End of Source-------------------------------------------

CHSP3_TASK __HspTaskFunc[]={
(CHSP3_TASK) L0000,
(CHSP3_TASK) L0001,	// testini
(CHSP3_TASK) L0002,	// testadd
(CHSP3_TASK) L0003,	// testvar
(CHSP3_TASK) L0004,	// testmes
(CHSP3_TASK) L0005,
(CHSP3_TASK) L0006,
(CHSP3_TASK) L0007,
(CHSP3_TASK) L0008,
(CHSP3_TASK) L0009,
(CHSP3_TASK) L0010,

};

/*-----------------------------------------------------------*/

STRUCTDAT __HspFuncInfo[]={
	{ -1,0, 0,0,0,0,1, 0 },
	{ -1,1, 0,1,8,4,2, 0 },
	{ -1,2, 1,2,16,16,3, 0 },
	{ -1,3, 3,1,24,4,4, 0 },
};

char *__HspFuncName[]={
	"testini",
	"testadd",
	"testvar",
	"testmes",
};


/*-----------------------------------------------------------*/

