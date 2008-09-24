//
//	hsp3cnv generated source
//	[test.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2008/09/24"
#define _HSP3CNV_TIME "19:53:45"
#define _HSP3CNV_MAXVAR 4
#define _HSP3CNV_MAXHPI 0
#define _HSP3CNV_VERSION 0x301
#define _HSP3CNV_BOOTOPT 0

/*-----------------------------------------------------------*/

#define Var_test (&mem_var[0])
#define Var_a (&mem_var[1])
#define Var_b (&mem_var[2])
#define Var_i (&mem_var[3])

/*-----------------------------------------------------------*/

void __HspEntry( void ) {
	// test =(123+456)/2
	PushInt(123); PushInt(456); CalcAddI(); PushInt(2); CalcDivI(); 
	VarSet(Var_test,0,1);
	// mes "OKOK!!!"
	PushStr("OKOK!!!"); 
	Extcmd(15,1);
	// mes test
	PushVAP(Var_test,0); 
	Extcmd(15,1);
	// a =rnd(123)
	PushFuncEnd(); 	PushInt(123); 
	PushIntfunc(1,1); 
	VarSet(Var_a,0,1);
	// b =456
	PushInt(456); 
	VarSet(Var_b,0,1);
	// if a!=b
	PushVar(Var_a,0); PushVar(Var_b,0); CalcNeI(); 
	if (HspIf()) {
		// mes "OKOK="+a
		PushStr("OKOK="); PushVar(Var_a,0); CalcAddI(); 
		Extcmd(15,1);
	}
	// i =20*40+10
	PushInt(10); PushInt(20); PushInt(40); CalcMulI(); CalcAddI(); 
	VarSet(Var_i,0,1);
	// i ++
	VarInc(Var_i,0);
	// b --
	VarDec(Var_b,0);
	// i *=10
	PushInt(10); 
	VarCalc(Var_i,0,2);
	// a (1)=5
	PushInt(5); 
	PushInt(1); 
	VarSet(Var_a,1,1);
	// a (2+5)*=7-a(1)
	PushInt(7); 	PushInt(1); 
	PushVar(Var_a,1); CalcSubI(); 
	PushInt(2); PushInt(5); CalcAddI(); 
	VarCalc(Var_a,1,2);
	TaskSwitch(0);
}

static void L0000( void ) {
	// stop 
	Prgcmd(17,0);
	// goto *L0000
	PushLabel(0); 
	Prgcmd(0,1);
	TaskSwitch(1);
}

static void L0001( void ) {
	// stop 
	Prgcmd(17,0);
	// goto 
	PushLabel(1); 
	Prgcmd(0,0);
}

//-End of Source-------------------------------------------

CHSP3_TASK __HspTaskFunc[]={
(CHSP3_TASK) L0000,
(CHSP3_TASK) L0001,
};

/*-----------------------------------------------------------*/

