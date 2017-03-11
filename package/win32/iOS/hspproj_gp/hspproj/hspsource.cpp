//
//	hsp3cnv(3.5b5) generated source
//	[posteffect.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2017/03/03"
#define _HSP3CNV_TIME "11:30:54"
#define _HSP3CNV_MAXVAR 17
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
static PVal *Var_15;
static PVal *Var_16;

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
	Var_15 = &mem_var[15];
	Var_16 = &mem_var[16];

	// title "HGIMG4 Post Effect Test"
	PushStr("HGIMG4 Post Effect Test"); 
	Extcmd(16,1);
	//  
	Extcmd(96,0);
	//  1, 0
	PushInt(0); 
	PushInt(1); 
	Extcmd(94,2);
	//  1048578, 0, 2, 5
	PushInt(5); 
	PushInt(2); 
	PushInt(0); 
	PushInt(1048578); 
	Extcmd(176,4);
	//  _HspVar0, "res/tamane2"
	PushStr("res/tamane2"); 
	PushVAP(Var_0,0); 
	Extcmd(117,2);
	//  _HspVar0, 0.020000, 0.020000, 0.020000
	PushDouble(0.020000); 
	PushDouble(0.020000); 
	PushDouble(0.020000); 
	PushVAP(Var_0,0); 
	Extcmd(178,4);
	//  _HspVar0
	PushVAP(Var_0,0); 
	Extcmd(250,1);
	// _HspVar1 =0
	PushInt(0); 
	VarSet(Var_1,0);
	// _HspVar2 =8
	PushInt(8); 
	VarSet(Var_2,0);
	TaskSwitch(0);
}

static void L0000( void ) {
	// gosub
	PushLabel(1); 
	PushLabel(18); Prgcmd(1,2); return;
}

static void L0018( void ) {
	TaskSwitch(2);
}

static void L0002( void ) {
	// gsel 1
	PushInt(1); 
	Extcmd(29,1);
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	//  _HspVar0, 0, 0.020000
	PushDouble(0.020000); 
	PushInt(0); 
	PushVAP(Var_0,0); 
	Extcmd(201,3);
	//  
	Extcmd(97,0);
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// gosub
	PushVAP(Var_3,0); 
	PushLabel(19); Prgcmd(1,2); return;
}

static void L0019( void ) {
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
	// mes ((("("+_HspVar4)+" x ")+_HspVar5)+")"
	PushStr("("); PushVar(Var_4,0); CalcAddI(); PushStr(" x "); CalcAddI(); PushVar(Var_5,0); CalcAddI(); PushStr(")"); CalcAddI(); 
	Extcmd(15,1);
	// mes "Effect : "+_HspVar6
	PushStr("Effect : "); PushVar(Var_6,0); CalcAddI(); 
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
	TaskSwitch(20);
}

static void L0020( void ) {
	// stick _HspVar7
	PushVAP(Var_7,0); 
	Extcmd(52,1);
	// if _HspVar7&128
	PushVar(Var_7,0); PushInt(128); CalcAndI(); 
	if (HspIf()) { TaskSwitch(21); return; }
	// goto *L0003
	TaskSwitch(3);
	return;
	TaskSwitch(21);
}

static void L0021( void ) {
	// if _HspVar7&256
	PushVar(Var_7,0); PushInt(256); CalcAndI(); 
	if (HspIf()) { TaskSwitch(22); return; }
	// _HspVar1 ++
	VarInc(Var_1,0);
	// if _HspVar1>=_HspVar2
	PushVar(Var_1,0); PushVar(Var_2,0); CalcGtEqI(); 
	if (HspIf()) { TaskSwitch(23); return; }
	// _HspVar1 =0
	PushInt(0); 
	VarSet(Var_1,0);
	TaskSwitch(23);
}

static void L0023( void ) {
	// goto *L0000
	TaskSwitch(0);
	return;
	TaskSwitch(22);
}

static void L0022( void ) {
	// goto *L0002
	TaskSwitch(2);
	return;
	TaskSwitch(3);
}

static void L0003( void ) {
	// end 
	Prgcmd(16,0);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	// _HspVar6 ="None"
	PushStr("None"); 
	VarSet(Var_6,0);
	// _HspVar3 =*L0004
	PushLabel(4); 
	VarSet(Var_3,0);
	// _HspVar4 =ginfo(26)
	PushFuncEnd(); 	PushInt(26); 
PushExtvar(256,1); 
	VarSet(Var_4,0);
	// _HspVar5 =ginfo(27)
	PushFuncEnd(); 	PushInt(27); 
PushExtvar(256,1); 
	VarSet(Var_5,0);
	// if _HspVar1=0
	PushVar(Var_1,0); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(24); return; }
	// gosub
	PushLabel(5); 
	PushLabel(25); Prgcmd(1,2); return;
}

static void L0025( void ) {
	TaskSwitch(24);
}

static void L0024( void ) {
	// if _HspVar1=1
	PushVar(Var_1,0); PushInt(1); CalcEqI(); 
	if (HspIf()) { TaskSwitch(26); return; }
	// gosub
	PushLabel(6); 
	PushLabel(27); Prgcmd(1,2); return;
}

static void L0027( void ) {
	TaskSwitch(26);
}

static void L0026( void ) {
	// if _HspVar1=2
	PushVar(Var_1,0); PushInt(2); CalcEqI(); 
	if (HspIf()) { TaskSwitch(28); return; }
	// gosub
	PushLabel(7); 
	PushLabel(29); Prgcmd(1,2); return;
}

static void L0029( void ) {
	TaskSwitch(28);
}

static void L0028( void ) {
	// if _HspVar1=3
	PushVar(Var_1,0); PushInt(3); CalcEqI(); 
	if (HspIf()) { TaskSwitch(30); return; }
	// gosub
	PushLabel(8); 
	PushLabel(31); Prgcmd(1,2); return;
}

static void L0031( void ) {
	TaskSwitch(30);
}

static void L0030( void ) {
	// if _HspVar1=4
	PushVar(Var_1,0); PushInt(4); CalcEqI(); 
	if (HspIf()) { TaskSwitch(32); return; }
	// gosub
	PushLabel(9); 
	PushLabel(33); Prgcmd(1,2); return;
}

static void L0033( void ) {
	TaskSwitch(32);
}

static void L0032( void ) {
	// if _HspVar1=5
	PushVar(Var_1,0); PushInt(5); CalcEqI(); 
	if (HspIf()) { TaskSwitch(34); return; }
	// gosub
	PushLabel(10); 
	PushLabel(35); Prgcmd(1,2); return;
}

static void L0035( void ) {
	TaskSwitch(34);
}

static void L0034( void ) {
	// if _HspVar1=6
	PushVar(Var_1,0); PushInt(6); CalcEqI(); 
	if (HspIf()) { TaskSwitch(36); return; }
	// gosub
	PushLabel(11); 
	PushLabel(37); Prgcmd(1,2); return;
}

static void L0037( void ) {
	TaskSwitch(36);
}

static void L0036( void ) {
	// if _HspVar1=7
	PushVar(Var_1,0); PushInt(7); CalcEqI(); 
	if (HspIf()) { TaskSwitch(38); return; }
	// gosub
	PushLabel(12); 
	PushLabel(39); Prgcmd(1,2); return;
}

static void L0039( void ) {
	TaskSwitch(38);
}

static void L0038( void ) {
	// gsel 0
	PushInt(0); 
	Extcmd(29,1);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(4);
}

static void L0004( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(13);
}

static void L0013( void ) {
	// gsel 0
	PushInt(0); 
	Extcmd(29,1);
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	// pos 0, 0
	PushInt(0); 
	PushInt(0); 
	Extcmd(17,2);
	// gmode 0
	PushInt(0); 
	Extcmd(32,1);
	// celput 1
	PushInt(1); 
	Extcmd(62,1);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(5);
}

static void L0005( void ) {
	// buffer 1, _HspVar4, _HspVar5, 32
	PushInt(32); 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(1); 
	Extcmd(41,4);
	// _HspVar3 =*L000d
	PushLabel(13); 
	VarSet(Var_3,0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(6);
}

static void L0006( void ) {
	// _HspVar6 ="Sepia Filter"
	PushStr("Sepia Filter"); 
	VarSet(Var_6,0);
	//  "res/shaders/sprite.vert", "res/shaders/p_sepia.frag", ""
	PushStr(""); 
	PushStr("res/shaders/p_sepia.frag"); 
	PushStr("res/shaders/sprite.vert"); 
	Extcmd(253,3);
	// buffer 1, _HspVar4, _HspVar5, 32+64
	PushInt(96);/*OPT*/ 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(1); 
	Extcmd(41,4);
	// _HspVar3 =*L000d
	PushLabel(13); 
	VarSet(Var_3,0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(7);
}

static void L0007( void ) {
	// _HspVar6 ="Gray Filter"
	PushStr("Gray Filter"); 
	VarSet(Var_6,0);
	//  "res/shaders/sprite.vert", "res/shaders/p_grayscale.frag", ""
	PushStr(""); 
	PushStr("res/shaders/p_grayscale.frag"); 
	PushStr("res/shaders/sprite.vert"); 
	Extcmd(253,3);
	// buffer 1, _HspVar4, _HspVar5, 32+64
	PushInt(96);/*OPT*/ 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(1); 
	Extcmd(41,4);
	// _HspVar3 =*L000d
	PushLabel(13); 
	VarSet(Var_3,0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(8);
}

static void L0008( void ) {
	// _HspVar6 ="Blur Filter"
	PushStr("Blur Filter"); 
	VarSet(Var_6,0);
	//  "res/shaders/sprite.vert", "res/shaders/p_blur.frag", ""
	PushStr(""); 
	PushStr("res/shaders/p_blur.frag"); 
	PushStr("res/shaders/sprite.vert"); 
	Extcmd(253,3);
	// buffer 1, _HspVar4, _HspVar5, 32+64
	PushInt(96);/*OPT*/ 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(1); 
	Extcmd(41,4);
	// _HspVar3 =*L000e
	PushLabel(14); 
	VarSet(Var_3,0);
	// _HspVar8 =4.000000
	PushDouble(4.000000); 
	VarSet(Var_8,0);
	// _HspVar9 =1.000000/_HspVar4
	PushDouble(1.000000); PushVar(Var_4,0); CalcDivI(); 
	VarSet(Var_9,0);
	//  _HspVar10, 1, 1
	PushInt(1); 
	PushInt(1); 
	PushVAP(Var_10,0); 
	Extcmd(254,3);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(14);
}

static void L0014( void ) {
	// _HspVar11 =_HspVar8*_HspVar8
	PushVar(Var_8,0); PushVar(Var_8,0); CalcMulI(); 
	VarSet(Var_11,0);
	//  _HspVar10, "u_length", _HspVar9*_HspVar8
	PushVar(Var_9,0); PushVar(Var_8,0); CalcMulI(); 
	PushStr("u_length"); 
	PushVAP(Var_10,0); 
	Extcmd(244,3);
	// gosub
	PushLabel(13); 
	PushLabel(40); Prgcmd(1,2); return;
}

static void L0040( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(9);
}

static void L0009( void ) {
	// _HspVar6 ="Mosaic Filter"
	PushStr("Mosaic Filter"); 
	VarSet(Var_6,0);
	//  "res/shaders/sprite.vert", "res/shaders/p_mosaic.frag", ""
	PushStr(""); 
	PushStr("res/shaders/p_mosaic.frag"); 
	PushStr("res/shaders/sprite.vert"); 
	Extcmd(253,3);
	// buffer 1, _HspVar4, _HspVar5, 32+64
	PushInt(96);/*OPT*/ 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(1); 
	Extcmd(41,4);
	// _HspVar3 =*L000d
	PushLabel(13); 
	VarSet(Var_3,0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(10);
}

static void L0010( void ) {
	// _HspVar6 ="Sobel Filter"
	PushStr("Sobel Filter"); 
	VarSet(Var_6,0);
	//  "res/shaders/sprite.vert", "res/shaders/p_sobel.frag", ""
	PushStr(""); 
	PushStr("res/shaders/p_sobel.frag"); 
	PushStr("res/shaders/sprite.vert"); 
	Extcmd(253,3);
	// buffer 1, _HspVar4, _HspVar5, 32+64
	PushInt(96);/*OPT*/ 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(1); 
	Extcmd(41,4);
	// _HspVar3 =*L000d
	PushLabel(13); 
	VarSet(Var_3,0);
	//  _HspVar12, 1, 1
	PushInt(1); 
	PushInt(1); 
	PushVAP(Var_12,0); 
	Extcmd(254,3);
	//  _HspVar12, "u_width", (1.000000/_HspVar4)/2
	PushDouble(1.000000); PushVar(Var_4,0); CalcDivI(); PushInt(2); CalcDivI(); 
	PushStr("u_width"); 
	PushVAP(Var_12,0); 
	Extcmd(244,3);
	//  _HspVar12, "u_height", (1.000000/_HspVar5)/2
	PushDouble(1.000000); PushVar(Var_5,0); CalcDivI(); PushInt(2); CalcDivI(); 
	PushStr("u_height"); 
	PushVAP(Var_12,0); 
	Extcmd(244,3);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(11);
}

static void L0011( void ) {
	// _HspVar6 ="Old Film Filter"
	PushStr("Old Film Filter"); 
	VarSet(Var_6,0);
	//  "res/shaders/sprite.vert", "res/shaders/p_oldfilm.frag", ""
	PushStr(""); 
	PushStr("res/shaders/p_oldfilm.frag"); 
	PushStr("res/shaders/sprite.vert"); 
	Extcmd(253,3);
	// buffer 1, _HspVar4, _HspVar5, 32+64
	PushInt(96);/*OPT*/ 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(1); 
	Extcmd(41,4);
	// _HspVar3 =*L000f
	PushLabel(15); 
	VarSet(Var_3,0);
	//  _HspVar13, 1, 1
	PushInt(1); 
	PushInt(1); 
	PushVAP(Var_13,0); 
	Extcmd(254,3);
	//  _HspVar13, "u_sepiaValue", 0.800000
	PushDouble(0.800000); 
	PushStr("u_sepiaValue"); 
	PushVAP(Var_13,0); 
	Extcmd(244,3);
	//  _HspVar13, "u_noiseValue", 0.400000
	PushDouble(0.400000); 
	PushStr("u_noiseValue"); 
	PushVAP(Var_13,0); 
	Extcmd(244,3);
	//  _HspVar13, "u_scratchValue", 0.400000
	PushDouble(0.400000); 
	PushStr("u_scratchValue"); 
	PushVAP(Var_13,0); 
	Extcmd(244,3);
	//  _HspVar13, "u_innerVignetting", 0.900000
	PushDouble(0.900000); 
	PushStr("u_innerVignetting"); 
	PushVAP(Var_13,0); 
	Extcmd(244,3);
	//  _HspVar13, "u_outerVignetting", 0.900000
	PushDouble(0.900000); 
	PushStr("u_outerVignetting"); 
	PushVAP(Var_13,0); 
	Extcmd(244,3);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(15);
}

static void L0015( void ) {
	//  _HspVar14, 34
	PushInt(34); 
	PushVAP(Var_14,0); 
	Extcmd(65,2);
	//  _HspVar13, "u_elapsedTime", _HspVar14
	PushVAP(Var_14,0); 
	PushStr("u_elapsedTime"); 
	PushVAP(Var_13,0); 
	Extcmd(244,3);
	// _HspVar11 =double(rnd(32768))
	PushFuncEnd(); 	PushFuncEnd(); 	PushInt(32768); 
PushIntfunc(1,1); 
PushIntfunc(389,1); 
	VarSet(Var_11,0);
	//  _HspVar13, "u_random", _HspVar11/32768
	PushVar(Var_11,0); PushInt(32768); CalcDivI(); 
	PushStr("u_random"); 
	PushVAP(Var_13,0); 
	Extcmd(244,3);
	// gosub
	PushLabel(13); 
	PushLabel(41); Prgcmd(1,2); return;
}

static void L0041( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(12);
}

static void L0012( void ) {
	// _HspVar6 ="Glow Filter"
	PushStr("Glow Filter"); 
	VarSet(Var_6,0);
	// buffer 1, _HspVar4, _HspVar5, 32
	PushInt(32); 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(1); 
	Extcmd(41,4);
	//  "res/shaders/sprite.vert", "res/shaders/p_blur.frag", ""
	PushStr(""); 
	PushStr("res/shaders/p_blur.frag"); 
	PushStr("res/shaders/sprite.vert"); 
	Extcmd(253,3);
	// buffer 2, _HspVar4/2, _HspVar5/2, 32+64
	PushInt(96);/*OPT*/ 
	PushVar(Var_5,0); PushInt(2); CalcDivI(); 
	PushVar(Var_4,0); PushInt(2); CalcDivI(); 
	PushInt(2); 
	Extcmd(41,4);
	// _HspVar3 =*L0010
	PushLabel(16); 
	VarSet(Var_3,0);
	//  _HspVar15, 2, 1
	PushInt(1); 
	PushInt(2); 
	PushVAP(Var_15,0); 
	Extcmd(254,3);
	// _HspVar16 =(1.000000/_HspVar4)*2
	PushDouble(1.000000); PushVar(Var_4,0); CalcDivI(); PushInt(2); CalcMulI(); 
	VarSet(Var_16,0);
	//  _HspVar15, "u_length", _HspVar16
	PushVAP(Var_16,0); 
	PushStr("u_length"); 
	PushVAP(Var_15,0); 
	Extcmd(244,3);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(16);
}

static void L0016( void ) {
	// gsel 2
	PushInt(2); 
	Extcmd(29,1);
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	// pos 0, 0
	PushInt(0); 
	PushInt(0); 
	Extcmd(17,2);
	// gmode 0
	PushInt(0); 
	Extcmd(32,1);
	// gzoom _HspVar4/2, _HspVar5/2, 1, 0, 0, _HspVar4, _HspVar5
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	PushInt(0); 
	PushInt(0); 
	PushInt(1); 
	PushVar(Var_5,0); PushInt(2); CalcDivI(); 
	PushVar(Var_4,0); PushInt(2); CalcDivI(); 
	Extcmd(31,7);
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// gsel 0
	PushInt(0); 
	Extcmd(29,1);
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	// pos 0, 0
	PushInt(0); 
	PushInt(0); 
	Extcmd(17,2);
	// gmode 1, , , 128
	PushInt(128); 
	PushDefault();
	PushDefault();
	PushInt(1); 
	Extcmd(32,4);
	// gzoom _HspVar4, _HspVar5, 2, 0, 0, _HspVar4/2, _HspVar5/2
	PushVar(Var_5,0); PushInt(2); CalcDivI(); 
	PushVar(Var_4,0); PushInt(2); CalcDivI(); 
	PushInt(0); 
	PushInt(0); 
	PushInt(2); 
	PushVAP(Var_5,0); 
	PushVAP(Var_4,0); 
	Extcmd(31,7);
	// pos 0, 0
	PushInt(0); 
	PushInt(0); 
	Extcmd(17,2);
	// gmode 5, , , 128
	PushInt(128); 
	PushDefault();
	PushDefault();
	PushInt(5); 
	Extcmd(32,4);
	// celput 1
	PushInt(1); 
	Extcmd(62,1);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(17);
}

static void L0017( void ) {
	// stop 
	Prgcmd(17,0);
	return;
	// goto *L0011
	TaskSwitch(17);
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
(CHSP3_TASK) L0013,
(CHSP3_TASK) L0014,
(CHSP3_TASK) L0015,
(CHSP3_TASK) L0016,
(CHSP3_TASK) L0017,
(CHSP3_TASK) L0018,
(CHSP3_TASK) L0019,
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
(CHSP3_TASK) L0040,
(CHSP3_TASK) L0041,
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

