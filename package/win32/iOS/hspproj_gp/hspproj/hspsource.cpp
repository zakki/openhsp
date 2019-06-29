//
//	hsp3cnv(3.5b5) generated source
//	[test1.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2019/06/29"
#define _HSP3CNV_TIME "15:30:06"
#define _HSP3CNV_MAXVAR 1
#define _HSP3CNV_MAXHPI 16
#define _HSP3CNV_VERSION 0x350
#define _HSP3CNV_BOOTOPT 4096

/*-----------------------------------------------------------*/

static PVal *Var_0;

/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// Var initalize
	Var_0 = &mem_var[0];

	// title "HGIMG4 Test"
	PushStr("HGIMG4 Test"); 
	Extcmd(16,1);
	//  
	Extcmd(96,0);
	//  1, 0
	PushInt(0); 
	PushInt(1); 
	Extcmd(94,2);
	//  1048578, 0, 0, 5
	PushInt(5); 
	PushInt(0); 
	PushInt(0); 
	PushInt(1048578); 
	Extcmd(176,4);
	//  _HspVar0, 1
	PushInt(1); 
	PushVAP(Var_0,0); 
	Extcmd(120,2);
	// repeat
	PushLabel(0); 
	PushLabel(2); Prgcmd(4,2); return;
	TaskSwitch(2);
}

static void L0002( void ) {
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	//  _HspVar0, 0, 0.020000, 0.010000
	PushDouble(0.010000); 
	PushDouble(0.020000); 
	PushInt(0); 
	PushVAP(Var_0,0); 
	Extcmd(201,4);
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
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// await 1000/60
	PushInt(16);/*OPT*/ 
	Prgcmd(8,1);
	TaskSwitch(3);
}

static void L0003( void ) {
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
	// goto *L0001
	TaskSwitch(1);
	return;
}

//-End of Source-------------------------------------------

CHSP3_TASK __HspTaskFunc[]={
(CHSP3_TASK) L0000,
(CHSP3_TASK) L0001,
(CHSP3_TASK) L0002,
(CHSP3_TASK) L0003,
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

