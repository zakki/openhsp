//
//	hsp3cnv generated source
//	[raytracing.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2011/01/17"
#define _HSP3CNV_TIME "17:24:42"
#define _HSP3CNV_MAXVAR 84
#define _HSP3CNV_MAXHPI 0
#define _HSP3CNV_VERSION 0x301
#define _HSP3CNV_BOOTOPT 0

/*-----------------------------------------------------------*/

static PVal *Var__HspVar0;
static PVal *Var__HspVar1;
static PVal *Var__HspVar2;
static PVal *Var__HspVar3;
static PVal *Var__HspVar4;
static PVal *Var__HspVar5;
static PVal *Var__HspVar6;
static PVal *Var__HspVar7;
static PVal *Var__HspVar8;
static PVal *Var__HspVar9;
static PVal *Var__HspVar10;
static PVal *Var__HspVar11;
static PVal *Var__HspVar12;
static PVal *Var__HspVar13;
static PVal *Var__HspVar14;
static PVal *Var__HspVar15;
static PVal *Var__HspVar16;
static PVal *Var__HspVar17;
static PVal *Var__HspVar18;
static PVal *Var__HspVar19;
static PVal *Var__HspVar20;
static PVal *Var__HspVar21;
static PVal *Var__HspVar22;
static PVal *Var__HspVar23;
static PVal *Var__HspVar24;
static PVal *Var__HspVar25;
static PVal *Var__HspVar26;
static PVal *Var__HspVar27;
static PVal *Var__HspVar28;
static PVal *Var__HspVar29;
static PVal *Var__HspVar30;
static PVal *Var__HspVar31;
static PVal *Var__HspVar32;
static PVal *Var__HspVar33;
static PVal *Var__HspVar34;
static PVal *Var__HspVar35;
static PVal *Var__HspVar36;
static PVal *Var__HspVar37;
static PVal *Var__HspVar38;
static PVal *Var__HspVar39;
static PVal *Var__HspVar40;
static PVal *Var__HspVar41;
static PVal *Var__HspVar42;
static PVal *Var__HspVar43;
static PVal *Var__HspVar44;
static PVal *Var__HspVar45;
static PVal *Var__HspVar46;
static PVal *Var__HspVar47;
static PVal *Var__HspVar48;
static PVal *Var__HspVar49;
static PVal *Var__HspVar50;
static PVal *Var__HspVar51;
static PVal *Var__HspVar52;
static PVal *Var__HspVar53;
static PVal *Var__HspVar54;
static PVal *Var__HspVar55;
static PVal *Var__HspVar56;
static PVal *Var__HspVar57;
static PVal *Var__HspVar58;
static PVal *Var__HspVar59;
static PVal *Var__HspVar60;
static PVal *Var__HspVar61;
static PVal *Var__HspVar62;
static PVal *Var__HspVar63;
static PVal *Var__HspVar64;
static PVal *Var__HspVar65;
static PVal *Var__HspVar66;
static PVal *Var__HspVar67;
static PVal *Var__HspVar68;
static PVal *Var__HspVar69;
static PVal *Var__HspVar70;
static PVal *Var__HspVar71;
static PVal *Var__HspVar72;
static PVal *Var__HspVar73;
static PVal *Var__HspVar74;
static PVal *Var__HspVar75;
static PVal *Var__HspVar76;
static PVal *Var__HspVar77;
static PVal *Var__HspVar78;
static PVal *Var__HspVar79;
static PVal *Var__HspVar80;
static PVal *Var__HspVar81;
static PVal *Var__HspVar82;
static PVal *Var__HspVar83;

/*-----------------------------------------------------------*/

void __HspInit( Hsp3r *hsp3 ) {
	hsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );
}

/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// Var initalize
	Var__HspVar0 = &mem_var[0];
	Var__HspVar1 = &mem_var[1];
	Var__HspVar2 = &mem_var[2];
	Var__HspVar3 = &mem_var[3];
	Var__HspVar4 = &mem_var[4];
	Var__HspVar5 = &mem_var[5];
	Var__HspVar6 = &mem_var[6];
	Var__HspVar7 = &mem_var[7];
	Var__HspVar8 = &mem_var[8];
	Var__HspVar9 = &mem_var[9];
	Var__HspVar10 = &mem_var[10];
	Var__HspVar11 = &mem_var[11];
	Var__HspVar12 = &mem_var[12];
	Var__HspVar13 = &mem_var[13];
	Var__HspVar14 = &mem_var[14];
	Var__HspVar15 = &mem_var[15];
	Var__HspVar16 = &mem_var[16];
	Var__HspVar17 = &mem_var[17];
	Var__HspVar18 = &mem_var[18];
	Var__HspVar19 = &mem_var[19];
	Var__HspVar20 = &mem_var[20];
	Var__HspVar21 = &mem_var[21];
	Var__HspVar22 = &mem_var[22];
	Var__HspVar23 = &mem_var[23];
	Var__HspVar24 = &mem_var[24];
	Var__HspVar25 = &mem_var[25];
	Var__HspVar26 = &mem_var[26];
	Var__HspVar27 = &mem_var[27];
	Var__HspVar28 = &mem_var[28];
	Var__HspVar29 = &mem_var[29];
	Var__HspVar30 = &mem_var[30];
	Var__HspVar31 = &mem_var[31];
	Var__HspVar32 = &mem_var[32];
	Var__HspVar33 = &mem_var[33];
	Var__HspVar34 = &mem_var[34];
	Var__HspVar35 = &mem_var[35];
	Var__HspVar36 = &mem_var[36];
	Var__HspVar37 = &mem_var[37];
	Var__HspVar38 = &mem_var[38];
	Var__HspVar39 = &mem_var[39];
	Var__HspVar40 = &mem_var[40];
	Var__HspVar41 = &mem_var[41];
	Var__HspVar42 = &mem_var[42];
	Var__HspVar43 = &mem_var[43];
	Var__HspVar44 = &mem_var[44];
	Var__HspVar45 = &mem_var[45];
	Var__HspVar46 = &mem_var[46];
	Var__HspVar47 = &mem_var[47];
	Var__HspVar48 = &mem_var[48];
	Var__HspVar49 = &mem_var[49];
	Var__HspVar50 = &mem_var[50];
	Var__HspVar51 = &mem_var[51];
	Var__HspVar52 = &mem_var[52];
	Var__HspVar53 = &mem_var[53];
	Var__HspVar54 = &mem_var[54];
	Var__HspVar55 = &mem_var[55];
	Var__HspVar56 = &mem_var[56];
	Var__HspVar57 = &mem_var[57];
	Var__HspVar58 = &mem_var[58];
	Var__HspVar59 = &mem_var[59];
	Var__HspVar60 = &mem_var[60];
	Var__HspVar61 = &mem_var[61];
	Var__HspVar62 = &mem_var[62];
	Var__HspVar63 = &mem_var[63];
	Var__HspVar64 = &mem_var[64];
	Var__HspVar65 = &mem_var[65];
	Var__HspVar66 = &mem_var[66];
	Var__HspVar67 = &mem_var[67];
	Var__HspVar68 = &mem_var[68];
	Var__HspVar69 = &mem_var[69];
	Var__HspVar70 = &mem_var[70];
	Var__HspVar71 = &mem_var[71];
	Var__HspVar72 = &mem_var[72];
	Var__HspVar73 = &mem_var[73];
	Var__HspVar74 = &mem_var[74];
	Var__HspVar75 = &mem_var[75];
	Var__HspVar76 = &mem_var[76];
	Var__HspVar77 = &mem_var[77];
	Var__HspVar78 = &mem_var[78];
	Var__HspVar79 = &mem_var[79];
	Var__HspVar80 = &mem_var[80];
	Var__HspVar81 = &mem_var[81];
	Var__HspVar82 = &mem_var[82];
	Var__HspVar83 = &mem_var[83];

	// randomize 
	Intcmd(39,0);
	// _HspVar0 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar0,0,1);
	// _HspVar1 =28.000000
	PushDouble(28.000000); 
	VarSet(Var__HspVar1,0,1);
	// _HspVar2 =80.000000
	PushDouble(80.000000); 
	VarSet(Var__HspVar2,0,1);
	// _HspVar3 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar3,0,1);
	// _HspVar4 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar4,0,1);
	// _HspVar5 =0.500000
	PushDouble(0.500000); 
	VarSet(Var__HspVar5,0,1);
	// _HspVar6 =0.707100
	PushDouble(0.707100); 
	VarSet(Var__HspVar6,0,1);
	// _HspVar7 =-0.500000
	PushDouble(-0.500000); 
	VarSet(Var__HspVar7,0,1);
	// font "ÇlÇr ÉSÉVÉbÉN", 12
	PushInt(12); 
	PushStr("ÇlÇr ÉSÉVÉbÉN"); 
	Extcmd(20,2);
	TaskSwitch(0);
}

static void L0000( void ) {
	// _HspVar8 =8
	PushInt(8); 
	VarSet(Var__HspVar8,0,1);
	// repeat
	PushVAP(Var__HspVar8,0); 
	PushLabel(1); 
	PushLabel(14); Prgcmd(4,3); return;
	TaskSwitch(14);
}

static void L000e( void ) {
	// _HspVar9 =(3.141590/4)*cnt
	PushDouble(3.141590); PushInt(4); CalcDivI(); PushFuncEnd(); PushSysvar(4,0); CalcMulI(); 
	VarSet(Var__HspVar9,0,1);
	// _HspVar10 (cnt)=sin(_HspVar9)*20
	PushFuncEnd(); 	PushVar(Var__HspVar9,0); 
	PushIntfunc(384,1); PushInt(20); CalcMulI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar10,1,1);
	// _HspVar11 (cnt)=(cos(_HspVar9)*20)+28
	PushFuncEnd(); 	PushVar(Var__HspVar9,0); 
	PushIntfunc(385,1); PushInt(20); CalcMulI(); PushInt(28); CalcAddI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar11,1,1);
	// _HspVar12 (cnt)=0.000000
	PushDouble(0.000000); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar12,1,1);
	// _HspVar13 (cnt)=10.000000
	PushDouble(10.000000); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar13,1,1);
	// _HspVar14 (cnt)=0.300000
	PushDouble(0.300000); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar14,1,1);
	// _HspVar15 (cnt)=0.300000
	PushDouble(0.300000); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar15,1,1);
	// _HspVar16 (cnt)=0.300000
	PushDouble(0.300000); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar16,1,1);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	// goto *L0002
	PushLabel(2); 
	Prgcmd(0,1);
	return;
	TaskSwitch(3);
}

static void L0003( void ) {
	// _HspVar8 =rnd(12)+1
	PushFuncEnd(); 	PushInt(12); 
	PushIntfunc(1,1); PushInt(1); CalcAddI(); 
	VarSet(Var__HspVar8,0,1);
	// _HspVar17 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar17,0,1);
	// _HspVar18 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar18,0,1);
	// _HspVar19 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar19,0,1);
	// repeat
	PushVAP(Var__HspVar8,0); 
	PushLabel(4); 
	PushLabel(15); Prgcmd(4,3); return;
	TaskSwitch(15);
}

static void L000f( void ) {
	// _HspVar10 (cnt)=(0.000000+rnd(60))-30
	PushDouble(0.000000); PushFuncEnd(); 	PushInt(60); 
	PushIntfunc(1,1); CalcAddI(); PushInt(30); CalcSubI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar10,1,1);
	// _HspVar11 (cnt)=0.000000+rnd(40)
	PushDouble(0.000000); PushFuncEnd(); 	PushInt(40); 
	PushIntfunc(1,1); CalcAddI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar11,1,1);
	// _HspVar12 (cnt)=(0.000000+rnd(60))-30
	PushDouble(0.000000); PushFuncEnd(); 	PushInt(60); 
	PushIntfunc(1,1); CalcAddI(); PushInt(30); CalcSubI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar12,1,1);
	// _HspVar13 (cnt)=0.010000*rnd(900)+4.000000
	PushDouble(4.000000); PushDouble(0.010000); PushFuncEnd(); 	PushInt(900); 
	PushIntfunc(1,1); CalcMulI(); CalcAddI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar13,1,1);
	// _HspVar14 (cnt)=0.001000*rnd(1000)
	PushDouble(0.001000); PushFuncEnd(); 	PushInt(1000); 
	PushIntfunc(1,1); CalcMulI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar14,1,1);
	// _HspVar15 (cnt)=0.001000*rnd(1000)
	PushDouble(0.001000); PushFuncEnd(); 	PushInt(1000); 
	PushIntfunc(1,1); CalcMulI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar15,1,1);
	// _HspVar16 (cnt)=0.001000*rnd(1000)
	PushDouble(0.001000); PushFuncEnd(); 	PushInt(1000); 
	PushIntfunc(1,1); CalcMulI(); 
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar16,1,1);
	// _HspVar17 +=_HspVar10(cnt)/_HspVar8
		PushFuncEnd(); PushSysvar(4,0); 
	PushVar(Var__HspVar10,1); PushVar(Var__HspVar8,0); CalcDivI(); 
	VarCalc(Var__HspVar17,0,0);
	// _HspVar18 +=_HspVar11(cnt)/_HspVar8
		PushFuncEnd(); PushSysvar(4,0); 
	PushVar(Var__HspVar11,1); PushVar(Var__HspVar8,0); CalcDivI(); 
	VarCalc(Var__HspVar18,0,0);
	// _HspVar19 +=_HspVar12(cnt)/_HspVar8
		PushFuncEnd(); PushSysvar(4,0); 
	PushVar(Var__HspVar12,1); PushVar(Var__HspVar8,0); CalcDivI(); 
	VarCalc(Var__HspVar19,0,0);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(2);
}

static void L0002( void ) {
	TaskSwitch(4);
}

static void L0004( void ) {
	// repeat
	PushLabel(5); 
	PushLabel(16); Prgcmd(4,2); return;
	TaskSwitch(16);
}

static void L0010( void ) {
	// _HspVar20 =_HspVar21
	PushVAP(Var__HspVar21,0); 
	VarSet(Var__HspVar20,0,1);
	// _HspVar22 =_HspVar23
	PushVAP(Var__HspVar23,0); 
	VarSet(Var__HspVar22,0,1);
	// _HspVar21 =mousex
	PushFuncEnd(); PushExtvar(0,0); 
	VarSet(Var__HspVar21,0,1);
	// _HspVar23 =mousey
	PushFuncEnd(); PushExtvar(1,0); 
	VarSet(Var__HspVar23,0,1);
	// _HspVar24 =mousew
	PushFuncEnd(); PushExtvar(2,0); 
	VarSet(Var__HspVar24,0,1);
	// _HspVar25 =_HspVar26
	PushVAP(Var__HspVar26,0); 
	VarSet(Var__HspVar25,0,1);
	// stick _HspVar26, 15+256
	PushInt(15); PushInt(256); CalcAddI(); 
	PushVAP(Var__HspVar26,0); 
	Extcmd(52,2);
	// if _HspVar26&16
	PushVar(Var__HspVar26,0); PushInt(16); CalcAndI(); 
	if (HspIf()) { TaskSwitch(17); return; }
	// break *L0005
	PushLabel(5); 
	Prgcmd(3,1);
	return;
	TaskSwitch(17);
}

static void L0011( void ) {
	// if _HspVar26&32
	PushVar(Var__HspVar26,0); PushInt(32); CalcAndI(); 
	if (HspIf()) { TaskSwitch(18); return; }
	// _HspVar27 =1
	PushInt(1); 
	VarSet(Var__HspVar27,0,1);
	// color , 255
	PushInt(255); 
	PushDefault();
	Extcmd(24,2);
	// boxf 633
	PushInt(633); 
	Extcmd(49,1);
	// pos 540, 460
	PushInt(460); 
	PushInt(540); 
	Extcmd(17,2);
	// mes "íÜíf : ESC"
	PushStr("íÜíf : ESC"); 
	Extcmd(15,1);
	TaskSwitch(19);
}

static void L0012( void ) {
	// else
	// _HspVar27 =16
	PushInt(16); 
	VarSet(Var__HspVar27,0,1);
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	TaskSwitch(19);
}

static void L0013( void ) {
	// _HspVar28 =ginfo(12)/_HspVar27
	PushFuncEnd(); 	PushInt(12); 
	PushExtvar(256,1); PushVar(Var__HspVar27,0); CalcDivI(); 
	VarSet(Var__HspVar28,0,1);
	// _HspVar29 =ginfo(13)/_HspVar27
	PushFuncEnd(); 	PushInt(13); 
	PushExtvar(256,1); PushVar(Var__HspVar27,0); CalcDivI(); 
	VarSet(Var__HspVar29,0,1);
	// _HspVar30 =1.000000/_HspVar29
	PushDouble(1.000000); PushVar(Var__HspVar29,0); CalcDivI(); 
	VarSet(Var__HspVar30,0,1);
	// getkey _HspVar31, 33
	PushInt(33); 
	PushVAP(Var__HspVar31,0); 
	Extcmd(35,2);
	// getkey _HspVar32, 34
	PushInt(34); 
	PushVAP(Var__HspVar32,0); 
	Extcmd(35,2);
	// _HspVar2 -=_HspVar31-_HspVar32*0.500000
	PushDouble(0.500000); PushVar(Var__HspVar31,0); PushVar(Var__HspVar32,0); CalcSubI(); CalcMulI(); 
	VarCalc(Var__HspVar2,0,1);
	// _HspVar0 +=((_HspVar26>>2)&1_HspVar26&1)-*0.030000
	PushDouble(0.030000); PushVar(Var__HspVar26,0); PushInt(2); CalcRrI(); PushInt(1); CalcAndI(); PushVar(Var__HspVar26,0); PushInt(1); CalcAndI(); CalcSubI(); CalcMulI(); 
	VarCalc(Var__HspVar0,0,0);
	// _HspVar1 +=(((_HspVar26>>1)&1_HspVar26>>3)&1)-
	PushVar(Var__HspVar26,0); PushInt(1); CalcRrI(); PushInt(1); CalcAndI(); PushVar(Var__HspVar26,0); PushInt(3); CalcRrI(); PushInt(1); CalcAndI(); CalcSubI(); 
	VarCalc(Var__HspVar1,0,0);
	// if _HspVar1<1.000000
	PushVar(Var__HspVar1,0); PushDouble(1.000000); CalcLtI(); 
	if (HspIf()) { TaskSwitch(20); return; }
	// _HspVar1 =1.000000
	PushDouble(1.000000); 
	VarSet(Var__HspVar1,0,1);
	TaskSwitch(20);
}

static void L0014( void ) {
	// _HspVar3 +=(_HspVar17-_HspVar3)*0.100000
	PushVar(Var__HspVar17,0); PushVar(Var__HspVar3,0); CalcSubI(); PushDouble(0.100000); CalcMulI(); 
	VarCalc(Var__HspVar3,0,0);
	// _HspVar4 +=(_HspVar19-_HspVar4)*0.100000
	PushVar(Var__HspVar19,0); PushVar(Var__HspVar4,0); CalcSubI(); PushDouble(0.100000); CalcMulI(); 
	VarCalc(Var__HspVar4,0,0);
	// _HspVar33 =sin(_HspVar0)
	PushFuncEnd(); 	PushVar(Var__HspVar0,0); 
	PushIntfunc(384,1); 
	VarSet(Var__HspVar33,0,1);
	// _HspVar34 =cos(_HspVar0)*-1
	PushFuncEnd(); 	PushVar(Var__HspVar0,0); 
	PushIntfunc(385,1); PushInt(-1); CalcMulI(); 
	VarSet(Var__HspVar34,0,1);
	// _HspVar35 =(_HspVar33*_HspVar2)+_HspVar3
	PushVar(Var__HspVar33,0); PushVar(Var__HspVar2,0); CalcMulI(); PushVar(Var__HspVar3,0); CalcAddI(); 
	VarSet(Var__HspVar35,0,1);
	// _HspVar36 =(_HspVar34*_HspVar2)+_HspVar4
	PushVar(Var__HspVar34,0); PushVar(Var__HspVar2,0); CalcMulI(); PushVar(Var__HspVar4,0); CalcAddI(); 
	VarSet(Var__HspVar36,0,1);
	// if _HspVar26&256
	PushVar(Var__HspVar26,0); PushInt(256); CalcAndI(); 
	if (HspIf()) { TaskSwitch(21); return; }
	// if _HspVar37>=0
	PushVar(Var__HspVar37,0); PushInt(0); CalcGtEqI(); 
	if (HspIf()) { TaskSwitch(22); return; }
	// _HspVar38 =_HspVar21-_HspVar20
	PushVar(Var__HspVar21,0); PushVar(Var__HspVar20,0); CalcSubI(); 
	VarSet(Var__HspVar38,0,1);
	// _HspVar39 =0.160000
	PushDouble(0.160000); 
	VarSet(Var__HspVar39,0,1);
	// _HspVar11 (_HspVar37)+=_HspVar22-_HspVar23*_HspVar39
	PushVar(Var__HspVar39,0); PushVar(Var__HspVar22,0); PushVar(Var__HspVar23,0); CalcSubI(); CalcMulI(); 
	PushVar(Var__HspVar37,0); 
	VarCalc(Var__HspVar11,1,0);
	// _HspVar10 (_HspVar37)-=(_HspVar39*_HspVar34)*_HspVar38
	PushVar(Var__HspVar39,0); PushVar(Var__HspVar34,0); CalcMulI(); PushVar(Var__HspVar38,0); CalcMulI(); 
	PushVar(Var__HspVar37,0); 
	VarCalc(Var__HspVar10,1,1);
	// _HspVar12 (_HspVar37)+=(_HspVar39*_HspVar33)*_HspVar38
	PushVar(Var__HspVar39,0); PushVar(Var__HspVar33,0); CalcMulI(); PushVar(Var__HspVar38,0); CalcMulI(); 
	PushVar(Var__HspVar37,0); 
	VarCalc(Var__HspVar12,1,0);
	// if _HspVar24>0
	PushVar(Var__HspVar24,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(23); return; }
	// _HspVar13 (_HspVar37)+=0.400000
	PushDouble(0.400000); 
	PushVar(Var__HspVar37,0); 
	VarCalc(Var__HspVar13,1,0);
	TaskSwitch(23);
}

static void L0017( void ) {
	// if _HspVar24<0
	PushVar(Var__HspVar24,0); PushInt(0); CalcLtI(); 
	if (HspIf()) { TaskSwitch(24); return; }
	// _HspVar13 (_HspVar37)-=0.400000
	PushDouble(0.400000); 
	PushVar(Var__HspVar37,0); 
	VarCalc(Var__HspVar13,1,1);
	TaskSwitch(24);
}

static void L0018( void ) {
	TaskSwitch(22);
}

static void L0016( void ) {
	TaskSwitch(25);
}

static void L0015( void ) {
	// else
	// _HspVar37 =-1
	PushInt(-1); 
	VarSet(Var__HspVar37,0,1);
	TaskSwitch(25);
}

static void L0019( void ) {
	// if ((_HspVar25^_HspVar26)&_HspVar26)&256
	PushVar(Var__HspVar25,0); PushVar(Var__HspVar26,0); CalcXorI(); PushVar(Var__HspVar26,0); CalcAndI(); PushInt(256); CalcAndI(); 
	if (HspIf()) { TaskSwitch(26); return; }
	// _HspVar40 =(_HspVar20/_HspVar27+0.5000000.500000*_HspVar28)-*_HspVar30
	PushVar(Var__HspVar30,0); PushDouble(0.500000); PushVar(Var__HspVar20,0); PushVar(Var__HspVar27,0); CalcDivI(); CalcAddI(); PushDouble(0.500000); PushVar(Var__HspVar28,0); CalcMulI(); CalcSubI(); CalcMulI(); 
	VarSet(Var__HspVar40,0,1);
	// _HspVar41 =(_HspVar22/_HspVar27+0.5000000.500000*_HspVar29)-*_HspVar30
	PushVar(Var__HspVar30,0); PushDouble(0.500000); PushVar(Var__HspVar22,0); PushVar(Var__HspVar27,0); CalcDivI(); CalcAddI(); PushDouble(0.500000); PushVar(Var__HspVar29,0); CalcMulI(); CalcSubI(); CalcMulI(); 
	VarSet(Var__HspVar41,0,1);
	// gosub
	PushLabel(6); 
	PushLabel(27); Prgcmd(1,2); return;
	TaskSwitch(27);
}

static void L001b( void ) {
	// _HspVar42 =2
	PushInt(2); 
	VarSet(Var__HspVar42,0,1);
	// gosub
	PushLabel(7); 
	PushLabel(28); Prgcmd(1,2); return;
	TaskSwitch(28);
}

static void L001c( void ) {
	// _HspVar37 =_HspVar43
	PushVAP(Var__HspVar43,0); 
	VarSet(Var__HspVar37,0,1);
	TaskSwitch(26);
}

static void L001a( void ) {
	// _HspVar44 =(((gettime(5)*60)+gettime(6))*1000)+gettime(7)
	PushFuncEnd(); 	PushInt(5); 
	PushIntfunc(8,1); PushInt(60); CalcMulI(); PushFuncEnd(); 	PushInt(6); 
	PushIntfunc(8,1); CalcAddI(); PushInt(1000); CalcMulI(); PushFuncEnd(); 	PushInt(7); 
	PushIntfunc(8,1); CalcAddI(); 
	VarSet(Var__HspVar44,0,1);
	// repeat
	PushVAP(Var__HspVar29,0); 
	PushLabel(8); 
	PushLabel(29); Prgcmd(4,3); return;
	TaskSwitch(29);
}

static void L001d( void ) {
	// _HspVar45 =cnt*_HspVar27
	PushFuncEnd(); PushSysvar(4,0); PushVar(Var__HspVar27,0); CalcMulI(); 
	VarSet(Var__HspVar45,0,1);
	// _HspVar41 =(0.500000+cnt0.500000*_HspVar29)-*_HspVar30
	PushVar(Var__HspVar30,0); PushDouble(0.500000); PushFuncEnd(); PushSysvar(4,0); CalcAddI(); PushDouble(0.500000); PushVar(Var__HspVar29,0); CalcMulI(); CalcSubI(); CalcMulI(); 
	VarSet(Var__HspVar41,0,1);
	// repeat
	PushVAP(Var__HspVar28,0); 
	PushLabel(9); 
	PushLabel(30); Prgcmd(4,3); return;
	TaskSwitch(30);
}

static void L001e( void ) {
	// _HspVar46 =cnt*_HspVar27
	PushFuncEnd(); PushSysvar(4,0); PushVar(Var__HspVar27,0); CalcMulI(); 
	VarSet(Var__HspVar46,0,1);
	// _HspVar40 =(0.500000+cnt0.500000*_HspVar28)-*_HspVar30
	PushVar(Var__HspVar30,0); PushDouble(0.500000); PushFuncEnd(); PushSysvar(4,0); CalcAddI(); PushDouble(0.500000); PushVar(Var__HspVar28,0); CalcMulI(); CalcSubI(); CalcMulI(); 
	VarSet(Var__HspVar40,0,1);
	// gosub
	PushLabel(6); 
	PushLabel(31); Prgcmd(1,2); return;
	TaskSwitch(31);
}

static void L001f( void ) {
	// _HspVar47 =1.000000
	PushDouble(1.000000); 
	VarSet(Var__HspVar47,0,1);
	// _HspVar48 =1.000000
	PushDouble(1.000000); 
	VarSet(Var__HspVar48,0,1);
	// _HspVar49 =1.000000
	PushDouble(1.000000); 
	VarSet(Var__HspVar49,0,1);
	// _HspVar50 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar50,0,1);
	// _HspVar51 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar51,0,1);
	// _HspVar52 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar52,0,1);
	// gosub
	PushLabel(7); 
	PushLabel(32); Prgcmd(1,2); return;
	TaskSwitch(32);
}

static void L0020( void ) {
	// if _HspVar53>=0.000000
	PushVar(Var__HspVar53,0); PushDouble(0.000000); CalcGtEqI(); 
	if (HspIf()) { TaskSwitch(33); return; }
	// _HspVar54 =limitf(((_HspVar55*_HspVar5_HspVar53*_HspVar6)+_HspVar56*_HspVar7)+, 0, 1)
	PushFuncEnd(); 	PushInt(1); 
		PushInt(0); 
		PushVar(Var__HspVar55,0); PushVar(Var__HspVar5,0); CalcMulI(); PushVar(Var__HspVar53,0); PushVar(Var__HspVar6,0); CalcMulI(); CalcAddI(); PushVar(Var__HspVar56,0); PushVar(Var__HspVar7,0); CalcMulI(); CalcAddI(); 
	PushIntfunc(393,3); 
	VarSet(Var__HspVar54,0,1);
	// repeat
	PushInt(8); 
	PushLabel(10); 
	PushLabel(34); Prgcmd(4,3); return;
	TaskSwitch(34);
}

static void L0022( void ) {
	// _HspVar54 =_HspVar54*_HspVar54
	PushVar(Var__HspVar54,0); PushVar(Var__HspVar54,0); CalcMulI(); 
	VarSet(Var__HspVar54,0,1);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(10);
}

static void L000a( void ) {
	// _HspVar57 =_HspVar54*100
	PushVar(Var__HspVar54,0); PushInt(100); CalcMulI(); 
	VarSet(Var__HspVar57,0,1);
	TaskSwitch(35);
}

static void L0021( void ) {
	// else
	// _HspVar58 =(_HspVar53*-1)*5.000000
	PushVar(Var__HspVar53,0); PushInt(-1); CalcMulI(); PushDouble(5.000000); CalcMulI(); 
	VarSet(Var__HspVar58,0,1);
	// _HspVar59 =(_HspVar60*-1)/_HspVar53
	PushVar(Var__HspVar60,0); PushInt(-1); CalcMulI(); PushVar(Var__HspVar53,0); CalcDivI(); 
	VarSet(Var__HspVar59,0,1);
	// _HspVar61 =_HspVar59*_HspVar55+_HspVar61
	PushVar(Var__HspVar61,0); PushVar(Var__HspVar59,0); PushVar(Var__HspVar55,0); CalcMulI(); CalcAddI(); 
	VarSet(Var__HspVar61,0,1);
	// _HspVar60 =0.000000
	PushDouble(0.000000); 
	VarSet(Var__HspVar60,0,1);
	// _HspVar62 =_HspVar59*_HspVar56+_HspVar62
	PushVar(Var__HspVar62,0); PushVar(Var__HspVar59,0); PushVar(Var__HspVar56,0); CalcMulI(); CalcAddI(); 
	VarSet(Var__HspVar62,0,1);
	// _HspVar57 =limitf((((int(_HspVar61+80000)/8int(_HspVar62+80000)/8)+(_HspVar62+80000))&1)!=0*0.700000, 0.300000, _HspVar58)
	PushFuncEnd(); 	PushVar(Var__HspVar58,0); 
		PushDouble(0.300000); 
		PushDouble(0.700000); PushFuncEnd(); 	PushVar(Var__HspVar61,0); PushInt(80000); CalcAddI(); 
	PushIntfunc(0,1); PushInt(8); CalcDivI(); PushFuncEnd(); 	PushVar(Var__HspVar62,0); PushInt(80000); CalcAddI(); 
	PushIntfunc(0,1); PushInt(8); CalcDivI(); CalcAddI(); PushInt(1); CalcAndI(); PushInt(0); CalcNeI(); CalcMulI(); 
	PushIntfunc(393,3); 
	VarSet(Var__HspVar57,0,1);
	// _HspVar55 =_HspVar5
	PushVAP(Var__HspVar5,0); 
	VarSet(Var__HspVar55,0,1);
	// _HspVar53 =_HspVar6
	PushVAP(Var__HspVar6,0); 
	VarSet(Var__HspVar53,0,1);
	// _HspVar56 =_HspVar7
	PushVAP(Var__HspVar7,0); 
	VarSet(Var__HspVar56,0,1);
	// _HspVar42 =1
	PushInt(1); 
	VarSet(Var__HspVar42,0,1);
	// gosub
	PushLabel(7); 
	PushLabel(36); Prgcmd(1,2); return;
	TaskSwitch(36);
}

static void L0024( void ) {
	// if _HspVar43>0
	PushVar(Var__HspVar43,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(37); return; }
	// _HspVar57 *=0.200000
	PushDouble(0.200000); 
	VarCalc(Var__HspVar57,0,2);
	TaskSwitch(37);
}

static void L0025( void ) {
	TaskSwitch(35);
}

static void L0023( void ) {
	// if _HspVar63
	PushVAP(Var__HspVar63,0); 
	if (HspIf()) { TaskSwitch(38); return; }
	// _HspVar50 +=_HspVar64*_HspVar14(_HspVar65)
	PushVar(Var__HspVar64,0); 	PushVar(Var__HspVar65,0); 
	PushVar(Var__HspVar14,1); CalcMulI(); 
	VarCalc(Var__HspVar50,0,0);
	// _HspVar51 +=_HspVar64*_HspVar15(_HspVar65)
	PushVar(Var__HspVar64,0); 	PushVar(Var__HspVar65,0); 
	PushVar(Var__HspVar15,1); CalcMulI(); 
	VarCalc(Var__HspVar51,0,0);
	// _HspVar52 +=_HspVar64*_HspVar16(_HspVar65)
	PushVar(Var__HspVar64,0); 	PushVar(Var__HspVar65,0); 
	PushVar(Var__HspVar16,1); CalcMulI(); 
	VarCalc(Var__HspVar52,0,0);
	TaskSwitch(38);
}

static void L0026( void ) {
	// color limitf((_HspVar57*_HspVar47)+_HspVar50, 0, 1)*255, limitf((_HspVar57*_HspVar48)+_HspVar51, 0, 1)*255, limitf((_HspVar57*_HspVar49)+_HspVar52, 0, 1)*255
	PushFuncEnd(); 	PushInt(1); 
		PushInt(0); 
		PushVar(Var__HspVar57,0); PushVar(Var__HspVar49,0); CalcMulI(); PushVar(Var__HspVar52,0); CalcAddI(); 
	PushIntfunc(393,3); PushInt(255); CalcMulI(); 
	PushFuncEnd(); 	PushInt(1); 
		PushInt(0); 
		PushVar(Var__HspVar57,0); PushVar(Var__HspVar48,0); CalcMulI(); PushVar(Var__HspVar51,0); CalcAddI(); 
	PushIntfunc(393,3); PushInt(255); CalcMulI(); 
	PushFuncEnd(); 	PushInt(1); 
		PushInt(0); 
		PushVar(Var__HspVar57,0); PushVar(Var__HspVar47,0); CalcMulI(); PushVar(Var__HspVar50,0); CalcAddI(); 
	PushIntfunc(393,3); PushInt(255); CalcMulI(); 
	Extcmd(24,3);
	// boxf _HspVar46, _HspVar45, (_HspVar46+_HspVar27)-1, (_HspVar45+_HspVar27)-1
	PushVar(Var__HspVar45,0); PushVar(Var__HspVar27,0); CalcAddI(); PushInt(1); CalcSubI(); 
	PushVar(Var__HspVar46,0); PushVar(Var__HspVar27,0); CalcAddI(); PushInt(1); CalcSubI(); 
	PushVAP(Var__HspVar45,0); 
	PushVAP(Var__HspVar46,0); 
	Extcmd(49,4);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(9);
}

static void L0009( void ) {
	// await 0
	PushInt(0); 
	Prgcmd(8,1);
	TaskSwitch(39);
}

static void L0027( void ) {
	// if _HspVar27=1
	PushVar(Var__HspVar27,0); PushInt(1); CalcEqI(); 
	if (HspIf()) { TaskSwitch(40); return; }
	// stick _HspVar26
	PushVAP(Var__HspVar26,0); 
	Extcmd(52,1);
	// if _HspVar26&128
	PushVar(Var__HspVar26,0); PushInt(128); CalcAndI(); 
	if (HspIf()) { TaskSwitch(41); return; }
	// _HspVar27 =16
	PushInt(16); 
	VarSet(Var__HspVar27,0,1);
	// break *L0008
	PushLabel(8); 
	Prgcmd(3,1);
	return;
	TaskSwitch(41);
}

static void L0029( void ) {
	TaskSwitch(40);
}

static void L0028( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(8);
}

static void L0008( void ) {
	// _HspVar66 =(((gettime(5)*60)+gettime(6))*1000)+gettime(7)
	PushFuncEnd(); 	PushInt(5); 
	PushIntfunc(8,1); PushInt(60); CalcMulI(); PushFuncEnd(); 	PushInt(6); 
	PushIntfunc(8,1); CalcAddI(); PushInt(1000); CalcMulI(); PushFuncEnd(); 	PushInt(7); 
	PushIntfunc(8,1); CalcAddI(); 
	VarSet(Var__HspVar66,0,1);
	// color 255, 255, 255
	PushInt(255); 
	PushInt(255); 
	PushInt(255); 
	Extcmd(24,3);
	// pos 0, 20
	PushInt(20); 
	PushInt(0); 
	Extcmd(17,2);
	// mes (double(_HspVar66-_HspVar44)/1000+"->")+"sec"
	PushStr("->"); PushFuncEnd(); 	PushVar(Var__HspVar66,0); PushVar(Var__HspVar44,0); CalcSubI(); 
	PushIntfunc(389,1); PushInt(1000); CalcDivI(); CalcAddI(); PushStr("sec"); CalcAddI(); 
	Extcmd(15,1);
	// if _HspVar27=1
	PushVar(Var__HspVar27,0); PushInt(1); CalcEqI(); 
	if (HspIf()) { TaskSwitch(42); return; }
	// dialog "ÉZÅ[ÉuÇµÇ‹Ç∑Ç©ÅH", 2
	PushInt(2); 
	PushStr("ÉZÅ[ÉuÇµÇ‹Ç∑Ç©ÅH"); 
	Extcmd(3,2);
	// if stat=6
	PushFuncEnd(); PushSysvar(3,0); PushInt(6); CalcEqI(); 
	if (HspIf()) { TaskSwitch(43); return; }
	// dialog "bmp", 17
	PushInt(17); 
	PushStr("bmp"); 
	Extcmd(3,2);
	// if stat
	PushFuncEnd(); PushSysvar(3,0); 
	if (HspIf()) { TaskSwitch(44); return; }
	// bmpsave refstr
	PushFuncEnd(); PushSysvar(12,0); 
	Extcmd(33,1);
	TaskSwitch(44);
}

static void L002c( void ) {
	TaskSwitch(43);
}

static void L002b( void ) {
	// stick _HspVar26
	PushVAP(Var__HspVar26,0); 
	Extcmd(52,1);
	TaskSwitch(45);
}

static void L002a( void ) {
	// else
	// color 255, 255, 255
	PushInt(255); 
	PushInt(255); 
	PushInt(255); 
	Extcmd(24,3);
	// pos 0, 0
	PushInt(0); 
	PushInt(0); 
	Extcmd(17,2);
	// mes "ëÄçÏ:Å™Å´Å©Å® Rup Rdn Enter Space Drag+Wheel"
	PushStr("ëÄçÏ:Å™Å´Å©Å® Rup Rdn Enter Space Drag+Wheel"); 
	Extcmd(15,1);
	TaskSwitch(45);
}

static void L002d( void ) {
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(5);
}

static void L0005( void ) {
	// goto *L0003
	PushLabel(3); 
	Prgcmd(0,1);
	return;
	TaskSwitch(7);
}

static void L0007( void ) {
	// if _HspVar42=0
	PushVar(Var__HspVar42,0); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(46); return; }
	// _HspVar63 =0
	PushInt(0); 
	VarSet(Var__HspVar63,0,1);
	TaskSwitch(46);
}

static void L002e( void ) {
	// repeat
	PushInt(10); 
	PushLabel(11); 
	PushLabel(47); Prgcmd(4,3); return;
	TaskSwitch(47);
}

static void L002f( void ) {
	// _HspVar43 =-1
	PushInt(-1); 
	VarSet(Var__HspVar43,0,1);
	// _HspVar67 =10000.000000
	PushDouble(10000.000000); 
	VarSet(Var__HspVar67,0,1);
	// repeat
	PushVAP(Var__HspVar8,0); 
	PushLabel(12); 
	PushLabel(48); Prgcmd(4,3); return;
	TaskSwitch(48);
}

static void L0030( void ) {
	// _HspVar9 =_HspVar13(cnt)
		PushFuncEnd(); PushSysvar(4,0); 
	PushVAP(Var__HspVar13,1); 
	VarSet(Var__HspVar9,0,1);
	// _HspVar38 =_HspVar10(cnt)-_HspVar61
		PushFuncEnd(); PushSysvar(4,0); 
	PushVar(Var__HspVar10,1); PushVar(Var__HspVar61,0); CalcSubI(); 
	VarSet(Var__HspVar38,0,1);
	// _HspVar68 =_HspVar11(cnt)-_HspVar60
		PushFuncEnd(); PushSysvar(4,0); 
	PushVar(Var__HspVar11,1); PushVar(Var__HspVar60,0); CalcSubI(); 
	VarSet(Var__HspVar68,0,1);
	// _HspVar69 =_HspVar12(cnt)-_HspVar62
		PushFuncEnd(); PushSysvar(4,0); 
	PushVar(Var__HspVar12,1); PushVar(Var__HspVar62,0); CalcSubI(); 
	VarSet(Var__HspVar69,0,1);
	// _HspVar70 =((_HspVar38*_HspVar55_HspVar68*_HspVar53)+_HspVar69*_HspVar56)+
	PushVar(Var__HspVar38,0); PushVar(Var__HspVar55,0); CalcMulI(); PushVar(Var__HspVar68,0); PushVar(Var__HspVar53,0); CalcMulI(); CalcAddI(); PushVar(Var__HspVar69,0); PushVar(Var__HspVar56,0); CalcMulI(); CalcAddI(); 
	VarSet(Var__HspVar70,0,1);
	// _HspVar71 =((_HspVar38*_HspVar38_HspVar68*_HspVar68)+_HspVar69*_HspVar69)+
	PushVar(Var__HspVar38,0); PushVar(Var__HspVar38,0); CalcMulI(); PushVar(Var__HspVar68,0); PushVar(Var__HspVar68,0); CalcMulI(); CalcAddI(); PushVar(Var__HspVar69,0); PushVar(Var__HspVar69,0); CalcMulI(); CalcAddI(); 
	VarSet(Var__HspVar71,0,1);
	// _HspVar72 =_HspVar9*_HspVar9-_HspVar71
	PushVar(Var__HspVar71,0); PushVar(Var__HspVar9,0); PushVar(Var__HspVar9,0); CalcMulI(); CalcSubI(); 
	VarSet(Var__HspVar72,0,1);
	// _HspVar73 =(_HspVar70*_HspVar70)-_HspVar72
	PushVar(Var__HspVar70,0); PushVar(Var__HspVar70,0); CalcMulI(); PushVar(Var__HspVar72,0); CalcSubI(); 
	VarSet(Var__HspVar73,0,1);
	// if _HspVar73<0.000000
	PushVar(Var__HspVar73,0); PushDouble(0.000000); CalcLtI(); 
	if (HspIf()) { TaskSwitch(49); return; }
	// continue *L000c
	PushLabel(12); 
	Prgcmd(6,1);
	return;
	TaskSwitch(49);
}

static void L0031( void ) {
	// _HspVar39 =_HspVar70-sqrt(_HspVar73)
	PushVar(Var__HspVar70,0); PushFuncEnd(); 	PushVar(Var__HspVar73,0); 
	PushIntfunc(388,1); CalcSubI(); 
	VarSet(Var__HspVar39,0,1);
	// if _HspVar39<0.000000
	PushVar(Var__HspVar39,0); PushDouble(0.000000); CalcLtI(); 
	if (HspIf()) { TaskSwitch(50); return; }
	// continue *L000c
	PushLabel(12); 
	Prgcmd(6,1);
	return;
	TaskSwitch(50);
}

static void L0032( void ) {
	// if _HspVar42=1
	PushVar(Var__HspVar42,0); PushInt(1); CalcEqI(); 
	if (HspIf()) { TaskSwitch(51); return; }
	// _HspVar43 =1
	PushInt(1); 
	VarSet(Var__HspVar43,0,1);
	// break *L000c
	PushLabel(12); 
	Prgcmd(3,1);
	return;
	TaskSwitch(51);
}

static void L0033( void ) {
	// if _HspVar39<_HspVar67
	PushVar(Var__HspVar39,0); PushVar(Var__HspVar67,0); CalcLtI(); 
	if (HspIf()) { TaskSwitch(52); return; }
	// if (_HspVar53*_HspVar39+_HspVar60)>0.000000
	PushVar(Var__HspVar60,0); PushVar(Var__HspVar53,0); PushVar(Var__HspVar39,0); CalcMulI(); CalcAddI(); PushDouble(0.000000); CalcGtI(); 
	if (HspIf()) { TaskSwitch(53); return; }
	// _HspVar67 =_HspVar39
	PushVAP(Var__HspVar39,0); 
	VarSet(Var__HspVar67,0,1);
	// _HspVar43 =cnt
	PushFuncEnd(); PushSysvar(4,0); 
	VarSet(Var__HspVar43,0,1);
	TaskSwitch(53);
}

static void L0035( void ) {
	TaskSwitch(52);
}

static void L0034( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(12);
}

static void L000c( void ) {
	// if _HspVar42
	PushVAP(Var__HspVar42,0); 
	if (HspIf()) { TaskSwitch(54); return; }
	// _HspVar42 =0
	PushInt(0); 
	VarSet(Var__HspVar42,0,1);
	// break *L000b
	PushLabel(11); 
	Prgcmd(3,1);
	return;
	TaskSwitch(54);
}

static void L0036( void ) {
	// if _HspVar43<0
	PushVar(Var__HspVar43,0); PushInt(0); CalcLtI(); 
	if (HspIf()) { TaskSwitch(55); return; }
	// break *L000b
	PushLabel(11); 
	Prgcmd(3,1);
	return;
	TaskSwitch(55);
}

static void L0037( void ) {
	// _HspVar71 =1.000000/_HspVar13(_HspVar43)
	PushDouble(1.000000); 	PushVar(Var__HspVar43,0); 
	PushVar(Var__HspVar13,1); CalcDivI(); 
	VarSet(Var__HspVar71,0,1);
	// _HspVar61 +=_HspVar55*_HspVar67
	PushVar(Var__HspVar55,0); PushVar(Var__HspVar67,0); CalcMulI(); 
	VarCalc(Var__HspVar61,0,0);
	// _HspVar74 =(_HspVar61-_HspVar10(_HspVar43))*_HspVar71
	PushVar(Var__HspVar61,0); 	PushVar(Var__HspVar43,0); 
	PushVar(Var__HspVar10,1); CalcSubI(); PushVar(Var__HspVar71,0); CalcMulI(); 
	VarSet(Var__HspVar74,0,1);
	// _HspVar60 +=_HspVar53*_HspVar67
	PushVar(Var__HspVar53,0); PushVar(Var__HspVar67,0); CalcMulI(); 
	VarCalc(Var__HspVar60,0,0);
	// _HspVar75 =(_HspVar60-_HspVar11(_HspVar43))*_HspVar71
	PushVar(Var__HspVar60,0); 	PushVar(Var__HspVar43,0); 
	PushVar(Var__HspVar11,1); CalcSubI(); PushVar(Var__HspVar71,0); CalcMulI(); 
	VarSet(Var__HspVar75,0,1);
	// _HspVar62 +=_HspVar56*_HspVar67
	PushVar(Var__HspVar56,0); PushVar(Var__HspVar67,0); CalcMulI(); 
	VarCalc(Var__HspVar62,0,0);
	// _HspVar76 =(_HspVar62-_HspVar12(_HspVar43))*_HspVar71
	PushVar(Var__HspVar62,0); 	PushVar(Var__HspVar43,0); 
	PushVar(Var__HspVar12,1); CalcSubI(); PushVar(Var__HspVar71,0); CalcMulI(); 
	VarSet(Var__HspVar76,0,1);
	// _HspVar71 =((_HspVar74*_HspVar55_HspVar75*_HspVar53)+_HspVar76*_HspVar56)+*2.000000
	PushDouble(2.000000); PushVar(Var__HspVar74,0); PushVar(Var__HspVar55,0); CalcMulI(); PushVar(Var__HspVar75,0); PushVar(Var__HspVar53,0); CalcMulI(); CalcAddI(); PushVar(Var__HspVar76,0); PushVar(Var__HspVar56,0); CalcMulI(); CalcAddI(); CalcMulI(); 
	VarSet(Var__HspVar71,0,1);
	// _HspVar55 =_HspVar71*_HspVar74-_HspVar55
	PushVar(Var__HspVar55,0); PushVar(Var__HspVar71,0); PushVar(Var__HspVar74,0); CalcMulI(); CalcSubI(); 
	VarSet(Var__HspVar55,0,1);
	// _HspVar53 =_HspVar71*_HspVar75-_HspVar53
	PushVar(Var__HspVar53,0); PushVar(Var__HspVar71,0); PushVar(Var__HspVar75,0); CalcMulI(); CalcSubI(); 
	VarSet(Var__HspVar53,0,1);
	// _HspVar56 =_HspVar71*_HspVar76-_HspVar56
	PushVar(Var__HspVar56,0); PushVar(Var__HspVar71,0); PushVar(Var__HspVar76,0); CalcMulI(); CalcSubI(); 
	VarSet(Var__HspVar56,0,1);
	// _HspVar77 =limitf(_HspVar71*0.500000+1.100000, 0, 1)
	PushFuncEnd(); 	PushInt(1); 
		PushInt(0); 
		PushDouble(1.100000); PushVar(Var__HspVar71,0); PushDouble(0.500000); CalcMulI(); CalcAddI(); 
	PushIntfunc(393,3); 
	VarSet(Var__HspVar77,0,1);
	// _HspVar77 =(_HspVar77*_HspVar77)*4
	PushVar(Var__HspVar77,0); PushVar(Var__HspVar77,0); CalcMulI(); PushInt(4); CalcMulI(); 
	VarSet(Var__HspVar77,0,1);
	// _HspVar78 =_HspVar43
	PushVAP(Var__HspVar43,0); 
	VarSet(Var__HspVar78,0,1);
	// _HspVar79 =limitf(((_HspVar74*_HspVar5_HspVar75*_HspVar6)+_HspVar76*_HspVar7)+, 0, 1)
	PushFuncEnd(); 	PushInt(1); 
		PushInt(0); 
		PushVar(Var__HspVar74,0); PushVar(Var__HspVar5,0); CalcMulI(); PushVar(Var__HspVar75,0); PushVar(Var__HspVar6,0); CalcMulI(); CalcAddI(); PushVar(Var__HspVar76,0); PushVar(Var__HspVar7,0); CalcMulI(); CalcAddI(); 
	PushIntfunc(393,3); 
	VarSet(Var__HspVar79,0,1);
	// if _HspVar79>0.000000
	PushVar(Var__HspVar79,0); PushDouble(0.000000); CalcGtI(); 
	if (HspIf()) { TaskSwitch(56); return; }
	// _HspVar80 =_HspVar55
	PushVAP(Var__HspVar55,0); 
	VarSet(Var__HspVar80,0,1);
	// _HspVar81 =_HspVar53
	PushVAP(Var__HspVar53,0); 
	VarSet(Var__HspVar81,0,1);
	// _HspVar82 =_HspVar56
	PushVAP(Var__HspVar56,0); 
	VarSet(Var__HspVar82,0,1);
	// _HspVar55 =_HspVar5
	PushVAP(Var__HspVar5,0); 
	VarSet(Var__HspVar55,0,1);
	// _HspVar53 =_HspVar6
	PushVAP(Var__HspVar6,0); 
	VarSet(Var__HspVar53,0,1);
	// _HspVar56 =_HspVar7
	PushVAP(Var__HspVar7,0); 
	VarSet(Var__HspVar56,0,1);
	// _HspVar42 =1
	PushInt(1); 
	VarSet(Var__HspVar42,0,1);
	// gosub
	PushLabel(7); 
	PushLabel(57); Prgcmd(1,2); return;
	TaskSwitch(57);
}

static void L0039( void ) {
	// if _HspVar43>0
	PushVar(Var__HspVar43,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(58); return; }
	// _HspVar79 *=0.200000
	PushDouble(0.200000); 
	VarCalc(Var__HspVar79,0,2);
	TaskSwitch(58);
}

static void L003a( void ) {
	// _HspVar55 =_HspVar80
	PushVAP(Var__HspVar80,0); 
	VarSet(Var__HspVar55,0,1);
	// _HspVar53 =_HspVar81
	PushVAP(Var__HspVar81,0); 
	VarSet(Var__HspVar53,0,1);
	// _HspVar56 =_HspVar82
	PushVAP(Var__HspVar82,0); 
	VarSet(Var__HspVar56,0,1);
	TaskSwitch(56);
}

static void L0038( void ) {
	// _HspVar47 *=_HspVar14(_HspVar78)*_HspVar77
		PushVar(Var__HspVar78,0); 
	PushVar(Var__HspVar14,1); PushVar(Var__HspVar77,0); CalcMulI(); 
	VarCalc(Var__HspVar47,0,2);
	// _HspVar48 *=_HspVar15(_HspVar78)*_HspVar77
		PushVar(Var__HspVar78,0); 
	PushVar(Var__HspVar15,1); PushVar(Var__HspVar77,0); CalcMulI(); 
	VarCalc(Var__HspVar48,0,2);
	// _HspVar49 *=_HspVar16(_HspVar78)*_HspVar77
		PushVar(Var__HspVar78,0); 
	PushVar(Var__HspVar16,1); PushVar(Var__HspVar77,0); CalcMulI(); 
	VarCalc(Var__HspVar49,0,2);
	// if _HspVar63=0
	PushVar(Var__HspVar63,0); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(59); return; }
	// _HspVar65 =_HspVar78
	PushVAP(Var__HspVar78,0); 
	VarSet(Var__HspVar65,0,1);
	// _HspVar64 =_HspVar79
	PushVAP(Var__HspVar79,0); 
	VarSet(Var__HspVar64,0,1);
	TaskSwitch(60);
}

static void L003b( void ) {
	// else
	// _HspVar50 +=(_HspVar79*_HspVar14(_HspVar78))*_HspVar47
	PushVar(Var__HspVar79,0); 	PushVar(Var__HspVar78,0); 
	PushVar(Var__HspVar14,1); CalcMulI(); PushVar(Var__HspVar47,0); CalcMulI(); 
	VarCalc(Var__HspVar50,0,0);
	// _HspVar51 +=(_HspVar79*_HspVar15(_HspVar78))*_HspVar48
	PushVar(Var__HspVar79,0); 	PushVar(Var__HspVar78,0); 
	PushVar(Var__HspVar15,1); CalcMulI(); PushVar(Var__HspVar48,0); CalcMulI(); 
	VarCalc(Var__HspVar51,0,0);
	// _HspVar52 +=(_HspVar79*_HspVar16(_HspVar78))*_HspVar49
	PushVar(Var__HspVar79,0); 	PushVar(Var__HspVar78,0); 
	PushVar(Var__HspVar16,1); CalcMulI(); PushVar(Var__HspVar49,0); CalcMulI(); 
	VarCalc(Var__HspVar52,0,0);
	TaskSwitch(60);
}

static void L003c( void ) {
	// _HspVar63 ++
	VarInc(Var__HspVar63,0);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(11);
}

static void L000b( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(6);
}

static void L0006( void ) {
	// _HspVar55 =((_HspVar34*-1)*_HspVar40)-_HspVar33
	PushVar(Var__HspVar34,0); PushInt(-1); CalcMulI(); PushVar(Var__HspVar40,0); CalcMulI(); PushVar(Var__HspVar33,0); CalcSubI(); 
	VarSet(Var__HspVar55,0,1);
	// _HspVar53 =_HspVar41*-1
	PushVar(Var__HspVar41,0); PushInt(-1); CalcMulI(); 
	VarSet(Var__HspVar53,0,1);
	// _HspVar56 =(_HspVar33*_HspVar40)-_HspVar34
	PushVar(Var__HspVar33,0); PushVar(Var__HspVar40,0); CalcMulI(); PushVar(Var__HspVar34,0); CalcSubI(); 
	VarSet(Var__HspVar56,0,1);
	// _HspVar83 =1.000000/sqrt(((_HspVar55*_HspVar55_HspVar53*_HspVar53)+_HspVar56*_HspVar56)+)
	PushDouble(1.000000); PushFuncEnd(); 	PushVar(Var__HspVar55,0); PushVar(Var__HspVar55,0); CalcMulI(); PushVar(Var__HspVar53,0); PushVar(Var__HspVar53,0); CalcMulI(); CalcAddI(); PushVar(Var__HspVar56,0); PushVar(Var__HspVar56,0); CalcMulI(); CalcAddI(); 
	PushIntfunc(388,1); CalcDivI(); 
	VarSet(Var__HspVar83,0,1);
	// _HspVar55 *=_HspVar83
	PushVAP(Var__HspVar83,0); 
	VarCalc(Var__HspVar55,0,2);
	// _HspVar53 *=_HspVar83
	PushVAP(Var__HspVar83,0); 
	VarCalc(Var__HspVar53,0,2);
	// _HspVar56 *=_HspVar83
	PushVAP(Var__HspVar83,0); 
	VarCalc(Var__HspVar56,0,2);
	// _HspVar61 =_HspVar35
	PushVAP(Var__HspVar35,0); 
	VarSet(Var__HspVar61,0,1);
	// _HspVar60 =_HspVar1
	PushVAP(Var__HspVar1,0); 
	VarSet(Var__HspVar60,0,1);
	// _HspVar62 =_HspVar36
	PushVAP(Var__HspVar36,0); 
	VarSet(Var__HspVar62,0,1);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(13);
}

static void L000d( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto 
	PushLabel(13); 
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
(CHSP3_TASK) L000a,
(CHSP3_TASK) L000b,
(CHSP3_TASK) L000c,
(CHSP3_TASK) L000d,
(CHSP3_TASK) L000e,
(CHSP3_TASK) L000f,
(CHSP3_TASK) L0010,
(CHSP3_TASK) L0011,
(CHSP3_TASK) L0012,
(CHSP3_TASK) L0013,
(CHSP3_TASK) L0014,
(CHSP3_TASK) L0015,
(CHSP3_TASK) L0016,
(CHSP3_TASK) L0017,
(CHSP3_TASK) L0018,
(CHSP3_TASK) L0019,
(CHSP3_TASK) L001a,
(CHSP3_TASK) L001b,
(CHSP3_TASK) L001c,
(CHSP3_TASK) L001d,
(CHSP3_TASK) L001e,
(CHSP3_TASK) L001f,
(CHSP3_TASK) L0020,
(CHSP3_TASK) L0021,
(CHSP3_TASK) L0022,
(CHSP3_TASK) L0023,
(CHSP3_TASK) L0024,
(CHSP3_TASK) L0025,
(CHSP3_TASK) L0026,
(CHSP3_TASK) L0027,
(CHSP3_TASK) L0028,
(CHSP3_TASK) L0029,
(CHSP3_TASK) L002a,
(CHSP3_TASK) L002b,
(CHSP3_TASK) L002c,
(CHSP3_TASK) L002d,
(CHSP3_TASK) L002e,
(CHSP3_TASK) L002f,
(CHSP3_TASK) L0030,
(CHSP3_TASK) L0031,
(CHSP3_TASK) L0032,
(CHSP3_TASK) L0033,
(CHSP3_TASK) L0034,
(CHSP3_TASK) L0035,
(CHSP3_TASK) L0036,
(CHSP3_TASK) L0037,
(CHSP3_TASK) L0038,
(CHSP3_TASK) L0039,
(CHSP3_TASK) L003a,
(CHSP3_TASK) L003b,
(CHSP3_TASK) L003c,

};

/*-----------------------------------------------------------*/

