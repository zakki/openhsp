//
//	hsp3cnv(3.5b5) generated source
//	[grotate.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2018/12/12"
#define _HSP3CNV_TIME "22:15:25"
#define _HSP3CNV_MAXVAR 11
#define _HSP3CNV_MAXHPI 16
#define _HSP3CNV_VERSION 0x350
#define _HSP3CNV_BOOTOPT 4096

/*-----------------------------------------------------------*/

static PVal *Var_0;
static PVal *Var_1;
static PVal *Var_2;
static PVal *Var_3;
static PVal *Var_4;
static PVal *Var_5;
static PVal *Var_6;
static PVal *Var_7;
static PVal *Var_8;
static PVal *Var_9;
static PVal *Var_10;

/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// Var initalize
	Var_0 = &mem_var[0];
	Var_1 = &mem_var[1];
	Var_2 = &mem_var[2];
	Var_3 = &mem_var[3];
	Var_4 = &mem_var[4];
	Var_5 = &mem_var[5];
	Var_6 = &mem_var[6];
	Var_7 = &mem_var[7];
	Var_8 = &mem_var[8];
	Var_9 = &mem_var[9];
	Var_10 = &mem_var[10];

	// randomize 
	Intcmd(39,0);
	// title "grotate"
	PushStr("grotate"); 
	Extcmd(16,1);
	// celload "hsp3dish.png", 3
	PushInt(3); 
	PushStr("hsp3ttl.jpg"); 
	Extcmd(60,2);
	// cls 4
	PushInt(4); 
	Extcmd(19,1);
	// font "Arial", 14
	PushInt(14); 
	PushStr("Arial"); 
	Extcmd(20,2);
	// _HspVar0 ="HSP3 grotate sample"
	PushStr("HSP3 grotate sample"); 
	VarSet(Var_0,0);
	// _HspVar1 =ginfo(12)-32
	PushFuncEnd(); 	PushInt(12); 
PushExtvar(256,1); PushInt(32); CalcSubI(); 
	VarSet(Var_1,0);
	// _HspVar2 =ginfo(13)-32
	PushFuncEnd(); 	PushInt(13); 
PushExtvar(256,1); PushInt(32); CalcSubI(); 
	VarSet(Var_2,0);
	// _HspVar3 =20
	PushInt(20); 
	VarSet(Var_3,0);
	// dim _HspVar4, _HspVar3
	PushVAP(Var_3,0); 
	PushVAP(Var_4,0); 
	Prgcmd(9,2);
	// dim _HspVar5, _HspVar3
	PushVAP(Var_3,0); 
	PushVAP(Var_5,0); 
	Prgcmd(9,2);
	// dim _HspVar6, _HspVar3
	PushVAP(Var_3,0); 
	PushVAP(Var_6,0); 
	Prgcmd(9,2);
	// dim _HspVar7, _HspVar3
	PushVAP(Var_3,0); 
	PushVAP(Var_7,0); 
	Prgcmd(9,2);
	// dim _HspVar8, _HspVar3
	PushVAP(Var_3,0); 
	PushVAP(Var_8,0); 
	Prgcmd(9,2);
	// dim _HspVar9, _HspVar3
	PushVAP(Var_3,0); 
	PushVAP(Var_9,0); 
	Prgcmd(9,2);
	// repeat
	PushVAP(Var_3,0); 
	PushLabel(0); 
	PushLabel(5); Prgcmd(4,3); return;
	TaskSwitch(5);
}

static void L0005( void ) {
	// _HspVar4 (cnt)=rnd(_HspVar1)
	PushFuncEnd(); 	PushVAP(Var_1,0); 
PushIntfunc(1,1); 
	PushSysvar(4,0); 
	VarSet(Var_4,1);
	// _HspVar5 (cnt)=rnd(_HspVar2)
	PushFuncEnd(); 	PushVAP(Var_2,0); 
PushIntfunc(1,1); 
	PushSysvar(4,0); 
	VarSet(Var_5,1);
	// _HspVar8 (cnt)=rnd(4096)
	PushFuncEnd(); 	PushInt(4096); 
PushIntfunc(1,1); 
	PushSysvar(4,0); 
	VarSet(Var_8,1);
	// _HspVar10 =rnd(5)-2
	PushFuncEnd(); 	PushInt(5); 
PushIntfunc(1,1); PushInt(2); CalcSubI(); 
	VarSet(Var_10,0);
	// if _HspVar10=0
	PushVar(Var_10,0); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(6); return; }
	// _HspVar10 =-1
	PushInt(-1); 
	VarSet(Var_10,0);
	TaskSwitch(6);
}

static void L0006( void ) {
	// _HspVar6 (cnt)=_HspVar10*2
	PushVar(Var_10,0); PushInt(2); CalcMulI(); 
	PushSysvar(4,0); 
	VarSet(Var_6,1);
	// _HspVar10 =rnd(5)-2
	PushFuncEnd(); 	PushInt(5); 
PushIntfunc(1,1); PushInt(2); CalcSubI(); 
	VarSet(Var_10,0);
	// if _HspVar10=0
	PushVar(Var_10,0); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(7); return; }
	// _HspVar10 =-1
	PushInt(-1); 
	VarSet(Var_10,0);
	TaskSwitch(7);
}

static void L0007( void ) {
	// _HspVar7 (cnt)=_HspVar10*2
	PushVar(Var_10,0); PushInt(2); CalcMulI(); 
	PushSysvar(4,0); 
	VarSet(Var_7,1);
	// _HspVar9 (cnt)=rnd(16)
	PushFuncEnd(); 	PushInt(16); 
PushIntfunc(1,1); 
	PushSysvar(4,0); 
	VarSet(Var_9,1);
	// _HspVar9 (cnt)+=8
	PushInt(8); 
	PushSysvar(4,0); 
	VarCalc(Var_9,1,0);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(0);
}

static void L0000( void ) {
	// repeat
	PushLabel(1); 
	PushLabel(8); Prgcmd(4,2); return;
	TaskSwitch(8);
}

static void L0008( void ) {
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	// color 64, 64, 64
	PushInt(64); 
	PushInt(64); 
	PushInt(64); 
	Extcmd(24,3);
	// boxf 
	Extcmd(49,0);
	// pos 0, 0
	PushInt(0); 
	PushInt(0); 
	Extcmd(17,2);
	// grotate 3, 0, 0, double(_HspVar8(0))*0.005000
	PushFuncEnd(); 		PushInt(0); 
	PushVAP(Var_8,1); 
	PushIntfunc(389,1); PushDouble(0.005000); CalcMulI(); 
	PushInt(0); 
	PushInt(0); 
	PushInt(3); 
	Extcmd(54,4);
	// gmode 2, 64, 64
	PushInt(64); 
	PushInt(64); 
	PushInt(2); 
	Extcmd(32,3);
	// repeat
	PushVAP(Var_3,0); 
	PushLabel(2); 
	PushLabel(9); Prgcmd(4,3); return;
	TaskSwitch(9);
}

static void L0009( void ) {
	// pos _HspVar4(cnt), _HspVar5(cnt)
		PushSysvar(4,0); 
	PushVAP(Var_5,1); 
		PushSysvar(4,0); 
	PushVAP(Var_4,1); 
	Extcmd(17,2);
	// grotate 3, 0, 0, double(_HspVar8(cnt))*0.005000
	PushFuncEnd(); 		PushSysvar(4,0); 
	PushVAP(Var_8,1); 
	PushIntfunc(389,1); PushDouble(0.005000); CalcMulI(); 
	PushInt(0); 
	PushInt(0); 
	PushInt(3); 
	Extcmd(54,4);
	// _HspVar4 (cnt)+=_HspVar6(cnt)
		PushSysvar(4,0); 
	PushVar(Var_6,1); 
	PushSysvar(4,0); 
	VarCalc(Var_4,1,0);
	// if (_HspVar4(cnt)<2_HspVar4(cnt)>_HspVar1)|(cnt)
		PushSysvar(4,0); 
	PushVar(Var_4,1); PushInt(2); CalcLtI(); 	PushSysvar(4,0); 
	PushVar(Var_4,1); PushVar(Var_1,0); CalcGtI(); CalcOrI(); 
	if (HspIf()) { TaskSwitch(10); return; }
	// _HspVar6 (cnt)=_HspVar6(cnt)*-1
		PushSysvar(4,0); 
PushVar(Var_6,1); PushInt(-1); CalcMulI(); 
	PushSysvar(4,0); 
	VarSet(Var_6,1);
	TaskSwitch(10);
}

static void L0010( void ) {
	// _HspVar5 (cnt)+=_HspVar7(cnt)
		PushSysvar(4,0); 
	PushVar(Var_7,1); 
	PushSysvar(4,0); 
	VarCalc(Var_5,1,0);
	// if (_HspVar5(cnt)<2_HspVar5(cnt)>_HspVar2)|(cnt)
		PushSysvar(4,0); 
	PushVar(Var_5,1); PushInt(2); CalcLtI(); 	PushSysvar(4,0); 
	PushVar(Var_5,1); PushVar(Var_2,0); CalcGtI(); CalcOrI(); 
	if (HspIf()) { TaskSwitch(11); return; }
	// _HspVar7 (cnt)=_HspVar7(cnt)*-1
		PushSysvar(4,0); 
PushVar(Var_7,1); PushInt(-1); CalcMulI(); 
	PushSysvar(4,0); 
	VarSet(Var_7,1);
	TaskSwitch(11);
}

static void L0011( void ) {
	// _HspVar8 (cnt)+=_HspVar9(cnt)
		PushSysvar(4,0); 
	PushVar(Var_9,1); 
	PushSysvar(4,0); 
	VarCalc(Var_8,1,0);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(2);
}

static void L0002( void ) {
	// pos 12, 12
	PushInt(12); 
	PushInt(12); 
	Extcmd(17,2);
	// color 0, 0, 0
	PushInt(0); 
	PushInt(0); 
	PushInt(0); 
	Extcmd(24,3);
	// mes _HspVar0
	PushVAP(Var_0,0); 
	Extcmd(15,1);
	// pos 10, 10
	PushInt(10); 
	PushInt(10); 
	Extcmd(17,2);
	// color 255, 255, 255
	PushInt(255); 
	PushInt(255); 
	PushInt(255); 
	Extcmd(24,3);
	// mes _HspVar0
	PushVAP(Var_0,0); 
	Extcmd(15,1);
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// await 1000/60
	PushInt(16);/*OPT*/ 
	Prgcmd(8,1);
	TaskSwitch(12);
}

static void L0012( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	TaskSwitch(3);
}

static void L0003( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto *L0003
	TaskSwitch(3);
	return;
	TaskSwitch(4);
}

static void L0004( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto *L0004
	TaskSwitch(4);
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
(CHSP3_TASK) L0010,
(CHSP3_TASK) L0011,
(CHSP3_TASK) L0012,
(CHSP3_TASK) 0,

};

/*-----------------------------------------------------------*/


/*-----------------------------------------------------------*/

void __HspInit( Hsp3r *hsp3 ) {
	hsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );
	hsp3->SetDataName( 0 );
	hsp3->SetFInfo( 0, 0 );
	hsp3->SetLInfo( 0, 0 );
	hsp3->SetMInfo( 0, 0 );
}

/*-----------------------------------------------------------*/

