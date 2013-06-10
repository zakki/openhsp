#ifndef gamehsp_H_
#define gamehsp_H_

#include "gameplay.h"
#include "gpmat.h"
#include "gplgt.h"
#include "gpcam.h"
#include "gpphy.h"

using namespace gameplay;

/**
 * Main game class.
 */
#define GPPRM_FPS 0
#define GPPRM_VSYNC 1
#define GPPRM_MAX 2

#define GPOBJ_FLAG_NONE (0)
#define GPOBJ_FLAG_ENTRY (1)

#define GPOBJ_MODE_HIDE (1)
#define GPOBJ_MODE_CLIP (2)
#define GPOBJ_MODE_XFRONT (4)
#define GPOBJ_MODE_WIRE (8)
#define GPOBJ_MODE_MOVE (32)
#define GPOBJ_MODE_FLIP (64)
#define GPOBJ_MODE_BORDER (0x80)
#define GPOBJ_MODE_2D (0x100)
#define GPOBJ_MODE_TIMER (0x200)
#define GPOBJ_MODE_SORT (0x400)
#define GPOBJ_MODE_LATE (0x4000)

#define GPOBJ_ID_PHYFLAG  (0x2000000)
#define GPOBJ_ID_MATFLAG  (0x800000)
#define GPOBJ_ID_FLAGBIT (0xff00000)
#define GPOBJ_ID_FLAGMASK (0x0fffff)

#define GPOBJ_ID_EXFLAG (0x100000)
#define GPOBJ_ID_SCENE  (0x100001)
#define GPOBJ_ID_CAMERA (0x100002)
#define GPOBJ_ID_LIGHT  (0x100003)

#define GPOBJ_SHAPE_NONE (-1)
#define GPOBJ_SHAPE_MODEL (0)
#define GPOBJ_SHAPE_BOX (1)
#define GPOBJ_SHAPE_FLOOR (2)
#define GPOBJ_SHAPE_PLATE (3)
#define GPOBJ_SHAPE_SPRITE (16)

enum {
MOC_POS = 0,
MOC_QUAT,
MOC_SCALE,
MOC_DIR,
MOC_EFX,
MOC_COLOR,
MOC_WORK,
MOC_WORK2,
MOC_AXANG,
MOC_ANGX,
MOC_ANGY,
MOC_ANGZ,
MOC_MAX
};

#define GPOBJ_USERVEC_DIR 0
#define GPOBJ_USERVEC_COLOR 1
#define GPOBJ_USERVEC_WORK 2
#define GPOBJ_USERVEC_WORK2 3
#define GPOBJ_USERVEC_MAX 4

#define GPOBJ_MARK_UPDATE_POS (0x100)
#define GPOBJ_MARK_UPDATE_ANG (0x200)
#define GPOBJ_MARK_UPDATE_SCALE (0x400)

#define GPOBJ_MATOPT_NOLIGHT (1)
#define GPOBJ_MATOPT_NOMIPMAP (2)
#define GPOBJ_MATOPT_NOCULL (4)
#define GPOBJ_MATOPT_NOZTEST (8)
#define GPOBJ_MATOPT_NOZWRITE (16)
#define GPOBJ_MATOPT_BLENDADD (32)


//  HGIMG4 Node Object
class gpobj {
public:
	gpobj();
	~gpobj();
	void reset( int id );

	short _flag;						// 存在フラグ
	short _mark;						// マーク処理用
	int _mode;							// モード(GPOBJ_MODE_*)
	int _id;							// ノードオブジェクトID
	int _shape;							// 生成された形状
	Node *_node;						// 生成されたNode
	Model *_model;						// 生成されたModel
	Camera *_camera;					// 生成されたCamera
	Light *_light;						// 生成されたLight
	int _usegpmat;						// gpmat使用時のID(-1=固有Material)
	Vector3 _sizevec;					// 生成されたサイズパラメーター
	Vector4 _vec[GPOBJ_USERVEC_MAX];	// ワーク用ベクター
};

#define BUFSIZE_POLYCOLOR 32
#define BUFSIZE_POLYTEX 64

//	gamehsp Object
class gamehsp: public Game
{
public:

    /**
     * Constructor.
     */
    gamehsp();

    /**
     * @see Game::keyEvent
     */
	void keyEvent(Keyboard::KeyEvent evt, int key);
	
    /**
     * @see Game::touchEvent
     */
    void touchEvent(Touch::TouchEvent evt, int x, int y, unsigned int contactIndex);


	/*
		HSP Support Functions
	*/
	void resetScreen( int opt=0 );
	void deleteAll( void );
	void deleteObjectID( int id );

	void hookSetSysReq( int reqid, int value );
	void hookGetSysReq( int reqid );

	gpobj *getObj( int id );
	int deleteObj( int id );
	gpobj *addObj( void );
	Node *getNode( int objid );
	Light *getLight( int lgtid );
	Camera *getCamera( int camid );

	gpmat *getMat( int id );
	int deleteMat( int id );
	gpmat *addMat( void );

	Material *getMaterial( int matid );

	gpphy *getPhy( int id );
	int deletePhy( int id );
	gpphy *addPhy( void );
	PhysicsRigidBody::Parameters *getParameters( int phyid );

	void drawAll( int option );
	void drawNode( Node *node );
	void drawObj( gpobj *obj );

	void selectScene( int sceneid );
	void selectLight( int lightid );
	void selectCamera( int camid );

	void makeNewModel( gpobj *obj, Mesh *mesh, Material *material );
	int makeNewModelWithMat( gpobj *obj, Mesh *mesh, int matid );

	int makeNullNode( void );
	int makeFloorNode( float xsize, float ysize, int color, int matid=-1 );
	int makePlateNode( float xsize, float ysize, int color, int matid=-1 );
	int makeBoxNode( float size, int color, int matid=-1 );
	int makeModelNode( char *fname, char *idname );
	int makeCloneNode( int objid );

	int makeNewMat( Material* material, int mode = GPMAT_MODE_3D );
	int makeNewMat2D( char *fname, int matopt );
	int makeNewPhy( int phyopt );
	int makeNewLgt( int id, int lgtopt, float range=1.0f, float inner=0.5f, float outer=1.0f );
	int makeNewCam( int id, float fov, float aspect, float near, float far );

	Material *makeMaterialColor( int color, int lighting );
	Material *makeMaterialTexture( char *fname, int matopt );
	Material *makeMaterialFromShader( char *vshd, char *fshd, char *defs );
	void setMaterialDefaultBinding( Material* material, int icolor, int matopt );
	float setMaterialBlend( Material* material, int gmode, int gfrate );
	Material *makeMaterialTex2D( char *fname, int matopt );
	int getTextureWidth( void );
	int getTextureHeight( void );

	void drawTest( int matid );
	int drawFont( int x, int y, char *text, Vector4 *p_color, int size );

	int getObjectVector( int objid, int moc, Vector4 *prm );
	void getNodeVector( gpobj *obj, Node *node, int moc, Vector4 *prm );
	int setObjectVector( int objid, int moc, Vector4 *prm );
	void setSceneVector( int moc, Vector4 *prm );
	void setNodeVector( gpobj *obj, Node *node, int moc, Vector4 *prm );

	int addObjectVector( int objid, int moc, Vector4 *prm );
	void addSceneVector( int moc, Vector4 *prm );
	void addNodeVector( gpobj *obj, Node *node, int moc, Vector4 *prm );
	int lookAtObject( int objid, Vector4 *prm );
	void lookAtNode(Node* node, const Vector3& target );

	void updateLightVector( gpobj *obj, int moc );

	// physics
	int setPhysicsObjectAuto( int objid, float mass, float friction );

	// utility function
	void colorVector3( int color, Vector4 &vec );
	void colorVector4( int color, Vector4 &vec );
	void attachColorMaterial( Model *model, int icolor );
	Mesh *createCubeMesh( float size );
	Material*make2DMaterialForMesh( void );

	// 2D draw function
	float *startPolyTex2D( gpmat *mat );
	void drawPolyTex2D( gpmat *mat );
	void addPolyTex2D( gpmat *mat );
	void finishPolyTex2D( gpmat *mat );
	void setPolyDiffuseTex2D( float r, float g, float b, float a );

	float *startPolyColor2D( void );
	void drawPolyColor2D( void );
	void addPolyColor2D( int num );
	void finishPolyColor2D( void );
	float setPolyColorBlend( int gmode, int gfrate );
	void setPolyDiffuse2D( float r, float g, float b, float a );
	float *startLineColor2D( void );
	void drawLineColor2D( void );
	void addLineColor2D( int num );
	void finishLineColor2D( void );

protected:
    /**
     * Internal use
     */

    /**
     * @see Game::initialize
     */
    void initialize();

    /**
     * @see Game::finalize
     */
    void finalize();

    /**
     * @see Game::update
     */
    void update(float elapsedTime);

    /**
     * @see Game::render
     */
    void render(float elapsedTime);

private:

    /**
     * Draws the scene each frame.
     */
    bool drawScene(Node* node);
	bool init2DRender( void );

	Font*	mFont;
	float _colrate;
	int _tex_width;
	int _tex_height;

	// gpobj
	int _maxobj;
	gpobj *_gpobj;

	// gpmat
	int _maxmat;
	gpmat *_gpmat;

	// gpphy
	int _maxphy;
	gpphy *_gpphy;
	int _defphysics;

	// default scene
	int _curscene;
	int _curlight;
	int _deflight;
	int _curcamera;
	int _defcamera;
	Scene *_scene;
	Camera *_cameraDefault;
//	Node *_camera;
	Quaternion _qcam_billboard;

	// preset flat mesh
    Matrix _projectionMatrix2D;
    MeshBatch* _meshBatch;						// MeshBatch for Polygon
    MeshBatch* _meshBatch_line;					// MeshBatch for Line

	Effect *_spriteEffect;
	float _bufPolyColor[BUFSIZE_POLYCOLOR];
	float _bufPolyTex[BUFSIZE_POLYTEX];

	//Node *_nodetemp;
};

#endif
