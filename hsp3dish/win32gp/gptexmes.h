#ifndef gptexmes_H_
#define gptexmes_H_

#include "gameplay.h"

using namespace gameplay;

/**
 * Texture cache class.
 */

#define TEXMESINF_MAX 256			// �e�N�X�`���L���b�V���̍ő吔
#define TEXMES_CACHE_DEFAULT 8		// �L���b�V���̃f�t�H���g�����t���[��
#define TEXMES_NAME_BUFFER 32		// �e�L�X�g�n�b�V���l�[���p�o�b�t�@�T�C�Y
#define TEXMES_BUFFER_MAX 0x40000	// �����e�N�X�`���o�b�t�@�o�b�t�@�T�C�Y

// �e�N�X�`���L���b�V�����
class gptexmes {
public:
	gptexmes();
	~gptexmes();
	void reset(int sizex, int sizey, int p_texsx, int p_texsy, void *data);
	void clear(void);
	int registText(char* msg);

	int entry;			// entry ID
	int flag;			// flag (0=none/1=enable)
	int sx;				// x-size (real)
	int sy;				// y-size (real)
	int texsx;			// texture x-size
	int texsy;			// texture y-size
	float ratex;		// 1/sx
	float ratey;		// 1/sy

	int hash;			// Text Hashcode
	int life;			// Text Cache life
	char* text;			// Text Message
	int font_size;		// Text font size
	int font_style;		// Text font style
	char buf[TEXMES_NAME_BUFFER];		// Text Data Buffer

	Texture::Sampler *_texture;
};


#endif
