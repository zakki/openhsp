
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

void WebTask::Terminate( void )
{
}


void WebTask::Reset( void )
{
	// Initalize
	//
	Terminate();
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
	return 0;
}


int	WebTask::getStatus( int id )
{
	// �X�e�[�^�X�l�̎擾
	//
	return 0;
}


char *WebTask::getData( int id )
{
	// �f�[�^������̎擾
	//
	return "";
}


void WebTask::setData( int id, char *str )
{
	// �f�[�^������̎擾
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

