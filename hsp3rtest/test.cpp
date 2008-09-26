//
//	hsp3cnv generated source
//	[test.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2008/09/26"
#define _HSP3CNV_TIME "20:34:33"
#define _HSP3CNV_MAXVAR 3
#define _HSP3CNV_MAXHPI 0
#define _HSP3CNV_VERSION 0x301
#define _HSP3CNV_BOOTOPT 0

/*-----------------------------------------------------------*/

static PVal *Var_a;
static PVal *Var_b;
static PVal *Var_c;

/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// Var initalize
	Var_a = &mem_var[0];
	Var_b = &mem_var[1];
	Var_c = &mem_var[2];

	// gosub
	PushLabel(0); 
	PushLabel(5); Prgcmd(1,2); return;
	TaskSwitch(5);
}

static void L0005( void ) {
	// a =hspver
	PushFuncEnd(); PushSysvar(2,0); 
	VarSet(Var_a,0,1);
	// mes "START"+strf("%x", a)
	PushStr("START"); PushFuncEnd(); 	PushVar(Var_a,0); 
		PushStr("%x"); 
	PushIntfunc(259,2); CalcAddI(); 
	Extcmd(15,1);
	// mes "SIN="+sin(0.500000+sqrt(1.000000))
	PushStr("SIN="); PushFuncEnd(); 	PushDouble(0.500000); PushFuncEnd(); 	PushDouble(1.000000); 
	PushIntfunc(388,1); CalcAddI(); 
	PushIntfunc(384,1); CalcAddI(); 
	Extcmd(15,1);
	// a =0
	PushInt(0); 
	VarSet(Var_a,0,1);
	// b =0
	PushInt(0); 
	VarSet(Var_b,0,1);
	// c =0
	PushInt(0); 
	VarSet(Var_c,0,1);
	// repeat
	PushInt(10); 
	PushLabel(1); 
	PushLabel(6); Prgcmd(4,3); return;
	TaskSwitch(6);
}

static void L0006( void ) {
	// a ++
	VarInc(Var_a,0);
	// b =rnd(5)+1
	PushFuncEnd(); 	PushInt(5); 
	PushIntfunc(1,1); PushInt(1); CalcAddI(); 
	VarSet(Var_b,0,1);
	// mes (("A="+a)+"/B=")+b
	PushStr("A="); PushVar(Var_a,0); CalcAddI(); PushStr("/B="); CalcAddI(); PushVar(Var_b,0); CalcAddI(); 
	Extcmd(15,1);
	// c +=a/b
	PushVar(Var_a,0); PushVar(Var_b,0); CalcDivI(); 
	VarCalc(Var_c,0,0);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	// mes "C="+c
	PushStr("C="); PushVar(Var_c,0); CalcAddI(); 
	Extcmd(15,1);
	// mes "END"
	PushStr("END"); 
	Extcmd(15,1);
	TaskSwitch(2);
}

static void L0002( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto *L0002
	PushLabel(2); 
	Prgcmd(0,1);
	return;
	TaskSwitch(0);
}

static void L0000( void ) {
	// repeat
	PushInt(10); 
	PushLabel(3); 
	PushLabel(7); Prgcmd(4,3); return;
	TaskSwitch(7);
}

static void L0007( void ) {
	// if cnt=3
	PushFuncEnd(); PushSysvar(4,0); PushInt(3); CalcEqI(); 
	if (HspIf()) { TaskSwitch(8); return; }
	// continue *L0003
	PushLabel(3); 
	Prgcmd(6,1);
	return;
	TaskSwitch(8);
}

static void L0008( void ) {
	// mes "OK"+cnt
	PushStr("OK"); PushFuncEnd(); PushSysvar(4,0); CalcAddI(); 
	Extcmd(15,1);
	// if cnt=5
	PushFuncEnd(); PushSysvar(4,0); PushInt(5); CalcEqI(); 
	if (HspIf()) { TaskSwitch(9); return; }
	// break *L0003
	PushLabel(3); 
	Prgcmd(3,1);
	return;
	TaskSwitch(9);
}

static void L0009( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(3);
}

static void L0003( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(4);
}

static void L0004( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto *L0004
	PushLabel(4); 
	Prgcmd(0,1);
	return;
}

//-End of Source-------------------------------------------

CHSP3_TASK __HspTaskFunc[]={
(CHSP3_TASK) L0000,
(CHSP3_TASK) L0001,
(CHSP3_TASK) L0002,
(CHSP3_TASK) L0003,
(CHSP3_TASK) L0004,
(CHSP3_TASK) L0005,
(CHSP3_TASK) L0006,
(CHSP3_TASK) L0007,
(CHSP3_TASK) L0008,
(CHSP3_TASK) L0009,

};

/*-----------------------------------------------------------*/

