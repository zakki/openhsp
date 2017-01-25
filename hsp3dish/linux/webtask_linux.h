
//
//	webtask_linux.cpp functions
//
#ifndef __webtask_linux_h
#define __webtask_linux_h

#define INETURL_MAX 2048
#define INETBUF_MAX 0x10000

#include <string>

enum {
CZHTTP_MODE_NONE = 0,		// �l�b�g�ڑ��Ȃ�
CZHTTP_MODE_READY,			// �l�b�g�ڑ��ҋ@
CZHTTP_MODE_VARREQUEST,		// ���N�G�X�g����
CZHTTP_MODE_VARREQSEND,		// ���N�G�X�g���M
CZHTTP_MODE_VARDATAWAIT,	// ���N�G�X�g��M��
CZHTTP_MODE_VARDATAEND,		// ���N�G�X�g��M�I��
CZHTTP_MODE_MAX
};

#define CZHTTP_MODE_ERROR -1	// �G���[����

#define HTTPINFO_MODE 0		// ���݂̃��[�h
#define HTTPINFO_SIZE 1		// �f�[�^�T�C�Y
#define HTTPINFO_DATA 16		// �擾�f�[�^
#define HTTPINFO_ERROR 17	// �G���[������

class WebTask {
public:
	WebTask();
	~WebTask();

	int Exec( void );									// ���t���[�����ƂɌĂ΂��
	int Request( char *url, char *post );				// HTTP���N�G�X�g

	//	�O���Ƃ̃C���^�[�t�F�[�X
	int getStatus( int id );							// �X�e�[�^�X�l�̎擾
	char *getData( int id );							// �f�[�^�̎擾
	void setData( int id, char *str );					// �f�[�^�̐ݒ�

protected:

	//	�����g�p
	void Terminate( void );								// �j��
	void Reset( void );									// ���Z�b�g

	char *getVarData( void ) { return vardata; };		// ��M�f�[�^�|�C���^�̎擾
	char *getError( void ) { return errstr; };			// �G���[������̃|�C���^���擾
	int getMode( void ) { return mode; };				// ���݂̃��[�h��Ԃ�
	int getSize( void ) { return size; };				// ��M�f�[�^�T�C�Y�̎擾
	int getVarSize( void ) { return varsize; };			// ��M�o�b�t�@�T�C�Y�̎擾
	void SetURL( char *url );							// �T�[�o�[��URL��ݒ�
	void ClearVarData( void );
	void ClearPostData( void );
	void SetError( char *mes );
	void SetPostData( char *post );
	void SetVarServerFromURL( char *url );				// URL���������͂���

	//	���N�G�X�g
	void SetVarRequestGet( char *path );
	void SetVarRequestPost( char *path, char *post );

	int mode;						// Current Mode
	int size;						// File Size

	char errstr[256];				// Error string buffer

	std::string req_url;			// Request URL

	char varstr[256];				// VarRequest request token
	char *postdata;					// Post data
	char *vardata;					// Transfer destination
	int varsize;					// Transfer max size
};


#endif

