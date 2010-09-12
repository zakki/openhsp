#include <stdio.h>
#include <stdarg.h>
#include <windows.h>
#include "supio.h"
#include "chsp3visitor.h"
#include "chsp3.h"
#include "chsp3cpp.h"


IHsp3Visitor::~IHsp3Visitor()
{
}

CHsp3OutVisitor::CHsp3OutVisitor(CHsp3* hsp3, CMemBuf *out) : IHsp3Visitor(hsp3), out(out)
{
}

void CHsp3OutVisitor::OutMes( const char *format, ... )
{
	//		outbufに文字列を出力(printf互換)(4096文字まで)
	//
	char textbf[4096];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);
	out->PutStr( textbf );
}


void CHsp3OutVisitor::OutLine( const char *format, ... )
{
	//		outbufに文字列を出力(printf互換)(4096文字まで)
	//
	char textbf[4096];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);

	for(int i=0;i<=indent;i++) { out->PutStr("\t"); }
	out->PutStr( textbf );
}


void CHsp3OutVisitor::OutLineBuf( CMemBuf *outbuf, char *format, ... )
{
	//		outbufに文字列を出力(printf互換)(4096文字まで)
	//
	char textbf[4096];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);

	for(int i=0;i<=indent;i++) { outbuf->PutStr("\t"); }
	outbuf->PutStr( textbf );
}


void CHsp3OutVisitor::OutCR( void )
{
	out->PutCR();
}


void CHsp3OutVisitor::SetIndent( int val )
{
	indent = val;
}
/////////////////////////////////////

CHsp3VisitorCpp::CHsp3VisitorCpp(CHsp3* hsp3, CMemBuf *out) : CHsp3OutVisitor(hsp3, out)
{
}

void CHsp3VisitorCpp::visitObjectInfo(char* orgname, int codeSize, int dataSize, int objectTempSize, int lInfoCount, int fInfoCount, int mInfoCount) {	
	OutMes( "//\r\n//\thsp3cnv generated source\r\n//\t[%s]\r\n//\r\n", orgname );
}

void CHsp3VisitorCpp::visitHead(HSPHED * const hsphed, CLocalInfo &localinfo) {
	OutMes( "#include \"hsp3r.h\"\r\n" );
	OutMes( "\r\n#define _HSP3CNV_DATE %s\n#define _HSP3CNV_TIME %s\r\n", localinfo.CurrentDate(), localinfo.CurrentTime() );
	OutMes( "#define _HSP3CNV_MAXVAR %d\r\n", hsphed->max_val );
	OutMes( "#define _HSP3CNV_MAXHPI %d\r\n", hsphed->max_hpi );
	OutMes( "#define _HSP3CNV_VERSION 0x%x\r\n", hsphed->version );
	OutMes( "#define _HSP3CNV_BOOTOPT %d\r\n", hsphed->bootoption );
	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );

	int maxvar = hsphed->max_val;
	for(int i=0;i<maxvar;i++) {
		OutMes( "static PVal *%s%s;\r\n", CPPHED_HSPVAR, hsp3->GetHSPVarName(i).c_str(), i );
	}

	OutMes( "\r\n/*-----------------------------------------------------------*/\r\n\r\n" );
}

/////////////////////////////////////

CHsp3Visitor::CHsp3Visitor(CHsp3* hsp3, CMemBuf *out) : CHsp3OutVisitor(hsp3, out) {
}

void CHsp3Visitor::visitObjectInfo(char* orgname, int codeSize, int dataSize, int objectTempSize, int lInfoCount, int fInfoCount, int mInfoCount) {
	char mes[512];
	
	sprintf( mes,"Original File : %s\n", orgname );
	out->PutStr( mes );
	sprintf( mes,"Code Segment Size : %d\n", codeSize );
	out->PutStr( mes );
	sprintf( mes,"Data Segment Size : %d\n", dataSize );
	out->PutStr( mes );
	sprintf( mes,"Object Temp Size : %d\n", objectTempSize );
	out->PutStr( mes );
	sprintf( mes,"LibInfo(%d) FInfo(%d) MInfo(%d)\n", lInfoCount, fInfoCount, mInfoCount );
	out->PutStr( mes );
	
	out->PutStr( "--------------------------------------------\n" );
}

void CHsp3Visitor::visitObjectInfoEnd()
{
	out->PutStr( "--------------------------------------------\n" );
}

void CHsp3Visitor::visitLInfo(int i, int max, LIBDAT *lib)
{
	//	LInfoの表示(DLLインポート情報)
	char mes[512];
	sprintf( mes,"LInfo#%d : flag=%x name=%s clsid=%x\n", i, lib->flag, hsp3->GetDS(lib->nameidx), lib->clsid );
	out->PutStr( mes );
}

void CHsp3Visitor::visitFInfo(int i, int max, STRUCTDAT *fnc)
{
	//	FInfoの表示(拡張命令情報)
	char mes[512];;
	const char *p;
	if ( fnc->nameidx < 0 )
		p = "";
	else
		p = hsp3->GetDS( fnc->nameidx );
	sprintf( mes,"FInfo#%d : index=%d ot=%d subid=%d name=%s param=%d\n", i, fnc->index, fnc->otindex, fnc->subid, p, fnc->prmmax );
	out->PutStr( mes );
}

void CHsp3Visitor::visitEndIf()
{
	out->PutStr( "endif\n" );
}

