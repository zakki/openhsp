
//
//		WebTask : http access task source
//				  for Linux enviroment
//					onion software/onitama 2015/2
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "webtask_linux.h"

void WebTask::Reset( void )
{
	// Reset Value
	mode = CZHTTP_MODE_READY;
}


WebTask::WebTask( void )
{
	//	�R���X�g���N�^
	//
	//str_agent = NULL;
	mode = CZHTTP_MODE_NONE;
	vardata = NULL;
	postdata = NULL;

	//	���������s��
	Reset();
}


WebTask::~WebTask( void )
{
	//	�f�X�g���N�^
	//
}


int WebTask::Request( char *url, char *post )
{
	//	HTTP���N�G�X�g���s
	//	( url:���N�G�X�g����URL )
	//	( post:NULL�̏ꍇ��GET�A������̏ꍇ��POST�œn�� )
	//
	if ( mode != CZHTTP_MODE_READY ) {
		return -1;
	}
	if ( post == NULL ) {
		SetVarRequestGet( url );
	} else {
		SetPostData( post );
		SetVarRequestPost( url, postdata );
	}
	return 0;
}


int WebTask::getStatus( int id )
{
	// �X�e�[�^�X�l�̎擾
	//
	switch( id ) {
	case HTTPINFO_MODE:
		Exec();
		return getMode();
	case HTTPINFO_SIZE:
		return getSize();
	default:
		break;
	}
	return 0;
}


char *WebTask::getData( int id )
{
	// �f�[�^������̎擾
	//
	switch( id ) {
	case HTTPINFO_DATA:				// ���ʃf�[�^
		{
		char *p = getVarData();
		if ( p != NULL ) return p;
		break;
		}
	case HTTPINFO_ERROR:			// �G���[������
		return getError();
	default:
		break;
	}
	return "";
}


void WebTask::setData( int id, char *str )
{
	// �f�[�^������̎擾
	//
	switch( id ) {
	case HTTPINFO_DATA:
		ClearVarData();				// ���ʃf�[�^���N���A����
		break;
	case HTTPINFO_ERROR:
		SetError( str );			// �G���[������
		break;
	default:
		break;
	}
	return;
}


//--------------------------------------------------------------//
//				External functions
//--------------------------------------------------------------//

int WebTask::Exec( void )
{
	//	���t���[�����s
	//
	//int handle;

	switch( mode ) {
	case CZHTTP_MODE_VARREQUEST:
	case CZHTTP_MODE_VARREQSEND:
		// HTTP�ɐڑ�
//		handle = emscripten_async_wget2_data(req_url.c_str(), varstr,
//									postdata, this, true,
//									WebTask::onLoaded, WebTask::onError, WebTask::onProgress);
		mode = CZHTTP_MODE_VARDATAWAIT;
		// FALL THROUGH
	case CZHTTP_MODE_VARDATAWAIT:
		break;
	case CZHTTP_MODE_VARDATAEND:
		mode = CZHTTP_MODE_READY;
		break;

	case CZHTTP_MODE_ERROR:
		return -1;
	default:
		return 1;
	}
	return 0;
}


//--------------------------------------------------------------//
//				Internal functions
//--------------------------------------------------------------//

void WebTask::ClearVarData( void )
{
	if ( vardata == NULL ) return;
	free( vardata );
	vardata = NULL;
}


void WebTask::ClearPostData( void )
{
	if ( postdata == NULL ) return;
	free( postdata );
	postdata = NULL;
}


void WebTask::SetURL( char *url )
{
	// �T�[�o�[��URL��ݒ�
	//
	req_url = url;
}


void WebTask::SetPostData( char *post )
{
	// �|�X�g������̐ݒ�
	//
	ClearPostData();
	if ( post == NULL ) return;
	//
	postdata = (char *)malloc( strlen( post ) + 1 );
	strcpy( postdata, post );
}


void WebTask::SetVarRequestGet( char *path )
{
	// �T�[�o�[�Ƀt�@�C����v��(GET)
	//
	req_url = path;
	strcpy( varstr, "GET" );
	postdata = NULL;
	mode = CZHTTP_MODE_VARREQUEST;
}


void WebTask::SetVarRequestPost( char *path, char *post )
{
	// �T�[�o�[�Ƀt�@�C����v��(POST)
	//
	req_url = path;
	strcpy( varstr, "POST" );
	postdata = post;
	mode = CZHTTP_MODE_VARREQUEST;
}

void WebTask::SetError( char *mes )
{
	//	�G���[�������ݒ�
	//
	mode = CZHTTP_MODE_ERROR;
	strcpy( errstr,mes );
}

