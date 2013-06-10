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

	short _flag;						// 存在フラグ
	short _mark;						// マーク処理用
	int _mode;							// モード
	int _id;							// フィジックスオブジェクトID
	PhysicsRigidBody::Parameters *_rigParams;	// 剛体パラメーター
};


#endif
