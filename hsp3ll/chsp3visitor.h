
//
//	CHsp3.cpp structures
//
#ifndef __CHsp3Visitor_h
#define __CHsp3Visitor_h


#include "../hsp3/hsp3config.h"
#include "../hsp3/hsp3debug.h"
#include "../hsp3/hsp3struct.h"
#include "../hspcmp/localinfo.h"
#include "../hspcmp/label.h"
#include "membuf.h"
#include "csstack.h"
#include "supio.h"

class CHsp3;


class IHsp3Visitor {
protected:
	CHsp3 * const hsp3;
public:
	IHsp3Visitor(CHsp3* const hsp3) : hsp3(hsp3) {}
	virtual ~IHsp3Visitor() = 0;

	virtual void visitObjectInfo(char* orgname, int codeSize, int dataSize, int objectTempSize, int lInfoCount, int fInfoCount, int mInfoCount){}
	virtual void visitObjectInfoEnd(){}

	virtual void visitLInfo(int i, int max, LIBDAT *lib){}
	virtual void visitFInfo(int i, int max, STRUCTDAT *fnc){}

	virtual void visitEndIf(){}
};

class CHsp3OutVisitor : public IHsp3Visitor {
protected:
	CMemBuf *out;

	int indent;

	//		Data Output
	//
	void OutMes( char *format, ... );
	void OutLine( char *format, ... );
	void OutLineBuf( CMemBuf *outbuf, char *format, ... );
	void OutCR( void );
public:
	CHsp3OutVisitor(CHsp3* const hsp3, CMemBuf *out);
	void SetIndent( int val );
};

class CHsp3VisitorCpp : public CHsp3OutVisitor {
public:
	CHsp3VisitorCpp(CHsp3* const hsp3, CMemBuf *out);

};

class CHsp3Visitor : public CHsp3OutVisitor {
public:
	CHsp3Visitor(CHsp3* const hsp3, CMemBuf *out);

	void visitObjectInfo(char* orgname, int codeSize, int dataSize, int objectTempSize, int lInfoCount, int fInfoCount, int mInfoCount);
	void visitObjectInfoEnd();

	void visitLInfo(int i, int max, LIBDAT *lib);
	void visitFInfo(int i, int max, STRUCTDAT *fnc);

	void visitEndIf();
};

#endif
