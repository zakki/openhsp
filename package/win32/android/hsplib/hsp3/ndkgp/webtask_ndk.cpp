
//
//		WebTask : http access task source
//				  for android enviroment
//					onion software/onitama 2015/5
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

//#include "../../hsp3/hsp3config.h"
//#include "../../hsp3/supio.h"

#include "webtask_ndk.h"
#include "../../javafunc.h"

void WebTask::Terminate( void )
{
}


void WebTask::Reset( void )
{
	// Initalize
	//
	Terminate();
	mode = CZHTTP_MODE_NONE;
}


WebTask::WebTask( void )
{
	//	�R���X�g���N�^
	//
	//	���������s��
	Reset();
}


WebTask::~WebTask( void )
{
	//	�f�X�g���N�^
	//
	Terminate();
}


int	WebTask::Request( char *url, char *post )
{
	//	HTTP���N�G�X�g���s
	//	( url:���N�G�X�g����URL )
	//	( post:NULL�̏ꍇ��GET�A������̏ꍇ��POST�œn�� )
	//
	int res;

	res = j_httpRequest( url, post, 0 );
	if ( res ) {
		mode = CZHTTP_MODE_NONE;
		return res;
	}

	mode = CZHTTP_MODE_READY;
	return res;
}


int	WebTask::getStatus( int id )
{
	// �X�e�[�^�X�l�̎擾
	//
	switch( id ) {
	case HTTPINFO_MODE:
		Exec();
		return getMode();
	case HTTPINFO_SIZE:
		return strlen( j_getHttpInfo() );
	default:
		break;
	}
	return 0;
}


char *WebTask::getData( int id )
{
	// �f�[�^������̎擾
	//
	// �f�[�^������̎擾
	//
	switch( id ) {
	case HTTPINFO_DATA:				// ���ʃf�[�^
		{
		char *p = j_getHttpInfo();
		if ( p != NULL ) return p;
		break;
		}
	case HTTPINFO_ERROR:			// �G���[������
//		return getError();
	default:
		break;
	}
	return "";
}


void WebTask::setData( int id, char *str )
{
	// �f�[�^������̐ݒ�
	//
	return;
}


//--------------------------------------------------------------//
//				External functions
//--------------------------------------------------------------//

int WebTask::Exec( void )
{
	//	���t���[�����s
	//
	return 0;
}


//--------------------------------------------------------------//
//				Internal functions
//--------------------------------------------------------------//

