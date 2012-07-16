//
//	hsp3cnv(3.3a4) generated source
//	[hsplogo.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2012/03/28"
#define _HSP3CNV_TIME "17:08:05"
#define _HSP3CNV_MAXVAR 26
#define _HSP3CNV_MAXHPI 0
#define _HSP3CNV_VERSION 0x301
#define _HSP3CNV_BOOTOPT 0

/*-----------------------------------------------------------*/

static PVal *Var_sprsxMsprmod;
static PVal *Var_sprsyMsprmod;
static PVal *Var_sprflgMsprmod;
static PVal *Var_sprxMsprmod;
static PVal *Var_spryMsprmod;
static PVal *Var_sprpxMsprmod;
static PVal *Var_sprpyMsprmod;
static PVal *Var_sprchrMsprmod;
static PVal *Var_sprrotMsprmod;
static PVal *Var_sprbufMsprmod;
static PVal *Var_sprgmodeMsprmod;
static PVal *Var_sprhxMsprmod;
static PVal *Var_sprhyMsprmod;
static PVal *Var_sprmaxMsprmod;
static PVal *Var_x1;
static PVal *Var_y1;
static PVal *Var_x2;
static PVal *Var_y2;
static PVal *Var_max;
static PVal *Var_mx;
static PVal *Var_sx;
static PVal *Var_my;
static PVal *Var_sy;
static PVal *Var_x;
static PVal *Var_y;
static PVal *Var_z;

/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// Var initalize
	Var_sprsxMsprmod = &mem_var[0];
	Var_sprsyMsprmod = &mem_var[1];
	Var_sprflgMsprmod = &mem_var[2];
	Var_sprxMsprmod = &mem_var[3];
	Var_spryMsprmod = &mem_var[4];
	Var_sprpxMsprmod = &mem_var[5];
	Var_sprpyMsprmod = &mem_var[6];
	Var_sprchrMsprmod = &mem_var[7];
	Var_sprrotMsprmod = &mem_var[8];
	Var_sprbufMsprmod = &mem_var[9];
	Var_sprgmodeMsprmod = &mem_var[10];
	Var_sprhxMsprmod = &mem_var[11];
	Var_sprhyMsprmod = &mem_var[12];
	Var_sprmaxMsprmod = &mem_var[13];
	Var_x1 = &mem_var[14];
	Var_y1 = &mem_var[15];
	Var_x2 = &mem_var[16];
	Var_y2 = &mem_var[17];
	Var_max = &mem_var[18];
	Var_mx = &mem_var[19];
	Var_sx = &mem_var[20];
	Var_my = &mem_var[21];
	Var_sy = &mem_var[22];
	Var_x = &mem_var[23];
	Var_y = &mem_var[24];
	Var_z = &mem_var[25];

	// goto *L0000
	TaskSwitch(0);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	// #deffunc init_sprite int _prm0, int _prm1, int _prm2
	// sprsx@sprmod =_prm0
	PushFuncPrmI(0); 
	VarSet(Var_sprsxMsprmod,0);
	// sprsy@sprmod =_prm1
	PushFuncPrmI(1); 
	VarSet(Var_sprsyMsprmod,0);
	// dim sprflg@sprmod, _prm2
	PushFuncPrmI(2); 
	PushVAP(Var_sprflgMsprmod,0); 
	Prgcmd(9,2);
	// dim sprx@sprmod, _prm2
	PushFuncPrmI(2); 
	PushVAP(Var_sprxMsprmod,0); 
	Prgcmd(9,2);
	// dim spry@sprmod, _prm2
	PushFuncPrmI(2); 
	PushVAP(Var_spryMsprmod,0); 
	Prgcmd(9,2);
	// dim sprpx@sprmod, _prm2
	PushFuncPrmI(2); 
	PushVAP(Var_sprpxMsprmod,0); 
	Prgcmd(9,2);
	// dim sprpy@sprmod, _prm2
	PushFuncPrmI(2); 
	PushVAP(Var_sprpyMsprmod,0); 
	Prgcmd(9,2);
	// dim sprchr@sprmod, _prm2
	PushFuncPrmI(2); 
	PushVAP(Var_sprchrMsprmod,0); 
	Prgcmd(9,2);
	// dim sprrot@sprmod, _prm2
	PushFuncPrmI(2); 
	PushVAP(Var_sprrotMsprmod,0); 
	Prgcmd(9,2);
	// sprbuf@sprmod =3
	PushInt(3); 
	VarSet(Var_sprbufMsprmod,0);
	// sprgmode@sprmod =2
	PushInt(2); 
	VarSet(Var_sprgmodeMsprmod,0);
	// sprhx@sprmod =sprsx@sprmod/2
	PushVar(Var_sprsxMsprmod,0); PushInt(2); CalcDivI(); 
	VarSet(Var_sprhxMsprmod,0);
	// sprhy@sprmod =sprsy@sprmod/2
	PushVar(Var_sprsyMsprmod,0); PushInt(2); CalcDivI(); 
	VarSet(Var_sprhyMsprmod,0);
	// sprmax@sprmod =_prm2
	PushFuncPrmI(2); 
	VarSet(Var_sprmaxMsprmod,0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(2);
}

static void L0002( void ) {
	// #deffunc opt_sprite int _prm3, int _prm4
	// sprbuf@sprmod =_prm3
	PushFuncPrmI(0); 
	VarSet(Var_sprbufMsprmod,0);
	// sprgmode@sprmod =_prm4
	PushFuncPrmI(1); 
	VarSet(Var_sprgmodeMsprmod,0);
	// celdiv sprbuf@sprmod, sprsx@sprmod, sprsy@sprmod, sprhx@sprmod, sprhy@sprmod
	PushVAP(Var_sprhyMsprmod,0); 
	PushVAP(Var_sprhxMsprmod,0); 
	PushVAP(Var_sprsyMsprmod,0); 
	PushVAP(Var_sprsxMsprmod,0); 
	PushVAP(Var_sprbufMsprmod,0); 
	Extcmd(61,5);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(3);
}

static void L0003( void ) {
	// #deffunc set_sprite int _prm5, int _prm6, int _prm7, int _prm8
	// sprflg@sprmod (_prm5)=1
	PushInt(1); 
	PushFuncPrmI(0); 
	VarSet(Var_sprflgMsprmod,1);
	// sprx@sprmod (_prm5)=_prm6
	PushFuncPrmI(1); 
	PushFuncPrmI(0); 
	VarSet(Var_sprxMsprmod,1);
	// spry@sprmod (_prm5)=_prm7
	PushFuncPrmI(2); 
	PushFuncPrmI(0); 
	VarSet(Var_spryMsprmod,1);
	// sprchr@sprmod (_prm5)=_prm8
	PushFuncPrmI(3); 
	PushFuncPrmI(0); 
	VarSet(Var_sprchrMsprmod,1);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(4);
}

static void L0004( void ) {
	// #deffunc draw_sprite int _prm9, int _prm10, int _prm11, int _prm12
	// gmode sprgmode@sprmod, sprsx@sprmod, sprsy@sprmod, 256
	PushInt(256); 
	PushVAP(Var_sprsyMsprmod,0); 
	PushVAP(Var_sprsxMsprmod,0); 
	PushVAP(Var_sprgmodeMsprmod,0); 
	Extcmd(32,4);
	// repeat
	PushVAP(Var_sprmaxMsprmod,0); 
	PushLabel(5); 
	PushLabel(13); Prgcmd(4,3); return;
	TaskSwitch(13);
}

static void L0013( void ) {
	// if sprflg@sprmod(cnt)=0
		PushSysvar(4,0); 
	PushVar(Var_sprflgMsprmod,1); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(14); return; }
	// continue
	PushLabel(5); 
	Prgcmd(6,1); return;
	TaskSwitch(15);
}

static void L0015( void ) {
	TaskSwitch(14);
}

static void L0014( void ) {
	// pos sprx@sprmod(cnt), spry@sprmod(cnt)
		PushSysvar(4,0); 
	PushVAP(Var_spryMsprmod,1); 
		PushSysvar(4,0); 
	PushVAP(Var_sprxMsprmod,1); 
	Extcmd(17,2);
	// celput 1, sprchr@sprmod(cnt)>>2
		PushSysvar(4,0); 
	PushVar(Var_sprchrMsprmod,1); PushInt(2); CalcRrI(); 
	PushInt(1); 
	Extcmd(62,2);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(5);
}

static void L0005( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(6);
}

static void L0006( void ) {
	// #deffunc move_sprite1_init 
	// repeat
	PushVAP(Var_sprmaxMsprmod,0); 
	PushLabel(7); 
	PushLabel(16); Prgcmd(4,3); return;
	TaskSwitch(16);
}

static void L0016( void ) {
	// set_sprite cnt, rnd(320), (rnd(480)+480)+sprhy@sprmod, 0
	PushInt(0); 
	PushFuncEnd(); 	PushInt(480); 
	PushIntfunc(1,1); PushInt(480); CalcAddI(); PushVar(Var_sprhyMsprmod,0); CalcAddI(); 
	PushFuncEnd(); 	PushInt(320); 
	PushIntfunc(1,1); 
	PushSysvar(4,0); 
	PushLabel(17);
	Modcmd(2,4);
	return;
}

static void L0017( void ) {
	// sprpx@sprmod (cnt)=rnd(4096)
	PushFuncEnd(); 	PushInt(4096); 
PushIntfunc(1,1); 
	PushSysvar(4,0); 
	VarSet(Var_sprpxMsprmod,1);
	// sprpy@sprmod (cnt)=rnd(4)-4
	PushFuncEnd(); 	PushInt(4); 
PushIntfunc(1,1); PushInt(4); CalcSubI(); 
	PushSysvar(4,0); 
	VarSet(Var_sprpyMsprmod,1);
	// sprchr@sprmod (cnt)=rnd(64)
	PushFuncEnd(); 	PushInt(64); 
PushIntfunc(1,1); 
	PushSysvar(4,0); 
	VarSet(Var_sprchrMsprmod,1);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(7);
}

static void L0007( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(8);
}

static void L0008( void ) {
	// #deffunc move_sprite1 
	// repeat
	PushVAP(Var_sprmaxMsprmod,0); 
	PushLabel(9); 
	PushLabel(18); Prgcmd(4,3); return;
	TaskSwitch(18);
}

static void L0018( void ) {
	// if sprflg@sprmod(cnt)=0
		PushSysvar(4,0); 
	PushVar(Var_sprflgMsprmod,1); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(19); return; }
	// continue
	PushLabel(9); 
	Prgcmd(6,1); return;
	TaskSwitch(20);
}

static void L0020( void ) {
	TaskSwitch(19);
}

static void L0019( void ) {
	// sprx@sprmod (cnt)+=sin(0.001534*sprpx@sprmod(cnt))*4
	PushFuncEnd(); 	PushDouble(0.001534); 	PushSysvar(4,0); 
	PushVar(Var_sprpxMsprmod,1); CalcMulI(); 
	PushIntfunc(384,1); PushInt(4); CalcMulI(); 
	PushSysvar(4,0); 
	VarCalc(Var_sprxMsprmod,1,0);
	// spry@sprmod (cnt)+=sprpy@sprmod(cnt)
		PushSysvar(4,0); 
	PushVar(Var_sprpyMsprmod,1); 
	PushSysvar(4,0); 
	VarCalc(Var_spryMsprmod,1,0);
	// sprpx@sprmod (cnt)+=64
	PushInt(64); 
	PushSysvar(4,0); 
	VarCalc(Var_sprpxMsprmod,1,0);
	// if sprhy@sprmod*-1<spry@sprmod(cnt)
		PushSysvar(4,0); 
	PushVar(Var_spryMsprmod,1); PushVar(Var_sprhyMsprmod,0); PushInt(-1); CalcMulI(); CalcLtI(); 
	if (HspIf()) { TaskSwitch(21); return; }
	// spry@sprmod (cnt)=480+sprhy@sprmod
	PushInt(480); PushVar(Var_sprhyMsprmod,0); CalcAddI(); 
	PushSysvar(4,0); 
	VarSet(Var_spryMsprmod,1);
	TaskSwitch(21);
}

static void L0021( void ) {
	// sprchr@sprmod (cnt)=(sprchr@sprmod(cnt)+1)&63
		PushSysvar(4,0); 
PushVar(Var_sprchrMsprmod,1); PushInt(1); CalcAddI(); PushInt(63); CalcAndI(); 
	PushSysvar(4,0); 
	VarSet(Var_sprchrMsprmod,1);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(9);
}

static void L0009( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(0);
}

static void L0000( void ) {
	// x1 =0
	PushInt(0); 
	VarSet(Var_x1,0);
	// y1 =0
	PushInt(0); 
	VarSet(Var_y1,0);
	// x2 =320
	PushInt(320); 
	VarSet(Var_x2,0);
	// y2 =480
	PushInt(480); 
	VarSet(Var_y2,0);
	// celload "hsplogo8.png", 1
	PushInt(1); 
	PushStr("hsplogo8.png"); 
	Extcmd(60,2);
	// screen 0, x2, y2
	PushVAP(Var_y2,0); 
	PushVAP(Var_x2,0); 
	PushInt(0); 
	Extcmd(42,3);
	// title "HSP logo demo"
	PushStr("HSP logo demo"); 
	Extcmd(16,1);
	// max =64
	PushInt(64); 
	VarSet(Var_max,0);
	// init_sprite 80, 50, max
	PushVAP(Var_max,0); 
	PushInt(50); 
	PushInt(80); 
	PushLabel(22);
	Modcmd(0,3);
	return;
}

static void L0022( void ) {
	// opt_sprite 1, 2
	PushInt(2); 
	PushInt(1); 
	PushLabel(23);
	Modcmd(1,2);
	return;
}

static void L0023( void ) {
	// move_sprite1_init 
	PushLabel(24);
	Modcmd(4,0);
	return;
}

static void L0024( void ) {
	// mx =sx
	PushVar(Var_sx,0); 
	VarSet(Var_mx,0);
	// my =sy
	PushVar(Var_sy,0); 
	VarSet(Var_my,0);
	// x =sx*-1
	PushVar(Var_sx,0); PushInt(-1); CalcMulI(); 
	VarSet(Var_x,0);
	// y =240
	PushInt(240); 
	VarSet(Var_y,0);
	// z =0
	PushInt(0); 
	VarSet(Var_z,0);
	// repeat
	PushLabel(10); 
	PushLabel(25); Prgcmd(4,2); return;
	TaskSwitch(25);
}

static void L0025( void ) {
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	// gradf 0, 0, 320, 480, 1, 0, 128
	PushInt(128); 
	PushInt(0); 
	PushInt(1); 
	PushInt(480); 
	PushInt(320); 
	PushInt(0); 
	PushInt(0); 
	Extcmd(56,7);
	// move_sprite1 
	PushLabel(26);
	Modcmd(5,0);
	return;
}

static void L0026( void ) {
	// draw_sprite 
	PushLabel(27);
	Modcmd(3,0);
	return;
}

static void L0027( void ) {
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// await 15
	PushInt(15); 
	Prgcmd(8,1);
	TaskSwitch(28);
}

static void L0028( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(10);
}

static void L0010( void ) {
	TaskSwitch(11);
}

static void L0011( void ) {
	// end 
	Prgcmd(16,0);
	return;
	TaskSwitch(12);
}

static void L0012( void ) {
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
(CHSP3_TASK) L0001,	// init_sprite
(CHSP3_TASK) L0002,	// opt_sprite
(CHSP3_TASK) L0003,	// set_sprite
(CHSP3_TASK) L0004,	// draw_sprite
(CHSP3_TASK) L0005,
(CHSP3_TASK) L0006,	// move_sprite1_init
(CHSP3_TASK) L0007,
(CHSP3_TASK) L0008,	// move_sprite1
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
(CHSP3_TASK) 0,

};

/*-----------------------------------------------------------*/

STRUCTDAT __HspFuncInfo[]={
	{ -1,0, 0,3,0,0,1, (void *)0 },
	{ -1,1, 3,2,12,0,2, (void *)0 },
	{ -1,2, 5,4,23,0,3, (void *)0 },
	{ -1,3, 9,4,34,0,4, (void *)0 },
	{ -1,4, 13,0,46,0,6, (void *)0 },
	{ -1,5, 13,0,64,0,8, (void *)0 },
};

STRUCTPRM __HspPrmInfo[]={
	{ 4, -1, 0 },
	{ 4, -1, 4 },
	{ 4, -1, 8 },
	{ 4, -1, 0 },
	{ 4, -1, 4 },
	{ 4, -1, 0 },
	{ 4, -1, 4 },
	{ 4, -1, 8 },
	{ 4, -1, 12 },
	{ 4, -1, 0 },
	{ 4, -1, 4 },
	{ 4, -1, 8 },
	{ 4, -1, 12 },
};

char __HspDataName[]="init_sprite\0"\
"opt_sprite\0"\
"set_sprite\0"\
"draw_sprite\0"\
"move_sprite1_init\0"\
"move_sprite1\0"\
;


/*-----------------------------------------------------------*/

void __HspInit( Hsp3r *hsp3 ) {
	hsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );
	hsp3->SetDataName( __HspDataName );
	hsp3->SetFInfo( __HspFuncInfo, 168 );
	hsp3->SetLInfo( 0, 0 );
	hsp3->SetMInfo( __HspPrmInfo, 104 );
}

/*-----------------------------------------------------------*/

