#pragma once

#include "hsp3r.h"
#include <math.h>
#include <memory>
#include <string>

void code_msgfunc();

namespace hsp {
	
	class Var {
	public:
		PVal* pval;
		Var() {
			pval = new PVal();
			pval->mode = HSPVAR_MODE_NONE;
			pval->flag = HSPVAR_FLAG_INT;				// ‰¼‚ÌŒ^
			HspVarCoreClear(pval, HSPVAR_FLAG_INT);	// ƒOƒ[ƒoƒ‹•Ï”‚ð0‚ÉƒŠƒZƒbƒg
		}
		explicit Var(int n) {
			Var();
			PushInt(n);
			VarSet(pval, 0);
		}
		explicit Var(double n) {
			Var();
			PushDouble(n);
			VarSet(pval, 0);
		}
		~Var() {
			HspVarCoreDispose(pval);
			delete pval;
		}

		int getInt() const {
			if (pval->flag != HSPVAR_FLAG_INT) { throw HSPERR_TYPE_MISMATCH; }
			return *(int *)(pval->pt);
		}
		double getDouble() const {
			if (pval->flag != HSPVAR_FLAG_DOUBLE) { throw HSPERR_TYPE_MISMATCH; }
			return *(double *)(pval->pt);
		}
		std::string getStr() const {
			if (pval->flag != HSPVAR_FLAG_STR) { throw HSPERR_TYPE_MISMATCH; }
			return pval->pt;

		}
	};

	/*
	Var operator"" _h(long double a)
	{
		return Var((double)a);
	}
	Var operator"" _h(unsigned long long a)
	{
		return Var((int)a);
	}
	*/

	class Runtime {
	public:
		int popInt() {
			Var r;
			VarSet(r.pval, 0);
			return r.getInt();
		}
		double popDouble() {
			Var r;
			VarSet(r.pval, 0);
			return r.getDouble();
		}
		std::string popStr() {
			Var r;
			VarSet(r.pval, 0);
			return r.getStr();
		}

		void randomize() {
			Intcmd(39, 0);
		}
		int rnd(int p1) {
			PushFuncEnd();
			PushInt(p1);
			PushIntfunc(1, 1);
			return popInt();
		}
		void font(const char* p1, int p2) {

		}
		void stick(int& p1, int p2 = 0, int p3 = 1) {
			Var r;
			PushInt(p3);
			PushInt(p2);
			PushVAP(r.pval, 0);
			Extcmd(52, 3);
			p1 = r.getInt();
		}
		int mousex() {
			PushFuncEnd();
			PushExtvar(0, 0);
			return popInt();
		}
		int mousey() {
			PushFuncEnd();
			PushExtvar(1, 0);
			return popInt();
		}
		int mousew() {
			PushFuncEnd();
			PushExtvar(2, 0);
			return popInt();
		}
		int stat() {
			PushSysvar(3, 0);
			return popInt();
		}
		std::string refstr() {
			PushSysvar(12, 0);
			return popStr();
		}
		double sin(double p1) {
			return ::sin(p1);
		}
		double cos(double p1) {
			return ::cos(p1);
		}
		double sqrt(double p1) {
			return ::sqrt(p1);
		}
		double limitf(double p1, double p2, double p3) {
			PushFuncEnd();
			PushDouble(p3);
			PushDouble(p2);
			PushDouble(p1);
			PushIntfunc(393, 3);
			return popDouble();
		}
		void pos(int p1, int p2) {
			PushInt(p2);
			PushInt(p1);
			Extcmd(17, 2);
		}
		void mes(const char* p1) {
			PushStr(const_cast<char*>(p1));
			Extcmd(15, 1);
		}
		void dialog(const char* p1, int p2) {
			PushInt(p2);
			PushStr(const_cast<char*>(p1));
			Extcmd(3, 2);
		}
		void bmpsave(const char* p1) {
			PushStr(const_cast<char*>(p1));
			Extcmd(33, 1);
		}
		int gettime(int p1) {
			PushFuncEnd();
			PushInt(p1);
			PushIntfunc(8, 1);
			return popInt();
		}
		void await(int p1) {
			code_msgfunc();
			PushInt(p1);
			Prgcmd(8, 1);
			code_msgfunc();
		}
		void boxf(int p1 = 0, int p2 = 0) {
			PushInt(p2);
			PushInt(p1);
			Extcmd(49, 2);
		}
		void boxf(int p1, int p2, int p3, int p4) {
			PushInt(p4);
			PushInt(p3);
			PushInt(p2);
			PushInt(p1);
			Extcmd(49, 4);

		}
		void color(int p1 = 0, int p2 = 0, int p3 = 0) {
			PushInt(p3);
			PushInt(p2);
			PushInt(p1);
			Extcmd(24, 3);
		}
		void redraw(int p1) {
			PushInt(p1);
			Extcmd(27, 1);
		}
		std::shared_ptr<Var> ginfo(int p1) {
			PushFuncEnd();
			PushInt(p1);
			PushExtvar(256, 1);
			auto r = std::make_shared<Var>();
			VarSet(r->pval, 0);
			return r;
		}
		void getkey(int& p1, int p2) {
			Var r;
			PushInt(p2);
			PushVAP(r.pval, 0);
			Extcmd(35, 2);
			p1 = r.getInt();
		}
	};

	extern Runtime rt;
	
}
#define msgothic "‚l‚r ƒSƒVƒbƒN"
#define msmincho "‚l‚r –¾’©"
	
#define ginfo_mx hsp::rt.ginfo(0)
#define ginfo_my hsp::rt.ginfo(1)
#define ginfo_act hsp::rt.ginfo(2)
#define ginfo_sel hsp::rt.ginfo(3)
#define ginfo_wx1 hsp::rt.ginfo(4)
#define ginfo_wy1 hsp::rt.ginfo(5)
#define ginfo_wx2 hsp::rt.ginfo(6)
#define ginfo_wy2 hsp::rt.ginfo(7)
#define ginfo_vx hsp::rt.ginfo(8)
#define ginfo_vy hsp::rt.ginfo(9)
#define ginfo_sizex hsp::rt.ginfo(10)
#define ginfo_sizey hsp::rt.ginfo(11)
#define ginfo_winx hsp::rt.ginfo(12)
#define ginfo_winy hsp::rt.ginfo(13)
#define ginfo_mesx hsp::rt.ginfo(14)
#define ginfo_mesy hsp::rt.ginfo(15)
#define ginfo_r hsp::rt.ginfo(16)
#define ginfo_g hsp::rt.ginfo(17)
#define ginfo_b hsp::rt.ginfo(18)
#define ginfo_paluse hsp::rt.ginfo(19)
#define ginfo_dispx hsp::rt.ginfo(20)
#define ginfo_dispy hsp::rt.ginfo(21)
#define ginfo_cx hsp::rt.ginfo(22)
#define ginfo_cy hsp::rt.ginfo(23)
#define global ginfo_intid hsp::rt.ginfo(24)
#define ginfo_newid hsp::rt.ginfo(25)
#define ginfo_sx hsp::rt.ginfo(26)
#define ginfo_sy hsp::rt.ginfo(27)
