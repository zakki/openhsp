
//
//		Configure for HSP3
//
#ifndef __hsp3config_h
#define __hsp3config_h

//		�V�X�e���֘A���x��
//
#define HSPTITLE "Hot Soup Processor ver."
#define hspver "3.1RC1"
#define mvscode 37		// minor version code
#define vercode 0x03001		// version code

#define HSPERR_HANDLE		// HSP�G���[��O��L���ɂ��܂�
#define SYSERR_HANDLE		// �V�X�e���G���[��O��L���ɂ��܂�


//
//		�ڐA�p�̃��x��
//
//#define HSPWIN		// Windows version flag
//#define HSPMAC		// Macintosh version flag
//#define HSPLINUX	// Linux version flag
#define JPN			// IME use flag
#define JPNMSG		// japanese message flag

//
//	Debug mode functions
//
#define HSPDEBUGLOG	// Debug Log Version

//		Debug Window Message Buffer Size
//
#define dbsel_size 0x10000
#define dbmes_size 0x10000

//
//		�ȉ��̃��x���̓R���p�C���I�v�V�����Őݒ肳��܂�
//

#define HSPDEBUG	// Debug version flag


#endif
