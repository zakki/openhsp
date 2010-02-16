
//
//		HSP3.0 plugin sample
//		onion software/onitama 2005/5
//

#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include "../hpi3sample/hsp3plugin.h"

#include "czhttp.h"
#include "czcrypt.h"

#include "cJSON.h"
#include "nkf/nkf32.h"

/*----------------------------------------------------------------*/

static CzHttp *http;

#define NKFBUF_DEFAULTSIZE 0x8000

static	char *nkfbuf = NULL;	// nkf�ϊ��o�b�t�@
static	int	nkfsize;			// nkf�ϊ��o�b�t�@�T�C�Y
static	char json_nkfopt[128];	// �擾����nkf�ϊ�
static	char json_nkfopt2[128];	// �ݒ莞��nkf�ϊ�

/*------------------------------------------------------------*/
/*
		nkf related interface
*/
/*------------------------------------------------------------*/

static void termNkfBuf( void )
{
	if ( nkfbuf != NULL ) {
		free( nkfbuf );
		nkfbuf = NULL;
		nkfsize = 0;
	}
}

static void initNkfBuf( int size )
{
	termNkfBuf();
	nkfbuf = (char *)malloc( size );
	nkfsize = size;
}

static int cnvNkf( char *srcbuf, int insize, int outsize, char *opt )
{
	int size, bufsize, ressize;
	bufsize = outsize;
	if ( bufsize <= 0 ) bufsize = NKFBUF_DEFAULTSIZE;
	if ( bufsize > nkfsize ) {
		initNkfBuf( bufsize );
	}
	SetNkfOption( opt );
	size = insize;
	if ( size < 0 ) size = strlen( srcbuf );
	NkfConvertSafe( nkfbuf, bufsize, (LPDWORD)&ressize, srcbuf, size );
	return ressize;
}

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

int WINAPI DllMain (HINSTANCE hInstance, DWORD fdwReason, PVOID pvReserved)
{
	if ( fdwReason==DLL_PROCESS_ATTACH ) {
		http = NULL;
		json_nkfopt[0] = 0;
		json_nkfopt2[0] = 0;
		initNkfBuf( NKFBUF_DEFAULTSIZE );
	}
	if ( fdwReason==DLL_PROCESS_DETACH ) {
		termNkfBuf();
		if ( http != NULL ) { delete http; http = NULL; }
	}
	return TRUE ;
}

 /*------------------------------------------------------------*/
/*
		controller
*/
/*------------------------------------------------------------*/

EXPORT BOOL WINAPI netinit( int p1, int p2, int p3, int p4 )
{
	//	(type$00)
	http = new CzHttp;
	if ( http->GetMode() != CZHTTP_MODE_READY ) {
		delete http; http = NULL;
		return -1;
	}
	return 0;
}


EXPORT BOOL WINAPI netterm( int p1, int p2, int p3, int p4 )
{
	//	(type$00)
	if ( http != NULL ) { delete http; http = NULL; }
	return 0;
}


EXPORT BOOL WINAPI netexec( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	PVal *pv;
	APTR ap;
	int res;

	res = -1;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�

	if ( http != NULL ) {
		res = http->Exec();
	}

	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &res );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI netmode( int *p1, int p2, int p3, int p4 )
{
	//	(type$01)
	*p1 = -1;
	if ( http == NULL ) return -1;
	*p1 = http->GetMode();
	return 0;
}


EXPORT BOOL WINAPI netsize( int *p1, int p2, int p3, int p4 )
{
	//	(type$01)
	*p1 = -1;
	if ( http == NULL ) return -1;
	*p1 = http->GetSize();
	return 0;
}


EXPORT BOOL WINAPI neturl( BMSCR *p1, char *p2, int p3, int p4 )
{
	//	(type$06)
	if ( http == NULL ) return -1;
	http->SetURL( p2 );
	return 0;
}


EXPORT BOOL WINAPI netdlname( BMSCR *p1, char *p2, int p3, int p4 )
{
	//	(type$06)
	if ( http == NULL ) return -1;
	http->SetLocalName( p2 );
	return 0;
}


EXPORT BOOL WINAPI netproxy( BMSCR *p1, char *p2, int p3, int p4 )
{
	//	(type$06)
	if ( http == NULL ) return -1;
	http->SetProxy( p2, p3, p4 );
	return 0;
}


EXPORT BOOL WINAPI netagent( BMSCR *p1, char *p2, int p3, int p4 )
{
	//	(type$06)
	if ( http == NULL ) return -1;
	http->SetAgent( p2 );
	return 0;
}


EXPORT BOOL WINAPI netheader( BMSCR *p1, char *p2, int p3, int p4 )
{
	//	(type$06)
	if ( http == NULL ) return -1;
	http->SetHeader( p2 );
	return 0;
}


EXPORT BOOL WINAPI netrequest( BMSCR *p1, char *p2, int p3, int p4 )
{
	//	(type$06)
	if ( http == NULL ) return -1;
	http->RequestFile( p2 );
	return 0;
}


EXPORT BOOL WINAPI netfileinfo( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�G���[������𓾂�
	//	(�ϐ��ɃG���[���������)
	//		neterror �ϐ�
	//
	PVal *pv;
	APTR ap;
	char *ss;
	char *res;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_gets();			// �p�����[�^2:������

	if ( http == NULL ) return -1;
	res = http->RequestFileInfo( ss );
	if ( res == NULL ) return -1;

	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, res );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI neterror( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�G���[������𓾂�
	//	(�ϐ��ɃG���[���������)
	//		neterror �ϐ�
	//
	PVal *pv;
	APTR ap;
	char *ss;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	if ( http == NULL ) return -1;
	ss = http->GetError();
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, ss );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI filecrc( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�t�@�C����CRC�����߂�
	//	(�ϐ���CRC32�Astrsize�Ƀt�@�C���T�C�Y����)
	//		filecrc �ϐ�, �t�@�C����
	//
	PVal *pv;
	APTR ap;
	char fname[_MAX_PATH];
	char *ss;
	int i;
	int num;
	CzCrypt crypt;
	HSPCTX *ctx;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	strncpy( fname, ss, _MAX_PATH );
	i = crypt.DataLoad( fname );
	if ( i ) return -1;

	ctx = hei->hspctx;

	num = crypt.GetCRC32();
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &num );	// �ϐ��ɒl����
	ctx->strsize = crypt.GetSize();

	return 0;
}


EXPORT BOOL WINAPI filemd5( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�t�@�C����MD5�����߂�
	//	(�ϐ���MD5������Astrsize�Ƀt�@�C���T�C�Y����)
	//		filemd5 �ϐ�, �t�@�C����
	//
	PVal *pv;
	APTR ap;
	char fname[_MAX_PATH];
	char *ss;
	int i;
	char md5str[ 128 ];
	CzCrypt crypt;
	HSPCTX *ctx;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	strncpy( fname, ss, _MAX_PATH );
	i = crypt.DataLoad( fname );
	if ( i ) return -1;

	ctx = hei->hspctx;

	crypt.GetMD5( md5str );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, md5str );	// �ϐ��ɒl����
	ctx->strsize = crypt.GetSize();

	return 0;
}

/*----------------------------------------------------------------*/


EXPORT BOOL WINAPI ftpresult( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	FTP�T�[�o�[�ԐM������𓾂�
	//	(�ϐ��ɕ��������)
	//		ftpresult �ϐ�
	//
	PVal *pv;
	APTR ap;
	char *ss;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	if ( http == NULL ) return -1;
	ss = http->GetTempBuffer();
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, ss );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI ftpopen( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�ڑ�
	//		ftpopen "�A�h���X","���[�U�[","�p�X���[�h",port
	//
	int i;
	char *ss;
	int _p1;
	ss = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	http->SetURL( ss );
	ss = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	http->SetUserName( ss );
	ss = hei->HspFunc_prm_gets();			// �p�����[�^3:������
	http->SetUserPassword( ss );
	_p1 = hei->HspFunc_prm_getdi(INTERNET_DEFAULT_FTP_PORT);		// �p�����[�^4:�����l
	http->SetFtpPort( _p1 );
	i = http->FtpConnect();
	return i;
}


EXPORT BOOL WINAPI ftpclose( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�ؒf
	//		ftpclose
	//
	http->FtpDisconnect();
	return 0;
}


EXPORT BOOL WINAPI ftpdir( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	FTP�T�[�o�[�f�B���N�g���𓾂�
	//	(�ϐ��ɕ��������)
	//		ftpdir �ϐ�,�ύXdir
	//
	PVal *pv;
	APTR ap;
	char *ss;
	char *n;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	n = hei->HspFunc_prm_getds("");		// �p�����[�^2:������
	if ( http == NULL ) return -1;

	if ( *n != 0 ) {
		http->SetFtpDir( n );
	}
	ss = http->GetFtpCurrentDir();
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, ss );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI ftpdirlist( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�t�@�C�����X�g
	//		ftpdirlist
	//
	http->GetFtpDirList();
	return 0;
}


EXPORT BOOL WINAPI ftpdirlist2( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�t�@�C�����X�g�擾
	//		ftpdirlist2 �ϐ�
	//
	PVal *pv;
	APTR ap;
	char *ss;
	int i;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	if ( http == NULL ) return -1;

	i = http->GetMode();
	if ( i == CZHTTP_MODE_FTPDIR ) return -3;
	if ( i != CZHTTP_MODE_FTPREADY ) return -2;

	ss = http->GetFlexBuffer();
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, ss );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI ftpcmd( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�R�}���h(���ʂ�ftpdirlist2�Ŏ擾����)
	//		ftpcmd "command"
	//
	char *ss;
	ss = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	return http->FtpSendCommand( ss );
}


EXPORT BOOL WINAPI ftprmdir( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�f�B���N�g���폜
	//		ftprmdir "name"
	//
	char *ss;
	ss = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	return http->KillFtpDir( ss );
}


EXPORT BOOL WINAPI ftpmkdir( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�f�B���N�g���쐬
	//		ftpmkdir "name"
	//
	char *ss;
	ss = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	return http->MakeFtpDir( ss );
}


EXPORT BOOL WINAPI ftpget( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�t�@�C���擾
	//		ftpget "name","localname",mode
	//
	char name[256];
	char *ss;
	int _p1;
	ss = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	strncpy( name, ss, 255 );
	ss = hei->HspFunc_prm_getds(name);		// �p�����[�^2:������
	_p1 = hei->HspFunc_prm_getdi(0);		// �p�����[�^3:�����l
	return http->GetFtpFile( name, ss, _p1 );
}


EXPORT BOOL WINAPI ftpput( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�t�@�C�����M
	//		ftpput "name","localname",mode
	//
	char name[256];
	char *ss;
	int _p1;
	ss = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	strncpy( name, ss, 255 );
	ss = hei->HspFunc_prm_getds(name);		// �p�����[�^2:������
	_p1 = hei->HspFunc_prm_getdi(0);		// �p�����[�^3:�����l
	return http->PutFtpFile( name, ss, _p1 );
}


EXPORT BOOL WINAPI ftprename( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�t�@�C�����l�[��
	//		ftpput "name","newname"
	//
	char name[256];
	char *ss;
	ss = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	strncpy( name, ss, 255 );
	ss = hei->HspFunc_prm_getds(name);		// �p�����[�^2:������
	return http->RenameFtpFile( name, ss );
}


EXPORT BOOL WINAPI ftpdelete( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		FTP�t�@�C���폜
	//		ftpdelete "name"
	//
	char *ss;
	ss = hei->HspFunc_prm_gets();			// �p�����[�^1:������
	return http->RenameFtpFile( ss, NULL );
}


EXPORT BOOL WINAPI fencode( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		�t�@�C���Í���
	//		fencode "srcfile","newfile",seed1,seed2
	//
	int i;
	CzCrypt crypt;
	HSPCTX *ctx;
	char *ss;
	char fname1[_MAX_PATH];
	char fname2[_MAX_PATH];
	int seed1,seed2;

	ss = hei->HspFunc_prm_gets();				// �p�����[�^1:������
	strncpy( fname1, ss, _MAX_PATH -1 );
	ss = hei->HspFunc_prm_gets();				// �p�����[�^2:������
	strncpy( fname2, ss, _MAX_PATH -1 );
	seed1 = hei->HspFunc_prm_getdi(0);			// �p�����[�^3:�����l
	seed2 = hei->HspFunc_prm_getdi(0);			// �p�����[�^4:�����l

	ctx = hei->hspctx;
	i = crypt.DataLoad( fname1 );
	if ( i ) return -1;

	crypt.SetSeed( seed1, seed2 );
	crypt.Encrypt();
	i = crypt.DataSave( fname2 );
	if ( i ) return -1;

	ctx->strsize = crypt.GetSize();
	return 0;
}


EXPORT BOOL WINAPI fdecode( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		�t�@�C��������
	//		fdecode "srcfile","newfile",seed1,seed2
	//
	int i;
	CzCrypt crypt;
	HSPCTX *ctx;
	char *ss;
	char fname1[_MAX_PATH];
	char fname2[_MAX_PATH];
	int seed1,seed2;

	ss = hei->HspFunc_prm_gets();				// �p�����[�^1:������
	strncpy( fname1, ss, _MAX_PATH -1 );
	ss = hei->HspFunc_prm_gets();				// �p�����[�^2:������
	strncpy( fname2, ss, _MAX_PATH -1 );
	seed1 = hei->HspFunc_prm_getdi(0);			// �p�����[�^3:�����l
	seed2 = hei->HspFunc_prm_getdi(0);			// �p�����[�^4:�����l

	ctx = hei->hspctx;
	i = crypt.DataLoad( fname1 );
	if ( i ) return -1;

	crypt.SetSeed( seed1, seed2 );
	crypt.Decrypt();
	i = crypt.DataSave( fname2 );
	if ( i ) return -1;

	ctx->strsize = crypt.GetSize();
	return 0;
}


/*------------------------------------------------------------------------------------*/


EXPORT BOOL WINAPI netgetv( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		�擾�f�[�^�𕶎���Ƃ��ĕϐ��ɑ������
	//		netgetv �ϐ�
	//
	PVal *pv;
	APTR ap;
	char *ss;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�

	if ( http == NULL ) return -1;

	//http->SetVarRequestGet( ss );
	ss = http->getVarData();
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, ss );	// �ϐ��ɒl����
	return -http->getVarSize();
}


EXPORT BOOL WINAPI netrequest_get( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		�t�@�C���f�[�^���������Ɏ擾����(netgetv�Ŏ擾)
	//		netrequest_get "path"
	//
	char *ss;

	ss = hei->HspFunc_prm_gets();				// �p�����[�^1:������

	if ( http == NULL ) return -1;

	http->SetVarRequestGet( ss );
	return 0;
}


EXPORT BOOL WINAPI netrequest_post( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		�t�@�C���f�[�^���������Ɏ擾����(netgetv�Ŏ擾)
	//		netrequest_post "path",var"
	//
	char *ss;
	char *ap;
	ss = hei->HspFunc_prm_gets();					// �p�����[�^1:������
	ap = (char *)hei->HspFunc_prm_getv();			// �p�����[�^2:�ϐ�

	if ( http == NULL ) return -1;

	http->SetVarRequestPost( ss, ap );
	return 0;
}


/*------------------------------------------------------------------------------------*/

EXPORT BOOL WINAPI varmd5( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�ϐ��o�b�t�@�̓��e����MD5�����߂�
	//	(�ϐ���MD5���������)
	//		varmd5 �ϐ�, �o�b�t�@�ϐ�, �T�C�Y
	//
	PVal *pv;
	APTR ap;
	int size;
	char md5str[ 128 ];
	CzCrypt crypt;
	char *vptr;

	ap = hei->HspFunc_prm_getva( &pv );			// �p�����[�^1:�ϐ�
	vptr = (char *)hei->HspFunc_prm_getv();		// �p�����[�^2:�ϐ�
	size = hei->HspFunc_prm_getdi(0);			// �p�����[�^3:�����l

	crypt.GetMD5ext( md5str, vptr, size );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, md5str );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI b64encode( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�ϐ��o�b�t�@�̓��e��BASE64�ɃG���R�[�h����
	//	(�ϐ���BASE64���������)
	//		b64encode �ϐ�, �o�b�t�@�ϐ�, �T�C�Y
	//
	PVal *pv;
	APTR ap;
	int size;
	CzCrypt crypt;
	char *dst;
	char *vptr;

	ap = hei->HspFunc_prm_getva( &pv );			// �p�����[�^1:�ϐ�
	vptr = (char *)hei->HspFunc_prm_getv();		// �p�����[�^2:�ϐ�
	size = hei->HspFunc_prm_getdi(-1);			// �p�����[�^3:�����l

	if ( size < 0 ) size = (int)strlen(vptr);
	dst = (char*)malloc( crypt.GetBASE64Size( size ) + 1 );
	crypt.EncodeBASE64( dst, vptr, size );

	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, dst );	// �ϐ��ɒl����
	free( dst );

	return 0;
}


EXPORT BOOL WINAPI b64decode( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�ϐ��o�b�t�@��BASE64��������f�R�[�h����
	//	(�ϐ��ɕϊ��㕶�������)
	//		b64decode �ϐ�, �o�b�t�@�ϐ�, �T�C�Y
	//
	int size;
	CzCrypt crypt;
	char *vptr;
	char *dstptr;

	dstptr = (char *)hei->HspFunc_prm_getv();	// �p�����[�^1:�ϐ�
	vptr = (char *)hei->HspFunc_prm_getv();		// �p�����[�^2:�ϐ�
	size = hei->HspFunc_prm_getdi(-1);			// �p�����[�^3:�����l

	if ( size < 0 ) size = (int)strlen(vptr);
	crypt.DecodeBASE64( dstptr, vptr, size );
	return 0;
}


EXPORT BOOL WINAPI rc4encode( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�ϐ��o�b�t�@��BASE64��������f�R�[�h����
	//	(�ϐ��ɕϊ��㕶�������)
	//		rc4encode �o�b�t�@�ϐ�, �L�[
	//
	CzCrypt crypt;
	char *dstptr;
	char *ss;
	int size;

	dstptr = (char *)hei->HspFunc_prm_getv();	// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_gets();				// �p�����[�^2:������
	size = hei->HspFunc_prm_getdi(-1);			// �p�����[�^3:�����l
	crypt.EncodeRC4( dstptr, ss, size );
	return 0;
}


EXPORT BOOL WINAPI urlencode( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�������URL�G���R�[�h����
	//	(�ϐ��ɕϊ��㕶�������)
	//		urlencode �ϐ�, "������"
	//
	char *ss;
	PVal *pv;
	APTR ap;
	char urltmp[4096];

	ap = hei->HspFunc_prm_getva( &pv );			// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_gets();				// �p�����[�^2:������
	http->UrlEncode( urltmp, 4096, ss );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, urltmp );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI urldecode( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	�������URL�f�R�[�h����
	//	(�ϐ��ɕϊ��㕶�������)
	//		urldecode �ϐ�, "������"
	//
	char *ss;
	PVal *pv;
	APTR ap;
	char urltmp[4096];

	ap = hei->HspFunc_prm_getva( &pv );			// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_gets();				// �p�����[�^2:������
	http->UrlDecode( urltmp, 4096, ss );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, urltmp );	// �ϐ��ɒl����
	return 0;
}


/*------------------------------------------------------------------------------------*/

static	cJSON *json = NULL;

EXPORT BOOL WINAPI jsonopen( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		JSON�`�����J��
	//		jsonopen �ϐ�,�o�b�t�@�ϐ�
	//
	char *ptr;
	PVal *pv;
	APTR ap;
	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ptr = (char *)hei->HspFunc_prm_getv();	// �p�����[�^2:�ϐ�

	if ( json != NULL ) {
		cJSON_Delete( json );
	}

	json = cJSON_Parse(ptr);
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &json );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI jsonclose( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		JSON�`�������
	//		jsonclose
	//
	cJSON_Delete( json );
	json = NULL;
	return 0;
}


EXPORT BOOL WINAPI jsonout( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//		JSON�`���f�[�^��ϐ��ɏo�͂���
	//		jsonout �ϐ�, JSON�|�C���^
	//
	PVal *pv;
	APTR ap;
	char *out;
	int _p3;
	cJSON *root;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	_p3 = hei->HspFunc_prm_getdi(-1);		// �p�����[�^2:�����l

	if ( _p3 == 0 ) return -1;
	if ( _p3 < 0 ) {
		root = json;
	} else {
		root = (cJSON *)_p3;
	}
	out = cJSON_Print(root);
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, out );	// �ϐ��ɒl����
	free(out);	
	return 0;
}


EXPORT BOOL WINAPI jsongetobj( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g�𓾂�
	//		jsongetobj �ϐ�, "����", JSON�|�C���^
	//
	PVal *pv;
	APTR ap;
	char *ss;
	int _p3;
	char name[1024];
	cJSON *root;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	strncpy( name, ss, 1024 );
	_p3 = hei->HspFunc_prm_getdi(-1);		// �p�����[�^3:�����l

	if ( _p3 == 0 ) return -1;
	if ( _p3 < 0 ) {
		root = json;
	} else {
		root = (cJSON *)_p3;
	}
	cJSON *cjobj = cJSON_GetObjectItem( root, name );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &cjobj );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI jsonnext( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g�𓾂�
	//		jsonnext �ϐ�, JSON�|�C���^, option
	//
	PVal *pv;
	APTR ap;
	int _p3;
	int _p4;
	cJSON *root;
	cJSON *cjobj;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	_p3 = hei->HspFunc_prm_getdi(-1);		// �p�����[�^2:�����l
	_p4 = hei->HspFunc_prm_getdi(0);		// �p�����[�^3:�����l

	if ( _p3 == 0 ) return -1;
	if ( _p3 < 0 ) {
		root = json;
	} else {
		root = (cJSON *)_p3;
	}

	switch( _p4 ) {
	case 1:
		cjobj = root->prev;
		break;
	case 2:
		cjobj = root->child;
		break;
	case 3:
		hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &root->type );	// �ϐ��ɒl����
		return 0;
	default:
		cjobj = root->next;
		break;
	}
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &cjobj );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI jsongets( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g���當����𓾂�
	//		jsongets �ϐ�, "����", JSON�|�C���^
	//
	PVal *pv;
	APTR ap;
	char *ss;
	int _p3;
	char name[1024];
	cJSON *root;
	char *resbuf;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_getds( "" );		// �p�����[�^2:������
	strncpy( name, ss, 1024 );
	_p3 = hei->HspFunc_prm_getdi(-1);		// �p�����[�^3:�����l

	if ( _p3 == 0 ) return -1;
	if ( _p3 < 0 ) {
		root = json;
	} else {
		root = (cJSON *)_p3;
	}
	if ( *ss != 0 ) {
		root = cJSON_GetObjectItem( root, name );
		if ( root == NULL ) return -1;
	}

	resbuf = root->valuestring;
	if ( *json_nkfopt != 0 ) {
		cnvNkf( resbuf, -1, -1, json_nkfopt );
		resbuf = nkfbuf;
	}
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, resbuf );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI jsongeti( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g���琮���l�𓾂�
	//		jsongeti �ϐ�, "����", JSON�|�C���^
	//
	PVal *pv;
	APTR ap;
	char *ss;
	int _p3;
	char name[1024];
	cJSON *root;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	ss = hei->HspFunc_prm_getds( "" );		// �p�����[�^2:������
	strncpy( name, ss, 1024 );
	_p3 = hei->HspFunc_prm_getdi(-1);		// �p�����[�^3:�����l

	if ( _p3 == 0 ) return -1;
	if ( _p3 < 0 ) {
		root = json;
	} else {
		root = (cJSON *)_p3;
	}
	if ( *ss != 0 ) {
		root = cJSON_GetObjectItem( root, name );
		if ( root == NULL ) return -1;
	}
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &root->valueint );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI jsonnewobj( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g��V�K�쐬
	//		jsonnewobj �ϐ�, JSON�|�C���^, "����"
	//
	PVal *pv;
	APTR ap;
	char *ss;
	int _p3;
	char name[1024];
	cJSON *root;
	cJSON *cjobj;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	_p3 = hei->HspFunc_prm_getdi(-1);		// �p�����[�^2:�����l
	ss = hei->HspFunc_prm_getds( "" );		// �p�����[�^3:������
	strncpy( name, ss, 1024 );

	root = cJSON_CreateObject();
	if ( _p3 == 0 ) return -1;
	if ( _p3 < 0 ) {
		cjobj = root;
	} else {
		cjobj = (cJSON *)_p3;
		cJSON_AddItemToObject( cjobj, name, root );
	}

	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_INT, &cjobj );	// �ϐ��ɒl����
	return 0;
}


EXPORT BOOL WINAPI jsonputs( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g�̕�����G���g���X�V
	//		jsonputs JSON�|�C���^, "����", "������"
	//
	char *ss;
	int _p3;
	char name[1024];
	cJSON *cjobj;

	_p3 = hei->HspFunc_prm_getdi(0);		// �p�����[�^1:�����l
	ss = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	strncpy( name, ss, 1024 );
	ss = hei->HspFunc_prm_gets();			// �p�����[�^3:������

	if ( _p3 <= 0 ) return -1;

	cjobj = (cJSON *)_p3;

	if ( *json_nkfopt2 != 0 ) {
		cnvNkf( ss, -1, -1, json_nkfopt2 );
		cJSON_AddStringToObject( cjobj, name, nkfbuf );
	} else {
		cJSON_AddStringToObject( cjobj, name, ss );
	}

	return 0;
}


EXPORT BOOL WINAPI jsonputi( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g�̐��l�G���g���X�V
	//		jsonputi JSON�|�C���^, "����", �����l, ���[�h
	//
	char *ss;
	int _p3;
	int _p4;
	int _p5;
	char name[1024];
	cJSON *cjobj;

	_p3 = hei->HspFunc_prm_getdi(0);		// �p�����[�^1:�����l
	ss = hei->HspFunc_prm_gets();			// �p�����[�^2:������
	strncpy( name, ss, 1024 );
	_p4 = hei->HspFunc_prm_getdi(0);		// �p�����[�^3:�����l
	_p5 = hei->HspFunc_prm_getdi(0);		// �p�����[�^4:�����l

	if ( _p3 <= 0 ) return -1;

	cjobj = (cJSON *)_p3;
	switch( _p5 ) {
	case 1:
		if ( _p4 ) {
			cJSON_AddTrueToObject (cjobj, name );
		} else {
			cJSON_AddFalseToObject (cjobj, name );
		}
		break;
	default:
		cJSON_AddNumberToObject( cjobj, name, _p4 );
		break;
	}
	return 0;
}


EXPORT BOOL WINAPI jsonsetprm( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g�̃p�����[�^�[�ݒ�
	//		jsonsetprm JSON�|�C���^, �ݒ�l, ���[�h
	//
	int _p3;
	int _p4;
	int _p5;
	cJSON *cjobj;

	_p3 = hei->HspFunc_prm_getdi(0);		// �p�����[�^1:�����l
	_p4 = hei->HspFunc_prm_getdi(0);		// �p�����[�^2:�����l
	_p5 = hei->HspFunc_prm_getdi(0);		// �p�����[�^3:�����l

	if ( _p3 <= 0 ) return -1;

	cjobj = (cJSON *)_p3;
	switch( _p5 ) {
	case 1:
		cjobj->prev = (cJSON *)_p4;
		break;
	case 2:
		cjobj->child = (cJSON *)_p4;
		break;
	case 3:
		cjobj->type = _p4;
		break;
	case 4:
		cjobj->valueint = _p4;
		break;
	default:
		cjobj->next = (cJSON *)_p4;
		break;
	}
	return 0;
}


EXPORT BOOL WINAPI jsondelobj( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�I�u�W�F�N�g���폜
	//		jsondelobj JSON�|�C���^
	//
	int _p3;
	cJSON *cjobj;

	_p3 = hei->HspFunc_prm_getdi(0);		// �p�����[�^1:�����l

	if ( _p3 <= 0 ) return -1;
	cjobj = (cJSON *)_p3;
	cJSON_Delete( cjobj );
	return 0;
}


EXPORT BOOL WINAPI jsonnkf( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	JSON�f�[�^�ϊ��I�v�V�����w��
	//		jsonnkf "�擾���ϊ��I�v�V����", "�ݒ莞�ϊ��I�v�V����"
	//
	char *ss;

	ss = hei->HspFunc_prm_getds( "" );		// �p�����[�^1:������
	strncpy( json_nkfopt, ss, 127 );
	ss = hei->HspFunc_prm_getds( "" );		// �p�����[�^2:������
	strncpy( json_nkfopt2, ss, 127 );

	return 0;
}


/*------------------------------------------------------------------------------------*/

EXPORT BOOL WINAPI nkfcnv( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	NKF�ɂ�镶���R�[�h�ϊ����s�Ȃ�
	//		nkfcnv �ϐ�, �ϐ�, "�I�v�V����", insize, outsize
	//
	PVal *pv;
	APTR ap;
	char *ss;
	char *vptr;
	int outsize, insize;
	char opt[1024];
	cJSON *root;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	vptr = (char *)hei->HspFunc_prm_getv();	// �p�����[�^2:�ϐ�
	ss = hei->HspFunc_prm_getds( "s" );		// �p�����[�^3:������
	strncpy( opt, ss, 1024 );
	insize = hei->HspFunc_prm_getdi(-1);	// �p�����[�^3:�����l
	outsize = hei->HspFunc_prm_getdi(-1);	// �p�����[�^3:�����l

	cnvNkf( vptr, insize, outsize, opt );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, nkfbuf );	// �ϐ��ɒl����

	return 0;
}


EXPORT BOOL WINAPI nkfguess( HSPEXINFO *hei, int p1, int p2, int p3 )
{
	//	(type$202)
	//	NKF�ɂ�镶���R�[�h�F�����ʂ��擾����
	//		nkfguess �ϐ�
	//
	PVal *pv;
	APTR ap;
	int ressize;

	ap = hei->HspFunc_prm_getva( &pv );		// �p�����[�^1:�ϐ�
	GetNkfGuessA( nkfbuf, nkfsize, (LPDWORD)&ressize );
	hei->HspFunc_prm_setva( pv, ap, HSPVAR_FLAG_STR, nkfbuf );	// �ϐ��ɒl����

	return 0;
}




/*------------------------------------------------------------------------------------*/

