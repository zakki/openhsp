//
//	hsp3cnv(3.3a4) generated source
//	[gcube.ax]
//
#include "hsp3r.h"

#define _HSP3CNV_DATE "2012/03/25"
#define _HSP3CNV_TIME "23:45:39"
#define _HSP3CNV_MAXVAR 119
#define _HSP3CNV_MAXHPI 0
#define _HSP3CNV_VERSION 0x301
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
static PVal *Var_17;
static PVal *Var_18;
static PVal *Var_19;
static PVal *Var_20;
static PVal *Var_21;
static PVal *Var_22;
static PVal *Var_23;
static PVal *Var_24;
static PVal *Var_25;
static PVal *Var_26;
static PVal *Var_27;
static PVal *Var_28;
static PVal *Var_29;
static PVal *Var_30;
static PVal *Var_31;
static PVal *Var_32;
static PVal *Var_33;
static PVal *Var_34;
static PVal *Var_35;
static PVal *Var_36;
static PVal *Var_37;
static PVal *Var_38;
static PVal *Var_39;
static PVal *Var_40;
static PVal *Var_41;
static PVal *Var_42;
static PVal *Var_43;
static PVal *Var_44;
static PVal *Var_45;
static PVal *Var_46;
static PVal *Var_47;
static PVal *Var_48;
static PVal *Var_49;
static PVal *Var_50;
static PVal *Var_51;
static PVal *Var_52;
static PVal *Var_53;
static PVal *Var_54;
static PVal *Var_55;
static PVal *Var_56;
static PVal *Var_57;
static PVal *Var_58;
static PVal *Var_59;
static PVal *Var_60;
static PVal *Var_61;
static PVal *Var_62;
static PVal *Var_63;
static PVal *Var_64;
static PVal *Var_65;
static PVal *Var_66;
static PVal *Var_67;
static PVal *Var_68;
static PVal *Var_69;
static PVal *Var_70;
static PVal *Var_71;
static PVal *Var_72;
static PVal *Var_73;
static PVal *Var_74;
static PVal *Var_75;
static PVal *Var_76;
static PVal *Var_77;
static PVal *Var_78;
static PVal *Var_79;
static PVal *Var_80;
static PVal *Var_81;
static PVal *Var_82;
static PVal *Var_83;
static PVal *Var_84;
static PVal *Var_85;
static PVal *Var_86;
static PVal *Var_87;
static PVal *Var_88;
static PVal *Var_89;
static PVal *Var_90;
static PVal *Var_91;
static PVal *Var_92;
static PVal *Var_93;
static PVal *Var_94;
static PVal *Var_95;
static PVal *Var_96;
static PVal *Var_97;
static PVal *Var_98;
static PVal *Var_99;
static PVal *Var_100;
static PVal *Var_101;
static PVal *Var_102;
static PVal *Var_103;
static PVal *Var_104;
static PVal *Var_105;
static PVal *Var_106;
static PVal *Var_107;
static PVal *Var_108;
static PVal *Var_109;
static PVal *Var_110;
static PVal *Var_111;
static PVal *Var_112;
static PVal *Var_113;
static PVal *Var_114;
static PVal *Var_115;
static PVal *Var_116;
static PVal *Var_117;
static PVal *Var_118;

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
	Var_17 = &mem_var[17];
	Var_18 = &mem_var[18];
	Var_19 = &mem_var[19];
	Var_20 = &mem_var[20];
	Var_21 = &mem_var[21];
	Var_22 = &mem_var[22];
	Var_23 = &mem_var[23];
	Var_24 = &mem_var[24];
	Var_25 = &mem_var[25];
	Var_26 = &mem_var[26];
	Var_27 = &mem_var[27];
	Var_28 = &mem_var[28];
	Var_29 = &mem_var[29];
	Var_30 = &mem_var[30];
	Var_31 = &mem_var[31];
	Var_32 = &mem_var[32];
	Var_33 = &mem_var[33];
	Var_34 = &mem_var[34];
	Var_35 = &mem_var[35];
	Var_36 = &mem_var[36];
	Var_37 = &mem_var[37];
	Var_38 = &mem_var[38];
	Var_39 = &mem_var[39];
	Var_40 = &mem_var[40];
	Var_41 = &mem_var[41];
	Var_42 = &mem_var[42];
	Var_43 = &mem_var[43];
	Var_44 = &mem_var[44];
	Var_45 = &mem_var[45];
	Var_46 = &mem_var[46];
	Var_47 = &mem_var[47];
	Var_48 = &mem_var[48];
	Var_49 = &mem_var[49];
	Var_50 = &mem_var[50];
	Var_51 = &mem_var[51];
	Var_52 = &mem_var[52];
	Var_53 = &mem_var[53];
	Var_54 = &mem_var[54];
	Var_55 = &mem_var[55];
	Var_56 = &mem_var[56];
	Var_57 = &mem_var[57];
	Var_58 = &mem_var[58];
	Var_59 = &mem_var[59];
	Var_60 = &mem_var[60];
	Var_61 = &mem_var[61];
	Var_62 = &mem_var[62];
	Var_63 = &mem_var[63];
	Var_64 = &mem_var[64];
	Var_65 = &mem_var[65];
	Var_66 = &mem_var[66];
	Var_67 = &mem_var[67];
	Var_68 = &mem_var[68];
	Var_69 = &mem_var[69];
	Var_70 = &mem_var[70];
	Var_71 = &mem_var[71];
	Var_72 = &mem_var[72];
	Var_73 = &mem_var[73];
	Var_74 = &mem_var[74];
	Var_75 = &mem_var[75];
	Var_76 = &mem_var[76];
	Var_77 = &mem_var[77];
	Var_78 = &mem_var[78];
	Var_79 = &mem_var[79];
	Var_80 = &mem_var[80];
	Var_81 = &mem_var[81];
	Var_82 = &mem_var[82];
	Var_83 = &mem_var[83];
	Var_84 = &mem_var[84];
	Var_85 = &mem_var[85];
	Var_86 = &mem_var[86];
	Var_87 = &mem_var[87];
	Var_88 = &mem_var[88];
	Var_89 = &mem_var[89];
	Var_90 = &mem_var[90];
	Var_91 = &mem_var[91];
	Var_92 = &mem_var[92];
	Var_93 = &mem_var[93];
	Var_94 = &mem_var[94];
	Var_95 = &mem_var[95];
	Var_96 = &mem_var[96];
	Var_97 = &mem_var[97];
	Var_98 = &mem_var[98];
	Var_99 = &mem_var[99];
	Var_100 = &mem_var[100];
	Var_101 = &mem_var[101];
	Var_102 = &mem_var[102];
	Var_103 = &mem_var[103];
	Var_104 = &mem_var[104];
	Var_105 = &mem_var[105];
	Var_106 = &mem_var[106];
	Var_107 = &mem_var[107];
	Var_108 = &mem_var[108];
	Var_109 = &mem_var[109];
	Var_110 = &mem_var[110];
	Var_111 = &mem_var[111];
	Var_112 = &mem_var[112];
	Var_113 = &mem_var[113];
	Var_114 = &mem_var[114];
	Var_115 = &mem_var[115];
	Var_116 = &mem_var[116];
	Var_117 = &mem_var[117];
	Var_118 = &mem_var[118];

	// title "S.Programs Glass-Cube"
	PushStr("S.Programs Glass-Cube"); 
	Extcmd(16,1);
	// goto *L0000
	TaskSwitch(0);
	return;
	TaskSwitch(1);
}

static void L0001( void ) {
	// #deffunc d3rotate var _prm0, var _prm1, double _prm2, double _prm3, double _prm4
	// _prm0 =(_prm2*cos(_prm4)_prm3*sin(_prm4))-
	PushFuncPrmD(2); PushFuncEnd(); 	PushFuncPrmD(4); 
PushIntfunc(385,1); CalcMulI(); PushFuncPrmD(3); PushFuncEnd(); 	PushFuncPrmD(4); 
PushIntfunc(384,1); CalcMulI(); CalcSubI(); 
	VarSet(FuncPrmVA(0),0);
	// _prm1 =(_prm2*sin(_prm4)_prm3*cos(_prm4))+
	PushFuncPrmD(2); PushFuncEnd(); 	PushFuncPrmD(4); 
PushIntfunc(384,1); CalcMulI(); PushFuncPrmD(3); PushFuncEnd(); 	PushFuncPrmD(4); 
PushIntfunc(385,1); CalcMulI(); CalcAddI(); 
	VarSet(FuncPrmVA(1),0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(2);
}

static void L0002( void ) {
	// #deffunc d3vrotate var _prm5, var _prm6, var _prm7, double _prm8, double _prm9, double _prm10, double _prm11, double _prm12, double _prm13, double _prm14
	// _HspVar0 =sqrt(((_prm11*_prm11_prm12*_prm12)+_prm13*_prm13)+)
	PushFuncEnd(); 	PushFuncPrmD(6); PushFuncPrmD(6); CalcMulI(); PushFuncPrmD(7); PushFuncPrmD(7); CalcMulI(); CalcAddI(); PushFuncPrmD(8); PushFuncPrmD(8); CalcMulI(); CalcAddI(); 
PushIntfunc(388,1); 
	VarSet(Var_0,0);
	// _HspVar1 =_prm11/_HspVar0
	PushFuncPrmD(6); PushVar(Var_0,0); CalcDivI(); 
	VarSet(Var_1,0);
	// _HspVar2 =_prm12/_HspVar0
	PushFuncPrmD(7); PushVar(Var_0,0); CalcDivI(); 
	VarSet(Var_2,0);
	// _HspVar3 =_prm13/_HspVar0
	PushFuncPrmD(8); PushVar(Var_0,0); CalcDivI(); 
	VarSet(Var_3,0);
	// _HspVar4 =sin(_prm14)
	PushFuncEnd(); 	PushFuncPrmD(9); 
PushIntfunc(384,1); 
	VarSet(Var_4,0);
	// _HspVar5 =cos(_prm14)
	PushFuncEnd(); 	PushFuncPrmD(9); 
PushIntfunc(385,1); 
	VarSet(Var_5,0);
	// _HspVar6 =1.000000-_HspVar5
	PushDouble(1.000000); PushVar(Var_5,0); CalcSubI(); 
	VarSet(Var_6,0);
	// _prm5 =(((((((((((_HspVar1*_HspVar1)*_HspVar6)+_HspVar5)*_prm8_HspVar1*_HspVar2)*_HspVar6_HspVar3*_HspVar4)-)*_prm9)+_HspVar3*_HspVar1)*_HspVar6_HspVar2*_HspVar4)+)*_prm10)+
	PushVar(Var_1,0); PushVar(Var_1,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_5,0); CalcAddI(); PushFuncPrmD(3); CalcMulI(); PushVar(Var_1,0); PushVar(Var_2,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_3,0); PushVar(Var_4,0); CalcMulI(); CalcSubI(); PushFuncPrmD(4); CalcMulI(); CalcAddI(); PushVar(Var_3,0); PushVar(Var_1,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_2,0); PushVar(Var_4,0); CalcMulI(); CalcAddI(); PushFuncPrmD(5); CalcMulI(); CalcAddI(); 
	VarSet(FuncPrmVA(0),0);
	// _prm6 =(((((((((((_HspVar1*_HspVar2)*_HspVar6_HspVar3*_HspVar4)+)*_prm8_HspVar2*_HspVar2)*_HspVar6)+_HspVar5)*_prm9)+_HspVar2*_HspVar3)*_HspVar6_HspVar1*_HspVar4)-)*_prm10)+
	PushVar(Var_1,0); PushVar(Var_2,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_3,0); PushVar(Var_4,0); CalcMulI(); CalcAddI(); PushFuncPrmD(3); CalcMulI(); PushVar(Var_2,0); PushVar(Var_2,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_5,0); CalcAddI(); PushFuncPrmD(4); CalcMulI(); CalcAddI(); PushVar(Var_2,0); PushVar(Var_3,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_1,0); PushVar(Var_4,0); CalcMulI(); CalcSubI(); PushFuncPrmD(5); CalcMulI(); CalcAddI(); 
	VarSet(FuncPrmVA(1),0);
	// _prm7 =(((((((((((_HspVar3*_HspVar1)*_HspVar6_HspVar2*_HspVar4)-)*_prm8_HspVar2*_HspVar3)*_HspVar6_HspVar1*_HspVar4)+)*_prm9)+_HspVar3*_HspVar3)*_HspVar6)+_HspVar5)*_prm10)+
	PushVar(Var_3,0); PushVar(Var_1,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_2,0); PushVar(Var_4,0); CalcMulI(); CalcSubI(); PushFuncPrmD(3); CalcMulI(); PushVar(Var_2,0); PushVar(Var_3,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_1,0); PushVar(Var_4,0); CalcMulI(); CalcAddI(); PushFuncPrmD(4); CalcMulI(); CalcAddI(); PushVar(Var_3,0); PushVar(Var_3,0); CalcMulI(); PushVar(Var_6,0); CalcMulI(); PushVar(Var_5,0); CalcAddI(); PushFuncPrmD(5); CalcMulI(); CalcAddI(); 
	VarSet(FuncPrmVA(2),0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(3);
}

static void L0003( void ) {
	// #deffunc d3setlocalmx double _prm15, double _prm16, double _prm17, double _prm18, double _prm19, double _prm20, double _prm21, double _prm22, double _prm23, double _prm24, double _prm25, double _prm26
	// _HspVar7 =(_HspVar8*_prm18_HspVar9*_prm21)+
	PushVar(Var_8,0); PushFuncPrmD(3); CalcMulI(); PushVar(Var_9,0); PushFuncPrmD(6); CalcMulI(); CalcAddI(); 
	VarSet(Var_7,0);
	// _HspVar10 =(_HspVar8*_prm19_HspVar9*_prm22)+
	PushVar(Var_8,0); PushFuncPrmD(4); CalcMulI(); PushVar(Var_9,0); PushFuncPrmD(7); CalcMulI(); CalcAddI(); 
	VarSet(Var_10,0);
	// _HspVar11 =(_HspVar8*_prm20_HspVar9*_prm23)+
	PushVar(Var_8,0); PushFuncPrmD(5); CalcMulI(); PushVar(Var_9,0); PushFuncPrmD(8); CalcMulI(); CalcAddI(); 
	VarSet(Var_11,0);
	// _HspVar12 =((_HspVar8*_prm15_HspVar9*_prm16)+)+_HspVar13
	PushVar(Var_8,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_9,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushVar(Var_13,0); CalcAddI(); 
	VarSet(Var_12,0);
	// _HspVar14 =((_HspVar15*_prm18_HspVar16*_prm21)+_HspVar17*_prm24)+
	PushVar(Var_15,0); PushFuncPrmD(3); CalcMulI(); PushVar(Var_16,0); PushFuncPrmD(6); CalcMulI(); CalcAddI(); PushVar(Var_17,0); PushFuncPrmD(9); CalcMulI(); CalcAddI(); 
	VarSet(Var_14,0);
	// _HspVar18 =((_HspVar15*_prm19_HspVar16*_prm22)+_HspVar17*_prm25)+
	PushVar(Var_15,0); PushFuncPrmD(4); CalcMulI(); PushVar(Var_16,0); PushFuncPrmD(7); CalcMulI(); CalcAddI(); PushVar(Var_17,0); PushFuncPrmD(10); CalcMulI(); CalcAddI(); 
	VarSet(Var_18,0);
	// _HspVar19 =((_HspVar15*_prm20_HspVar16*_prm23)+_HspVar17*_prm26)+
	PushVar(Var_15,0); PushFuncPrmD(5); CalcMulI(); PushVar(Var_16,0); PushFuncPrmD(8); CalcMulI(); CalcAddI(); PushVar(Var_17,0); PushFuncPrmD(11); CalcMulI(); CalcAddI(); 
	VarSet(Var_19,0);
	// _HspVar20 =(((_HspVar15*_prm15_HspVar16*_prm16)+_HspVar17*_prm17)+)+_HspVar21
	PushVar(Var_15,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_16,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushVar(Var_17,0); PushFuncPrmD(2); CalcMulI(); CalcAddI(); PushVar(Var_21,0); CalcAddI(); 
	VarSet(Var_20,0);
	// _HspVar22 =((_HspVar23*_prm18_HspVar24*_prm21)+_HspVar25*_prm24)+
	PushVar(Var_23,0); PushFuncPrmD(3); CalcMulI(); PushVar(Var_24,0); PushFuncPrmD(6); CalcMulI(); CalcAddI(); PushVar(Var_25,0); PushFuncPrmD(9); CalcMulI(); CalcAddI(); 
	VarSet(Var_22,0);
	// _HspVar26 =((_HspVar23*_prm19_HspVar24*_prm22)+_HspVar25*_prm25)+
	PushVar(Var_23,0); PushFuncPrmD(4); CalcMulI(); PushVar(Var_24,0); PushFuncPrmD(7); CalcMulI(); CalcAddI(); PushVar(Var_25,0); PushFuncPrmD(10); CalcMulI(); CalcAddI(); 
	VarSet(Var_26,0);
	// _HspVar27 =((_HspVar23*_prm20_HspVar24*_prm23)+_HspVar25*_prm26)+
	PushVar(Var_23,0); PushFuncPrmD(5); CalcMulI(); PushVar(Var_24,0); PushFuncPrmD(8); CalcMulI(); CalcAddI(); PushVar(Var_25,0); PushFuncPrmD(11); CalcMulI(); CalcAddI(); 
	VarSet(Var_27,0);
	// _HspVar28 =(((_HspVar23*_prm15_HspVar24*_prm16)+_HspVar25*_prm17)+)+_HspVar29
	PushVar(Var_23,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_24,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushVar(Var_25,0); PushFuncPrmD(2); CalcMulI(); CalcAddI(); PushVar(Var_29,0); CalcAddI(); 
	VarSet(Var_28,0);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(4);
}

static void L0004( void ) {
	// #deffunc d3setcamx double _prm27, double _prm28, double _prm29, double _prm30, double _prm31, double _prm32, double _prm33
	// mref _HspVar30, 64
	PushInt(64); 
	PushVAP(Var_30,0); 
	Prgcmd(22,2);
	// _HspVar31 =ginfo(12)/2
	PushFuncEnd(); 	PushInt(12); 
PushExtvar(256,1); PushInt(2); CalcDivI(); 
	VarSet(Var_31,0);
	// _HspVar32 =ginfo(13)/2
	PushFuncEnd(); 	PushInt(13); 
PushExtvar(256,1); PushInt(2); CalcDivI(); 
	VarSet(Var_32,0);
	// _HspVar1 =_prm27-_prm30
	PushFuncPrmD(0); PushFuncPrmD(3); CalcSubI(); 
	VarSet(Var_1,0);
	// _HspVar2 =_prm28-_prm31
	PushFuncPrmD(1); PushFuncPrmD(4); CalcSubI(); 
	VarSet(Var_2,0);
	// _HspVar3 =_prm29-_prm32
	PushFuncPrmD(2); PushFuncPrmD(5); CalcSubI(); 
	VarSet(Var_3,0);
	// _HspVar33 =sqrt((_HspVar1*_HspVar1_HspVar2*_HspVar2)+)
	PushFuncEnd(); 	PushVar(Var_1,0); PushVar(Var_1,0); CalcMulI(); PushVar(Var_2,0); PushVar(Var_2,0); CalcMulI(); CalcAddI(); 
PushIntfunc(388,1); 
	VarSet(Var_33,0);
	// _HspVar34 =sqrt((_HspVar33*_HspVar33_HspVar3*_HspVar3)+)
	PushFuncEnd(); 	PushVar(Var_33,0); PushVar(Var_33,0); CalcMulI(); PushVar(Var_3,0); PushVar(Var_3,0); CalcMulI(); CalcAddI(); 
PushIntfunc(388,1); 
	VarSet(Var_34,0);
	// if _HspVar33!=0.000000
	PushVar(Var_33,0); PushDouble(0.000000); CalcNeI(); 
	if (HspIf()) { TaskSwitch(36); return; }
	// _HspVar35 =(_HspVar1*-1)/_HspVar33
	PushVar(Var_1,0); PushInt(-1); CalcMulI(); PushVar(Var_33,0); CalcDivI(); 
	VarSet(Var_35,0);
	// _HspVar36 =(_HspVar2*-1)/_HspVar33
	PushVar(Var_2,0); PushInt(-1); CalcMulI(); PushVar(Var_33,0); CalcDivI(); 
	VarSet(Var_36,0);
	TaskSwitch(36);
}

static void L0036( void ) {
	// if _HspVar34!=0.000000
	PushVar(Var_34,0); PushDouble(0.000000); CalcNeI(); 
	if (HspIf()) { TaskSwitch(37); return; }
	// _HspVar5 =_HspVar33/_HspVar34
	PushVar(Var_33,0); PushVar(Var_34,0); CalcDivI(); 
	VarSet(Var_5,0);
	// _HspVar4 =_HspVar3/_HspVar34
	PushVar(Var_3,0); PushVar(Var_34,0); CalcDivI(); 
	VarSet(Var_4,0);
	TaskSwitch(37);
}

static void L0037( void ) {
	// _HspVar3 =0.010000+ginfo(13)/_prm33
	PushFuncPrmD(6); PushDouble(0.010000); PushFuncEnd(); 	PushInt(13); 
PushExtvar(256,1); CalcAddI(); CalcDivI(); 
	VarSet(Var_3,0);
	// _HspVar8 =_HspVar36
	PushVar(Var_36,0); 
	VarSet(Var_8,0);
	// _HspVar9 =_HspVar35*-1
	PushVar(Var_35,0); PushInt(-1); CalcMulI(); 
	VarSet(Var_9,0);
	// _HspVar15 =(_HspVar35*_HspVar5)*_HspVar3
	PushVar(Var_35,0); PushVar(Var_5,0); CalcMulI(); PushVar(Var_3,0); CalcMulI(); 
	VarSet(Var_15,0);
	// _HspVar16 =(_HspVar36*_HspVar5)*_HspVar3
	PushVar(Var_36,0); PushVar(Var_5,0); CalcMulI(); PushVar(Var_3,0); CalcMulI(); 
	VarSet(Var_16,0);
	// _HspVar17 =(_HspVar4*-1)*_HspVar3
	PushVar(Var_4,0); PushInt(-1); CalcMulI(); PushVar(Var_3,0); CalcMulI(); 
	VarSet(Var_17,0);
	// _HspVar23 =_HspVar35*_HspVar4
	PushVar(Var_35,0); PushVar(Var_4,0); CalcMulI(); 
	VarSet(Var_23,0);
	// _HspVar24 =_HspVar36*_HspVar4
	PushVar(Var_36,0); PushVar(Var_4,0); CalcMulI(); 
	VarSet(Var_24,0);
	// _HspVar25 =_HspVar5
	PushVar(Var_5,0); 
	VarSet(Var_25,0);
	// _HspVar13 =((_HspVar8*_prm27_HspVar9*_prm28)+)*-1
	PushVar(Var_8,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_9,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushInt(-1); CalcMulI(); 
	VarSet(Var_13,0);
	// _HspVar21 =(((_HspVar15*_prm27_HspVar16*_prm28)+_HspVar17*_prm29)+)*-1
	PushVar(Var_15,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_16,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushVar(Var_17,0); PushFuncPrmD(2); CalcMulI(); CalcAddI(); PushInt(-1); CalcMulI(); 
	VarSet(Var_21,0);
	// _HspVar29 =(((_HspVar23*_prm27_HspVar24*_prm28)+_HspVar25*_prm29)+)*-1
	PushVar(Var_23,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_24,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushVar(Var_25,0); PushFuncPrmD(2); CalcMulI(); CalcAddI(); PushInt(-1); CalcMulI(); 
	VarSet(Var_29,0);
	// d3setlocalmx 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1
	PushInt(1); 
	PushInt(0); 
	PushInt(0); 
	PushInt(0); 
	PushInt(1); 
	PushInt(0); 
	PushInt(0); 
	PushInt(0); 
	PushInt(1); 
	PushInt(0); 
	PushInt(0); 
	PushInt(0); 
	PushLabel(38);
	Modcmd(2,12);
	return;
}

static void L0038( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(5);
}

static void L0005( void ) {
	// #deffunc d3vpos double _prm34, double _prm35, double _prm36
	// _HspVar37 =_HspVar38
	PushVar(Var_38,0); 
	VarSet(Var_37,0);
	// _HspVar39 =_HspVar40
	PushVar(Var_40,0); 
	VarSet(Var_39,0);
	// _HspVar41 =_HspVar30
	PushVar(Var_30,0); 
	VarSet(Var_41,0);
	// _HspVar42 =(((_HspVar14*_prm34_HspVar18*_prm35)+_HspVar19*_prm36)+)+_HspVar20
	PushVar(Var_14,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_18,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushVar(Var_19,0); PushFuncPrmD(2); CalcMulI(); CalcAddI(); PushVar(Var_20,0); CalcAddI(); 
	VarSet(Var_42,0);
	// _HspVar30 =0
	PushInt(0); 
	VarSet(Var_30,0);
	// if _HspVar42>0
	PushVar(Var_42,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(39); return; }
	// _HspVar38 =((((_HspVar7*_prm34_HspVar10*_prm35)+_HspVar11*_prm36)+)+_HspVar12)/_HspVar42+_HspVar31
	PushVar(Var_31,0); PushVar(Var_7,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_10,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushVar(Var_11,0); PushFuncPrmD(2); CalcMulI(); CalcAddI(); PushVar(Var_12,0); CalcAddI(); PushVar(Var_42,0); CalcDivI(); CalcAddI(); 
	VarSet(Var_38,0);
	// _HspVar40 =((((_HspVar22*_prm34_HspVar26*_prm35)+_HspVar27*_prm36)+)+_HspVar28)/_HspVar42-_HspVar32
	PushVar(Var_32,0); PushVar(Var_22,0); PushFuncPrmD(0); CalcMulI(); PushVar(Var_26,0); PushFuncPrmD(1); CalcMulI(); CalcAddI(); PushVar(Var_27,0); PushFuncPrmD(2); CalcMulI(); CalcAddI(); PushVar(Var_28,0); CalcAddI(); PushVar(Var_42,0); CalcDivI(); CalcSubI(); 
	VarSet(Var_40,0);
	// _HspVar30 =((_HspVar38/8000_HspVar40/8000)|)=0
	PushVar(Var_38,0); PushInt(8000); CalcDivI(); PushVar(Var_40,0); PushInt(8000); CalcDivI(); CalcOrI(); PushInt(0); CalcEqI(); 
	VarSet(Var_30,0);
	TaskSwitch(39);
}

static void L0039( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(6);
}

static void L0006( void ) {
	// #deffunc d3line double _prm37, double _prm38, double _prm39, double _prm40, double _prm41, double _prm42
	// d3vpos _prm40, _prm41, _prm42
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushLabel(40);
	Modcmd(4,3);
	return;
}

static void L0040( void ) {
	// d3vpos _prm37, _prm38, _prm39
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushLabel(41);
	Modcmd(4,3);
	return;
}

static void L0041( void ) {
	// if _HspVar30&_HspVar41
	PushVar(Var_30,0); PushVar(Var_41,0); CalcAndI(); 
	if (HspIf()) { TaskSwitch(42); return; }
	// line _HspVar38, _HspVar40, _HspVar37, _HspVar39
	PushVAP(Var_39,0); 
	PushVAP(Var_37,0); 
	PushVAP(Var_40,0); 
	PushVAP(Var_38,0); 
	Extcmd(47,4);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(42);
}

static void L0042( void ) {
	// if _HspVar30|_HspVar41
	PushVar(Var_30,0); PushVar(Var_41,0); CalcOrI(); 
	if (HspIf()) { TaskSwitch(43); return; }
	// if _HspVar30
	PushVAP(Var_30,0); 
	if (HspIf()) { TaskSwitch(44); return; }
	// pos _HspVar38, _HspVar40
	PushVAP(Var_40,0); 
	PushVAP(Var_38,0); 
	Extcmd(17,2);
	// _HspVar1 =_prm37
	PushFuncPrmD(0); 
	VarSet(Var_1,0);
	// _HspVar2 =_prm38
	PushFuncPrmD(1); 
	VarSet(Var_2,0);
	// _HspVar3 =_prm39
	PushFuncPrmD(2); 
	VarSet(Var_3,0);
	// _HspVar43 =_prm40
	PushFuncPrmD(3); 
	VarSet(Var_43,0);
	// _HspVar44 =_prm41
	PushFuncPrmD(4); 
	VarSet(Var_44,0);
	// _HspVar45 =_prm42
	PushFuncPrmD(5); 
	VarSet(Var_45,0);
	TaskSwitch(45);
}

static void L0044( void ) {
	// else
	// pos _HspVar37, _HspVar39
	PushVAP(Var_39,0); 
	PushVAP(Var_37,0); 
	Extcmd(17,2);
	// _HspVar1 =_prm40
	PushFuncPrmD(3); 
	VarSet(Var_1,0);
	// _HspVar2 =_prm41
	PushFuncPrmD(4); 
	VarSet(Var_2,0);
	// _HspVar3 =_prm42
	PushFuncPrmD(5); 
	VarSet(Var_3,0);
	// _HspVar43 =_prm37
	PushFuncPrmD(0); 
	VarSet(Var_43,0);
	// _HspVar44 =_prm38
	PushFuncPrmD(1); 
	VarSet(Var_44,0);
	// _HspVar45 =_prm39
	PushFuncPrmD(2); 
	VarSet(Var_45,0);
	TaskSwitch(45);
}

static void L0045( void ) {
	// repeat
	PushInt(10); 
	PushLabel(7); 
	PushLabel(46); Prgcmd(4,3); return;
	TaskSwitch(46);
}

static void L0046( void ) {
	// _HspVar46 =(_HspVar1+_HspVar43)/2
	PushVar(Var_1,0); PushVar(Var_43,0); CalcAddI(); PushInt(2); CalcDivI(); 
	VarSet(Var_46,0);
	// _HspVar47 =(_HspVar2+_HspVar44)/2
	PushVar(Var_2,0); PushVar(Var_44,0); CalcAddI(); PushInt(2); CalcDivI(); 
	VarSet(Var_47,0);
	// _HspVar48 =(_HspVar3+_HspVar45)/2
	PushVar(Var_3,0); PushVar(Var_45,0); CalcAddI(); PushInt(2); CalcDivI(); 
	VarSet(Var_48,0);
	// _HspVar49 =(((_HspVar14*_HspVar46_HspVar18*_HspVar47)+_HspVar19*_HspVar48)+)+_HspVar20
	PushVar(Var_14,0); PushVar(Var_46,0); CalcMulI(); PushVar(Var_18,0); PushVar(Var_47,0); CalcMulI(); CalcAddI(); PushVar(Var_19,0); PushVar(Var_48,0); CalcMulI(); CalcAddI(); PushVar(Var_20,0); CalcAddI(); 
	VarSet(Var_49,0);
	// _HspVar50 =0
	PushInt(0); 
	VarSet(Var_50,0);
	// if _HspVar49>0
	PushVar(Var_49,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(47); return; }
	// _HspVar37 =((((_HspVar7*_HspVar46_HspVar10*_HspVar47)+_HspVar11*_HspVar48)+)+_HspVar12)/_HspVar49+_HspVar31
	PushVar(Var_31,0); PushVar(Var_7,0); PushVar(Var_46,0); CalcMulI(); PushVar(Var_10,0); PushVar(Var_47,0); CalcMulI(); CalcAddI(); PushVar(Var_11,0); PushVar(Var_48,0); CalcMulI(); CalcAddI(); PushVar(Var_12,0); CalcAddI(); PushVar(Var_49,0); CalcDivI(); CalcAddI(); 
	VarSet(Var_37,0);
	// _HspVar39 =((((_HspVar22*_HspVar46_HspVar26*_HspVar47)+_HspVar27*_HspVar48)+)+_HspVar28)/_HspVar49-_HspVar32
	PushVar(Var_32,0); PushVar(Var_22,0); PushVar(Var_46,0); CalcMulI(); PushVar(Var_26,0); PushVar(Var_47,0); CalcMulI(); CalcAddI(); PushVar(Var_27,0); PushVar(Var_48,0); CalcMulI(); CalcAddI(); PushVar(Var_28,0); CalcAddI(); PushVar(Var_49,0); CalcDivI(); CalcSubI(); 
	VarSet(Var_39,0);
	// _HspVar50 =((_HspVar37/8000_HspVar39/8000)|)=0
	PushVar(Var_37,0); PushInt(8000); CalcDivI(); PushVar(Var_39,0); PushInt(8000); CalcDivI(); CalcOrI(); PushInt(0); CalcEqI(); 
	VarSet(Var_50,0);
	TaskSwitch(47);
}

static void L0047( void ) {
	// if _HspVar50
	PushVAP(Var_50,0); 
	if (HspIf()) { TaskSwitch(48); return; }
	// _HspVar1 =_HspVar46
	PushVar(Var_46,0); 
	VarSet(Var_1,0);
	// _HspVar2 =_HspVar47
	PushVar(Var_47,0); 
	VarSet(Var_2,0);
	// _HspVar3 =_HspVar48
	PushVar(Var_48,0); 
	VarSet(Var_3,0);
	// line _HspVar37, _HspVar39
	PushVAP(Var_39,0); 
	PushVAP(Var_37,0); 
	Extcmd(47,2);
	TaskSwitch(49);
}

static void L0048( void ) {
	// else
	// _HspVar43 =_HspVar46
	PushVar(Var_46,0); 
	VarSet(Var_43,0);
	// _HspVar44 =_HspVar47
	PushVar(Var_47,0); 
	VarSet(Var_44,0);
	// _HspVar45 =_HspVar48
	PushVar(Var_48,0); 
	VarSet(Var_45,0);
	TaskSwitch(49);
}

static void L0049( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(43);
}

static void L0043( void ) {
	TaskSwitch(7);
}

static void L0007( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(8);
}

static void L0008( void ) {
	// #deffunc d3arrow double _prm43, double _prm44, double _prm45, double _prm46, double _prm47, double _prm48
	// d3line _prm43, _prm44, _prm45, _prm46, _prm47, _prm48
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushLabel(50);
	Modcmd(5,6);
	return;
}

static void L0050( void ) {
	// if _HspVar30&_HspVar41
	PushVar(Var_30,0); PushVar(Var_41,0); CalcAndI(); 
	if (HspIf()) { TaskSwitch(51); return; }
	// _HspVar51 =atan(_HspVar40-_HspVar39, _HspVar38-_HspVar37)
	PushFuncEnd(); 	PushVar(Var_38,0); PushVar(Var_37,0); CalcSubI(); 
	PushVar(Var_40,0); PushVar(Var_39,0); CalcSubI(); 
PushIntfunc(387,2); 
	VarSet(Var_51,0);
	// d3vpos ((_prm43*6)+_prm46)/7, ((_prm44*6)+_prm47)/7, ((_prm45*6)+_prm48)/7
	PushFuncPrmD(2); PushInt(6); CalcMulI(); PushFuncPrmD(5); CalcAddI(); PushInt(7); CalcDivI(); 
	PushFuncPrmD(1); PushInt(6); CalcMulI(); PushFuncPrmD(4); CalcAddI(); PushInt(7); CalcDivI(); 
	PushFuncPrmD(0); PushInt(6); CalcMulI(); PushFuncPrmD(3); CalcAddI(); PushInt(7); CalcDivI(); 
	PushLabel(52);
	Modcmd(4,3);
	return;
}

static void L0052( void ) {
	// _HspVar0 =(sqrt((((((_prm43-_prm46_prm43-_prm46)*_prm44-_prm47_prm44-_prm47)*)+_prm45-_prm48_prm45-_prm48)*)+)/_HspVar42)/25
	PushFuncEnd(); 	PushFuncPrmD(0); PushFuncPrmD(3); CalcSubI(); PushFuncPrmD(0); PushFuncPrmD(3); CalcSubI(); CalcMulI(); PushFuncPrmD(1); PushFuncPrmD(4); CalcSubI(); PushFuncPrmD(1); PushFuncPrmD(4); CalcSubI(); CalcMulI(); CalcAddI(); PushFuncPrmD(2); PushFuncPrmD(5); CalcSubI(); PushFuncPrmD(2); PushFuncPrmD(5); CalcSubI(); CalcMulI(); CalcAddI(); 
PushIntfunc(388,1); PushVar(Var_42,0); CalcDivI(); PushInt(25); CalcDivI(); 
	VarSet(Var_0,0);
	// _HspVar43 =cos(_HspVar51)*_HspVar0
	PushFuncEnd(); 	PushVAP(Var_51,0); 
PushIntfunc(385,1); PushVar(Var_0,0); CalcMulI(); 
	VarSet(Var_43,0);
	// _HspVar44 =sin(_HspVar51)*_HspVar0
	PushFuncEnd(); 	PushVAP(Var_51,0); 
PushIntfunc(384,1); PushVar(Var_0,0); CalcMulI(); 
	VarSet(Var_44,0);
	// line _HspVar37, _HspVar39, _HspVar38-_HspVar44, _HspVar40+_HspVar43
	PushVar(Var_40,0); PushVar(Var_43,0); CalcAddI(); 
	PushVar(Var_38,0); PushVar(Var_44,0); CalcSubI(); 
	PushVAP(Var_39,0); 
	PushVAP(Var_37,0); 
	Extcmd(47,4);
	// line _HspVar37, _HspVar39, _HspVar38+_HspVar44, _HspVar40-_HspVar43
	PushVar(Var_40,0); PushVar(Var_43,0); CalcSubI(); 
	PushVar(Var_38,0); PushVar(Var_44,0); CalcAddI(); 
	PushVAP(Var_39,0); 
	PushVAP(Var_37,0); 
	Extcmd(47,4);
	TaskSwitch(51);
}

static void L0051( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(9);
}

static void L0009( void ) {
	// #deffunc d3box double _prm49, double _prm50, double _prm51, double _prm52, double _prm53, double _prm54
	// d3line _prm49, _prm50, _prm51, _prm49, _prm50, _prm54
	PushFuncPrmD(5); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushLabel(53);
	Modcmd(5,6);
	return;
}

static void L0053( void ) {
	// d3line _prm49, _prm50, _prm54, _prm49, _prm53, _prm54
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(0); 
	PushFuncPrmD(5); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushLabel(54);
	Modcmd(5,6);
	return;
}

static void L0054( void ) {
	// d3line _prm49, _prm53, _prm54, _prm49, _prm53, _prm51
	PushFuncPrmD(2); 
	PushFuncPrmD(4); 
	PushFuncPrmD(0); 
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(0); 
	PushLabel(55);
	Modcmd(5,6);
	return;
}

static void L0055( void ) {
	// d3line _prm49, _prm53, _prm51, _prm49, _prm50, _prm51
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushFuncPrmD(2); 
	PushFuncPrmD(4); 
	PushFuncPrmD(0); 
	PushLabel(56);
	Modcmd(5,6);
	return;
}

static void L0056( void ) {
	// d3line _prm52, _prm50, _prm51, _prm52, _prm53, _prm51
	PushFuncPrmD(2); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(3); 
	PushLabel(57);
	Modcmd(5,6);
	return;
}

static void L0057( void ) {
	// d3line _prm52, _prm53, _prm51, _prm52, _prm53, _prm54
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushFuncPrmD(2); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushLabel(58);
	Modcmd(5,6);
	return;
}

static void L0058( void ) {
	// d3line _prm52, _prm53, _prm54, _prm52, _prm50, _prm54
	PushFuncPrmD(5); 
	PushFuncPrmD(1); 
	PushFuncPrmD(3); 
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushLabel(59);
	Modcmd(5,6);
	return;
}

static void L0059( void ) {
	// d3line _prm52, _prm50, _prm54, _prm52, _prm50, _prm51
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(3); 
	PushFuncPrmD(5); 
	PushFuncPrmD(1); 
	PushFuncPrmD(3); 
	PushLabel(60);
	Modcmd(5,6);
	return;
}

static void L0060( void ) {
	// d3line _prm49, _prm50, _prm51, _prm52, _prm50, _prm51
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(3); 
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushLabel(61);
	Modcmd(5,6);
	return;
}

static void L0061( void ) {
	// d3line _prm49, _prm50, _prm54, _prm52, _prm50, _prm54
	PushFuncPrmD(5); 
	PushFuncPrmD(1); 
	PushFuncPrmD(3); 
	PushFuncPrmD(5); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushLabel(62);
	Modcmd(5,6);
	return;
}

static void L0062( void ) {
	// d3line _prm49, _prm53, _prm54, _prm52, _prm53, _prm54
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(0); 
	PushLabel(63);
	Modcmd(5,6);
	return;
}

static void L0063( void ) {
	// d3line _prm49, _prm53, _prm51, _prm52, _prm53, _prm51
	PushFuncPrmD(2); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushFuncPrmD(2); 
	PushFuncPrmD(4); 
	PushFuncPrmD(0); 
	PushLabel(64);
	Modcmd(5,6);
	return;
}

static void L0064( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(10);
}

static void L0010( void ) {
	// #deffunc d3circle double _prm55, double _prm56, double _prm57, double _prm58, int _prm59
	// d3vpos _prm55, _prm56, _prm57
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushLabel(65);
	Modcmd(4,3);
	return;
}

static void L0065( void ) {
	// if _HspVar30
	PushVAP(Var_30,0); 
	if (HspIf()) { TaskSwitch(66); return; }
	// _HspVar0 =_prm58/_HspVar42
	PushFuncPrmD(3); PushVar(Var_42,0); CalcDivI(); 
	VarSet(Var_0,0);
	// if _HspVar0>=1
	PushVar(Var_0,0); PushInt(1); CalcGtEqI(); 
	if (HspIf()) { TaskSwitch(67); return; }
	// circle _HspVar38-_HspVar0, _HspVar40-_HspVar0, _HspVar0+0.500000+_HspVar38, _HspVar0+0.500000+_HspVar40, _prm59
	PushFuncPrmI(4); 
	PushVar(Var_40,0); PushVar(Var_0,0); PushDouble(0.500000); CalcAddI(); CalcAddI(); 
	PushVar(Var_38,0); PushVar(Var_0,0); PushDouble(0.500000); CalcAddI(); CalcAddI(); 
	PushVar(Var_40,0); PushVar(Var_0,0); CalcSubI(); 
	PushVar(Var_38,0); PushVar(Var_0,0); CalcSubI(); 
	Extcmd(18,5);
	TaskSwitch(68);
}

static void L0067( void ) {
	// else
	// pset _HspVar38, _HspVar40
	PushVAP(Var_40,0); 
	PushVAP(Var_38,0); 
	Extcmd(12,2);
	TaskSwitch(68);
}

static void L0068( void ) {
	TaskSwitch(66);
}

static void L0066( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(11);
}

static void L0011( void ) {
	// #deffunc d3mes str _prm60, double _prm61, double _prm62, double _prm63
	// d3vpos _prm61, _prm62, _prm63
	PushFuncPrmD(3); 
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushLabel(69);
	Modcmd(4,3);
	return;
}

static void L0069( void ) {
	// if _HspVar30
	PushVAP(Var_30,0); 
	if (HspIf()) { TaskSwitch(70); return; }
	// pos 0, -32000
	PushInt(-32000); 
	PushInt(0); 
	Extcmd(17,2);
	// mes _prm60
	PushFuncPrm(0); 
	Extcmd(15,1);
	// pos ginfo(14)/2-_HspVar38, ginfo(15)/2-_HspVar40
	PushVar(Var_40,0); PushFuncEnd(); 	PushInt(15); 
	PushExtvar(256,1); PushInt(2); CalcDivI(); CalcSubI(); 
	PushVar(Var_38,0); PushFuncEnd(); 	PushInt(14); 
	PushExtvar(256,1); PushInt(2); CalcDivI(); CalcSubI(); 
	Extcmd(17,2);
	// mes _prm60
	PushFuncPrm(0); 
	Extcmd(15,1);
	TaskSwitch(70);
}

static void L0070( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(12);
}

static void L0012( void ) {
	// #deffunc d3createptc int _prm64, int _prm65, int _prm66, int _prm67, array _prm68, int _prm69
	// _HspVar52 =ginfo(3)
	PushFuncEnd(); 	PushInt(3); 
PushExtvar(256,1); 
	VarSet(Var_52,0);
	// _HspVar53 =171*_prm64
	PushInt(171); PushFuncPrmI(0); CalcMulI(); 
	VarSet(Var_53,0);
	// if _prm64>=_HspVar54
	PushFuncPrmI(0); PushVar(Var_54,0); CalcGtEqI(); 
	if (HspIf()) { TaskSwitch(71); return; }
	// _HspVar51 =_prm64+4
	PushFuncPrmI(0); PushInt(4); CalcAddI(); 
	VarSet(Var_51,0);
	// if _HspVar55=29
	PushVar(Var_55,0); PushInt(29); CalcEqI(); 
	if (HspIf()) { TaskSwitch(72); return; }
	// _HspVar55 =27
	PushInt(27); 
	VarSet(Var_55,0);
	// _HspVar56 =29
	PushInt(29); 
	VarSet(Var_56,0);
	TaskSwitch(73);
}

static void L0072( void ) {
	// else
	// _HspVar55 =29
	PushInt(29); 
	VarSet(Var_55,0);
	// _HspVar56 =27
	PushInt(27); 
	VarSet(Var_56,0);
	TaskSwitch(73);
}

static void L0073( void ) {
	// buffer _HspVar56, 171*_HspVar51, 171+18
	PushInt(189);/*OPT*/ 
	PushInt(171); PushVar(Var_51,0); CalcMulI(); 
	PushVAP(Var_56,0); 
	Extcmd(41,3);
	// if _HspVar54
	PushVAP(Var_54,0); 
	if (HspIf()) { TaskSwitch(74); return; }
	// gcopy _HspVar55, 0, 0, 171*_HspVar54, 171+18
	PushInt(189);/*OPT*/ 
	PushInt(171); PushVar(Var_54,0); CalcMulI(); 
	PushInt(0); 
	PushInt(0); 
	PushVAP(Var_55,0); 
	Extcmd(30,5);
	TaskSwitch(74);
}

static void L0074( void ) {
	// buffer _HspVar55, 342, 342
	PushInt(342); 
	PushInt(342); 
	PushVAP(Var_55,0); 
	Extcmd(41,3);
	// _HspVar54 =_HspVar51
	PushVar(Var_51,0); 
	VarSet(Var_54,0);
	TaskSwitch(71);
}

static void L0071( void ) {
	// if _prm69
	PushFuncPrmI(5); 
	if (HspIf()) { TaskSwitch(75); return; }
	// gsel _HspVar56
	PushVAP(Var_56,0); 
	Extcmd(29,1);
	// pos _HspVar53, 0
	PushInt(0); 
	PushVAP(Var_53,0); 
	Extcmd(17,2);
	// gzoom 171, 171, _prm65, _prm66, _prm67, _prm68, _prm69, 1
	PushInt(1); 
	PushFuncPrmI(5); 
	PushFuncPAP(4,0); 
	PushFuncPrmI(3); 
	PushFuncPrmI(2); 
	PushFuncPrmI(1); 
	PushInt(171); 
	PushInt(171); 
	Extcmd(31,8);
	TaskSwitch(76);
}

static void L0075( void ) {
	// else
	// gsel _HspVar55
	PushVAP(Var_55,0); 
	Extcmd(29,1);
	// color 
	Extcmd(24,0);
	// boxf 
	Extcmd(49,0);
	// _HspVar57 =_prm68*_prm68
	PushFuncPrm(4,0); 	PushInt(1); 
PushFuncPrm(4,1); CalcMulI(); 
	VarSet(Var_57,0);
	// _HspVar58 =171*_HspVar57
	PushInt(171); PushVar(Var_57,0); CalcMulI(); 
	VarSet(Var_58,0);
	// repeat
	PushVAP(Var_58,0); 
	PushLabel(13); 
	PushLabel(77); Prgcmd(4,3); return;
	TaskSwitch(77);
}

static void L0077( void ) {
	// _HspVar59 =(1.000000+cnt)/_HspVar58
	PushDouble(1.000000); PushSysvar(4,0); CalcAddI(); PushVar(Var_58,0); CalcDivI(); 
	VarSet(Var_59,0);
	// _HspVar59 =((_HspVar59*_HspVar59)+_HspVar59)/2
	PushVar(Var_59,0); PushVar(Var_59,0); CalcMulI(); PushVar(Var_59,0); CalcAddI(); PushInt(2); CalcDivI(); 
	VarSet(Var_59,0);
	// color limit(_HspVar59*_prm65, 0, 255), limit(_HspVar59*_prm66, 0, 255), limit(_HspVar59*_prm67, 0, 255)
	PushFuncEnd(); 	PushInt(255); 
		PushInt(0); 
		PushVar(Var_59,0); PushFuncPrmI(3); CalcMulI(); 
	PushIntfunc(17,3); 
	PushFuncEnd(); 	PushInt(255); 
		PushInt(0); 
		PushVar(Var_59,0); PushFuncPrmI(2); CalcMulI(); 
	PushIntfunc(17,3); 
	PushFuncEnd(); 	PushInt(255); 
		PushInt(0); 
		PushVar(Var_59,0); PushFuncPrmI(1); CalcMulI(); 
	PushIntfunc(17,3); 
	Extcmd(24,3);
	// _HspVar59 =(6.283185*cnt)/_HspVar57
	PushDouble(6.283185); PushSysvar(4,0); CalcMulI(); PushVar(Var_57,0); CalcDivI(); 
	VarSet(Var_59,0);
	// _HspVar0 =(((_HspVar58-cnt*171)*_prm68)/100)/_HspVar58
	PushInt(171); PushVar(Var_58,0); PushSysvar(4,0); CalcSubI(); CalcMulI(); 	PushSysvar(4,0); 	PushInt(1); 
PushFuncPrm(4,1); CalcModI(); PushInt(2); CalcAddI(); 
PushFuncPrm(4,1); CalcMulI(); PushInt(100); CalcDivI(); PushVar(Var_58,0); CalcDivI(); 
	VarSet(Var_0,0);
	// line sin(_HspVar59)*_HspVar0+171, cos(_HspVar59)*_HspVar0-171
	PushInt(171); PushFuncEnd(); 	PushVAP(Var_59,0); 
	PushIntfunc(385,1); PushVar(Var_0,0); CalcMulI(); CalcSubI(); 
	PushInt(171); PushFuncEnd(); 	PushVAP(Var_59,0); 
	PushIntfunc(384,1); PushVar(Var_0,0); CalcMulI(); CalcAddI(); 
	Extcmd(47,2);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(13);
}

static void L0013( void ) {
	// pos 0, 0
	PushInt(0); 
	PushInt(0); 
	Extcmd(17,2);
	// gmode 2, 342, 342
	PushInt(342); 
	PushInt(342); 
	PushInt(2); 
	Extcmd(32,3);
	// gcopy _HspVar55, 1
	PushInt(1); 
	PushVAP(Var_55,0); 
	Extcmd(30,2);
	// gsel _HspVar56
	PushVAP(Var_56,0); 
	Extcmd(29,1);
	// pos _HspVar53, 0
	PushInt(0); 
	PushVAP(Var_53,0); 
	Extcmd(17,2);
	// gzoom 171, 171, _HspVar55, 0, 0, 342, 342, 1
	PushInt(1); 
	PushInt(342); 
	PushInt(342); 
	PushInt(0); 
	PushInt(0); 
	PushVAP(Var_55,0); 
	PushInt(171); 
	PushInt(171); 
	Extcmd(31,8);
	TaskSwitch(76);
}

static void L0076( void ) {
	// repeat
	PushInt(1); 
	PushInt(18); 
	PushLabel(14); 
	PushLabel(78); Prgcmd(4,4); return;
	TaskSwitch(78);
}

static void L0078( void ) {
	// pos (((cnt-1)*cnt)/2)+_HspVar53, 171
	PushInt(171); 
	PushSysvar(4,0); PushInt(1); CalcSubI(); PushSysvar(4,0); CalcMulI(); PushInt(2); CalcDivI(); PushVar(Var_53,0); CalcAddI(); 
	Extcmd(17,2);
	// gzoom cnt, cnt, _HspVar56, _HspVar53, 0, 171, 171, 1
	PushInt(1); 
	PushInt(171); 
	PushInt(171); 
	PushInt(0); 
	PushVAP(Var_53,0); 
	PushVAP(Var_56,0); 
	PushSysvar(4,0); 
	PushSysvar(4,0); 
	Extcmd(31,8);
	// gmode 3, , , 56
	PushInt(56); 
	PushDefault();
	PushDefault();
	PushInt(3); 
	Extcmd(32,4);
	// pos ((cnt*cnt)/2)+_HspVar53, cnt/2+171
	PushInt(171); PushSysvar(4,0); PushInt(2); CalcDivI(); CalcAddI(); 
	PushSysvar(4,0); PushSysvar(4,0); CalcMulI(); PushInt(2); CalcDivI(); PushVar(Var_53,0); CalcAddI(); 
	Extcmd(17,2);
	// gcopy _HspVar56, (171/2)+_HspVar53, 171/2, 1, 1
	PushInt(1); 
	PushInt(1); 
	PushInt(85);/*OPT*/ 
	PushInt(85);/*OPT*/ PushVar(Var_53,0); CalcAddI(); 
	PushVAP(Var_56,0); 
	Extcmd(30,5);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(14);
}

static void L0014( void ) {
	// _HspVar60 =0, 0, 170, 170
	PushInt(0); 
	VarSet(Var_60,0);
	PushVarOffset(Var_60);
	PushInt(0); 
	VarSet2(Var_60);
	PushVarOffset(Var_60);
	PushInt(170); 
	VarSet2(Var_60);
	PushVarOffset(Var_60);
	PushInt(170); 
	VarSet2(Var_60);
	// gsel _HspVar52
	PushVAP(Var_52,0); 
	Extcmd(29,1);
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(15);
}

static void L0015( void ) {
	// #deffunc d3particlem int _prm70, double _prm71
	// if _HspVar30
	PushVAP(Var_30,0); 
	if (HspIf()) { TaskSwitch(79); return; }
	// _HspVar61 =int((_prm71*2)/_HspVar42)
	PushFuncEnd(); 	PushFuncPrmD(1); PushInt(2); CalcMulI(); PushVar(Var_42,0); CalcDivI(); 
PushIntfunc(0,1); 
	VarSet(Var_61,0);
	// if _HspVar61>=1
	PushVar(Var_61,0); PushInt(1); CalcGtEqI(); 
	if (HspIf()) { TaskSwitch(80); return; }
	// if _HspVar61<=18
	PushVar(Var_61,0); PushInt(18); CalcLtEqI(); 
	if (HspIf()) { TaskSwitch(81); return; }
	// pos _HspVar61/2-_HspVar38, _HspVar61/2-_HspVar40
	PushVar(Var_40,0); PushVar(Var_61,0); PushInt(2); CalcDivI(); CalcSubI(); 
	PushVar(Var_38,0); PushVar(Var_61,0); PushInt(2); CalcDivI(); CalcSubI(); 
	Extcmd(17,2);
	// gcopy _HspVar56, (((_prm70*171_HspVar61-1)*_HspVar61)/2)+, 171, _HspVar61, _HspVar61
	PushVAP(Var_61,0); 
	PushVAP(Var_61,0); 
	PushInt(171); 
	PushFuncPrmI(0); PushInt(171); CalcMulI(); PushVar(Var_61,0); PushInt(1); CalcSubI(); PushVar(Var_61,0); CalcMulI(); PushInt(2); CalcDivI(); CalcAddI(); 
	PushVAP(Var_56,0); 
	Extcmd(30,5);
	TaskSwitch(82);
}

static void L0081( void ) {
	// else
	// _HspVar0 =_HspVar61/2
	PushVar(Var_61,0); PushInt(2); CalcDivI(); 
	VarSet(Var_0,0);
	// _HspVar62 =_HspVar38-_HspVar0, _HspVar38+_HspVar0, _HspVar38+_HspVar0, _HspVar62
	PushVar(Var_38,0); PushVar(Var_0,0); CalcSubI(); 
	VarSet(Var_62,0);
	PushVarOffset(Var_62);
	PushVar(Var_38,0); PushVar(Var_0,0); CalcAddI(); 
	VarSet2(Var_62);
	PushVarOffset(Var_62);
	PushVar(Var_38,0); PushVar(Var_0,0); CalcAddI(); 
	VarSet2(Var_62);
	PushVarOffset(Var_62);
	PushVar(Var_62,0); 
	VarSet2(Var_62);
	// _HspVar63 =_HspVar40-_HspVar0, _HspVar63, _HspVar40+_HspVar0, _HspVar40+_HspVar0
	PushVar(Var_40,0); PushVar(Var_0,0); CalcSubI(); 
	VarSet(Var_63,0);
	PushVarOffset(Var_63);
	PushVar(Var_63,0); 
	VarSet2(Var_63);
	PushVarOffset(Var_63);
	PushVar(Var_40,0); PushVar(Var_0,0); CalcAddI(); 
	VarSet2(Var_63);
	PushVarOffset(Var_63);
	PushVar(Var_40,0); PushVar(Var_0,0); CalcAddI(); 
	VarSet2(Var_63);
	// _HspVar53 =_prm70*171
	PushFuncPrmI(0); PushInt(171); CalcMulI(); 
	VarSet(Var_53,0);
	// _HspVar64 =_HspVar53, _HspVar53+170, _HspVar53+170, _HspVar53
	PushVar(Var_53,0); 
	VarSet(Var_64,0);
	PushVarOffset(Var_64);
	PushVar(Var_53,0); PushInt(170); CalcAddI(); 
	VarSet2(Var_64);
	PushVarOffset(Var_64);
	PushVar(Var_53,0); PushInt(170); CalcAddI(); 
	VarSet2(Var_64);
	PushVarOffset(Var_64);
	PushVar(Var_53,0); 
	VarSet2(Var_64);
	// gsquare _HspVar56, _HspVar62, _HspVar63, _HspVar64, _HspVar60
	PushVAP(Var_60,0); 
	PushVAP(Var_64,0); 
	PushVAP(Var_63,0); 
	PushVAP(Var_62,0); 
	PushVAP(Var_56,0); 
	Extcmd(55,5);
	TaskSwitch(82);
}

static void L0082( void ) {
	TaskSwitch(80);
}

static void L0080( void ) {
	TaskSwitch(79);
}

static void L0079( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(16);
}

static void L0016( void ) {
	// #deffunc d3particlemr int _prm72, double _prm73, double _prm74
	// if _HspVar30
	PushVAP(Var_30,0); 
	if (HspIf()) { TaskSwitch(83); return; }
	// _HspVar0 =(_prm73/_HspVar42)*1.414214
	PushFuncPrmD(1); PushVar(Var_42,0); CalcDivI(); PushDouble(1.414214); CalcMulI(); 
	VarSet(Var_0,0);
	// if _HspVar0>=1
	PushVar(Var_0,0); PushInt(1); CalcGtEqI(); 
	if (HspIf()) { TaskSwitch(84); return; }
	// _HspVar65 =cos(_prm74-0.785398)*_HspVar0
	PushFuncEnd(); 	PushFuncPrmD(2); PushDouble(0.785398); CalcSubI(); 
PushIntfunc(385,1); PushVar(Var_0,0); CalcMulI(); 
	VarSet(Var_65,0);
	// _HspVar66 =sin(_prm74-0.785398)*_HspVar0
	PushFuncEnd(); 	PushFuncPrmD(2); PushDouble(0.785398); CalcSubI(); 
PushIntfunc(384,1); PushVar(Var_0,0); CalcMulI(); 
	VarSet(Var_66,0);
	// _HspVar62 =_HspVar38+_HspVar66, _HspVar38+_HspVar65, _HspVar38-_HspVar66, _HspVar38-_HspVar65
	PushVar(Var_38,0); PushVar(Var_66,0); CalcAddI(); 
	VarSet(Var_62,0);
	PushVarOffset(Var_62);
	PushVar(Var_38,0); PushVar(Var_65,0); CalcAddI(); 
	VarSet2(Var_62);
	PushVarOffset(Var_62);
	PushVar(Var_38,0); PushVar(Var_66,0); CalcSubI(); 
	VarSet2(Var_62);
	PushVarOffset(Var_62);
	PushVar(Var_38,0); PushVar(Var_65,0); CalcSubI(); 
	VarSet2(Var_62);
	// _HspVar63 =_HspVar40-_HspVar65, _HspVar40+_HspVar66, _HspVar40+_HspVar65, _HspVar40-_HspVar66
	PushVar(Var_40,0); PushVar(Var_65,0); CalcSubI(); 
	VarSet(Var_63,0);
	PushVarOffset(Var_63);
	PushVar(Var_40,0); PushVar(Var_66,0); CalcAddI(); 
	VarSet2(Var_63);
	PushVarOffset(Var_63);
	PushVar(Var_40,0); PushVar(Var_65,0); CalcAddI(); 
	VarSet2(Var_63);
	PushVarOffset(Var_63);
	PushVar(Var_40,0); PushVar(Var_66,0); CalcSubI(); 
	VarSet2(Var_63);
	// _HspVar53 =_prm72*171
	PushFuncPrmI(0); PushInt(171); CalcMulI(); 
	VarSet(Var_53,0);
	// _HspVar64 =_HspVar53, _HspVar53+170, _HspVar53+170, _HspVar53
	PushVar(Var_53,0); 
	VarSet(Var_64,0);
	PushVarOffset(Var_64);
	PushVar(Var_53,0); PushInt(170); CalcAddI(); 
	VarSet2(Var_64);
	PushVarOffset(Var_64);
	PushVar(Var_53,0); PushInt(170); CalcAddI(); 
	VarSet2(Var_64);
	PushVarOffset(Var_64);
	PushVar(Var_53,0); 
	VarSet2(Var_64);
	// gsquare _HspVar56, _HspVar62, _HspVar63, _HspVar64, _HspVar60
	PushVAP(Var_60,0); 
	PushVAP(Var_64,0); 
	PushVAP(Var_63,0); 
	PushVAP(Var_62,0); 
	PushVAP(Var_56,0); 
	Extcmd(55,5);
	TaskSwitch(84);
}

static void L0084( void ) {
	TaskSwitch(83);
}

static void L0083( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(17);
}

static void L0017( void ) {
	// #deffunc d3square array _prm75, array _prm76, array _prm77
	// repeat
	PushInt(4); 
	PushLabel(18); 
	PushLabel(85); Prgcmd(4,3); return;
	TaskSwitch(85);
}

static void L0085( void ) {
	// _HspVar67 =_prm75
		PushSysvar(4,0); 
PushFuncPrm(0,1); 
	VarSet(Var_67,0);
	// _HspVar68 =_prm76
		PushSysvar(4,0); 
PushFuncPrm(1,1); 
	VarSet(Var_68,0);
	// _HspVar69 =_prm77
		PushSysvar(4,0); 
PushFuncPrm(2,1); 
	VarSet(Var_69,0);
	// _HspVar42 =(((_HspVar14*_HspVar67_HspVar18*_HspVar68)+_HspVar19*_HspVar69)+)+_HspVar20
	PushVar(Var_14,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_18,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_19,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_20,0); CalcAddI(); 
	VarSet(Var_42,0);
	// _HspVar30 =0
	PushInt(0); 
	VarSet(Var_30,0);
	// if _HspVar42>0
	PushVar(Var_42,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(86); return; }
	// _HspVar38 =((((_HspVar7*_HspVar67_HspVar10*_HspVar68)+_HspVar11*_HspVar69)+)+_HspVar12)/_HspVar42+_HspVar31
	PushVar(Var_31,0); PushVar(Var_7,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_10,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_11,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_12,0); CalcAddI(); PushVar(Var_42,0); CalcDivI(); CalcAddI(); 
	VarSet(Var_38,0);
	// _HspVar40 =((((_HspVar22*_HspVar67_HspVar26*_HspVar68)+_HspVar27*_HspVar69)+)+_HspVar28)/_HspVar42-_HspVar32
	PushVar(Var_32,0); PushVar(Var_22,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_26,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_27,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_28,0); CalcAddI(); PushVar(Var_42,0); CalcDivI(); CalcSubI(); 
	VarSet(Var_40,0);
	// _HspVar30 =((_HspVar38/8000_HspVar40/8000)|)=0
	PushVar(Var_38,0); PushInt(8000); CalcDivI(); PushVar(Var_40,0); PushInt(8000); CalcDivI(); CalcOrI(); PushInt(0); CalcEqI(); 
	VarSet(Var_30,0);
	TaskSwitch(86);
}

static void L0086( void ) {
	// if _HspVar30=0
	PushVar(Var_30,0); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(87); return; }
	// break *L0012
	PushLabel(18); 
	Prgcmd(3,1);
	return;
	TaskSwitch(87);
}

static void L0087( void ) {
	// _HspVar62 (cnt)=_HspVar38
	PushVar(Var_38,0); 
	PushSysvar(4,0); 
	VarSet(Var_62,1);
	// _HspVar63 (cnt)=_HspVar40
	PushVar(Var_40,0); 
	PushSysvar(4,0); 
	VarSet(Var_63,1);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(18);
}

static void L0018( void ) {
	// if _HspVar30
	PushVAP(Var_30,0); 
	if (HspIf()) { TaskSwitch(88); return; }
	// gsquare -1, _HspVar62, _HspVar63
	PushVAP(Var_63,0); 
	PushVAP(Var_62,0); 
	PushInt(-1); 
	Extcmd(55,3);
	TaskSwitch(88);
}

static void L0088( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(19);
}

static void L0019( void ) {
	// #deffunc d3ribbonto double _prm78, double _prm79, double _prm80, double _prm81, double _prm82, double _prm83
	// _HspVar62 =_HspVar38, _HspVar37
	PushVar(Var_38,0); 
	VarSet(Var_62,0);
	PushVarOffset(Var_62);
	PushVar(Var_37,0); 
	VarSet2(Var_62);
	// _HspVar63 =_HspVar40, _HspVar39
	PushVar(Var_40,0); 
	VarSet(Var_63,0);
	PushVarOffset(Var_63);
	PushVar(Var_39,0); 
	VarSet2(Var_63);
	// _HspVar51 =_HspVar41&_HspVar30
	PushVar(Var_41,0); PushVar(Var_30,0); CalcAndI(); 
	VarSet(Var_51,0);
	// d3vpos _prm78, _prm79, _prm80
	PushFuncPrmD(2); 
	PushFuncPrmD(1); 
	PushFuncPrmD(0); 
	PushLabel(89);
	Modcmd(4,3);
	return;
}

static void L0089( void ) {
	// d3vpos _prm81, _prm82, _prm83
	PushFuncPrmD(5); 
	PushFuncPrmD(4); 
	PushFuncPrmD(3); 
	PushLabel(90);
	Modcmd(4,3);
	return;
}

static void L0090( void ) {
	// if (_HspVar51&_HspVar41)&_HspVar30
	PushVar(Var_51,0); PushVar(Var_41,0); CalcAndI(); PushVar(Var_30,0); CalcAndI(); 
	if (HspIf()) { TaskSwitch(91); return; }
	// _HspVar62 (2)=_HspVar37, _HspVar38
	PushVar(Var_37,0); 
	PushInt(2); 
	VarSet(Var_62,1);
	PushVarOffset(Var_62);
	PushVar(Var_38,0); 
	VarSet2(Var_62);
	// _HspVar63 (2)=_HspVar39, _HspVar40
	PushVar(Var_39,0); 
	PushInt(2); 
	VarSet(Var_63,1);
	PushVarOffset(Var_63);
	PushVar(Var_40,0); 
	VarSet2(Var_63);
	// gsquare -1, _HspVar62, _HspVar63
	PushVAP(Var_63,0); 
	PushVAP(Var_62,0); 
	PushInt(-1); 
	Extcmd(55,3);
	TaskSwitch(91);
}

static void L0091( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(20);
}

static void L0020( void ) {
	// #deffunc d3texture array _prm84, array _prm85, array _prm86, int _prm87, int _prm88, int _prm89, int _prm90, int _prm91, int _prm92
	// if _prm92<=1
	PushFuncPrmI(8); PushInt(1); CalcLtEqI(); 
	if (HspIf()) { TaskSwitch(92); return; }
	// repeat
	PushInt(4); 
	PushLabel(21); 
	PushLabel(93); Prgcmd(4,3); return;
	TaskSwitch(93);
}

static void L0093( void ) {
	// _HspVar67 =_prm84
		PushSysvar(4,0); 
PushFuncPrm(0,1); 
	VarSet(Var_67,0);
	// _HspVar68 =_prm85
		PushSysvar(4,0); 
PushFuncPrm(1,1); 
	VarSet(Var_68,0);
	// _HspVar69 =_prm86
		PushSysvar(4,0); 
PushFuncPrm(2,1); 
	VarSet(Var_69,0);
	// _HspVar42 =(((_HspVar14*_HspVar67_HspVar18*_HspVar68)+_HspVar19*_HspVar69)+)+_HspVar20
	PushVar(Var_14,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_18,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_19,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_20,0); CalcAddI(); 
	VarSet(Var_42,0);
	// _HspVar30 =0
	PushInt(0); 
	VarSet(Var_30,0);
	// if _HspVar42>0
	PushVar(Var_42,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(94); return; }
	// _HspVar38 =((((_HspVar7*_HspVar67_HspVar10*_HspVar68)+_HspVar11*_HspVar69)+)+_HspVar12)/_HspVar42+_HspVar31
	PushVar(Var_31,0); PushVar(Var_7,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_10,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_11,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_12,0); CalcAddI(); PushVar(Var_42,0); CalcDivI(); CalcAddI(); 
	VarSet(Var_38,0);
	// _HspVar40 =((((_HspVar22*_HspVar67_HspVar26*_HspVar68)+_HspVar27*_HspVar69)+)+_HspVar28)/_HspVar42-_HspVar32
	PushVar(Var_32,0); PushVar(Var_22,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_26,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_27,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_28,0); CalcAddI(); PushVar(Var_42,0); CalcDivI(); CalcSubI(); 
	VarSet(Var_40,0);
	// _HspVar30 =((_HspVar38/8000_HspVar40/8000)|)=0
	PushVar(Var_38,0); PushInt(8000); CalcDivI(); PushVar(Var_40,0); PushInt(8000); CalcDivI(); CalcOrI(); PushInt(0); CalcEqI(); 
	VarSet(Var_30,0);
	TaskSwitch(94);
}

static void L0094( void ) {
	// if _HspVar30=0
	PushVar(Var_30,0); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(95); return; }
	// break *L0015
	PushLabel(21); 
	Prgcmd(3,1);
	return;
	TaskSwitch(95);
}

static void L0095( void ) {
	// _HspVar62 (cnt)=_HspVar38
	PushVar(Var_38,0); 
	PushSysvar(4,0); 
	VarSet(Var_62,1);
	// _HspVar63 (cnt)=_HspVar40
	PushVar(Var_40,0); 
	PushSysvar(4,0); 
	VarSet(Var_63,1);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(21);
}

static void L0021( void ) {
	// if _HspVar30
	PushVAP(Var_30,0); 
	if (HspIf()) { TaskSwitch(96); return; }
	// _HspVar64 =_prm88, (_prm88+_prm90)-1, (_prm88+_prm90)-1, _prm88
	PushFuncPrmI(4); 
	VarSet(Var_64,0);
	PushVarOffset(Var_64);
	PushFuncPrmI(4); PushFuncPrmI(6); CalcAddI(); PushInt(1); CalcSubI(); 
	VarSet2(Var_64);
	PushVarOffset(Var_64);
	PushFuncPrmI(4); PushFuncPrmI(6); CalcAddI(); PushInt(1); CalcSubI(); 
	VarSet2(Var_64);
	PushVarOffset(Var_64);
	PushFuncPrmI(4); 
	VarSet2(Var_64);
	// _HspVar70 =_prm89, _prm89, (_prm89+_prm91)-1, (_prm89+_prm91)-1
	PushFuncPrmI(5); 
	VarSet(Var_70,0);
	PushVarOffset(Var_70);
	PushFuncPrmI(5); 
	VarSet2(Var_70);
	PushVarOffset(Var_70);
	PushFuncPrmI(5); PushFuncPrmI(7); CalcAddI(); PushInt(1); CalcSubI(); 
	VarSet2(Var_70);
	PushVarOffset(Var_70);
	PushFuncPrmI(5); PushFuncPrmI(7); CalcAddI(); PushInt(1); CalcSubI(); 
	VarSet2(Var_70);
	// gsquare _prm87, _HspVar62, _HspVar63, _HspVar64, _HspVar70
	PushVAP(Var_70,0); 
	PushVAP(Var_64,0); 
	PushVAP(Var_63,0); 
	PushVAP(Var_62,0); 
	PushFuncPrmI(3); 
	Extcmd(55,5);
	TaskSwitch(96);
}

static void L0096( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(92);
}

static void L0092( void ) {
	// _HspVar71 =_prm92+1
	PushFuncPrmI(8); PushInt(1); CalcAddI(); 
	VarSet(Var_71,0);
	// _HspVar72 =_prm92*_prm92
	PushFuncPrmI(8); PushFuncPrmI(8); CalcMulI(); 
	VarSet(Var_72,0);
	// repeat
	PushVar(Var_71,0); PushVar(Var_71,0); CalcMulI(); 
	PushLabel(22); 
	PushLabel(97); Prgcmd(4,3); return;
	TaskSwitch(97);
}

static void L0097( void ) {
	// _HspVar53 =cnt%_HspVar71
	PushSysvar(4,0); PushVar(Var_71,0); CalcModI(); 
	VarSet(Var_53,0);
	// _HspVar73 =cnt/_HspVar71
	PushSysvar(4,0); PushVar(Var_71,0); CalcDivI(); 
	VarSet(Var_73,0);
	// _HspVar74 =(_prm92-_HspVar53_prm92-_HspVar73)*
	PushFuncPrmI(8); PushVar(Var_53,0); CalcSubI(); PushFuncPrmI(8); PushVar(Var_73,0); CalcSubI(); CalcMulI(); 
	VarSet(Var_74,0);
	// _HspVar75 =_prm92-_HspVar73*_HspVar53
	PushVar(Var_53,0); PushFuncPrmI(8); PushVar(Var_73,0); CalcSubI(); CalcMulI(); 
	VarSet(Var_75,0);
	// _HspVar76 =_HspVar53*_HspVar73
	PushVar(Var_53,0); PushVar(Var_73,0); CalcMulI(); 
	VarSet(Var_76,0);
	// _HspVar77 =(_prm92-_HspVar53)*_HspVar73
	PushFuncPrmI(8); PushVar(Var_53,0); CalcSubI(); PushVar(Var_73,0); CalcMulI(); 
	VarSet(Var_77,0);
	// _HspVar67 =((((_prm84*_HspVar74_prm84*_HspVar75)+(1)_prm84*_HspVar76)+(2)_prm84*_HspVar77)+(3))/_HspVar72
		PushInt(0); 
PushFuncPrm(0,1); PushVar(Var_74,0); CalcMulI(); 	PushInt(1); 
PushFuncPrm(0,1); PushVar(Var_75,0); CalcMulI(); CalcAddI(); 	PushInt(2); 
PushFuncPrm(0,1); PushVar(Var_76,0); CalcMulI(); CalcAddI(); 	PushInt(3); 
PushFuncPrm(0,1); PushVar(Var_77,0); CalcMulI(); CalcAddI(); PushVar(Var_72,0); CalcDivI(); 
	VarSet(Var_67,0);
	// _HspVar68 =((((_prm85*_HspVar74_prm85*_HspVar75)+(1)_prm85*_HspVar76)+(2)_prm85*_HspVar77)+(3))/_HspVar72
		PushInt(0); 
PushFuncPrm(1,1); PushVar(Var_74,0); CalcMulI(); 	PushInt(1); 
PushFuncPrm(1,1); PushVar(Var_75,0); CalcMulI(); CalcAddI(); 	PushInt(2); 
PushFuncPrm(1,1); PushVar(Var_76,0); CalcMulI(); CalcAddI(); 	PushInt(3); 
PushFuncPrm(1,1); PushVar(Var_77,0); CalcMulI(); CalcAddI(); PushVar(Var_72,0); CalcDivI(); 
	VarSet(Var_68,0);
	// _HspVar69 =((((_prm86*_HspVar74_prm86*_HspVar75)+(1)_prm86*_HspVar76)+(2)_prm86*_HspVar77)+(3))/_HspVar72
		PushInt(0); 
PushFuncPrm(2,1); PushVar(Var_74,0); CalcMulI(); 	PushInt(1); 
PushFuncPrm(2,1); PushVar(Var_75,0); CalcMulI(); CalcAddI(); 	PushInt(2); 
PushFuncPrm(2,1); PushVar(Var_76,0); CalcMulI(); CalcAddI(); 	PushInt(3); 
PushFuncPrm(2,1); PushVar(Var_77,0); CalcMulI(); CalcAddI(); PushVar(Var_72,0); CalcDivI(); 
	VarSet(Var_69,0);
	// _HspVar42 =(((_HspVar14*_HspVar67_HspVar18*_HspVar68)+_HspVar19*_HspVar69)+)+_HspVar20
	PushVar(Var_14,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_18,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_19,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_20,0); CalcAddI(); 
	VarSet(Var_42,0);
	// _HspVar78 (cnt)=0
	PushInt(0); 
	PushSysvar(4,0); 
	VarSet(Var_78,1);
	// if _HspVar42>0
	PushVar(Var_42,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(98); return; }
	// _HspVar79 (cnt)=((((_HspVar7*_HspVar67_HspVar10*_HspVar68)+_HspVar11*_HspVar69)+)+_HspVar12)/_HspVar42+_HspVar31
	PushVar(Var_31,0); PushVar(Var_7,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_10,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_11,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_12,0); CalcAddI(); PushVar(Var_42,0); CalcDivI(); CalcAddI(); 
	PushSysvar(4,0); 
	VarSet(Var_79,1);
	// _HspVar80 (cnt)=((((_HspVar22*_HspVar67_HspVar26*_HspVar68)+_HspVar27*_HspVar69)+)+_HspVar28)/_HspVar42-_HspVar32
	PushVar(Var_32,0); PushVar(Var_22,0); PushVar(Var_67,0); CalcMulI(); PushVar(Var_26,0); PushVar(Var_68,0); CalcMulI(); CalcAddI(); PushVar(Var_27,0); PushVar(Var_69,0); CalcMulI(); CalcAddI(); PushVar(Var_28,0); CalcAddI(); PushVar(Var_42,0); CalcDivI(); CalcSubI(); 
	PushSysvar(4,0); 
	VarSet(Var_80,1);
	// _HspVar78 (cnt)=((_HspVar79(cnt)/8000_HspVar80(cnt)/8000)|(cnt))=0
		PushSysvar(4,0); 
PushVar(Var_79,1); PushInt(8000); CalcDivI(); 	PushSysvar(4,0); 
PushVar(Var_80,1); PushInt(8000); CalcDivI(); CalcOrI(); PushInt(0); CalcEqI(); 
	PushSysvar(4,0); 
	VarSet(Var_78,1);
	TaskSwitch(98);
}

static void L0098( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(22);
}

static void L0022( void ) {
	// _HspVar81 =_prm90-1
	PushFuncPrmI(6); PushInt(1); CalcSubI(); 
	VarSet(Var_81,0);
	// _HspVar82 =_prm91-1
	PushFuncPrmI(7); PushInt(1); CalcSubI(); 
	VarSet(Var_82,0);
	// repeat
	PushFuncPrmI(8); 
	PushLabel(23); 
	PushLabel(99); Prgcmd(4,3); return;
	TaskSwitch(99);
}

static void L0099( void ) {
	// _HspVar73 =cnt
	PushSysvar(4,0); 
	VarSet(Var_73,0);
	// _HspVar70 =((_HspVar73*_HspVar82)/_prm92)+_prm89, _HspVar70(0), (((_HspVar73+1)*_HspVar82)/_prm92)+_prm89, _HspVar70(2)
	PushVar(Var_73,0); PushVar(Var_82,0); CalcMulI(); PushFuncPrmI(8); CalcDivI(); PushFuncPrmI(5); CalcAddI(); 
	VarSet(Var_70,0);
	PushVarOffset(Var_70);
		PushInt(0); 
PushVar(Var_70,1); 
	VarSet2(Var_70);
	PushVarOffset(Var_70);
	PushVar(Var_73,0); PushInt(1); CalcAddI(); PushVar(Var_82,0); CalcMulI(); PushFuncPrmI(8); CalcDivI(); PushFuncPrmI(5); CalcAddI(); 
	VarSet2(Var_70);
	PushVarOffset(Var_70);
		PushInt(2); 
PushVar(Var_70,1); 
	VarSet2(Var_70);
	// repeat
	PushFuncPrmI(8); 
	PushLabel(24); 
	PushLabel(100); Prgcmd(4,3); return;
	TaskSwitch(100);
}

static void L0100( void ) {
	// _HspVar53 =cnt
	PushSysvar(4,0); 
	VarSet(Var_53,0);
	// _HspVar83 =(_HspVar73*_HspVar71)+_HspVar53
	PushVar(Var_73,0); PushVar(Var_71,0); CalcMulI(); PushVar(Var_53,0); CalcAddI(); 
	VarSet(Var_83,0);
	// _HspVar84 =_HspVar83+1
	PushVar(Var_83,0); PushInt(1); CalcAddI(); 
	VarSet(Var_84,0);
	// _HspVar85 =_HspVar84+_HspVar71
	PushVar(Var_84,0); PushVar(Var_71,0); CalcAddI(); 
	VarSet(Var_85,0);
	// _HspVar86 =_HspVar83+_HspVar71
	PushVar(Var_83,0); PushVar(Var_71,0); CalcAddI(); 
	VarSet(Var_86,0);
	// if ((_HspVar78(_HspVar83)(_HspVar84)&_HspVar78(_HspVar84))&_HspVar78(_HspVar85))&_HspVar78(_HspVar86)
		PushVAP(Var_83,0); 
	PushVar(Var_78,1); 	PushVAP(Var_84,0); 
	PushVar(Var_78,1); CalcAndI(); 	PushVAP(Var_85,0); 
	PushVar(Var_78,1); CalcAndI(); 	PushVAP(Var_86,0); 
	PushVar(Var_78,1); CalcAndI(); 
	if (HspIf()) { TaskSwitch(101); return; }
	// _HspVar62 =_HspVar79(_HspVar83), _HspVar79(_HspVar84), _HspVar79(_HspVar85), _HspVar79(_HspVar86)
		PushVAP(Var_83,0); 
PushVar(Var_79,1); 
	VarSet(Var_62,0);
	PushVarOffset(Var_62);
		PushVAP(Var_84,0); 
PushVar(Var_79,1); 
	VarSet2(Var_62);
	PushVarOffset(Var_62);
		PushVAP(Var_85,0); 
PushVar(Var_79,1); 
	VarSet2(Var_62);
	PushVarOffset(Var_62);
		PushVAP(Var_86,0); 
PushVar(Var_79,1); 
	VarSet2(Var_62);
	// _HspVar63 =_HspVar80(_HspVar83), _HspVar80(_HspVar84), _HspVar80(_HspVar85), _HspVar80(_HspVar86)
		PushVAP(Var_83,0); 
PushVar(Var_80,1); 
	VarSet(Var_63,0);
	PushVarOffset(Var_63);
		PushVAP(Var_84,0); 
PushVar(Var_80,1); 
	VarSet2(Var_63);
	PushVarOffset(Var_63);
		PushVAP(Var_85,0); 
PushVar(Var_80,1); 
	VarSet2(Var_63);
	PushVarOffset(Var_63);
		PushVAP(Var_86,0); 
PushVar(Var_80,1); 
	VarSet2(Var_63);
	// _HspVar64 =((_HspVar53*_HspVar81)/_prm92)+_prm88, (((_HspVar53+1)*_HspVar81)/_prm92)+_prm88, _HspVar64(1), _HspVar64(0)
	PushVar(Var_53,0); PushVar(Var_81,0); CalcMulI(); PushFuncPrmI(8); CalcDivI(); PushFuncPrmI(4); CalcAddI(); 
	VarSet(Var_64,0);
	PushVarOffset(Var_64);
	PushVar(Var_53,0); PushInt(1); CalcAddI(); PushVar(Var_81,0); CalcMulI(); PushFuncPrmI(8); CalcDivI(); PushFuncPrmI(4); CalcAddI(); 
	VarSet2(Var_64);
	PushVarOffset(Var_64);
		PushInt(1); 
PushVar(Var_64,1); 
	VarSet2(Var_64);
	PushVarOffset(Var_64);
		PushInt(0); 
PushVar(Var_64,1); 
	VarSet2(Var_64);
	// gsquare _prm87, _HspVar62, _HspVar63, _HspVar64, _HspVar70
	PushVAP(Var_70,0); 
	PushVAP(Var_64,0); 
	PushVAP(Var_63,0); 
	PushVAP(Var_62,0); 
	PushFuncPrmI(3); 
	Extcmd(55,5);
	TaskSwitch(101);
}

static void L0101( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(24);
}

static void L0024( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(23);
}

static void L0023( void ) {
	// return 
	Prgcmd(2,0);
	return;
	TaskSwitch(25);
}

static void L0025( void ) {
	// #defcfunc d3timer 
	//  _HspVar87, 34
	PushInt(34); 
	PushVAP(Var_87,0); 
	Extcmd(65,2);
	// return _HspVar87
	PushVAP(Var_87,0); 
	Prgcmd(2,1);
	return;
	TaskSwitch(26);
}

static void L0026( void ) {
	// #defcfunc d3getfps 
	// _HspVar51 =d3timer()/200
	PushFuncEnd(); PushModcmd(16,0); PushInt(200); CalcDivI(); 
	VarSet(Var_51,0);
	// _HspVar88 (_HspVar51&31)++
	PushVar(Var_51,0); PushInt(31); CalcAndI(); 
	VarInc(Var_88,1);
	// if _HspVar89!=_HspVar51
	PushVar(Var_89,0); PushVar(Var_51,0); CalcNeI(); 
	if (HspIf()) { TaskSwitch(102); return; }
	// _HspVar89 =_HspVar51
	PushVar(Var_51,0); 
	VarSet(Var_89,0);
	// _HspVar90 =0
	PushInt(0); 
	VarSet(Var_90,0);
	// repeat
	PushInt(1); 
	PushInt(5); 
	PushLabel(27); 
	PushLabel(103); Prgcmd(4,4); return;
	TaskSwitch(103);
}

static void L0103( void ) {
	// _HspVar90 +=_HspVar88((_HspVar51-cnt)&31)
		PushVar(Var_51,0); PushSysvar(4,0); CalcSubI(); PushInt(31); CalcAndI(); 
	PushVar(Var_88,1); 
	VarCalc(Var_90,0,0);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(27);
}

static void L0027( void ) {
	// repeat
	PushInt(1); 
	PushInt(20); 
	PushLabel(28); 
	PushLabel(104); Prgcmd(4,4); return;
	TaskSwitch(104);
}

static void L0104( void ) {
	// _HspVar88 ((_HspVar51+cnt)&31)=0
	PushInt(0); 
	PushVar(Var_51,0); PushSysvar(4,0); CalcAddI(); PushInt(31); CalcAndI(); 
	VarSet(Var_88,1);
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(102);
}

static void L0102( void ) {
	TaskSwitch(28);
}

static void L0028( void ) {
	// return _HspVar90
	PushVAP(Var_90,0); 
	Prgcmd(2,1);
	return;
	TaskSwitch(0);
}

static void L0000( void ) {
	// dim _HspVar88, 32
	PushInt(32); 
	PushVAP(Var_88,0); 
	Prgcmd(9,2);
	// _HspVar91 =20, 1, 100
	PushInt(20); 
	VarSet(Var_91,0);
	PushVarOffset(Var_91);
	PushInt(1); 
	VarSet2(Var_91);
	PushVarOffset(Var_91);
	PushInt(100); 
	VarSet2(Var_91);
	// _HspVar92 =200.000000
	PushDouble(200.000000); 
	VarSet(Var_92,0);
	// _HspVar93 =0.000000
	PushDouble(0.000000); 
	VarSet(Var_93,0);
	// _HspVar94 =d3timer()
	PushFuncEnd(); PushModcmd(16,0); 
	VarSet(Var_94,0);
	TaskSwitch(29);
}

static void L0029( void ) {
	// stick _HspVar95, 15
	PushInt(15); 
	PushVAP(Var_95,0); 
	Extcmd(52,2);
	// if _HspVar95&128
	PushVar(Var_95,0); PushInt(128); CalcAndI(); 
	if (HspIf()) { TaskSwitch(105); return; }
	// end 
	Prgcmd(16,0);
	return;
	TaskSwitch(105);
}

static void L0105( void ) {
	// _HspVar96 =0.001000*d3timer()
	PushDouble(0.001000); PushFuncEnd(); PushModcmd(16,0); CalcMulI(); 
	VarSet(Var_96,0);
	// _HspVar97 =_HspVar96-_HspVar98
	PushVar(Var_96,0); PushVar(Var_98,0); CalcSubI(); 
	VarSet(Var_97,0);
	// _HspVar98 =_HspVar96
	PushVar(Var_96,0); 
	VarSet(Var_98,0);
	// _HspVar92 +=((_HspVar97*100_HspVar95=2_HspVar95=8)-)*
	PushVar(Var_97,0); PushInt(100); CalcMulI(); PushVar(Var_95,0); PushInt(2); CalcEqI(); PushVar(Var_95,0); PushInt(8); CalcEqI(); CalcSubI(); CalcMulI(); 
	VarCalc(Var_92,0,0);
	// _HspVar93 +=_HspVar97*_HspVar92
	PushVar(Var_97,0); PushVar(Var_92,0); CalcMulI(); 
	VarCalc(Var_93,0,0);
	// _HspVar99 =absf(sin(_HspVar96))
	PushFuncEnd(); 	PushFuncEnd(); 	PushVAP(Var_96,0); 
PushIntfunc(384,1); 
PushIntfunc(390,1); 
	VarSet(Var_99,0);
	// _HspVar100 =(d3timer()-_HspVar94)+1000
	PushFuncEnd(); PushModcmd(16,0); PushVar(Var_94,0); CalcSubI(); PushInt(1000); CalcAddI(); 
	VarSet(Var_100,0);
	// redraw 0
	PushInt(0); 
	Extcmd(27,1);
	// color 
	Extcmd(24,0);
	// boxf 
	Extcmd(49,0);
	// hsvcolor _HspVar96, 128, 224000/_HspVar100-224
	PushInt(224); PushInt(224000); PushVar(Var_100,0); CalcDivI(); CalcSubI(); 
	PushInt(128); 
	PushVAP(Var_96,0); 
	Extcmd(34,3);
	// _HspVar101 =(3000000/_HspVar100)+700
	PushInt(3000000); PushVar(Var_100,0); CalcDivI(); PushInt(700); CalcAddI(); 
	VarSet(Var_101,0);
	// d3setcamx cos(_HspVar96/5)*_HspVar101, sin(_HspVar96/5)*_HspVar101, (sin(_HspVar96/6)*300_HspVar101/2)+, 0, 0, _HspVar99*140, 1
	PushInt(1); 
	PushVar(Var_99,0); PushInt(140); CalcMulI(); 
	PushInt(0); 
	PushInt(0); 
	PushFuncEnd(); 	PushVar(Var_96,0); PushInt(6); CalcDivI(); 
	PushIntfunc(384,1); PushInt(300); CalcMulI(); PushVar(Var_101,0); PushInt(2); CalcDivI(); CalcAddI(); 
	PushFuncEnd(); 	PushVar(Var_96,0); PushInt(5); CalcDivI(); 
	PushIntfunc(384,1); PushVar(Var_101,0); CalcMulI(); 
	PushFuncEnd(); 	PushVar(Var_96,0); PushInt(5); CalcDivI(); 
	PushIntfunc(385,1); PushVar(Var_101,0); CalcMulI(); 
	PushLabel(106);
	Modcmd(3,7);
	return;
}

static void L0106( void ) {
	// repeat
	PushInt(16); 
	PushLabel(30); 
	PushLabel(107); Prgcmd(4,3); return;
	TaskSwitch(107);
}

static void L0107( void ) {
	// _HspVar102 =(((cnt*64)+_HspVar93)&1023)-512
	PushSysvar(4,0); PushInt(64); CalcMulI(); PushVar(Var_93,0); CalcAddI(); PushInt(1023); CalcAndI(); PushInt(512); CalcSubI(); 
	VarSet(Var_102,0);
	// repeat
	PushInt(16); 
	PushLabel(31); 
	PushLabel(108); Prgcmd(4,3); return;
	TaskSwitch(108);
}

static void L0108( void ) {
	// _HspVar103 =(cnt*64)-512
	PushSysvar(4,0); PushInt(64); CalcMulI(); PushInt(512); CalcSubI(); 
	VarSet(Var_103,0);
	// _HspVar101 =(_HspVar99*150)+400
	PushVar(Var_99,0); PushInt(150); CalcMulI(); PushInt(400); CalcAddI(); 
	VarSet(Var_101,0);
	// _HspVar104 =(((0.400000*_HspVar99-1.000000_HspVar101-sqrt((_HspVar102*_HspVar102_HspVar103*_HspVar103)+))/_HspVar101)*rnd(160)+160)*(160)
	PushDouble(1.000000); PushDouble(0.400000); PushVar(Var_99,0); CalcMulI(); CalcSubI(); PushVar(Var_101,0); PushFuncEnd(); 	PushVar(Var_102,0); PushVar(Var_102,0); CalcMulI(); PushVar(Var_103,0); PushVar(Var_103,0); CalcMulI(); CalcAddI(); 
PushIntfunc(388,1); CalcSubI(); PushVar(Var_101,0); CalcDivI(); CalcMulI(); PushFuncEnd(); 	PushInt(160); 
PushIntfunc(1,1); PushInt(160); CalcAddI(); CalcMulI(); 
	VarSet(Var_104,0);
	// if _HspVar104>0
	PushVar(Var_104,0); PushInt(0); CalcGtI(); 
	if (HspIf()) { TaskSwitch(109); return; }
	// _HspVar101 =28
	PushInt(28); 
	VarSet(Var_101,0);
	// _HspVar105 =_HspVar102-_HspVar101, _HspVar102+_HspVar101, _HspVar102+_HspVar101, _HspVar102-_HspVar101
	PushVar(Var_102,0); PushVar(Var_101,0); CalcSubI(); 
	VarSet(Var_105,0);
	PushVarOffset(Var_105);
	PushVar(Var_102,0); PushVar(Var_101,0); CalcAddI(); 
	VarSet2(Var_105);
	PushVarOffset(Var_105);
	PushVar(Var_102,0); PushVar(Var_101,0); CalcAddI(); 
	VarSet2(Var_105);
	PushVarOffset(Var_105);
	PushVar(Var_102,0); PushVar(Var_101,0); CalcSubI(); 
	VarSet2(Var_105);
	// _HspVar106 =_HspVar103-_HspVar101, _HspVar103-_HspVar101, _HspVar103+_HspVar101, _HspVar103+_HspVar101
	PushVar(Var_103,0); PushVar(Var_101,0); CalcSubI(); 
	VarSet(Var_106,0);
	PushVarOffset(Var_106);
	PushVar(Var_103,0); PushVar(Var_101,0); CalcSubI(); 
	VarSet2(Var_106);
	PushVarOffset(Var_106);
	PushVar(Var_103,0); PushVar(Var_101,0); CalcAddI(); 
	VarSet2(Var_106);
	PushVarOffset(Var_106);
	PushVar(Var_103,0); PushVar(Var_101,0); CalcAddI(); 
	VarSet2(Var_106);
	// _HspVar107 =0, 0, 0, 0
	PushInt(0); 
	VarSet(Var_107,0);
	PushVarOffset(Var_107);
	PushInt(0); 
	VarSet2(Var_107);
	PushVarOffset(Var_107);
	PushInt(0); 
	VarSet2(Var_107);
	PushVarOffset(Var_107);
	PushInt(0); 
	VarSet2(Var_107);
	// gmode 5, , , _HspVar104
	PushVAP(Var_104,0); 
	PushDefault();
	PushDefault();
	PushInt(5); 
	Extcmd(32,4);
	// d3square _HspVar105, _HspVar106, _HspVar107
	PushVAP(Var_107,0); 
	PushVAP(Var_106,0); 
	PushVAP(Var_105,0); 
	PushLabel(110);
	Modcmd(13,3);
	return;
}

static void L0110( void ) {
	TaskSwitch(109);
}

static void L0109( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(31);
}

static void L0031( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(30);
}

static void L0030( void ) {
	// repeat
	PushInt(3); 
	PushLabel(32); 
	PushLabel(111); Prgcmd(4,3); return;
	TaskSwitch(111);
}

static void L0111( void ) {
	// randomize 0
	PushInt(0); 
	Intcmd(39,1);
	// if cnt=0
	PushSysvar(4,0); PushInt(0); CalcEqI(); 
	if (HspIf()) { TaskSwitch(112); return; }
	// _HspVar108 =sqrt(_HspVar99)*0.100000
	PushFuncEnd(); 	PushVAP(Var_99,0); 
PushIntfunc(388,1); PushDouble(0.100000); CalcMulI(); 
	VarSet(Var_108,0);
	// _HspVar109 =6
	PushInt(6); 
	VarSet(Var_109,0);
	// _HspVar110 =(_HspVar99*0.500000)+1
	PushVar(Var_99,0); PushDouble(0.500000); CalcMulI(); PushInt(1); CalcAddI(); 
	VarSet(Var_110,0);
	// _HspVar111 =-0.050000
	PushDouble(-0.050000); 
	VarSet(Var_111,0);
	TaskSwitch(112);
}

static void L0112( void ) {
	// if cnt=1
	PushSysvar(4,0); PushInt(1); CalcEqI(); 
	if (HspIf()) { TaskSwitch(113); return; }
	// _HspVar108 =_HspVar99*0.200000-0.300000
	PushDouble(0.300000); PushVar(Var_99,0); PushDouble(0.200000); CalcMulI(); CalcSubI(); 
	VarSet(Var_108,0);
	// _HspVar109 =5
	PushInt(5); 
	VarSet(Var_109,0);
	// _HspVar110 =1
	PushInt(1); 
	VarSet(Var_110,0);
	// _HspVar111 =-0.900000
	PushDouble(-0.900000); 
	VarSet(Var_111,0);
	TaskSwitch(113);
}

static void L0113( void ) {
	// if cnt=2
	PushSysvar(4,0); PushInt(2); CalcEqI(); 
	if (HspIf()) { TaskSwitch(114); return; }
	// _HspVar108 =1
	PushInt(1); 
	VarSet(Var_108,0);
	// _HspVar111 =1
	PushInt(1); 
	VarSet(Var_111,0);
	TaskSwitch(114);
}

static void L0114( void ) {
	// _HspVar112 =64
	PushInt(64); 
	VarSet(Var_112,0);
	// _HspVar113 =58
	PushInt(58); 
	VarSet(Var_113,0);
	// _HspVar114 =4
	PushInt(4); 
	VarSet(Var_114,0);
	// _HspVar115 =(_HspVar93*-1)/170
	PushVar(Var_93,0); PushInt(-1); CalcMulI(); PushInt(170); CalcDivI(); 
	VarSet(Var_115,0);
	// d3setlocalmx 0, 0, ((_HspVar99*300)+70)*_HspVar111, sin(_HspVar115)*_HspVar110, 0, cos(_HspVar115)*_HspVar110, 0, _HspVar110, 0, cos(_HspVar115)*_HspVar111, 0, (sin(_HspVar115)*-1)*_HspVar111
	PushFuncEnd(); 	PushVAP(Var_115,0); 
	PushIntfunc(384,1); PushInt(-1); CalcMulI(); PushVar(Var_111,0); CalcMulI(); 
	PushInt(0); 
	PushFuncEnd(); 	PushVAP(Var_115,0); 
	PushIntfunc(385,1); PushVar(Var_111,0); CalcMulI(); 
	PushInt(0); 
	PushVAP(Var_110,0); 
	PushInt(0); 
	PushFuncEnd(); 	PushVAP(Var_115,0); 
	PushIntfunc(385,1); PushVar(Var_110,0); CalcMulI(); 
	PushInt(0); 
	PushFuncEnd(); 	PushVAP(Var_115,0); 
	PushIntfunc(384,1); PushVar(Var_110,0); CalcMulI(); 
	PushVar(Var_99,0); PushInt(300); CalcMulI(); PushInt(70); CalcAddI(); PushVar(Var_111,0); CalcMulI(); 
	PushInt(0); 
	PushInt(0); 
	PushLabel(115);
	Modcmd(2,12);
	return;
}

static void L0115( void ) {
	// repeat
	PushInt(2); 
	PushLabel(33); 
	PushLabel(116); Prgcmd(4,3); return;
	TaskSwitch(116);
}

static void L0116( void ) {
	// _HspVar116 =(cnt*2)-1*_HspVar112, _HspVar116, _HspVar116, _HspVar116
	PushVar(Var_112,0); PushSysvar(4,0); PushInt(2); CalcMulI(); PushInt(1); CalcSubI(); CalcMulI(); 
	VarSet(Var_116,0);
	PushVarOffset(Var_116);
	PushVar(Var_116,0); 
	VarSet2(Var_116);
	PushVarOffset(Var_116);
	PushVar(Var_116,0); 
	VarSet2(Var_116);
	PushVarOffset(Var_116);
	PushVar(Var_116,0); 
	VarSet2(Var_116);
	// repeat
	PushInt(4); 
	PushLabel(34); 
	PushLabel(117); Prgcmd(4,3); return;
	TaskSwitch(117);
}

static void L0117( void ) {
	// _HspVar117 =((cnt%2)*2)-1
	PushSysvar(4,0); PushInt(2); CalcModI(); PushInt(2); CalcMulI(); PushInt(1); CalcSubI(); 
	VarSet(Var_117,0);
	// _HspVar118 =((cnt/2)*2)-1
	PushSysvar(4,0); PushInt(2); CalcDivI(); PushInt(2); CalcMulI(); PushInt(1); CalcSubI(); 
	VarSet(Var_118,0);
	// _HspVar102 =_HspVar114*_HspVar117, _HspVar114*_HspVar117, _HspVar113*_HspVar117, _HspVar113*_HspVar117
	PushVar(Var_114,0); PushVar(Var_117,0); CalcMulI(); 
	VarSet(Var_102,0);
	PushVarOffset(Var_102);
	PushVar(Var_114,0); PushVar(Var_117,0); CalcMulI(); 
	VarSet2(Var_102);
	PushVarOffset(Var_102);
	PushVar(Var_113,0); PushVar(Var_117,0); CalcMulI(); 
	VarSet2(Var_102);
	PushVarOffset(Var_102);
	PushVar(Var_113,0); PushVar(Var_117,0); CalcMulI(); 
	VarSet2(Var_102);
	// _HspVar103 =_HspVar114*_HspVar118, _HspVar113*_HspVar118, _HspVar113*_HspVar118, _HspVar114*_HspVar118
	PushVar(Var_114,0); PushVar(Var_118,0); CalcMulI(); 
	VarSet(Var_103,0);
	PushVarOffset(Var_103);
	PushVar(Var_113,0); PushVar(Var_118,0); CalcMulI(); 
	VarSet2(Var_103);
	PushVarOffset(Var_103);
	PushVar(Var_113,0); PushVar(Var_118,0); CalcMulI(); 
	VarSet2(Var_103);
	PushVarOffset(Var_103);
	PushVar(Var_114,0); PushVar(Var_118,0); CalcMulI(); 
	VarSet2(Var_103);
	// gmode _HspVar109, , , rnd(160)+96*_HspVar108
	PushVar(Var_108,0); PushFuncEnd(); 	PushInt(160); 
	PushIntfunc(1,1); PushInt(96); CalcAddI(); CalcMulI(); 
	PushDefault();
	PushDefault();
	PushVAP(Var_109,0); 
	Extcmd(32,4);
	// d3square _HspVar102, _HspVar103, _HspVar116
	PushVAP(Var_116,0); 
	PushVAP(Var_103,0); 
	PushVAP(Var_102,0); 
	PushLabel(118);
	Modcmd(13,3);
	return;
}

static void L0118( void ) {
	// d3square _HspVar116, _HspVar102, _HspVar103
	PushVAP(Var_103,0); 
	PushVAP(Var_102,0); 
	PushVAP(Var_116,0); 
	PushLabel(119);
	Modcmd(13,3);
	return;
}

static void L0119( void ) {
	// d3square _HspVar103, _HspVar116, _HspVar102
	PushVAP(Var_102,0); 
	PushVAP(Var_116,0); 
	PushVAP(Var_103,0); 
	PushLabel(120);
	Modcmd(13,3);
	return;
}

static void L0120( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(34);
}

static void L0034( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(33);
}

static void L0033( void ) {
	// loop 
	Prgcmd(5,0);
	return;
	TaskSwitch(32);
}

static void L0032( void ) {
	// redraw 1
	PushInt(1); 
	Extcmd(27,1);
	// await 10
	PushInt(10); 
	Prgcmd(8,1);
	TaskSwitch(121);
}

static void L0121( void ) {
	// goto *L001d
	TaskSwitch(29);
	return;
	TaskSwitch(35);
}

static void L0035( void ) {
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
(CHSP3_TASK) L0001,	// d3rotate
(CHSP3_TASK) L0002,	// d3vrotate
(CHSP3_TASK) L0003,	// d3setlocalmx
(CHSP3_TASK) L0004,	// d3setcamx
(CHSP3_TASK) L0005,	// d3vpos
(CHSP3_TASK) L0006,	// d3line
(CHSP3_TASK) L0007,
(CHSP3_TASK) L0008,	// d3arrow
(CHSP3_TASK) L0009,	// d3box
(CHSP3_TASK) L0010,	// d3circle
(CHSP3_TASK) L0011,	// d3mes
(CHSP3_TASK) L0012,	// d3createptc
(CHSP3_TASK) L0013,
(CHSP3_TASK) L0014,
(CHSP3_TASK) L0015,	// d3particlem
(CHSP3_TASK) L0016,	// d3particlemr
(CHSP3_TASK) L0017,	// d3square
(CHSP3_TASK) L0018,
(CHSP3_TASK) L0019,	// d3ribbonto
(CHSP3_TASK) L0020,	// d3texture
(CHSP3_TASK) L0021,
(CHSP3_TASK) L0022,
(CHSP3_TASK) L0023,
(CHSP3_TASK) L0024,
(CHSP3_TASK) L0025,	// d3timer
(CHSP3_TASK) L0026,	// d3getfps
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
(CHSP3_TASK) L0042,
(CHSP3_TASK) L0043,
(CHSP3_TASK) L0044,
(CHSP3_TASK) L0045,
(CHSP3_TASK) L0046,
(CHSP3_TASK) L0047,
(CHSP3_TASK) L0048,
(CHSP3_TASK) L0049,
(CHSP3_TASK) L0050,
(CHSP3_TASK) L0051,
(CHSP3_TASK) L0052,
(CHSP3_TASK) L0053,
(CHSP3_TASK) L0054,
(CHSP3_TASK) L0055,
(CHSP3_TASK) L0056,
(CHSP3_TASK) L0057,
(CHSP3_TASK) L0058,
(CHSP3_TASK) L0059,
(CHSP3_TASK) L0060,
(CHSP3_TASK) L0061,
(CHSP3_TASK) L0062,
(CHSP3_TASK) L0063,
(CHSP3_TASK) L0064,
(CHSP3_TASK) L0065,
(CHSP3_TASK) L0066,
(CHSP3_TASK) L0067,
(CHSP3_TASK) L0068,
(CHSP3_TASK) L0069,
(CHSP3_TASK) L0070,
(CHSP3_TASK) L0071,
(CHSP3_TASK) L0072,
(CHSP3_TASK) L0073,
(CHSP3_TASK) L0074,
(CHSP3_TASK) L0075,
(CHSP3_TASK) L0076,
(CHSP3_TASK) L0077,
(CHSP3_TASK) L0078,
(CHSP3_TASK) L0079,
(CHSP3_TASK) L0080,
(CHSP3_TASK) L0081,
(CHSP3_TASK) L0082,
(CHSP3_TASK) L0083,
(CHSP3_TASK) L0084,
(CHSP3_TASK) L0085,
(CHSP3_TASK) L0086,
(CHSP3_TASK) L0087,
(CHSP3_TASK) L0088,
(CHSP3_TASK) L0089,
(CHSP3_TASK) L0090,
(CHSP3_TASK) L0091,
(CHSP3_TASK) L0092,
(CHSP3_TASK) L0093,
(CHSP3_TASK) L0094,
(CHSP3_TASK) L0095,
(CHSP3_TASK) L0096,
(CHSP3_TASK) L0097,
(CHSP3_TASK) L0098,
(CHSP3_TASK) L0099,
(CHSP3_TASK) L0100,
(CHSP3_TASK) L0101,
(CHSP3_TASK) L0102,
(CHSP3_TASK) L0103,
(CHSP3_TASK) L0104,
(CHSP3_TASK) L0105,
(CHSP3_TASK) L0106,
(CHSP3_TASK) L0107,
(CHSP3_TASK) L0108,
(CHSP3_TASK) L0109,
(CHSP3_TASK) L0110,
(CHSP3_TASK) L0111,
(CHSP3_TASK) L0112,
(CHSP3_TASK) L0113,
(CHSP3_TASK) L0114,
(CHSP3_TASK) L0115,
(CHSP3_TASK) L0116,
(CHSP3_TASK) L0117,
(CHSP3_TASK) L0118,
(CHSP3_TASK) L0119,
(CHSP3_TASK) L0120,
(CHSP3_TASK) L0121,
(CHSP3_TASK) 0,

};

/*-----------------------------------------------------------*/

STRUCTDAT __HspFuncInfo[]={
	{ -1,0, 0,5,0,0,1, (void *)0 },
	{ -1,1, 5,10,9,0,2, (void *)0 },
	{ -1,2, 15,12,19,0,3, (void *)0 },
	{ -1,3, 27,7,32,0,4, (void *)0 },
	{ -1,4, 34,3,42,0,5, (void *)0 },
	{ -1,5, 37,6,49,0,6, (void *)0 },
	{ -1,6, 43,6,56,0,8, (void *)0 },
	{ -1,7, 49,6,64,0,9, (void *)0 },
	{ -1,8, 55,5,70,0,10, (void *)0 },
	{ -1,9, 60,4,79,0,11, (void *)0 },
	{ -1,10, 64,6,85,0,12, (void *)0 },
	{ -1,11, 70,2,97,0,15, (void *)0 },
	{ -1,12, 72,3,109,0,16, (void *)0 },
	{ -1,13, 75,3,122,0,17, (void *)0 },
	{ -1,14, 78,6,131,0,19, (void *)0 },
	{ -1,15, 84,9,142,0,20, (void *)0 },
	{ -2,16, 93,0,152,0,25, (void *)0 },
	{ -2,17, 93,0,160,0,26, (void *)0 },
};

STRUCTPRM __HspPrmInfo[]={
	{ -3, -1, 0 },
	{ -3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 24 },
	{ 3, -1, 32 },
	{ -3, -1, 0 },
	{ -3, -1, 8 },
	{ -3, -1, 16 },
	{ 3, -1, 24 },
	{ 3, -1, 32 },
	{ 3, -1, 40 },
	{ 3, -1, 48 },
	{ 3, -1, 56 },
	{ 3, -1, 64 },
	{ 3, -1, 72 },
	{ 3, -1, 0 },
	{ 3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 24 },
	{ 3, -1, 32 },
	{ 3, -1, 40 },
	{ 3, -1, 48 },
	{ 3, -1, 56 },
	{ 3, -1, 64 },
	{ 3, -1, 72 },
	{ 3, -1, 80 },
	{ 3, -1, 88 },
	{ 3, -1, 0 },
	{ 3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 24 },
	{ 3, -1, 32 },
	{ 3, -1, 40 },
	{ 3, -1, 48 },
	{ 3, -1, 0 },
	{ 3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 0 },
	{ 3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 24 },
	{ 3, -1, 32 },
	{ 3, -1, 40 },
	{ 3, -1, 0 },
	{ 3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 24 },
	{ 3, -1, 32 },
	{ 3, -1, 40 },
	{ 3, -1, 0 },
	{ 3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 24 },
	{ 3, -1, 32 },
	{ 3, -1, 40 },
	{ 3, -1, 0 },
	{ 3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 24 },
	{ 4, -1, 32 },
	{ -6, -1, 0 },
	{ 3, -1, 4 },
	{ 3, -1, 12 },
	{ 3, -1, 20 },
	{ 4, -1, 0 },
	{ 4, -1, 4 },
	{ 4, -1, 8 },
	{ 4, -1, 12 },
	{ -2, -1, 16 },
	{ 4, -1, 24 },
	{ 4, -1, 0 },
	{ 3, -1, 4 },
	{ 4, -1, 0 },
	{ 3, -1, 4 },
	{ 3, -1, 12 },
	{ -2, -1, 0 },
	{ -2, -1, 8 },
	{ -2, -1, 16 },
	{ 3, -1, 0 },
	{ 3, -1, 8 },
	{ 3, -1, 16 },
	{ 3, -1, 24 },
	{ 3, -1, 32 },
	{ 3, -1, 40 },
	{ -2, -1, 0 },
	{ -2, -1, 8 },
	{ -2, -1, 16 },
	{ 4, -1, 24 },
	{ 4, -1, 28 },
	{ 4, -1, 32 },
	{ 4, -1, 36 },
	{ 4, -1, 40 },
	{ 4, -1, 44 },
};

char __HspDataName[]="d3rotate\0"\
"d3vrotate\0"\
"d3setlocalmx\0"\
"d3setcamx\0"\
"d3vpos\0"\
"d3line\0"\
"d3arrow\0"\
"d3box\0"\
"d3circle\0"\
"d3mes\0"\
"d3createptc\0"\
"d3particlem\0"\
"d3particlemr\0"\
"d3square\0"\
"d3ribbonto\0"\
"d3texture\0"\
"d3timer\0"\
"d3getfps\0"\
;


/*-----------------------------------------------------------*/

void __HspInit( Hsp3r *hsp3 ) {
	hsp3->Reset( _HSP3CNV_MAXVAR, _HSP3CNV_MAXHPI );
	hsp3->SetDataName( __HspDataName );
	hsp3->SetFInfo( __HspFuncInfo, 504 );
	hsp3->SetLInfo( 0, 0 );
	hsp3->SetMInfo( __HspPrmInfo, 744 );
}

/*-----------------------------------------------------------*/

