
//
//	hsp3.cpp header
//
#ifndef __hsp3_h
#define __hsp3_h

#include "hsp3debug.h"
#include "hsp3struct.h"
#include "hsp3ext.h"
#include "hsp3code.h"

//	HSP3 class
//
class Hsp3 {
public:
	//	Functions
	//
	Hsp3( void );
	~Hsp3( void );
	void Dispose( void );						// HSP ax�̔j��
	int Reset( int mode );						// HSP ax�̏��������s�Ȃ�
	void SetPackValue( int sum, int dec );		// packfile�p�̐ݒ�f�[�^��n��
	void SetFileName( char *name );				// ax�t�@�C�������w�肷��

	//	Data
	//
	HSPCTX hspctx;
	char *axname;
	char *axfile;
	int	maxvar;
	int hsp_sum, hsp_dec;

private:
};


#endif
