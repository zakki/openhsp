
//
//		Configure for HSP3
//
#ifndef __hsp3config_h
#define __hsp3config_h

//		�V�X�e���֘A���x��
//
#define HSPTITLE "OpenHSP ver."
#define hspver "3.2"
#define mvscode 6		// minor version code
#define vercode 0x3206	// version code

#define HSPERR_HANDLE		// HSP�G���[��O��L���ɂ��܂�
#define SYSERR_HANDLE		// �V�X�e���G���[��O��L���ɂ��܂�


//
//		�ڐA�p�̃��x��
//
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
//#define HSPWIN		// Windows(WIN32) version flag
//#define HSPWINGUI		// Windows(WIN32) version flag
//#define HSPMAC		// Macintosh version flag
//#define HSPLINUX		// Linux(CLI) version flag
//#define HSPLINUXGUI	// Linux(GUI) version flag

//#define HSPDEBUG	// Debug version flag

//
//		�ڐA�p�̒萔
//
#ifdef HSPWIN
#define HSP_MAX_PATH	260
#define HSP_PATH_SEPARATOR '\\'
#endif
#ifdef HSPLINUX
#define HSP_MAX_PATH	256
#define HSP_PATH_SEPARATOR '/'
#endif

#endif
