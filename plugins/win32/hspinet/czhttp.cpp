
#include <windows.h>
#include <process.h>
#include <stdio.h>
//#include <tchar.h>

#include "czhttp.h"

#pragma comment( lib,"Wininet.lib" )

void CzHttp::Terminate( void )
{
	//	Delete Session
	if ( pt != NULL ) {
		free( pt );	pt = NULL;
	}
	if ( hSession != NULL ) {
		InternetCloseHandle( hSession );
		hSession = NULL;
	}
	errstr[0] = 0;
	req_url[0] = 0;
	req_path[0] = 0;
	down_path[0] = 0;

	//	Clear headers
	if ( req_header != NULL ) { free( req_header ); req_header = NULL; }

	ClearVarData();
}


void CzHttp::Reset( void )
{
	// Initalize
	//
	char *agent;
	Terminate();

	agent = str_agent;
	if ( agent == NULL ) agent = "HSPInet(HSP3.1; Windows)";

	if ( proxy_url[0] != 0 ) {
		char *local_prm = NULL;
		if ( proxy_local ) local_prm = "<local>";
		hSession = InternetOpen( agent, INTERNET_OPEN_TYPE_PROXY, proxy_url, local_prm, 0 );
	} else {
		hSession = InternetOpen( agent, INTERNET_OPEN_TYPE_DIRECT, NULL, NULL, 0 );
	}
	if ( hSession == NULL ) {
		mode = CZHTTP_MODE_NONE;
		SetError( "�������Ɏ��s���܂���" ); return;
	}

	strcpy( username, "anonymous" );
	strcpy( userpass, "aaa@aaa.com" );
	ftp_port = INTERNET_DEFAULT_FTP_PORT;

	// Reset Value
	mode = CZHTTP_MODE_READY;
}


CzHttp::CzHttp( void )
{
	//	�R���X�g���N�^
	//
	str_agent = NULL;
	pt = NULL;
	mode = CZHTTP_MODE_NONE;
	hSession = NULL;
	proxy_local = 0;
	proxy_url[0] = 0;
	req_header = NULL;
	vardata = NULL;

	//	�ڑ��\��?
	if( InternetAttemptConnect(0) ){
		SetError( "�l�b�g�ڑ����m�F�ł��܂���ł���" ); return;
	}

	//	���������s��
	Reset();
}


CzHttp::~CzHttp( void )
{
	//	�f�X�g���N�^
	//
	Terminate();
	if ( str_agent != NULL ) { free( str_agent ); str_agent = NULL; }
}


//--------------------------------------------------------------//
//				External functions
//--------------------------------------------------------------//

int CzHttp::Exec( void )
{
	//	���t���[�����s
	//
	static char hdr[] = "Content-Type: application/x-www-form-urlencoded";
	char req_name[1024];
	char *name;
	BOOL res;

	switch( mode ) {
	case CZHTTP_MODE_REQUEST:			// http�ɐڑ�
		strcpy( req_name, req_url );
		strcat( req_name, req_path );
		hService = InternetOpenUrl( hSession, req_name, req_header, 0, 0, INTERNET_FLAG_RELOAD );
		if ( hService == NULL ) {
			SetError( "������URL���w�肳��܂���" );
			break;
		}
		mode = CZHTTP_MODE_REQSEND;
	case CZHTTP_MODE_REQSEND:
		name = down_path;
		if ( name[0] == 0 ) name = req_path;
		fp = fopen( name, "wb");
		if ( fp == NULL ) {
			SetError( "�_�E�����[�h�t�@�C�����쐬�ł��܂���" );
			break;
		}
		size = 0;
		mode = CZHTTP_MODE_DATAWAIT;
	case CZHTTP_MODE_DATAWAIT:
		{
		DWORD dwBytesRead = INETBUF_MAX;
		if ( InternetReadFile( hService, buf, INETBUF_MAX, &dwBytesRead ) == 0 ) {
			fclose( fp );
			InternetCloseHandle( hService );
			SetError( "�_�E�����[�h���ɃG���[���������܂���" );
			break;
		}
		if( dwBytesRead == 0 ) {
			mode = CZHTTP_MODE_DATAEND;
			break;
		}
		fwrite( buf, dwBytesRead, 1, fp );
		size += dwBytesRead;
		break;
		}
	case CZHTTP_MODE_DATAEND:
		fclose( fp );
		InternetCloseHandle( hService );
		mode = CZHTTP_MODE_READY;
		break;



	case CZHTTP_MODE_VARREQUEST:

		strcpy( req_name, req_url2 );
		strcat( req_name, req_path );

		// HTTP�ɐڑ�
		hHttpSession = ::InternetConnectA( hSession, varserver, INTERNET_DEFAULT_HTTP_PORT, NULL, NULL, INTERNET_SERVICE_HTTP, 0, 0 );
		if ( hHttpSession == NULL ) {
			SetError( "�����ȃT�[�o�[���w�肳��܂���" );
			break;
		}

		// HTTP�v���̍쐬
		hHttpRequest = ::HttpOpenRequestA( hHttpSession, varstr, req_name, HTTP_VERSION, NULL, NULL, INTERNET_FLAG_RELOAD|INTERNET_FLAG_NO_UI, 0 );
		if ( hHttpSession == NULL ) {
			SetError( "������URL���w�肳��܂���" );
			break;
		}
		mode = CZHTTP_MODE_VARREQSEND;
	case CZHTTP_MODE_VARREQSEND:

		// �쐬����HTTP�v���̔��s
		if ( postdata != NULL ) {
			res = ::HttpSendRequestA( hHttpRequest, hdr, (int)strlen(hdr), postdata, (int)strlen(postdata) );
		} else {
			res = ::HttpSendRequestA( hHttpRequest, NULL, 0, NULL, 0 );
		}
		if ( res == false ) {
			InternetCloseHandle( hHttpSession );
			SetError( "���N�G�X�g���ł��܂���ł���" );
			break;
		}
/*
		{
		// �Ԃ��ꂽ�R���e���c�̒������擾
		DWORD dwSize = INETBUF_MAX;
		*buf = 0;
		res = HttpQueryInfo( hHttpRequest, HTTP_QUERY_CONTENT_LENGTH, buf, &dwSize, 0 );
		if ( res == false ) {
			InternetCloseHandle( hHttpRequest );
			InternetCloseHandle( hHttpSession );
			SetError( "�f�[�^�T�C�Y�擾���ł��܂���ł���" );
			break;
		}
		varsize = atoi(buf);
		if ( varsize == 0 ) {
			InternetCloseHandle( hHttpRequest );
			InternetCloseHandle( hHttpSession );
			SetError( "�_�E�����[�h�ł��܂���ł���" );
			break;
		}
		}
*/
		varsize = 0x40000;
		ClearVarData();
		vardata = (char *)malloc( varsize );
		size = 0;
		mode = CZHTTP_MODE_VARDATAWAIT;
	case CZHTTP_MODE_VARDATAWAIT:
		{
		DWORD dwBytesRead;
		if ( InternetReadFile( hHttpRequest, vardata+size, varsize, &dwBytesRead ) == 0 ) {
			InternetCloseHandle( hHttpRequest );
			InternetCloseHandle( hHttpSession );
			SetError( "�_�E�����[�h���ɃG���[���������܂���" );
			break;
		}
		size += dwBytesRead;
		if( dwBytesRead == 0 ) {
			mode = CZHTTP_MODE_VARDATAEND;
			vardata[size] = 0;
			break;
		}
		break;
		}
	case CZHTTP_MODE_VARDATAEND:
		InternetCloseHandle( hHttpRequest );
		InternetCloseHandle( hHttpSession );
		mode = CZHTTP_MODE_READY;
		break;



	case CZHTTP_MODE_INFOREQ:
		strcpy( req_name, req_url );
		strcat( req_name, req_path );
		hService = InternetOpenUrl( hSession, req_name, req_header, 0, 0, 0 );
		if ( hService == NULL ) {
			SetError( "������URL���w�肳��܂���" );
			break;
		}
		mode = CZHTTP_MODE_INFORECV;
	case CZHTTP_MODE_INFORECV:
		{
		DWORD dwSize = INETBUF_MAX;
		buf[0] = 0;
		HttpQueryInfo( hService, HTTP_QUERY_RAW_HEADERS_CRLF, buf, &dwSize, 0 );
		InternetCloseHandle( hService );
		mode = CZHTTP_MODE_READY;
		break;
		}

	case CZHTTP_MODE_FTPREADY:
		return 2;

	case CZHTTP_MODE_FTPDIR:
		{
		char tx[512];
		char dname[64];
		char *fname;
		SYSTEMTIME t;

		fname = finddata.cFileName;
		if( finddata.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
			strcpy( dname, "<DIR>" );
        }
        else{
			sprintf( dname, "%d", finddata.nFileSizeLow );
        }
		FileTimeToSystemTime( &finddata.ftLastWriteTime,&t );
		sprintf( tx, "\"%s\",%s,%4d/%02d/%02d,%02d:%02d:%02d\r\n", fname, dname, t.wYear, t.wMonth, t.wDay, t.wHour, t.wMinute, t.wSecond );
		AddFlexBuf( tx, (int)strlen(tx) );
		if ( !InternetFindNextFile( hFtpEnum, &finddata ) ) {
			InternetCloseHandle( hFtpEnum );
			mode = CZHTTP_MODE_FTPREADY;
		}
		break;
		}

	case CZHTTP_MODE_FTPREAD:
		break;
	case CZHTTP_MODE_FTPWRITE:
		break;
	case CZHTTP_MODE_FTPCMD:
		{
		char tx[1024];
	    DWORD dwBytesRead;
		if( InternetReadFile( hResponse, buf, 1024, &dwBytesRead ) ){
			AddFlexBuf( tx, dwBytesRead );
		}
		if ( dwBytesRead == 0 ) {
			InternetCloseHandle( hResponse );
			mode = CZHTTP_MODE_FTPREADY;
		}
		break;
		}
	case CZHTTP_MODE_FTPRESULT:
		GetFtpResponse();
		break;

	case CZHTTP_MODE_ERROR:
		return -1;
	default:
		return 1;
	}
	return 0;
}


void CzHttp::ClearVarData( void )
{
	if ( vardata == NULL ) return;
	free( vardata );
	vardata = NULL;
}


char *CzHttp::GetError( void )
{
	// �G���[������̃|�C���^���擾
	//
	return errstr;
}


int CzHttp::RequestFile( char *path )
{
	// �T�[�o�[�Ƀt�@�C����v��
	//
	if ( mode != CZHTTP_MODE_READY ) {
		return -1;
	}
	strcpy( req_path, path );
	mode = CZHTTP_MODE_REQUEST;
	return 0;
}


char *CzHttp::RequestFileInfo( char *path )
{
	// �T�[�o�[�Ƀt�@�C������v��
	//
	char req_name[1024];
	DWORD dwSize = INETBUF_MAX;

	if ( mode != CZHTTP_MODE_READY ) {
		return NULL;
	}
	strcpy( req_name, req_url );
	strcat( req_name, path );

	hService = InternetOpenUrl( hSession, req_name, req_header, 0, 0, 0 );
	if ( hService == NULL ) return NULL;

	buf[0] = 0;
	HttpQueryInfo( hService, HTTP_QUERY_RAW_HEADERS_CRLF, buf, &dwSize, 0 );
	InternetCloseHandle( hService );
	return buf;
}


void CzHttp::SetURL( char *url )
{
	// �T�[�o�[��URL��ݒ�
	//
	strncpy( req_url, url, 1024 );
}


void CzHttp::SetLocalName( char *name )
{
	// �T�[�o�[��URL��ݒ�
	//
	strncpy( down_path, name, 512 );
}


int CzHttp::GetSize( void )
{
	// �擾�t�@�C���̃T�C�Y��Ԃ�
	//
	if ( mode != CZHTTP_MODE_READY ) return 0;
	return size;
}


char *CzHttp::GetData( void )
{
	// �擾�t�@�C���f�[�^�ւ̃|�C���^��Ԃ�
	//
	if ( mode != CZHTTP_MODE_READY ) return NULL;
	return pt;
}


void CzHttp::SetProxy( char *url, int port, int local )
{
	// PROXY�T�[�o�[�̐ݒ�
	//	(URL��NULL���w�肷���PROXY�����ƂȂ�)
	//
	if ( url == NULL ) {
		proxy_url[0] = 0;
	} else {
		sprintf( proxy_url, "%s:%d", url, port );
		proxy_local = local;
	}
	Reset();
}


void CzHttp::SetAgent( char *agent )
{
	// �G�[�W�F���g�̐ݒ�
	//	(URL��NULL���w�肷��ƃf�t�H���g�ɂȂ�)
	//
	if ( str_agent != NULL ) { free( str_agent ); str_agent = NULL; }
	if ( agent == NULL ) str_agent = agent; else {
		str_agent = (char *)malloc( strlen( agent ) + 1 );
		strcpy( str_agent, agent );
	}
	Reset();
}


void CzHttp::SetHeader( char *header )
{
	// �w�b�_������̐ݒ�
	//
	if ( req_header != NULL ) { free( req_header ); req_header = NULL; }
	if ( header == NULL ) return;
	//
	req_header = (char *)malloc( strlen( header ) + 1 );
	strcpy( req_header, header );
}


void CzHttp::SetUserName( char *name )
{
	// ���[�U�[���̐ݒ�
	//
	strncpy( username, name, 255 );
}


void CzHttp::SetUserPassword( char *pass )
{
	// �p�X���[�h�̐ݒ�
	//
	strncpy( userpass, pass, 255 );
}


void CzHttp::SetFtpPort( int port )
{
	// �|�[�g�̐ݒ�
	//
	ftp_port = port;
}


void CzHttp::ResetFlexBuf( int defsize )
{
	if ( pt != NULL ) {	free( pt );	}
	pt = (char *)malloc( defsize );
	pt_size = defsize;
	pt_cur = 0;
}


void CzHttp::AllocFlexBuf( int size )
{
	char *p;
	if ( pt_size >= size ) return;
	p = (char *)malloc( size );
	memcpy( p, pt, pt_size );
	free( pt );
	pt_size = size;
	pt = p;
}


void CzHttp::AddFlexBuf( char *data, int size )
{
	int i;
	i = pt_cur + size + 1;
	if ( i > pt_size ) {
		pt_size = ( i + 0x0fff ) & 0x7ffff000;
		AllocFlexBuf( pt_size );
	}
	memcpy( pt + pt_cur, data, size );
	pt_cur += size;
	pt[ pt_cur ] = 0;									// Terminate
}



void CzHttp::SetVarServerFromURL( void )
{
	char *p;
	char *wr;
	char a1;
	p = req_url;
	wr = varserver;
	*wr = 0;

	while(1)				// '//'��T��
	{
		a1 = *p++;
		if ( a1 == 0 ) return;
		if ( a1 == '/' ) {
			if ( *p == '/' ) { p++; break; }
		}
	}
	while(1) {				// '/'�܂ł����o��
		a1 = *p;
		if ( a1 == 0 ) break;
		p++;
		if ( a1 == '/' ) break;
		*wr++ = a1;
	}
	*wr = 0;

	wr = req_url2;
	*wr++ = '/';

	while(1) {				// �Ō�܂Ŏ��o��
		a1 = *p++;
		if ( a1 == 0 ) break;
		*wr++ = a1;
	}
	*wr = 0;

}


void CzHttp::SetVarRequestGet( char *path )
{
	// �T�[�o�[�Ƀt�@�C����v��(GET)
	//
	if ( mode != CZHTTP_MODE_READY ) {
		return;
	}
	SetVarServerFromURL();
	strcpy( varstr, "GET" );
	strcpy( req_path, path );
	postdata = NULL;
	mode = CZHTTP_MODE_VARREQUEST;
}


void CzHttp::SetVarRequestPost( char *path, char *post )
{
	// �T�[�o�[�Ƀt�@�C����v��(POST)
	//
	if ( mode != CZHTTP_MODE_READY ) {
		return;
	}
	SetVarServerFromURL();
	strcpy( varstr, "POST" );
	strcpy( req_path, path );
	postdata = post;
	mode = CZHTTP_MODE_VARREQUEST;
}


//--------------------------------------------------------------//
//				FTP functions
//--------------------------------------------------------------//

int CzHttp::FtpConnect( void )
{
	// FTP�ڑ�
	//
	*buf = 0;
	if ( mode != CZHTTP_MODE_READY ) {
		return -1;
	}

	hService = InternetConnect( hSession,
                                req_url,
                                INTERNET_DEFAULT_FTP_PORT,
                                username,
                                userpass,
                                INTERNET_SERVICE_FTP,
                                0,
                                0 );


	GetFtpResponse();
	if ( mode != CZHTTP_MODE_FTPREADY ) return -1;
	return 0;
}


void CzHttp::FtpDisconnect( void )
{
	// FTP�ؒf
	//
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return;
	}
	InternetCloseHandle( hService );
	mode = CZHTTP_MODE_READY;
}


char *CzHttp::GetFtpResponse( void )
{
	// FTP���X�|���X�ւ̃|�C���^��Ԃ�
	//
	DWORD dwSize = INETBUF_MAX;
	DWORD dwError;
	if ( InternetGetLastResponseInfo( &dwError, buf, &dwSize ) ) {
		mode = CZHTTP_MODE_FTPREADY;
	} else {
		InternetCloseHandle( hService );
		mode = CZHTTP_MODE_ERROR;
	}
	return buf;
}


char *CzHttp::GetFtpCurrentDir( void )
{
	// FTP�J�����g�f�B���N�g�����擾
	//
	DWORD dwSize = INETBUF_MAX;

	if ( mode != CZHTTP_MODE_FTPREADY ) {
		*buf = 0;
		return buf;
	}
	FtpGetCurrentDirectory( hService, buf, &dwSize );
	return buf;
}


void CzHttp::SetFtpDir( char *name )
{
	// FTP�J�����g�f�B���N�g����ύX
	//
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return;
	}
	FtpSetCurrentDirectory( hService, name );
	GetFtpResponse();
}


void CzHttp::GetFtpDirList( void )
{
	// FTP�J�����g�f�B���N�g�����e���擾
	//
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return;
	}
	ResetFlexBuf( 1024 );
    hFtpEnum = FtpFindFirstFile( hService, NULL, &finddata, INTERNET_FLAG_RELOAD | INTERNET_FLAG_DONT_CACHE, 0 );
	if ( hFtpEnum != NULL ) mode = CZHTTP_MODE_FTPDIR;
}


char *CzHttp::GetTempBuffer( void )
{
	// �����o�b�t�@�ւ̃|�C���^��Ԃ�
	//
	return buf;
}


int CzHttp::GetFtpFile( char *name, char *downname, int tmode )
{
	// FTP�t�@�C�����擾
	//
	int i;
	DWORD type;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	type = FTP_TRANSFER_TYPE_BINARY;
	if ( tmode ) type = FTP_TRANSFER_TYPE_ASCII;
	i = FtpGetFile( hService, name, downname, FALSE, FILE_ATTRIBUTE_ARCHIVE, type, 0 );
	if ( i == 0 ) return -1;
	GetFtpResponse();
	return 0;
}


int CzHttp::PutFtpFile( char *name, char *downname, int tmode )
{
	// FTP�t�@�C���𑗐M
	//
	int i;
	DWORD type;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	type = FTP_TRANSFER_TYPE_BINARY;
	if ( tmode ) type = FTP_TRANSFER_TYPE_ASCII;
	i = FtpPutFile( hService, downname, name, type, 0 );
	if ( i == 0 ) return -1;
	GetFtpResponse();
	return 0;
}


int CzHttp::RenameFtpFile( char *name, char *newname )
{
	// FTP�t�@�C�������l�[��
	//
	int i;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	if ( newname == NULL ) {
		i = FtpDeleteFile( hService, name );
	} else {
		i = FtpRenameFile( hService, name, newname );
	}
	if ( i == 0 ) return -1;
	GetFtpResponse();
	return 0;
}


int CzHttp::MakeFtpDir( char *name )
{
	// FTP�f�B���N�g���쐬
	//
	int i;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	i = FtpCreateDirectory( hService, name );
	if ( i == 0 ) return -1;
	GetFtpResponse();
	return 0;
}


int CzHttp::KillFtpDir( char *name )
{
	// FTP�f�B���N�g���폜
	//
	int i;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	i = FtpRemoveDirectory( hService, name );
	if ( i == 0 ) return -1;
	GetFtpResponse();
	return 0;
}


int CzHttp::FtpSendCommand( char *cmd )
{
	// FTP�R�}���h���M
	//
	int i;
	if ( mode != CZHTTP_MODE_FTPREADY ) {
		return -1;
	}
	ResetFlexBuf( 1024 );
	i = FtpCommand( hService, TRUE, FTP_TRANSFER_TYPE_ASCII, cmd, 0, &hResponse );
	if ( i ) {
		mode = CZHTTP_MODE_FTPCMD;
		return 0;
	}
	return -1;
}


//--------------------------------------------------------------//
//				Internal functions
//--------------------------------------------------------------//

void CzHttp::SetError( char *mes )
{
	//	�G���[�������ݒ�
	//
	mode = CZHTTP_MODE_ERROR;
	strcpy( errstr,mes );
}


