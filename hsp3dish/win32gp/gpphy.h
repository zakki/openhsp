#ifndef gpphy_H_
#define gpphy_H_

#include "gameplay.h"

using namespace gameplay;

#define GPPHY_FLAG_NONE (0)
#define GPPHY_FLAG_ENTRY (1)

//  HGIMG4 Physics Object
class gpphy {
public:
	gpphy();
	~gpphy();
	void reset( int id );

	short _flag;						// ���݃t���O
	short _mark;						// �}�[�N�����p
	int _mode;							// ���[�h
	int _id;							// �t�B�W�b�N�X�I�u�W�F�N�gID
	PhysicsRigidBody::Parameters *_rigParams;	// ���̃p�����[�^�[
};


#endif
