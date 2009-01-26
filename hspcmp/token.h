
//
//	token.cpp structures
//
#ifndef __token_h
#define __token_h

// token type
#define TK_NONE 0
#define TK_OBJ 1
#define TK_STRING 2
#define TK_DNUM 3
#define TK_NUM 4
#define TK_CODE 6
#define TK_LABEL 7
#define TK_VOID 0x1000
#define TK_SEPARATE 0x1001
#define TK_EOL 0x1002
#define TK_EOF 0x1003
#define TK_ERROR -1
#define TK_CALCERROR -2
#define TK_CALCSTOP -3

#define DUMPMODE_RESCMD 3
#define DUMPMODE_DLLCMD 4
#define DUMPMODE_ALL 15

#define CMPMODE_PPOUT 1
#define CMPMODE_OPTCODE 2
#define CMPMODE_CASE 4
#define CMPMODE_OPTINFO 8
#define CMPMODE_PUTVARS 16

#define CG_FLAG_ENABLE 0
#define CG_FLAG_DISABLE 1

#define CG_LASTCMD_NONE 0
#define CG_LASTCMD_LET 1
#define CG_LASTCMD_CMD 2
#define CG_LASTCMD_CMDIF 3
#define CG_LASTCMD_CMDMIF 4
#define CG_LASTCMD_CMDELSE 5
#define CG_LASTCMD_CMDMELSE 6

#define CG_IFLEV_MAX 128
#define CG_REPLEV_MAX 128

// option for 'GetTokenCG'
#define GETTOKEN_DEFAULT 0
#define GETTOKEN_NOFLOAT 1		// '.'�������_�ƌ��Ȃ��Ȃ�(�����̂ݎ擾)
#define GETTOKEN_LABEL 2		// '*'�ɑ������O�����x���Ƃ��Ď擾

#define CG_LOCALSTRUCT_MAX 256

#define CG_IFCHECK_SCOPE 0
#define CG_IFCHECK_LINE 1

#define CG_LIBMODE_NONE -1
#define CG_LIBMODE_DLL 0
#define CG_LIBMODE_DLLNEW 1
#define CG_LIBMODE_COM 2
#define CG_LIBMODE_COMNEW 3

#define	CALCVAR double


// structure for CG calculation
struct CGVAR {
	int curtype;
	int minflag;
	int ival;
	double dval;
	int cnt;
	int ptr;
};

// line mode type
#define LMODE_ON 0
#define LMODE_STR 1
#define LMODE_COMMENT 2
#define LMODE_OFF 3

// macro default data storage
typedef struct MACDEF {
	int		index[32];				// offset to data
	char	data[1];
} MACDEF;

// module related define
#define OBJNAME_MAX 60
#define MODNAME_MAX 20

#define COMP_MODE_DEBUG 1
#define COMP_MODE_DEBUGWIN 2

#define HEDINFO_RUNTIME 0x1000		// runtime�w��p�̃w�b�_���

class CLabel;
class CMemBuf;
class CTagStack;
class CStrNote;
class AHTMODEL;

//  token analysis class
class CToken {
public:
	CToken();
	CToken( char *buf );
	~CToken();
	CLabel *GetLabelInfo( void );
	void SetLabelInfo( CLabel *lbinfo );

	void Error( char *mes );
	void LineError( char *mes, int line, char *fname );
	void SetError( char *mes );
	void Mes( char *mes );
	void Mesf( char *format, ...);
	void SetErrorBuf( CMemBuf *buf );
	void SetAHT( AHTMODEL *aht );
	void SetAHTBuffer( CMemBuf *aht );

	void ResetCompiler( void );
	int GetToken( void );
	int Calc( CALCVAR &val );
	char *CheckValidWord( void );

	//		For preprocess
	//
	int Preprocess( char *str );
	int PreprocessNM( char *str );
	void PreprocessCommentCheck( char *str );

	int ExpandLine( CMemBuf *buf, CMemBuf *src );
	int ExpandFile( CMemBuf *buf, char *fname, char *refname );
	void SetCommonPath( char *path );
	int SetAdditionMode( int mode );

	void SetLook( char *buf );
	char *GetLook( void );
	char *GetLookResult( void );
	int GetLookResultInt( void );
	int LabelRegist( char *list, int mode );
	int LabelRegist2( char *list );
	int LabelRegist3( char *list );
	int LabelDump( CMemBuf *out, int option );
	int GetLabelBufferSize( void );
	int RegistExtMacroPath( char *name, char *str );
	int RegistExtMacro( char *name, char *str );
	int RegistExtMacro( char *keyword, int val );
	void SetPackfileOut( CMemBuf *pack );
	int AddPackfile( char *name, int mode );


	//		For Code Generate
	//
	int GenerateCode( char *fname, char *oname, int mode );
	int GenerateCode( CMemBuf *srcbuf, char *oname, int mode );

	void PutCS( int type, int value, int exflg );
	int GetCS( void );
	void PutCS( int type, double value, int exflg );
	int PutOT( int value );
	int PutDS( char *str );
	int PutDS( char *str, int size );
	char *GetDS( int ptr );
	void SetOT( int id, int value );
	void PutDI( void );
	void PutDI( int dbg_code, int a, int subid );
	void PutDIVars( void );
	void PutHPI( short flag, short option, char *libname, char *funcname );
	int PutLIB( int flag, char *name );
	void SetLIBIID( int id, char *clsid );
	int PutStructParam( short mptype, int extype );
	int PutStructParamTag( void );
	void PutStructStart( void );
	int PutStructEnd( char *name, int libindex, int otindex, int funcflag );
	int PutStructEndDll( char *name, int libindex, int subid, int otindex );

	void CalcCG( int ex );

	int GetHeaderOption( void ) { return hed_option; }
	char *GetHeaderRuntimeName( void ) { return hed_runtime; }
	void SetHeaderOption( int opt, char *name ) { hed_option=opt; strcpy( hed_runtime, name ); }
	int GetCmpOption( void ) { return hed_cmpmode; }
	void SetCmpOption( int cmpmode ) { hed_cmpmode = cmpmode; }

private:
	//		For preprocess
	//
	void Pickstr( void );
	char *Pickstr2( char *str );
	void Calc_token( void );
	void Calc_factor( CALCVAR &v );
	void Calc_muldiv( CALCVAR &v );
	void Calc_addsub( CALCVAR &v );
	void Calc_bool( CALCVAR &v );
	void Calc_bool2( CALCVAR &v );
	void Calc_compare( CALCVAR &v );
	void Calc_start( CALCVAR &v );

	int PP_Define( void );
	int PP_Const( void );
	int PP_Enum( void );
	int PP_SwitchStart( int sw );
	int PP_SwitchEnd( void );
	int PP_SwitchReverse( void );
	int PP_Module( void );
	int PP_Global( void );
	int PP_Deffunc( int mode );
	int PP_Defcfunc( int mode );
	int PP_Struct( void );
	int PP_Func( char *name );
	int PP_Cmd( char *name );
	int PP_Pack( int mode );
	int PP_PackOpt( void );
	int PP_RuntimeOpt( void );
	int PP_CmpOpt( void );
	int PP_Usecom( void );
	int PP_Aht( void );
	int PP_Ahtout( void );
	int PP_Ahtmes( void );

	void SetModuleName( char *name );
	char *GetModuleName( void );
	void AddModuleName( char *str );
	void FixModuleName( char *str );
	int IsGlobalMode( void );
	int CheckModuleName( char *name );

	char *SkipLine( char *str, int *pline );
	char *ExpandStr( char *str, int opt );
	char *ExpandStrEx( char *str );
	char *ExpandStrComment( char *str, int opt );
	char *ExpandAhtStr( char *str );
	char *ExpandBin( char *str, int *val );
	char *ExpandHex( char *str, int *val );
	char *ExpandToken( char *str, int *type, int ppmode );
	int ExpandTokens( char *vp, CMemBuf *buf, int *lineext, int is_preprocess_line );
	char *SendLineBuf( char *str );
	char *SendLineBufPP( char *str, int *lines );
	int ReplaceLineBuf( char *str1, char *str2, char *repl, int macopt, MACDEF *macdef );


	//		For Code Generate
	//
	int GenerateCodeMain( CMemBuf *src );
	int GenerateCodeBlock( void );
	int GenerateCodeSub( void );
	void GenerateCodePP( char *buf );
	void GenerateCodeCMD( int id );
	void GenerateCodeLET( int id );
	void GenerateCodeVAR( int id, int ex );
	void GenerateCodePRM( void );
	void GenerateCodePRMN( void );
	int GenerateCodePRMF( void );
	void GenerateCodePRMF2( void );
	void GenerateCodePRMF3( void );
	int GenerateCodePRMF4( int t );
	void GenerateCodeMethod( void );
	void GenerateCodeLabel( char *name, int ex );

	void GenerateCodePP_regcmd( void );
	void GenerateCodePP_cmd( void );
	void GenerateCodePP_deffunc( void );
	void GenerateCodePP_defcfunc( void );
	void GenerateCodePP_uselib( void );
	void GenerateCodePP_module( void );
	void GenerateCodePP_struct( void );
	void GenerateCodePP_func( int deftype );
	void GenerateCodePP_usecom( void );
	void GenerateCodePP_comfunc( void );

	int GetParameterTypeCG( char *name );
	int GetParameterStructTypeCG( char *name );
	int GetParameterFuncTypeCG( char *name );
	int GetParameterResTypeCG( char *name );

	char *GetTokenCG( char *str, int option );
	char *GetTokenCG( int option );
	char *GetSymbolCG( char *str );
	char *GetLineCG( void );
	char *PickStringCG( char *str, int sep );
	char *PickStringCG2( char *str, char **strsrc );
	char *PickLongStringCG( char *str );
	int PickNextCodeCG( void );
	void CheckInternalCMD1( int opt );
	void CheckInternalProgCMD( int opt, int orgcs );
	void CheckInternalIF( int opt );
	void CheckCMDIF_Set( int mode );
	void CheckCMDIF_Fin( int mode );

	void CalcCG_token( void );
	void CalcCG_optimize( CGVAR &org, CGVAR &v, int mark );
	void CalcCG_regmark( int mark );
	void CalcCG_factor( CGVAR &v );
	void CalcCG_muldiv( CGVAR &v );
	void CalcCG_addsub( CGVAR &v );
	void CalcCG_shift( CGVAR &v );
	void CalcCG_bool( CGVAR &v );
	void CalcCG_compare( CGVAR &v );
	void CalcCG_start( CGVAR &v );


	//		Data
	//
	CLabel *lb;						// label object
	CLabel *tmp_lb;					// label object (preprocessor reference)
	CTagStack *tstack;				// tag stack object
	CMemBuf *errbuf;
	CMemBuf *wrtbuf;
	CMemBuf *packbuf;
	CMemBuf *ahtbuf;
	CStrNote *note;
	AHTMODEL *ahtmodel;				// AHT process data
	char common_path[HSP_MAX_PATH];	// common path
	char search_path[HSP_MAX_PATH];	// search path

	int line;
	int val;
	int ttype;						// last token type
	int texflag;
	char *lasttoken;				// last token point
	float val_f;
	double val_d;
	double fpbit;
	unsigned char *wp;
	unsigned char s2[1024];
	unsigned char *s3;
	char linebuf[0x8000];			// Line expand buffer
	char linetmp[0x8000];			// Line expand temp
	char errtmp[128];				// temp for error message
	char mestmp[128];				// meseage temp
	int incinf;						// include level
	int mulstr;						// multiline string flag
	short swstack[32];				// generator sw stack (flag)
	short swstack2[32];				// generator sw stack (mode)
	short swstack3[32];				// generator sw stack (sw)
	int swsp;						// generator sw stack pointer
	int swmode;						// generator sw mode (0=if/1=else)
	int swlevel;					// first stack level ( when off )
	int fileadd;					// File Addition Mode (1=on)
	int swflag;						// generator sw enable flag
	char *ahtkeyword;				// keyword for AHT

	char modname[MODNAME_MAX+2];	// Module Name Prefix
	int	modgc;						// Global counter for Module
	int enumgc;						// Global counter for Enum

	//		for CodeGenerator
	//
	int cg_flag;
	int cg_debug;
	int cg_iflev;
	int cg_valcnt;
	int cg_typecnt;
	int cg_pptype;
	int cg_locallabel;
	int cg_varhpi;
	int cg_putvars;
	char *cg_ptr;
	char *cg_str;
	unsigned char *cg_wp;
	char cg_libname[1024];

	int	replev;
	int repend[CG_REPLEV_MAX];
	int iflev;
	int iftype[CG_IFLEV_MAX];
	int ifmode[CG_IFLEV_MAX];
	int ifscope[CG_IFLEV_MAX];
	int ifptr[CG_IFLEV_MAX];
	int ifterm[CG_IFLEV_MAX];

	int cg_lastcmd;
	int cg_lasttype;
	int cg_lastval;
	int cg_lastcs;

	CMemBuf *cs_buf;
	CMemBuf *ds_buf;
	CMemBuf *ot_buf;
	CMemBuf *di_buf;

	CMemBuf *li_buf;
	CMemBuf *fi_buf;
	CMemBuf *mi_buf;
	CMemBuf *fi2_buf;
	CMemBuf *hpi_buf;

	//		for Header info
	int hed_option;
	char hed_runtime[64];
	int hed_cmpmode;

	//		for Struct
	int	cg_stnum;
	int	cg_stsize;
	int cg_stptr;
	int cg_libindex;
	int cg_libmode;
	int cg_localstruct[CG_LOCALSTRUCT_MAX];
	int cg_localcur;

	//		for Error
	//
	int cg_errline;
	int cg_orgline;
	char cg_orgfile[256];
};


#endif
