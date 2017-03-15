//
//	hsp3cnv(3.5b5) generated source
//	[tamane2.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2017/03/15"
#define _HSP3CNV_TIME "17:08:45"
#define _HSP3CNV_MAXVAR 15
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
static PVal *Var_11;
static PVal *Var_12;
static PVal *Var_13;
static PVal *Var_14;

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
	Var_11 = &mem_var[11];
	Var_12 = &mem_var[12];
	Var_13 = &mem_var[13];
	Var_14 = &mem_var[14];

	// title "HGIMG4 Test"
	PushStr("HGIMG4 Test"); 
	Extcmd(16,1);
	//  
	Extcmd(96,0);
	//  1, 4210752
	PushInt(4210752); 
	PushInt(1); 
	Extcmd(94,2);
	//  1048579, 1, 1, 1
	PushInt(1); 
	PushInt(1); 
	PushInt(1); 
	PushInt(1048579); 
	Extcmd(181,4);
	//  1048579, 0.500000, 0.500000, 0.500000
	PushDouble(0.500000); 
	PushDouble(0.500000); 
	PushDouble(0.500000); 
	PushInt(1048579); 
	Extcmd(179,4);
	//  _HspVar0, "res/tamane2"
	PushStr("res/tamane2"); 
	PushVAP(Var_0,0); 
	Extcmd(117,2);
	//  _HspVar1, 0, 3.141592
	PushDouble(3.141592); 
	PushInt(0); 
	PushVAP(Var_1,0); 
	Extcmd(185,3);
	//  _HspVar0, 0.100000, 0.100000, 0.100000
	PushDouble(0.100000); 
	PushDouble(0.100000); 
	PushDouble(0.100000); 
	PushVAP(Var_0,0); 
	Extcmd(178,4);
	//  1048578, 0, 20, 30
	PushInt(30); 
	PushInt(20); 
	PushInt(0); 
	PushInt(1048578); 
	Extcmd(176,4);
	//  _HspVar0
	PushVAP(Var_0,0); 
	Extcmd(250,1);
	// repeat
	PushLabel(0); 
	PushLabel(2); Prgcmd(4,2); return;
	TaskSwitch(2);
}

static void L0002( void ) {
	// stick _HspVar2, 15
	PushInt(15); 
	PushVAP(Var_2,0); 
	Extcmd(52,2);
	// if _HspVar2&128
	PushVar(Var_2,0); PushInt(128); CalcAndI(); 
	if (HspIf()) { TaskSwitch(3); return; }
	// end 
	Prgcmd(16,0);
	return;
	TaskSwitch(3);
}

static void L0003( void ) {
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	// if _HspVar3
	PushVAP(Var_3,0); 
	if (HspIf()) { TaskSwitch(4); return; }
	// getkey _HspVar4, 1
	PushInt(1); 
	PushVAP(Var_4,0); 
	Extcmd(35,2);
	// if _HspVar4=1
	PushVar(Var_4,0); PushInt(1); CalcEqI(); 
	if (HspIf()) { TaskSwitch(5); return; }
	// _HspVar5 =(mousex-_HspVar6*0.050000)+_HspVar7
	PushDouble(0.050000); PushFuncEnd(); PushExtvar(0,0); PushVar(Var_6,0); CalcSubI(); CalcMulI(); PushVar(Var_7,0); CalcAddI(); 
	VarSet(Var_5,0);
	// _HspVar8 =(mousey-_HspVar9*0.050000)+_HspVar10
	PushDouble(0.050000); PushFuncEnd(); PushExtvar(1,0); PushVar(Var_9,0); CalcSubI(); CalcMulI(); PushVar(Var_10,0); CalcAddI(); 
	VarSet(Var_8,0);
	//  1048578, _HspVar5, _HspVar8, _HspVar11
	PushVAP(Var_11,0); 
	PushVAP(Var_8,0); 
	PushVAP(Var_5,0); 
	PushInt(1048578); 
	Extcmd(176,4);
	TaskSwitch(6);
}

static void L0005( void ) {
	// else
	// _HspVar3 =0
	PushInt(0); 
	VarSet(Var_3,0);
	TaskSwitch(6);
}

static void L0006( void ) {
	TaskSwitch(7);
}

static void L0004( void ) {
	// else
	// getkey _HspVar4, 1
	PushInt(1); 
	PushVAP(Var_4,0); 
	Extcmd(35,2);
	// if _HspVar4
	PushVAP(Var_4,0); 
	if (HspIf()) { TaskSwitch(8); return; }
	// _HspVar6 =mousex
	PushFuncEnd(); PushExtvar(0,0); 
	VarSet(Var_6,0);
	// _HspVar9 =mousey
	PushFuncEnd(); PushExtvar(1,0); 
	VarSet(Var_9,0);
	//  1048578, _HspVar7, _HspVar10, _HspVar11
	PushVAP(Var_11,0); 
	PushVAP(Var_10,0); 
	PushVAP(Var_7,0); 
	PushInt(1048578); 
	Extcmd(128,4);
	// _HspVar3 =1
	PushInt(1); 
	VarSet(Var_3,0);
	TaskSwitch(8);
}

static void L0008( void ) {
	TaskSwitch(7);
}

static void L0007( void ) {
	//  1048578, 0, 14, 0
	PushInt(0); 
	PushInt(14); 
	PushInt(0); 
	PushInt(1048578); 
	Extcmd(124,4);
	//  
	Extcmd(97,0);
	// color 255, 255, 255
	PushInt(255); 
	PushInt(255); 
	PushInt(255); 
	Extcmd(24,3);
	// pos 8, 8
	PushInt(8); 
	PushInt(8); 
	Extcmd(17,2);
	// mes "HGIMG4 sample"
	PushStr("HGIMG4 sample"); 
	Extcmd(15,1);
	// mes ((("("+_HspVar12)+" x ")+_HspVar13)+")"
	PushStr("("); PushVar(Var_12,0); CalcAddI(); PushStr(" x "); CalcAddI(); PushVar(Var_13,0); CalcAddI(); PushStr(")"); CalcAddI(); 
	Extcmd(15,1);
	// mes "Effect : "+_HspVar14
	PushStr("Effect : "); PushVar(Var_14,0); CalcAddI(); 
	Extcmd(15,1);
	// mes ((((("Acc("+ginfo(256))+",")+ginfo(257))+",")+ginfo(258))+")"
	PushStr("Acc("); PushFuncEnd(); 	PushInt(256); 
	PushExtvar(256,1); CalcAddI(); PushStr(","); CalcAddI(); PushFuncEnd(); 	PushInt(257); 
	PushExtvar(256,1); CalcAddI(); PushStr(","); CalcAddI(); PushFuncEnd(); 	PushInt(258); 
	PushExtvar(256,1); CalcAddI(); PushStr(")"); CalcAddI(); 
	Extcmd(15,1);
	// mes ((((("Gyro("+ginfo(259))+",")+ginfo(260))+",")+ginfo(261))+")"
	PushStr("Gyro("); PushFuncEnd(); 	PushInt(259); 
	PushExtvar(256,1); CalcAddI(); PushStr(","); CalcAddI(); PushFuncEnd(); 	PushInt(260); 
	PushExtvar(256,1); CalcAddI(); PushStr(","); CalcAddI(); PushFuncEnd(); 	PushInt(261); 
	PushExtvar(256,1); CalcAddI(); PushStr(")"); CalcAddI(); 
	Extcmd(15,1);
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// await 1000/60
	PushInt(16);/*OPT*/ 
	Prgcmd(8,1);
	TaskSwitch(9);
}

static void L0009( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(0);
}

static void L0000( void ) {
	TaskSwitch(1);
}

static void L0001( void ) {
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
(CHSP3_TASK) L0001,
(CHSP3_TASK) L0002,
(CHSP3_TASK) L0003,
(CHSP3_TASK) L0004,
(CHSP3_TASK) L0005,
(CHSP3_TASK) L0006,
(CHSP3_TASK) L0007,
(CHSP3_TASK) L0008,
(CHSP3_TASK) L0009,
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

