#include "gamehsp.h"

#include "../../hsp3/hsp3config.h"
#include "../supio.h"
#include "../sysreq.h"

/*------------------------------------------------------------*/
/*
		gameplay Physics Obj
*/
/*------------------------------------------------------------*/

gpphy::gpphy()
{
	// コンストラクタ
	_flag = GPPHY_FLAG_NONE;
}

gpphy::~gpphy()
{
}

void gpphy::reset( int id )
{
	_mode = 0;
	_mark = 0;
	_rigParams = NULL;
	_flag = GPPHY_FLAG_ENTRY;
	_id = id;
}


/*------------------------------------------------------------*/
/*
		Physics process
*/
/*------------------------------------------------------------*/

gpphy *gamehsp::getPhy( int id )
{
	int flag_id;
	int base_id;
	flag_id = id & GPOBJ_ID_FLAGBIT;
	if ( flag_id != GPOBJ_ID_PHYFLAG ) return NULL;
	base_id = id & GPOBJ_ID_FLAGMASK;
	if (( base_id < 0 )||( base_id >= _maxphy )) return NULL;
	if ( _gpphy[base_id]._flag == GPPHY_FLAG_NONE ) return NULL;
	return &_gpphy[base_id];
}


int gamehsp::deletePhy( int id )
{
	gpphy *phy = getPhy( id );
	if ( phy == NULL ) return -1;
	phy->_flag = GPPHY_FLAG_NONE;
	if ( phy->_rigParams ) {
		delete phy->_rigParams;
		phy->_rigParams = NULL;
	}
	return 0;
}


gpphy *gamehsp::addPhy( void )
{
	int i;
	gpphy *phy = _gpphy;
	for(i=0;i<_maxphy;i++) {
		if ( phy->_flag == GPPHY_FLAG_NONE ) {
			phy->reset( i|GPOBJ_ID_PHYFLAG );
			return phy;
		}
		phy++;
	}
	return NULL;
}


PhysicsRigidBody::Parameters *gamehsp::getParameters( int phyid )
{
	gpphy *phy = getPhy( phyid );
	if ( phy == NULL ) return NULL;
	return phy->_rigParams;
}


