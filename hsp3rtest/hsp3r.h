
//
//	hsp3r.cpp header
//
#ifndef __hsp3r_h
#define __hsp3r_h

#include "../hsp3/hsp3debug.h"
#include "../hsp3/hsp3struct.h"
#include "../hsp3/hsp3code.h"
#include "../hsp3/stack.h"
#include "hspvar_util.h"

//	HSP3r class
//
class Hsp3r {
public:
	//	Functions
	//
	Hsp3r( void );
	~Hsp3r( void );
	void Dispose( void );						// HSP3R�̔j��
	int Reset( int ext_vars, int ext_hpi );		// HSP3R�̏��������s�Ȃ�
	void SetPackValue( int sum, int dec );		// packfile�p�̐ݒ�f�[�^��n��
	void SetFileName( char *name );				// ax�t�@�C�������w�肷��

	//	Data
	//
	HSPCTX hspctx;
	int	maxvar;
	int max_varhpi;
	int hsp_sum, hsp_dec;

private:
};


#endif
