#ifndef gpphy_H_
#define gpphy_H_

#include "gameplay.h"

using namespace gameplay;

#define GPPHY_FLAG_NONE (0)
#define GPPHY_FLAG_ENTRY (1)

#define GPPAPPLY_FORCE (0)
#define GPPAPPLY_IMPULSE (1)
#define GPPAPPLY_TORQUE (2)
#define GPPAPPLY_TORQUE_IMPULSE (3)

#define BIND_PHYSICS_NOSCALE (1)
#define BIND_PHYSICS_MESH (2)

//  HGIMG4 Physics Object
class gpphy {
public:
	gpphy();
	~gpphy();
	void reset( int id );
	int setParameter( int prmid, Vector3 *prm );
	void bindNodeAsBox( Node *node, Vector3 &size, PhysicsRigidBody::Parameters *rigParams );
	void bindNodeAsSphere( Node *node, float radius, Vector3 &center, PhysicsRigidBody::Parameters *rigParams );
	void bindNodeAsMesh(Node *node, Mesh *mesh, PhysicsRigidBody::Parameters *rigParams);

	short _flag;						// ���݃t���O
	short _mark;						// �}�[�N�����p
	int _mode;							// ���[�h
	int _id;							// �t�B�W�b�N�X�I�u�W�F�N�gID
	PhysicsRigidBody *_colObj;	// �R���W�����I�u�W�F�N�g

};


#endif
