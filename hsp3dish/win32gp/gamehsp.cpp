#include "gamehsp.h"

#include "../../hsp3/hsp3config.h"
#include "../supio.h"
#include "../sysreq.h"

// Default sprite shaders
#define SPRITE_VSH "res/shaders/sprite.vert"
#define SPRITE_FSH "res/shaders/sprite.frag"

#define SPRITECOL_VSH "res/shaders/spritecol.vert"
#define SPRITECOL_FSH "res/shaders/spritecol.frag"

enum {
CLSMODE_NONE = 0,
CLSMODE_SOLID,
CLSMODE_TEXTURE,
CLSMODE_BLUR,
CLSMODE_MAX,
};

/*------------------------------------------------------------*/
/*
		gameplay Node Obj
*/
/*------------------------------------------------------------*/

gpobj::gpobj()
{
	// コンストラクタ
	_flag = GPOBJ_FLAG_NONE;
}

gpobj::~gpobj()
{
}

void gpobj::reset( int id )
{
	_mode = 0;
	_mark = 0;
	_shape = GPOBJ_SHAPE_NONE;
	_node = NULL;
	_model = NULL;
	_camera = NULL;
	_light = NULL;
	_flag = GPOBJ_FLAG_ENTRY;
	_id = id;
	_usegpmat = -1;
}


/*------------------------------------------------------------*/
/*
		gameplay game class
*/
/*------------------------------------------------------------*/

gamehsp::gamehsp()
{
	// コンストラクタ
	mFont = NULL;
	_maxobj = 0;
	_gpobj = NULL;
	_gpmat = NULL;
	_gpphy = NULL;
	_colrate = 1.0f / 255.0f;
	_scene = NULL;
	_meshBatch = NULL;
	_meshBatch_line = NULL;
	_spriteEffect = NULL;

}

void gamehsp::initialize()
{
	// フォント作成
	mFont = Font::create("res/font.gpb");
	resetScreen();
}

void gamehsp::finalize()
{
	// release
	//
	deleteAll();

	SAFE_RELEASE(mFont);
}


void gamehsp::deleteAll( void )
{
	// release
	//
	if ( _scene ) {
		_scene->removeAllNodes();
	}

	if ( _gpobj ) {
		int i;
		for(i=0;i<_maxobj;i++) { deleteObj( i ); }
		delete[] _gpobj;
		_gpobj = NULL;
	}
	if ( _gpmat ) {
		int i;
		for(i=0;i<_maxmat;i++) { deleteMat( i ); }
		delete[] _gpmat;
		_gpmat = NULL;
	}
	if ( _gpphy ) {
		int i;
		for(i=0;i<_maxphy;i++) { deletePhy( i ); }
		delete[] _gpphy;
		_gpphy = NULL;
	}

	if ( _meshBatch ) {
		delete _meshBatch;
		_meshBatch = NULL;
	}
	if ( _meshBatch_line ) {
		delete _meshBatch_line;
		_meshBatch_line = NULL;
	}

	SAFE_RELEASE(_spriteEffect);
	SAFE_RELEASE(_scene);
}


void gamehsp::update(float elapsedTime)
{
}

void gamehsp::render(float elapsedTime)
{
    // Clear the color and depth buffers
	Vector4 clscolor;
	int icolor;
	int clsmode;

	icolor = GetSysReq( SYSREQ_CLSCOLOR );
	clsmode = GetSysReq( SYSREQ_CLSMODE );

	if ( clsmode == CLSMODE_NONE ) {
		clear(CLEAR_DEPTH, Vector4::zero(), 1.0f, 0);
		return;
	}

	clscolor.set( ( (icolor>>16)&0xff )*_colrate, ( (icolor>>8)&0xff )*_colrate, ( icolor&0xff )*_colrate, 1.0f );
    clear(CLEAR_COLOR_DEPTH, clscolor, 1.0f, 0);

    //nodetemp->rotateY(MATH_DEG_TO_RAD((float)elapsedTime / 1000.0f * 180.0f));
}

void gamehsp::keyEvent(Keyboard::KeyEvent evt, int key)
{
}

void gamehsp::touchEvent(Touch::TouchEvent evt, int x, int y, unsigned int contactIndex)
{
}

/*------------------------------------------------------------*/
/*
		HSP Script Service
*/
/*------------------------------------------------------------*/

void gamehsp::hookSetSysReq( int reqid, int value )
{
	//	HGIMG4用のSetSysReq
	//
	switch( reqid ) {
	case SYSREQ_VSYNC:
		setVsync( value!=0 );
		break;
	default:
		break;
	}
}


void gamehsp::hookGetSysReq( int reqid )
{
	//	HGIMG4用のGetSysReq
	//
	switch( reqid ) {
	case SYSREQ_FPS:
		SetSysReq( reqid, (int)getFrameRate() );
		break;
	default:
		break;
	}
}


void gamehsp::resetScreen( int opt )
{
	if ( opt == 1 ) {
		_scene->removeAllNodes();
		return;
	}

	// 画面の初期化
	deleteAll();

	// VSYNCの設定
	setVsync( GetSysReq( SYSREQ_VSYNC )!=0 );

	// gpobj作成
	_maxobj = GetSysReq( SYSREQ_MAXOBJ );
	_gpobj = new gpobj[ _maxobj ];

	// gpmat作成
	_maxmat = GetSysReq( SYSREQ_MAXMATERIAL );
	_gpmat = new gpmat[ _maxmat ];

	// gplgt作成
	_maxphy = GetSysReq( SYSREQ_MAXPHYSICS );
	_gpphy = new gpphy[ _maxphy ];

	// シーン作成
	_scene = Scene::create();
	_curscene = 0;

	// カメラ作成
	//Camera*	camera = Camera::createPerspective(45.0f, getAspectRatio(), 0.01f, 20.0f );
	//Camera*	camera = Camera::createPerspective(0.25f*3.141592654f, getAspectRatio(), 0.5f, 768.0f );
	//_cameraDefault = Camera::createPerspective( 45.0f, getAspectRatio(), 0.5f, 768.0f );

	_defcamera = makeNewCam( -1, 45.0f, getAspectRatio(), 0.5f, 768.0f );		// カメラを生成
	selectCamera( _defcamera );

//	_camera = _scene->addNode("camera");
//	_camera->setCamera( _cameraDefault );
//	_scene->setActiveCamera( _cameraDefault );	// カメラ設定
//	_camera->translate(0, 0, 100);
//	SAFE_RELEASE(camera);

	// シーンライト作成
	_scene->setLightColor( 1.0f, 1.0f, 1.0f );

	Vector3 ldir;
	ldir.set( -0.5f, 0.0f, -0.3f );
	_scene->setLightDirection( ldir );
	_scene->setAmbientColor( 0.25f, 0.25f, 0.25f );

	// ライト作成
	_deflight = makeNewLgt( -1, GPLGT_OPT_NORMAL );
	selectLight( _deflight );

	// 2D初期化
	init2DRender();

	//makeFloorNode( 20.0f, 20.0f, 0x404040 );
	//makeModelNode( "res/mikuA","mikuA_root" );
}


void gamehsp::deleteObjectID( int id )
{
	//	指定されたIDのオブジェクトを削除する
	//	(gpobj,gpmat,gplgt,gpcam,gpphyで使用可能)
	//
	int flag_id;
	int base_id;
	flag_id = id & GPOBJ_ID_FLAGBIT;
	base_id = id & GPOBJ_ID_FLAGMASK;
	switch( flag_id ) {
	case GPOBJ_ID_MATFLAG:
		deleteMat( id );
		return;
	case GPOBJ_ID_PHYFLAG:
		deletePhy( id );
		return;
	default:
		break;
	}
	deleteObj( base_id );
}


bool gamehsp::init2DRender( void )
{
	// 2D用の初期化
	//

	// 2D用のプロジェクション
	//Matrix::createOrthographic(getWidth(), getHeight(), -1.0f, 1.0f, &_projectionMatrix2D);
	Matrix::createOrthographicOffCenter( 0.0f, getWidth(), getHeight(), 0.0f, -1.0f, 1.0f, &_projectionMatrix2D);

	// スプライト用のshader
	_spriteEffect = Effect::createFromFile(SPRITE_VSH, SPRITE_FSH);
	if ( _spriteEffect == NULL ) {
        GP_ERROR("2D shader initalize failed.");
        return false;
	}

	// MeshBatch for FlatPolygon Draw
	Material* mesh_material = make2DMaterialForMesh();
    VertexFormat::Element elements[] =
    {
        VertexFormat::Element(VertexFormat::POSITION, 3),
        VertexFormat::Element(VertexFormat::COLOR, 4)
    };
    unsigned int elementCount = sizeof(elements) / sizeof(VertexFormat::Element);
    _meshBatch = MeshBatch::create(VertexFormat(elements, elementCount), Mesh::TRIANGLE_STRIP, mesh_material, true, 16, 16 );
	SAFE_RELEASE(mesh_material);

	mesh_material = make2DMaterialForMesh();
	_meshBatch_line = MeshBatch::create(VertexFormat(elements, elementCount), Mesh::LINES, mesh_material, true, 4, 4 );
	SAFE_RELEASE(mesh_material);


	int i;
	for(i=0;i<BUFSIZE_POLYCOLOR;i++) {
		_bufPolyColor[i] = 0.0f;
	}
	for(i=0;i<BUFSIZE_POLYTEX;i++) {
		_bufPolyTex[i] = 0.0f;
	}

	return true;
}


void gamehsp::selectScene( int sceneid )
{
	_curscene = sceneid;
}


void gamehsp::addSceneVector( int ch, Vector4 *prm )
{
}


void gamehsp::addNodeVector( gpobj *obj, Node *node, int moc, Vector4 *prm )
{
	switch(moc) {
	case MOC_POS:
		if ( node ) {
			node->translate( prm->x, prm->y, prm->z );
		}
		break;
	case MOC_QUAT:
		if ( node ) {
			node->rotate( prm->x, prm->y, prm->z, prm->w );
		}
		break;
	case MOC_SCALE:
		if ( node ) {
			node->scale( prm->x, prm->y, prm->z );
		}
		break;
	case MOC_DIR:
		if ( obj ) {
			obj->_vec[GPOBJ_USERVEC_DIR] += *prm;
		}
		break;
	case MOC_EFX:
		break;
	case MOC_COLOR:
		if ( obj ) {
			obj->_vec[GPOBJ_USERVEC_COLOR] += *prm;
			if ( obj->_light ) updateLightVector( obj, moc );
		}
		break;
	case MOC_WORK:
		if ( obj ) {
			obj->_vec[GPOBJ_USERVEC_WORK] += *prm;
		}
		break;
	case MOC_WORK2:
		if ( obj ) {
			obj->_vec[GPOBJ_USERVEC_WORK2] += *prm;
		}
		break;

	case MOC_AXANG:
		break;
	case MOC_ANGX:
		if ( node ) {
			node->rotateX( prm->x );
			node->rotateY( prm->y );
			node->rotateZ( prm->z );
		}
		break;
	case MOC_ANGY:
		if ( node ) {
			node->rotateY( prm->y );
			node->rotateZ( prm->z );
			node->rotateX( prm->x );
		}
		break;
	case MOC_ANGZ:
		if ( node ) {
			node->rotateZ( prm->z );
			node->rotateY( prm->y );
			node->rotateX( prm->x );
		}
		break;


	}
}


int gamehsp::addObjectVector( int objid, int moc, Vector4 *prm )
{
	gpobj *obj;
	int flag_id;
	flag_id = objid & GPOBJ_ID_FLAGBIT;
	if ( flag_id == 0 ) {
		obj = getObj( objid );
		if ( obj == NULL ) return -1;
		addNodeVector( obj, obj->_node, moc, prm );
		return 0;
	}

	switch( flag_id ) {
	case GPOBJ_ID_EXFLAG:
		break;
	default:
		return -1;
	}

	//	GPOBJ_ID_EXFLAGの場合
	switch( objid ) {
	case GPOBJ_ID_SCENE:
		addSceneVector( moc, prm );
		return 0;
	case GPOBJ_ID_CAMERA:
		obj = getObj( _defcamera );
		break;
	case GPOBJ_ID_LIGHT:
		obj = getObj( _deflight );
		break;
	default:
		return -1;
	}
	if ( obj == NULL ) return -1;
	addNodeVector( obj, obj->_node, moc, prm );
	return 0;
}


void gamehsp::lookAtNode(Node* node, const Vector3& target )
{
	Vector3 up;
	up.set( 0.0f, 1.0f, 0.0f );

	// Create lookAt matrix
    Matrix matrix;
	Matrix::createLookAt( node->getTranslation(), target, up, &matrix);
    matrix.transpose();

    // Pull rotation out of matrix
    Quaternion rotation;
    matrix.getRotation(&rotation);

    // Set rotation on node
    node->setRotation(rotation);
}



int gamehsp::lookAtObject( int objid, Vector4 *prm )
{
	Vector3 target;
	target.set( prm->x, prm->y, prm->z );
	Node *node;
	node = getNode( objid );
	if ( node == NULL ) return -1;
	lookAtNode( node, target );
	return 0;
}


void gamehsp::setSceneVector( int ch, Vector4 *prm )
{
}


void gamehsp::setNodeVector( gpobj *obj, Node *node, int moc, Vector4 *prm )
{
	switch(moc) {
	case MOC_POS:
		if ( node ) {
			node->setTranslation( prm->x, prm->y, prm->z );
		}
		break;
	case MOC_QUAT:
		if ( node ) {
			node->setRotation( prm->x, prm->y, prm->z, prm->w );
		}
		break;
	case MOC_SCALE:
		if ( node ) {
			node->setScale( prm->x, prm->y, prm->z );
		}
		break;
	case MOC_DIR:
		if ( obj ) {
			obj->_vec[GPOBJ_USERVEC_DIR] = *prm;
		}
		break;
	case MOC_EFX:
		break;

	case MOC_ANGX:
		if ( node ) {
			Matrix matrix;
			matrix.identity();
			matrix.rotateX( prm->x );
			matrix.rotateY( prm->y );
			matrix.rotateZ( prm->z );
			node->setRotation( matrix );
		}
		break;
	case MOC_ANGY:
		if ( node ) {
			Matrix matrix;
			matrix.identity();
			matrix.rotateY( prm->y );
			matrix.rotateX( prm->x );
			matrix.rotateZ( prm->z );
			node->setRotation( matrix );
		}
		break;
	case MOC_ANGZ:
		if ( node ) {
			Matrix matrix;
			matrix.identity();
			matrix.rotateZ( prm->z );
			matrix.rotateY( prm->y );
			matrix.rotateX( prm->x );
			node->setRotation( matrix );
		}
		break;

	case MOC_COLOR:
		if ( obj ) {
			obj->_vec[GPOBJ_USERVEC_COLOR] = *prm;
			if ( obj->_light ) updateLightVector( obj, moc );
		}
		break;
	case MOC_WORK:
		if ( obj ) {
			obj->_vec[GPOBJ_USERVEC_WORK] = *prm;
		}
		break;
	case MOC_WORK2:
		if ( obj ) {
			obj->_vec[GPOBJ_USERVEC_WORK2] = *prm;
		}
		break;
	}
}


int gamehsp::setObjectVector( int objid, int moc, Vector4 *prm )
{
	gpobj *obj;
	int flag_id;
	flag_id = objid & GPOBJ_ID_FLAGBIT;
	if ( flag_id == 0 ) {
		obj = getObj( objid );
		if ( obj == NULL ) return -1;
		setNodeVector( obj, obj->_node, moc, prm );
		return 0;
	}

	switch( flag_id ) {
	case GPOBJ_ID_EXFLAG:
		break;
	default:
		return -1;
	}

	//	GPOBJ_ID_EXFLAGの場合
	switch( objid ) {
	case GPOBJ_ID_SCENE:
		setSceneVector( moc, prm );
		return 0;
	case GPOBJ_ID_CAMERA:
		obj = getObj( _defcamera );
		break;
	case GPOBJ_ID_LIGHT:
		obj = getObj( _deflight );
		break;
	default:
		return -1;
	}
	if ( obj == NULL ) return -1;
	setNodeVector( obj, obj->_node, moc, prm );
	return 0;
}


int gamehsp::getObjectVector( int objid, int moc, Vector4 *prm )
{
	int flag_id;
	flag_id = objid & GPOBJ_ID_FLAGBIT;
	if ( flag_id == 0 ) {
		gpobj *obj;
		obj = getObj( objid );
		if ( obj == NULL ) return -1;
		getNodeVector( obj, obj->_node, moc, prm );
		return 0;
	}
	getNodeVector( NULL, getNode(objid), moc, prm );

	return 0;
}


void gamehsp::getNodeVector( gpobj *obj, Node *node, int moc, Vector4 *prm )
{
	switch(moc) {
	case MOC_POS:
		if ( node ) {
			*(Vector3 *)prm = node->getTranslation();
			prm->w = 0.0f;
		}
		break;
	case MOC_QUAT:
		if ( node ) {
			Quaternion quat;
			quat = node->getRotation();
			prm->x = quat.x;
			prm->y = quat.y;
			prm->z = quat.z;
			prm->w = quat.w;
		}
		break;
	case MOC_SCALE:
		if ( node ) {
			*(Vector3 *)prm = node->getScale();
			prm->w = 1.0f;
		}
		break;
	case MOC_DIR:
		if ( obj ) {
			*prm = obj->_vec[GPOBJ_USERVEC_DIR];
		}
		break;
	case MOC_EFX:
		break;

	case MOC_COLOR:
		if ( obj ) {
			*prm = obj->_vec[GPOBJ_USERVEC_COLOR];
		}
		break;
	case MOC_WORK:
		if ( obj ) {
			*prm = obj->_vec[GPOBJ_USERVEC_WORK];
		}
		break;
	case MOC_WORK2:
		if ( obj ) {
			*prm = obj->_vec[GPOBJ_USERVEC_WORK2];
		}
		break;
	}
}


void gamehsp::drawNode( Node *node )
{
	Model* model = node->getModel(); 
	if (model) {
		model->draw();
	}
}


void gamehsp::drawAll( int option )
{
	// すべてのノードを描画
	//

	// ビルボード用の向きを作成
	Matrix m;
	Camera* camera = _scene->getActiveCamera();
	m = camera->getNode()->getMatrix();
	m.getRotation(&_qcam_billboard);
/*
	int i;
	Node *node;
	gpobj *obj = _gpobj;

	for(i=0;i<_maxobj;i++) {
		if ( obj->_flag ) {
			node = obj->_node;
			if ( node ) {
				drawNode( obj );
			}
		}
		obj++;
	}
*/
	_scene->visit(this, &gamehsp::drawScene);
}


bool gamehsp::drawScene(Node* node)
{
    // If the node visited contains a model, draw it
	gpobj *obj = (gpobj *)node->getUserPointer();
    Model* model = node->getModel(); 

	if ( obj ) {
		int mode = obj->_mode;
		if ( mode & GPOBJ_MODE_HIDE ) return true;
		if ( mode & GPOBJ_MODE_XFRONT ) {
			node->setRotation(_qcam_billboard);
		}
		if ( mode & GPOBJ_MODE_CLIP ) {
			if (node->getBoundingSphere().intersects(_cameraDefault->getFrustum()) == false ) return true;
		}
		if ( mode & GPOBJ_MODE_WIRE ) {
			if (model) { model->draw(true); }
			return true;
		}
	}

    if (model)
    {
        model->draw();
    }
    return true;
}


int gamehsp::drawFont( int x, int y, char *text, Vector4 *p_color, int size )
{
	// フォントで描画
	int xsize;
	if ( mFont == NULL ) return 0;

    mFont->start();
    xsize = mFont->drawText(text, x, y, *p_color, size );
    mFont->finish();
	return xsize;
}


/*------------------------------------------------------------*/
/*
		Primitive process
*/
/*------------------------------------------------------------*/

int gamehsp::makeNullNode( void )
{
	Node *node;
	gpobj *obj = addObj();
	if ( obj == NULL ) return -1;

	node = Node::create();
	obj->_node = node;
	node->setUserPointer( obj, NULL );

	if ( _curscene >= 0 ) {
		_scene->addNode( obj->_node );
	}

	return obj->_id;
}


int gamehsp::makeFloorNode( float xsize, float ysize, int color, int matid )
{
	gpobj *obj = addObj();
	if ( obj == NULL ) return -1;

    // 平面作成
	Mesh* floorMesh = Mesh::createQuad(
		Vector3( -xsize * 0.5f , 0, -ysize * 0.5f ), Vector3( -xsize * 0.5f , 0, ysize * 0.5f ), 
		Vector3( xsize * 0.5f ,  0, -ysize * 0.5f ), Vector3( xsize * 0.5f , 0, ysize * 0.5f ));

	//Mesh* floorMesh = createFloorMesh( xsize, ysize );

	Material *material;
	if ( matid < 0 ) {
		int matopt = 0;
		if ( _curlight < 0 ) matopt |= GPOBJ_MATOPT_NOLIGHT;
		material = makeMaterialColor( color, matopt );
	} else {
		material = getMaterial( matid );
	}
	makeNewModel( obj, floorMesh, material );

    // メッシュ削除
    SAFE_RELEASE(floorMesh);

	// 初期化パラメーターを保存
	obj->_shape = GPOBJ_SHAPE_FLOOR;
	obj->_sizevec.set( xsize, 0, ysize );

/*
	// 物理設定
	PhysicsRigidBody::Parameters rigParams;
	rigParams.mass = 0.0f;	// 重さ
    rigParams.friction = 0.5;
    rigParams.restitution = 0.75;
    rigParams.linearDamping = 0.025;
    rigParams.angularDamping = 0.16;
	obj->_node->setCollisionObject(PhysicsCollisionObject::RIGID_BODY, 
		PhysicsCollisionShape::box(Vector3(xsize * 2, 0, ysize * 2)), &rigParams);
*/

	if ( _curscene >= 0 ) {
		_scene->addNode( obj->_node );
	}

	return obj->_id;
}


int gamehsp::makePlateNode( float xsize, float ysize, int color, int matid )
{
	gpobj *obj = addObj();
	if ( obj == NULL ) return -1;

    // 平面作成
	Mesh* floorMesh = Mesh::createQuad(
		Vector3( -xsize * 0.5f , ysize * 0.5f, 0 ), Vector3( -xsize * 0.5f , -ysize * 0.5f, 0 ), 
		Vector3( xsize * 0.5f ,  ysize * 0.5f, 0 ), Vector3( xsize * 0.5f , -ysize * 0.5f, 0 ));

	//Mesh* floorMesh = createFloorMesh( xsize, ysize );

	Material *material;
	if ( matid < 0 ) {
		int matopt = 0;
		if ( _curlight < 0 ) matopt |= GPOBJ_MATOPT_NOLIGHT;
		material = makeMaterialColor( color, matopt );
	} else {
		material = getMaterial( matid );
	}
	makeNewModel( obj, floorMesh, material );

    // メッシュ削除
    SAFE_RELEASE(floorMesh);

	// 初期化パラメーターを保存
	obj->_shape = GPOBJ_SHAPE_PLATE;
	obj->_sizevec.set( xsize, ysize, 0 );

	if ( _curscene >= 0 ) {
		_scene->addNode( obj->_node );
	}

	return obj->_id;
}


int gamehsp::makeBoxNode( float size, int color, int matid )
{
	Mesh *mesh;
	gpobj *obj = addObj();
	if ( obj == NULL ) return -1;

	mesh = createCubeMesh( size );

	Material *material;
	if ( matid < 0 ) {
		int matopt = 0;
		if ( _curlight < 0 ) matopt |= GPOBJ_MATOPT_NOLIGHT;
		material = makeMaterialColor( color, matopt );
	} else {
		material = getMaterial( matid );
	}
	makeNewModel( obj, mesh, material );

	// 初期化パラメーターを保存
	obj->_shape = GPOBJ_SHAPE_BOX;
	obj->_sizevec.set( size, size, size );

    // メッシュ削除
    SAFE_RELEASE(mesh);

/*
	// 物理設定
	PhysicsRigidBody::Parameters rigParams;
	rigParams.mass = 1.0f;	// 重さ
	rigParams.friction = 0.5;
	rigParams.restitution = 0.5;
	rigParams.linearDamping = 0.1;
	rigParams.angularDamping = 0.5;
	obj->_node->setCollisionObject(PhysicsCollisionObject::RIGID_BODY, 
		PhysicsCollisionShape::box(Vector3(1,1,1)), &rigParams);
*/

	if ( _curscene >= 0 ) {
		_scene->addNode( obj->_node );
	}

	BoundingSphere bound = obj->_node->getBoundingSphere();

	return obj->_id;
}


int gamehsp::makeModelNode( char *fname, char *idname )
{
	char fn[512];
	char fn2[512];
	gpobj *obj = addObj();
	if ( obj == NULL ) return -1;

	//getpath( fname, fn, 1 );
	strcpy( fn, fname );
	strcpy( fn2, fn );
	strcat( fn, ".gpb" );
	strcat( fn2, ".material" );

    Bundle *bundle = Bundle::create( fn );
    Node *mCubeNode = bundle->loadNode(idname);

	if ( _curscene >= 0 ) {
		_scene->addNode( mCubeNode );
	}

	//mCubeNode->scale( 0.2f );

    Node *node = mCubeNode;
	if ( node->getModel() == NULL ) {
		node = mCubeNode->getFirstChild();
	}
	Model* model = node->getModel();

	Material* boxMaterial = Material::create( fn2 );

	MaterialParameter *ambientColorParam = boxMaterial->getParameter("u_ambientColor");
	MaterialParameter *lightDirectionParam = boxMaterial->getParameter("u_lightDirection");
	MaterialParameter *lightColorParam = boxMaterial->getParameter("u_lightColor");

	if ( _curlight >= 0 ) {
		//	カレントライトを反映させる
		gpobj *lgt;
		Node *light_node;
		lgt = getObj( _curlight );
		light_node = lgt->_node;

		// ライトの方向設定
		if ( lightDirectionParam ) {
			lightDirectionParam->bindValue(light_node, &Node::getForwardVectorView);
		}
	    // ライトの色設定
		// (リアルタイムに変更を反映させる場合は再設定が必要。現在は未対応)
		if ( ambientColorParam ) {
			Vector3 *vambient;
			vambient = (Vector3 *)&lgt->_vec[GPOBJ_USERVEC_WORK];
			ambientColorParam->setValue( vambient );
		}
		if ( lightColorParam ) {
			lightColorParam->setValue(light_node->getLight()->getColor());
		}
	}

	model->setMaterial( boxMaterial );

	SAFE_RELEASE(bundle);
    SAFE_RELEASE(boxMaterial);

	//nodetemp = mCubeNode;
	mCubeNode->setUserPointer( obj, NULL );
	obj->_node = mCubeNode;

	// 初期化パラメーターを保存
	obj->_shape = GPOBJ_SHAPE_MODEL;

	return obj->_id;
}


void gamehsp::makeNewModel( gpobj *obj, Mesh *mesh, Material *material )
{
	//	gpobjに新規モデルを追加してメッシュとマテリアルを設定する
	//
	Model *model;
	model = Model::create(mesh);	// モデル作成
	model->setMaterial( material );

	Node *node = obj->_node;
	if ( node == NULL ) {
		node = Node::create();
		obj->_node = node;
	}
	node->setModel(model);
	node->setUserPointer( obj, NULL );
	obj->_model = model;
	SAFE_RELEASE(model);
}


int gamehsp::makeNewModelWithMat( gpobj *obj, Mesh *mesh, int matid )
{
	//	gpobjに新規モデルを追加してメッシュとマテリアルを設定する
	//  (マテリアルIDを使用)
	//
	gpmat *mat = getMat( matid );
	if ( mat == NULL ) return -1;
	makeNewModel( obj, mesh, mat->_material );
	obj->_usegpmat = matid;
	return 0;
}



/*------------------------------------------------------------*/
/*
		Physics process
*/
/*------------------------------------------------------------*/

int gamehsp::setPhysicsObjectAuto( int objid, float mass, float friction )
{
	gpobj *obj;
	obj = getObj( objid );
	if ( obj == NULL ) return -1;
	Node *node = obj->_node;
	if ( node == NULL ) return -1;

	if ( obj->_shape < 0 ) return -1;

	PhysicsRigidBody::Parameters rigParams;

	rigParams.mass = mass;	// 重さ
	rigParams.friction = friction;
	rigParams.restitution = 0.5f;
	rigParams.linearDamping = 0.1f;
	rigParams.angularDamping = 0.5f;

	switch( obj->_shape ) {
	case GPOBJ_SHAPE_BOX:
		node->setCollisionObject(PhysicsCollisionObject::RIGID_BODY, 
			PhysicsCollisionShape::box( obj->_sizevec ), &rigParams);
		break;
	case GPOBJ_SHAPE_FLOOR:
	case GPOBJ_SHAPE_PLATE:
	    rigParams.restitution = 0.75f;
	    rigParams.linearDamping = 0.025f;
	    rigParams.angularDamping = 0.16f;
		node->setCollisionObject(PhysicsCollisionObject::RIGID_BODY, 
			PhysicsCollisionShape::box( obj->_sizevec ), &rigParams);
		break;
	case GPOBJ_SHAPE_MODEL:
		{
		BoundingSphere sphere;
		sphere = node->getBoundingSphere();
		node->setCollisionObject(PhysicsCollisionObject::RIGID_BODY, 
			PhysicsCollisionShape::sphere( sphere.radius, sphere.center ), &rigParams);
		break;
		}
	default:
		return -1;
	}

	return 0;
}


/*------------------------------------------------------------*/
/*
		Node process
*/
/*------------------------------------------------------------*/

gpobj *gamehsp::getObj( int id )
{
	if (( id < 0 )||( id >= _maxobj )) return NULL;
	if ( _gpobj[id]._flag == GPOBJ_FLAG_NONE ) return NULL;
	return &_gpobj[id];
}


int gamehsp::deleteObj( int id )
{
	Model *model;
	Material *material;
	gpobj *obj = getObj( id );
	if ( obj == NULL ) return -1;
	obj->_flag = GPOBJ_FLAG_NONE;
	model = obj->_model;
	if ( model ) {
		if ( obj->_usegpmat < 0 ) {
			material = model->getMaterial();
			material->release();		// 独自にcreateした参照カウントを減らす
		}
	}
    SAFE_RELEASE( obj->_node );

    SAFE_RELEASE( obj->_camera );
    SAFE_RELEASE( obj->_light );

	return 0;
}


gpobj *gamehsp::addObj( void )
{
	int i;
	gpobj *obj = _gpobj;
	for(i=0;i<_maxobj;i++) {
		if ( obj->_flag == GPOBJ_FLAG_NONE ) {
			obj->reset(i);
			return obj;
		}
		obj++;
	}
	return NULL;
}


Node *gamehsp::getNode( int objid )
{
	//	指定されたIDの持つノードを返す
	//	(gpobj,gplgt,cameraで使用可能)
	//
	int flag_id;
	gpobj *obj;
	flag_id = objid & GPOBJ_ID_FLAGBIT;
	switch( flag_id ) {
	case 0:
		obj = getObj( objid );
		if ( obj == NULL ) return NULL;
		return obj->_node;
	case GPOBJ_ID_EXFLAG:
		break;
	default:
		return NULL;
	}

	//	GPOBJ_ID_EXFLAGの場合
	switch( objid ) {
//	case GPOBJ_ID_SCENE:
	case GPOBJ_ID_CAMERA:
		return _cameraDefault->getNode();
	case GPOBJ_ID_LIGHT:
		obj = getObj( _deflight );
		if ( obj == NULL ) return NULL;
		return obj->_node;
	default:
		break;
	}
	return NULL;
}


int gamehsp::makeCloneNode( int objid )
{
	gpobj *obj;
	Node *node;
	obj = getObj( objid );
	if ( obj == NULL ) return -1;
	node = obj->_node;
	if ( node == NULL ) return -1;

	gpobj *newobj = addObj();
	if ( newobj == NULL ) return -1;

	newobj->_mode = obj->_mode;
	newobj->_usegpmat = obj->_usegpmat;
	newobj->_shape = obj->_shape;
	newobj->_sizevec = obj->_sizevec;

	node->setUserPointer( NULL, NULL );

	newobj->_node = node->clone();
	newobj->_node->setUserPointer( newobj, NULL );

	if ( _curscene >= 0 ) {
		_scene->addNode( newobj->_node );
	}

	node->setUserPointer( obj, NULL );

	return newobj->_id;
}


/*------------------------------------------------------------*/
/*
		Utils
*/
/*------------------------------------------------------------*/

void gamehsp::colorVector3( int icolor, Vector4 &vec )
{
	vec.set( ( (icolor>>16)&0xff )*_colrate, ( (icolor>>8)&0xff )*_colrate, ( icolor&0xff )*_colrate, 1.0f );
}


void gamehsp::colorVector4( int icolor, Vector4 &vec )
{
	vec.set( ( (icolor>>16)&0xff )*_colrate, ( (icolor>>8)&0xff )*_colrate, ( icolor&0xff )*_colrate, ( (icolor>>24)&0xff )*_colrate );
}


Mesh *gamehsp::createCubeMesh( float size )
{
    float a = size * 0.5f;
    float vertices[] =
    {
        -a, -a,  a,    0.0,  0.0,  1.0,   0.0, 0.0,
         a, -a,  a,    0.0,  0.0,  1.0,   1.0, 0.0,
        -a,  a,  a,    0.0,  0.0,  1.0,   0.0, 1.0,
         a,  a,  a,    0.0,  0.0,  1.0,   1.0, 1.0,
        -a,  a,  a,    0.0,  1.0,  0.0,   0.0, 0.0,
         a,  a,  a,    0.0,  1.0,  0.0,   1.0, 0.0,
        -a,  a, -a,    0.0,  1.0,  0.0,   0.0, 1.0,
         a,  a, -a,    0.0,  1.0,  0.0,   1.0, 1.0,
        -a,  a, -a,    0.0,  0.0, -1.0,   0.0, 0.0,
         a,  a, -a,    0.0,  0.0, -1.0,   1.0, 0.0,
        -a, -a, -a,    0.0,  0.0, -1.0,   0.0, 1.0,
         a, -a, -a,    0.0,  0.0, -1.0,   1.0, 1.0,
        -a, -a, -a,    0.0, -1.0,  0.0,   0.0, 0.0,
         a, -a, -a,    0.0, -1.0,  0.0,   1.0, 0.0,
        -a, -a,  a,    0.0, -1.0,  0.0,   0.0, 1.0,
         a, -a,  a,    0.0, -1.0,  0.0,   1.0, 1.0,
         a, -a,  a,    1.0,  0.0,  0.0,   0.0, 0.0,
         a, -a, -a,    1.0,  0.0,  0.0,   1.0, 0.0,
         a,  a,  a,    1.0,  0.0,  0.0,   0.0, 1.0,
         a,  a, -a,    1.0,  0.0,  0.0,   1.0, 1.0,
        -a, -a, -a,   -1.0,  0.0,  0.0,   0.0, 0.0,
        -a, -a,  a,   -1.0,  0.0,  0.0,   1.0, 0.0,
        -a,  a, -a,   -1.0,  0.0,  0.0,   0.0, 1.0,
        -a,  a,  a,   -1.0,  0.0,  0.0,   1.0, 1.0
    };
    short indices[] = 
    {
        0, 1, 2, 2, 1, 3, 4, 5, 6, 6, 5, 7, 8, 9, 10, 10, 9, 11, 12, 13, 14, 14, 13, 15, 16, 17, 18, 18, 17, 19, 20, 21, 22, 22, 21, 23
    };
    unsigned int vertexCount = 24;
    unsigned int indexCount = 36;
    VertexFormat::Element elements[] =
    {
        VertexFormat::Element(VertexFormat::POSITION, 3),
        VertexFormat::Element(VertexFormat::NORMAL, 3),
        VertexFormat::Element(VertexFormat::TEXCOORD0, 2)
    };
    Mesh* mesh = Mesh::createMesh(VertexFormat(elements, 3), vertexCount, false);
    if (mesh == NULL)
    {
        GP_ERROR("Failed to create mesh.");
        return NULL;
    }
    mesh->setVertexData(vertices, 0, vertexCount);
    MeshPart* meshPart = mesh->addPart(Mesh::TRIANGLES, Mesh::INDEX16, indexCount, false);
    meshPart->setIndexData(indices, 0, indexCount);
    return mesh;
}


float *gamehsp::startPolyColor2D( void )
{
    _meshBatch->start();
	return _bufPolyColor;
}


void gamehsp::drawPolyColor2D( void )
{
    static unsigned short indices[] = { 0, 1, 2, 3 };
	_meshBatch->add( _bufPolyColor, 4, indices, 4 );
    _meshBatch->finish();
    _meshBatch->draw();
}


void gamehsp::addPolyColor2D( int num )
{
    static unsigned short indices[] = { 0, 1, 2, 3 };
	_meshBatch->add( _bufPolyColor, num, indices, num );
}


void gamehsp::finishPolyColor2D( void )
{
    _meshBatch->finish();
    _meshBatch->draw();
}


void gamehsp::setPolyDiffuse2D( float r, float g, float b, float a )
{
	//	Vertexのカラーコードのみを設定する
	//
	int i;
	float *v = _bufPolyColor;
	for(i=0;i<4;i++) {
		v += 3;						// Posを飛ばす
		*v++ = r;
		*v++ = g;
		*v++ = b;
		*v++ = a;
	}
}


float *gamehsp::startLineColor2D( void )
{
    _meshBatch_line->start();
	return _bufPolyColor;
}


void gamehsp::drawLineColor2D( void )
{
    static unsigned short indices[] = { 0, 1, 2, 3 };
	_meshBatch_line->add( _bufPolyColor, 2, indices, 2 );
    _meshBatch_line->finish();
    _meshBatch_line->draw();
}


void gamehsp::addLineColor2D( int num )
{
    static unsigned short indices[] = { 0, 1, 2, 3 };
	_meshBatch_line->add( _bufPolyColor, num, indices, num );
}


void gamehsp::finishLineColor2D( void )
{
    _meshBatch_line->finish();
    _meshBatch_line->draw();
}


float *gamehsp::startPolyTex2D( gpmat *mat )
{
	MeshBatch *mesh = mat->_mesh;
	if ( mesh == NULL ) {
        GP_ERROR("Bad Material.");
        return NULL;
	}

	mesh->start();
	return _bufPolyTex;
}


void gamehsp::drawPolyTex2D( gpmat *mat )
{
    static unsigned short indices[] = { 0, 1, 2, 3 };

	MeshBatch *mesh = mat->_mesh;
	if ( mesh == NULL ) {
        GP_ERROR("Bad Material.");
        return;
	}

	mesh->add( _bufPolyTex, 4, indices, 4 );
    mesh->finish();
    mesh->draw();
}


void gamehsp::addPolyTex2D( gpmat *mat )
{
    static unsigned short indices[] = { 0, 1, 2, 3 };

	MeshBatch *mesh = mat->_mesh;
	if ( mesh == NULL ) {
        GP_ERROR("Bad Material.");
        return;
	}
	mesh->add( _bufPolyTex, 4, indices, 4 );
}


void gamehsp::finishPolyTex2D( gpmat *mat )
{
	MeshBatch *mesh = mat->_mesh;
	if ( mesh == NULL ) {
        GP_ERROR("Bad Material.");
        return;
	}
    mesh->finish();
    mesh->draw();
}


void gamehsp::setPolyDiffuseTex2D( float r, float g, float b, float a )
{
	//	Vertexのカラーコードのみを設定する
	//
	int i;
	float *v = _bufPolyTex;
	for(i=0;i<4;i++) {
		v += 3 + 2;					// Pos,UVを飛ばす
		*v++ = r;
		*v++ = g;
		*v++ = b;
		*v++ = a;
	}
}


float gamehsp::setPolyColorBlend( int gmode, int gfrate )
{
	//	2Dカラー描画設定
	//	(戻り値=alpha値(0.0～1.0))
	//
	Material *material;
	material = _meshBatch->getMaterial();
	return setMaterialBlend( material, gmode, gfrate );
}


void gamehsp::drawTest( int matid )
{

	float points[] ={
	        0,100,0, 1,1,1,1,
	        0,0,0, 1,1,1,1,
	        100,100,0, 1,1,1,1,
	        100,0,0, 1,1,1,1,

	        0,300,0, 1,1,1,0,
	        0,200,0, 1,1,1,0,
	        100,300,0, 1,1,1,1,
	        100,200,0, 1,1,1,1,
	};

    //SPRITE_ADD_VERTEX(v[0], downLeft.x, downLeft.y, z, u1, v1, color.x, color.y, color.z, color.w);
    //SPRITE_ADD_VERTEX(v[1], upLeft.x, upLeft.y, z, u1, v2, color.x, color.y, color.z, color.w);
    //SPRITE_ADD_VERTEX(v[2], downRight.x, downRight.y, z, u2, v1, color.x, color.y, color.z, color.w);
    //SPRITE_ADD_VERTEX(v[3], upRight.x, upRight.y, z, u2, v2, color.x, color.y, color.z, color.w);

//	material->getParameter("u_projectionMatrix")->bindValue(this, &gamehsp::getProjectionMatrix);
//	material->getParameter("u_projectionMatrix")->setValue( _projectionMatrix2D );
//	material->getParameter("u_worldViewProjectionMatrix")->setValue( _camera->getWorldViewProjectionMatrix() );
//	material->getParameter("u_inverseTransposeWorldViewMatrix")->setValue( _camera->getInverseTransposeWorldViewMatrix() );
//	material->getParameter("u_cameraPosition")->setValue( _camera->getTranslation() );



    static unsigned short indices[] = { 0, 1, 2, 3, 3,4,   4,5,6,7, };



    _meshBatch->start();
    _meshBatch->add( points, 8, indices, 10 );
    _meshBatch->finish();
    _meshBatch->draw();


	return;
}


Material* gamehsp::make2DMaterialForMesh( void )
{
	RenderState::StateBlock *state;
	Material* mesh_material = Material::create( SPRITECOL_VSH, SPRITECOL_FSH, NULL );
	if ( mesh_material == NULL ) {
        GP_ERROR("2D initalize failed.");
        return false;
	}
    mesh_material->getParameter("u_projectionMatrix")->setValue(_projectionMatrix2D);
	state = mesh_material->getStateBlock();
	state->setCullFace(false);
	state->setDepthTest(false);
	state->setDepthWrite(false);
	state->setBlend(true);
	state->setBlendSrc(RenderState::BLEND_SRC_ALPHA);
	state->setBlendDst(RenderState::BLEND_ONE_MINUS_SRC_ALPHA);
	return mesh_material;
}


