;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;
%type
�g������
%ver
3.4
%note
hgimg4.as���C���N���[�h���邱�ƁB
%date
2013/07/01
%author
onitama
%dll
hgimg4
%url
http://www.onionsoft.net/
%port
Win
%portinfo
Windows+OpenGL3.1�ȍ~�̃V�X�e����ł̂ݓ��삵�܂��B



%index
gpreset
HGIMG4�̏�����
%group
�g����ʐ��䖽��
%prm
option
option(0) : �������I�v�V����
%inst
HGIMG4�̏��������s�Ȃ��܂��B
�V�[�����č\�z����ꍇ�Ɏg�p���Ă��������B
option�Őݒ肵�����e�ɂ���ď������̓��e���ς��܂��B
^p
	�I�v�V�����l  ���e
	---------------------------------------------------------------
	    0         ���ׂẴI�u�W�F�N�g��j�����ď�����Ԃɖ߂�
	    1         �V�[���ɑ��݂���I�u�W�F�N�g�̂ݔj������
^p
%href


%index
gpdraw
�V�[�����̑S�I�u�W�F�N�g��`�悷��
%group
�g����ʐ��䖽��
%prm
option
option(0) : �`��I�v�V����
%inst
�V�[�����̃I�u�W�F�N�g�����ׂĕ`�悵�܂��B
option�p�����[�^�[���w�肷�邱�ƂŁA����ꂽ���ڂ̕`�悾�����s�Ȃ����Ƃ��ł��܂��B
^p
        �}�N����                      ���e
    --------------------------------------------------------------------
	GPDRAW_OPT_OBJUPDATE          �I�u�W�F�N�g�̎����ړ�����
	GPDRAW_OPT_DRAWSCENE          3D�V�[���`�揈��
	GPDRAW_OPT_DRAWSCENE_LATE     3D�V�[���`�揈��(OBJ_LATE)
	GPDRAW_OPT_DRAW2D             2D�X�v���C�g�`�揈��
	GPDRAW_OPT_DRAW2D_LATE        2D�X�v���C�g�`�揈��(OBJ_LATE)
^p
option�p�����[�^�[���ȗ������ꍇ�́A���ׂĂ̍��ڂ��I������Ă����ԂɂȂ�܂��B
�ʏ�́Aoption�p�����[�^�[���w�肵�Ȃ��Ă���肠��܂���B
�܂��A2D�̒��ڕ`�施�߂������g�p���āA�I�u�W�F�N�g�ɂ��`�悪�s�v�ȏꍇ�́Agpdraw���߂��L�q����K�v������܂���B
OBJ_LATE�̃��[�h���t�����ꂽ����(���������l���ݒ肳��Ă�����̂��܂�)�́A�s�����̃I�u�W�F�N�g������ɕ`�悷�邽�߁A���ڂ��������Ă��܂��B
�����̍��ڂ��u|�v�ŋ�؂��Ďw�肷�邱�Ƃ��ł��܂��B
^p
	��:
	gpdraw GPDRAW_OPT_DRAW2D|GPDRAW_OPT_DRAW2D_LATE
^p
��̗�ł́A2D�X�v���C�g�`�揈���A2D�X�v���C�g�`�揈��(OBJ_LATE)���������s���܂��B
����𗘗p����ƁA3D�V�[���`���2D�X�v���C�g�`��̊Ԃ�gcopy���߂ȂǕʂȕ`�施�߂ɂ��
�\�����s�Ȃ����Ƃ��\�ɂȂ�܂��B

%href


%index
gpusescene
�V�[���̐؂�ւ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I������V�[��ID
%inst
(����̃o�[�W�����ŃT�|�[�g���邽�߂̗\��L�[���[�h�ł��B�@�\�͌��݂܂���������Ă��܂���B)
%href


%index
gpsetprm
�I�u�W�F�N�g�̃R�A�p�����[�^�[�ݒ�
%group
�g����ʐ��䖽��
%prm
objid,prmid,value
objid(0) : �I�u�W�F�N�gID
prmid(0) : �R�A�p�����[�^�[ID
value(0) : �ݒ肷��l(�����l)
%inst
�I�u�W�F�N�g���Ƃɕێ�����Ă���R�A�p�����[�^�[�ɒl��ݒ肵�܂��B
�R�A�p�����[�^�[�́A32bit�����l�ŁA�l�X�ȏ����Ǘ����Ă��܂��B
�R�A�p�����[�^�[ID�Ƃ��Ďw��\�ȍ��ڂ͈ȉ��̒ʂ�ł��B
^p
	�}�N����             | ���e
	--------------------------------------------------------------
	PRMSET_FLAG            �I�u�W�F�N�g�o�^�t���O(*)
	PRMSET_MODE            ���[�h�l
	PRMSET_ID              �I�u�W�F�N�gID(*)
	PRMSET_ALPHA           �����x(���l)
	PRMSET_TIMER           �^�C�}�[�l
	PRMSET_MYGROUP         ���g�̃R���W�����O���[�v
	PRMSET_COLGROUP        �Փˌ��o����R���W�����O���[�v
	PRMSET_SHAPE           �`��ID(*)
	PRMSET_USEGPMAT        �}�e���A��ID
	PRMSET_USEGPPHY        �����ݒ�ID
	PRMSET_COLILOG         �R���W�������OID(*)
	PRMSET_SPRID           �\�[�X�o�b�t�@ID(�X�v���C�g�̂�)
	PRMSET_SPRCELID        �\�[�X�̃Z��ID(�X�v���C�g�̂�)
	PRMSET_SPRGMODE        �R�s�[���[�h(�X�v���C�g�̂�)

	(*)�̍��ڂ͓ǂݏo���̂�
^p
%href
gpgetprm


%index
gpgetprm
�I�u�W�F�N�g�̃R�A�p�����[�^�[�擾
%group
�g����ʐ��䖽��
%prm
var,objid,prmid
var      : �l����������ϐ���
objid(0) : �I�u�W�F�N�gID
prmid(0) : �R�A�p�����[�^�[ID
%inst
�I�u�W�F�N�g���Ƃɕێ�����Ă���R�A�p�����[�^�[�ɒl���擾���܂��B
�R�A�p�����[�^�[�́A32bit�����l�ŁA�l�X�ȏ����Ǘ����Ă��܂��B
�R�A�p�����[�^�[ID�Ƃ��Ďw��\�ȍ��ڂ͈ȉ��̒ʂ�ł��B
^p
	�}�N����             | ���e
	--------------------------------------------------------------
	PRMSET_FLAG            �I�u�W�F�N�g�o�^�t���O(*)
	PRMSET_MODE            ���[�h�l
	PRMSET_ID              �I�u�W�F�N�gID(*)
	PRMSET_ALPHA           �����x(���l)
	PRMSET_TIMER           �^�C�}�[�l
	PRMSET_MYGROUP         ���g�̃R���W�����O���[�v
	PRMSET_COLGROUP        �Փˌ��o����R���W�����O���[�v
	PRMSET_SHAPE           �`��ID(*)
	PRMSET_USEGPMAT        �}�e���A��ID
	PRMSET_USEGPPHY        �����ݒ�ID
	PRMSET_COLILOG         �R���W�������OID(*)
	PRMSET_SPRID           �\�[�X�o�b�t�@ID(�X�v���C�g�̂�)
	PRMSET_SPRCELID        �\�[�X�̃Z��ID(�X�v���C�g�̂�)
	PRMSET_SPRGMODE        �R�s�[���[�h(�X�v���C�g�̂�)

	(*)�̍��ڂ͓ǂݏo���̂�
^p
%href
gpsetprm



%index
gppostefx
�|�X�g�G�t�F�N�g����
%group
�g����ʐ��䖽��
%prm
var
var     : �G�t�F�N�gID����������ϐ���
%inst
(����̃o�[�W�����ŃT�|�[�g���邽�߂̗\��L�[���[�h�ł��B�@�\�͌��݂܂���������Ă��܂���B)
%href


%index
gpuselight
���C�g�I�u�W�F�N�g�̐؂�ւ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I�����郉�C�g�I�u�W�F�N�g��ID
%inst
�w�肵���m�[�h�I�u�W�F�N�g��L���ȃ��C�g�I�u�W�F�N�g�Ƃ��đI�����܂��B
�K���A���C�g�Ƃ��ď���������Ă���m�[�h�I�u�W�F�N�g���w�肷��K�v������܂��B
���C�g��؂�ւ��邱�ƂŁA�ȍ~�ɐ��������I�u�W�F�N�g���Ƃ炷���C�g���ύX����܂��B
%href
gpusecamera


%index
gpusecamera
�J�����I�u�W�F�N�g�̐؂�ւ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I������J�����I�u�W�F�N�g��ID
%inst
�w�肵���m�[�h�I�u�W�F�N�g��L���ȃJ�����I�u�W�F�N�g�Ƃ��đI�����܂��B
�K���A�J�����Ƃ��ď���������Ă���m�[�h�I�u�W�F�N�g���w�肷��K�v������܂��B
�ȍ~�́A�؂�ւ���ꂽ�J���������_�Ƃ��ăV�[���̕`�悪�s�Ȃ��܂��B
%href
gpuselight


%index
gpmatprm
�}�e���A���̃p�����[�^�[�ݒ�
%group
�g����ʐ��䖽��
%prm
id,"name",x,y,z
id(0)  : �}�e���A��ID
"name" : �p�����[�^�[��
x(0)   : X�̐ݒ�l
y(0)   : Y�̐ݒ�l
z(0)   : Z�̐ݒ�l
%inst
�������ꂽ�}�e���A���̃V�F�[�_�[�p�����[�^�[��ݒ肵�܂��B
^p
	��:
	gpmatprm objid,"u_diffuseColor",1,0,0.5 ; �}�e���A���̃p�����[�^�[�ݒ�
^p
��̗�ł́Au_diffuseColor�Ƃ������̂̃p�����[�^�[��( 1.0, 0.0, 0.5 )�̃x�N�g���l��ݒ肵�܂��B
%href
gpmat


%index
gpmatstate
�}�e���A���̃X�e�[�g�ݒ�
%group
�g����ʐ��䖽��
%prm
objid,"name","value"
id(0)   : �}�e���A��ID
"name"  : �ݒ荀�ږ�(������)
"value" : �ݒ�l(������)
%inst
�������ꂽ�}�e���A���̕\���X�e�[�g�ݒ��ύX���܂��B
������Ƃ���name�Ŏw�肳�ꂽ���ڂɑ΂��āAvalue�Ŏw�肳�ꂽ���e��ݒ肵�܂��B
���ږ��Ɛݒ���e�͂��ׂĕ�����ōs�Ȃ��̂Œ��ӂ��Ă��������B
���ږ��Ɛݒ���e�͂��ׂĕ�����ōs�Ȃ��̂Œ��ӂ��Ă��������B(���ږ��y�ѐݒ�l�͑啶������������ʂ��܂���B)
^p
	name             value
    --------------------------------------------------------------------
	"blend"          �v�����h�̗L��/�����؂�ւ�
	                         (true �܂��� false ���w��)
	"blendSrc"       �u�����h����I��(���L�Q��)
	"blendDst"       �u�����h���I��(���L�Q��)
	"cullFace"       �B�ʏ���(�J�����O)�̗L��/�����؂�ւ�
	                         (true �܂��� false ���w��)
	"cullFaceSide"   �B�ʏ���(�J�����O)�̖ʎw��
	"depthTest"      true �܂��� false
	                         (true �܂��� false ���w��)
	"depthWrite"     Z�o�b�t�@�������݂̗L��/�����؂�ւ�
	                         (true �܂��� false ���w��)
	"depthFunc"      Z�l��r���@��I��(���L�Q��)

	(*)blendSrc,blendDst�Őݒ�ł��镶����

	"ZERO"                     ���l(0)
	"ONE"                      ���l(1)
	"SRC_COLOR"                �������݌��J���[
	"ONE_MINUS_SRC_COLOR"      �������݌��J���[(���]�l)
	"DST_COLOR"                �������ݐ�J���[
	"ONE_MINUS_DST_COLOR"      �������ݐ�J���[(���]�l)
	"SRC_ALPHA"                �������݌���
	"ONE_MINUS_SRC_ALPHA"      �������݌���(���]�l)
	"DST_ALPHA"                �������ݐ惿
	"ONE_MINUS_DST_ALPHA"      �������ݐ惿(���]�l)
	"CONSTANT_ALPHA"           ���Œ�l
	"ONE_MINUS_CONSTANT_ALPHA" ���Œ�l(���]�l)
	"SRC_ALPHA_SATURATE"       �������݌������]�l

	(*)cullFaceSide�Őݒ�ł��镶����

	BACK             ���ʂ��J�����O
	FRONT            �\�ʂ��J�����O
	FRONT_AND_BACK   ���ʂ��J�����O

	(*)depthFunc�Őݒ�ł��镶����

	NEVER            ��ɋ���
	LESS             �������l�̎��̂݋���
	EQUAL            ����l�̂݋���
	LEQUAL           ���ꂩ�������l�̎��̂݋���
	GREATER          �傫���l�̎��̂݋���
	NOTEQUAL         ����łȂ��l�̂݋���
	GEQUAL           ���ꂩ�傫���l�̎��̂݋���
	ALWAYS           ��ɋ���
^p
%href


%index
gpviewport
�r���[�|�[�g�ݒ�
%group
�g����ʐ��䖽��
%prm
x,y,sx,sy
x(0)  : �r���[�|�[�g����X���W
y(0)  : �r���[�|�[�g����Y���W
sx    : �r���[�|�[�g��X�T�C�Y
sy    : �r���[�|�[�g��Y�T�C�Y
%inst
HGIMG4���`����s�Ȃ��̈�(�r���[�|�[�g)��ݒ肵�܂��B
�X�N���[�����W��(x,y)����(sx,sy)�Ŏw�肵���T�C�Y�̗̈�ɑ΂��ĕ`�悪�s�Ȃ��܂��B
sx,sy���ȗ�����ƁA���݂̕\��X,Y�T�C�Y���f�t�H���g�Ƃ��Ďw�肳��܂��B
%href


%index
setobjname
�I�u�W�F�N�g�̃m�[�h����ݒ肷��
%group
�g����ʐ��䖽��
%prm
objid,"name"
objid(0) : �I�u�W�F�N�g��ID
"name"   : �ݒ肳��閼��(������)
%inst
�m�[�h�I�u�W�F�N�g�Ɏw�肳�ꂽ���̂�ݒ肵�܂��B
���ׂẴm�[�h�I�u�W�F�N�g�́A�C�ӂɎw�肵�����̂�ݒ肷�邱�Ƃ��\�ł��B
%href
getobjname


%index
getobjname
�I�u�W�F�N�g�̃m�[�h�����擾����
%group
�g����ʐ��䖽��
%prm
var,objid
var      : ���ʂ���������ϐ���
objid(0) : �I�u�W�F�N�g��ID
%inst
�m�[�h�I�u�W�F�N�g�Ɏw�肳�ꂽ���̂��擾���܂��B
var�Ŏw�肳�ꂽ�ϐ��ɖ��̂�������^�Ƃ��đ������܂��B
���ׂẴm�[�h�I�u�W�F�N�g�́A�C�ӂɎw�肵�����̂��ݒ肳��Ă��܂��B
%href
setobjname


%index
gpcolormat
�J���[�}�e���A���̐���
%group
�g����ʐ��䖽��
%prm
var,color,opt
var      : �������ꂽ�}�e���A��ID����������ϐ���
color(0) : �}�e���A���J���[(24bitRGB�l)
opt(0)   : �}�e���A���I�v�V�����l
%inst
�w�肳�ꂽ�F�����J���[�}�e���A���̐������s�Ȃ��܂��B
color�p�����[�^�[�́A24bitRGB�l(0xRRGGBB�Ŏ������l)���w�肵�܂��B�ȗ������ꍇ�́A���F(0xffffff)���ݒ肳��܂��B
�}�e���A����Ǝ��ɐ������邱�Ƃɂ��A�ڍׂȎ����̐ݒ肪�\�ɂȂ�܂��B

^p
	��:
	gpcolormat mat_id,0xff00ff,GPOBJ_MATOPT_NOLIGHT
	gpbox id_model, 1, , mat_id
^p
��̗�ł́ARGB�J���[��0xff00ff(��)�́A���C�e�B���O���s�Ȃ�Ȃ��}�e���A�����������A�����̂̃m�[�h�I�u�W�F�N�g����������܂��B
opt�p�����[�^�[�ɂ��A�}�e���A���̐ݒ��ύX���邱�Ƃ��ł��܂��B
�����̐ݒ�́Agpmatstate���߂ŕʓr�ݒ肷�邱�Ƃ��\�ł��B
^p
        �}�N����                ���e
    -------------------------------------------------------------------
	GPOBJ_MATOPT_NOLIGHT    ���C�e�B���O���s�Ȃ�Ȃ�
	GPOBJ_MATOPT_NOMIPMAP   MIPMAP�𐶐����Ȃ�
	GPOBJ_MATOPT_NOCULL     �J�����O�𖳌��ɂ���
	GPOBJ_MATOPT_NOZTEST    Z�e�X�g�𖳌��ɂ���
	GPOBJ_MATOPT_NOZWRITE   Z�o�b�t�@�������݂𖳌��ɂ���
	GPOBJ_MATOPT_BLENDADD   �v�����h���[�h�����Z�ɐݒ肷��
^p
����Ƀ}�e���A���������ł��Ȃ������ꍇ�́A�G���[3(�p�����[�^�̒l���ُ�ł�)���������܂��B
�������������ꂽ�ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ��Ƀ}�e���A��ID(�����l)���������܂��B

%href
gptexmat
gpusermat


%index
gptexmat
�e�N�X�`���}�e���A���̐���
%group
�g����ʐ��䖽��
%prm
var,"file",opt
var     : �������ꂽ�}�e���A��ID����������ϐ���
opt(0)  : �}�e���A���I�v�V�����l
%inst
�e�N�X�`��(�摜)�}�e���A���̐������s�Ȃ��܂��B
�}�e���A����Ǝ��ɐ������邱�Ƃɂ��A�ڍׂȎ����̐ݒ肪�\�ɂȂ�܂��B
^p
	��:
	gptexmat id_texmat, "res/qbox.png"	; �e�N�X�`���}�e���A���쐬
	gpbox id_model, 1, , id_texmat		; ���m�[�h��ǉ�
^p
��̗�ł́Ares�t�H���_����qbox.png���e�N�X�`���Ƃ��Ď������}�e���A�����������A�����̂̃m�[�h�I�u�W�F�N�g����������܂��B
opt�p�����[�^�[�ɂ��A�}�e���A���̐ݒ��ύX���邱�Ƃ��ł��܂��B
�����̐ݒ�́Agpmatstate���߂ŕʓr�ݒ肷�邱�Ƃ��\�ł��B
^p
        �}�N����                ���e
    -------------------------------------------------------------------
	GPOBJ_MATOPT_NOLIGHT    ���C�e�B���O���s�Ȃ�Ȃ�
	GPOBJ_MATOPT_NOMIPMAP   MIPMAP�𐶐����Ȃ�
	GPOBJ_MATOPT_NOCULL     �J�����O�𖳌��ɂ���
	GPOBJ_MATOPT_NOZTEST    Z�e�X�g�𖳌��ɂ���
	GPOBJ_MATOPT_NOZWRITE   Z�o�b�t�@�������݂𖳌��ɂ���
	GPOBJ_MATOPT_BLENDADD   �v�����h���[�h�����Z�ɐݒ肷��
^p
����Ƀ}�e���A���������ł��Ȃ������ꍇ�́A�G���[3(�p�����[�^�̒l���ُ�ł�)���������܂��B
�������������ꂽ�ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ��Ƀ}�e���A��ID(�����l)���������܂��B

%href
gpcolormat
gpusermat


%index
gpusermat
�J�X�^���}�e���A���̐���
%group
�g����ʐ��䖽��
%prm
var,"vsh","fsh","defs",color,opt
var       : �������ꂽ�}�e���A��ID����������ϐ���
"vsh"     : �o�[�e�b�N�X�V�F�[�_�[�t�@�C����
"fsh"     : �t���O�����g�V�F�[�_�[�t�@�C����
"defs"    : �ǉ��̃��x����`
color(-1) : �}�e���A���J���[(24bitRGB�l)
opt(0)    : �}�e���A���I�v�V�����l
%inst
�J�X�^���}�e���A���𐶐����܂��B
�J�X�^���}�e���A���́A�o�[�e�b�N�X�V�F�[�_�[�y�уt���O�����g�V�F�[�_�[���w�肵���Ǝ��̕`����s�Ȃ��܂��B
OpenGL�̃V�F�[�_�[����(GLSL)�ŋL�q���ꂽ�V�F�[�_�[�t�@�C�������A"vsh"�A"fsh"�p�����[�^�[�Ɏw�肵�܂��B
"defs"�p�����[�^�[�ɂ́A�V�F�[�_�[�R���p�C�����ɒǉ�����郉�x����`���L�q���܂��B
color�p�����[�^�[�Ńf�t�H���g�̃J���[��ݒ肷�邱�Ƃ��ł��܂��B�ȗ������ꍇ�́A���F(0xffffff)���ݒ肳��܂��B
opt�p�����[�^�[�ɂ��A�}�e���A���̐ݒ��ύX���邱�Ƃ��ł��܂��B
�����̐ݒ�́Agpmatstate���߂ŕʓr�ݒ肷�邱�Ƃ��\�ł��B
^p
        �}�N����                ���e
    -------------------------------------------------------------------
	GPOBJ_MATOPT_NOLIGHT    ���C�e�B���O���s�Ȃ�Ȃ�
	GPOBJ_MATOPT_NOMIPMAP   MIPMAP�𐶐����Ȃ�
	GPOBJ_MATOPT_NOCULL     �J�����O�𖳌��ɂ���
	GPOBJ_MATOPT_NOZTEST    Z�e�X�g�𖳌��ɂ���
	GPOBJ_MATOPT_NOZWRITE   Z�o�b�t�@�������݂𖳌��ɂ���
	GPOBJ_MATOPT_BLENDADD   �v�����h���[�h�����Z�ɐݒ肷��
^p
����Ƀ}�e���A���������ł��Ȃ������ꍇ�́A�G���[3(�p�����[�^�̒l���ُ�ł�)���������܂��B
�������������ꂽ�ꍇ�́Avar�Ŏw�肳�ꂽ�ϐ��Ƀ}�e���A��ID(�����l)���������܂��B
^
�J�X�^���}�e���A���ɂ��A�C�ӂ̃V�F�[�_�[���g���ĕ`��̂��ׂĂ��R���g���[�����邱�Ƃ��ł���悤�ɂȂ�܂��B
����́A�V�F�[�_�[�ɂ��Ă̒m��������㋉�Ҍ����̊g���@�\�ł��̂ŁA�ʏ�͎g�p����K�v�͂���܂���B
�J�X�^���}�e���A���𐶐������ꍇ�́Agpmatprm���߂ɂ���ăV�F�[�_�[�p�����[�^�[�ɓn�����߂̒l��ݒ肷�邱�Ƃ��ł��܂��B

%href
gpmatprm
gpcolormat
gptexmat


%index
gpclone
�m�[�h�𕡐�
%group
�g����ʐ��䖽��
%prm
var,objid
var      : �������ꂽ�I�u�W�F�N�g��ID����������ϐ���
objid(0) : �������̃I�u�W�F�N�gID
%inst
���ɑ��݂���I�u�W�F�N�g�Ɠ����ݒ�ŁA�V�����I�u�W�F�N�g�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
����̌`��A�p�����[�^�[�ݒ�(�����ݒ������)�������܂������W��p�x�Ȃǂ�V�����ݒ肷�邱�Ƃ��ł��܂��B
����̕��̂𕡐���������ꍇ�ɁA�ݒ��ǂݍ��݂����x���s�Ȃ���Ԃ��y�����������ɂ��Ȃ���܂��B
^p
	��:
	gpload id_model,"res/duck"	; ���f���ǂݍ���
	gpclone i, id_model		; �������̂��N���[��
^p
��̗�ł́Ares/duck.gpb�t�@�C���ɂ��3D���f���m�[�h(id_model)���N���[�����ĕϐ�i�ɐV�����I�u�W�F�N�gID�������܂��B
�����݂̃o�[�W�����ł́A�V�[�����ɑ��݂���\���\�ȃI�u�W�F�N�g�ȊO�̓N���[�����邱�Ƃ��ł��܂���̂Œ��ӂ��Ă��������B%href
gpdraw


%index
gpnull
�k���m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var
var : �������ꂽ�I�u�W�F�N�gID����������ϐ���
%inst
��̃m�[�h�I�u�W�F�N�g(�k���m�[�h)�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�k���m�[�h�́A�J�����⃉�C�g�Ȃǃ��f�������K�v�̂Ȃ��m�[�h���쐬����ꍇ�ȂǂɎg�p���܂��B
�������ꂽ�m�[�h�́A���̃m�[�h�Ɠ��l��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
%href
gpcamera
gplight


%index
gpload
3D���f���m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,"file","name"
var     : �������ꂽ�I�u�W�F�N�gID����������ϐ���
"file"  : �ǂݍ��݂��s�Ȃ�gpb�t�@�C����
"name"  : �ǂݍ��ݑΏۂƂȂ�m�[�h��
%inst
�t�@�C�������ꂽ3D���f���f�[�^(.gpb�t�@�C��)���m�[�h�Ƃ��Đ������܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
"file"�Ńt�H���_�y�уt�@�C�������w�肵�܂��B�u.gpb�v�Ȃǂ̊g���q�͎w�肷��K�v����܂���B
�t�@�C���̒��œ���̖��O���������m�[�h������ǂݍ��݂����ꍇ�́A"name"�Ŏw�肷�邱�Ƃ��ł��܂��B
"name"�̎w����ȗ������ꍇ�́A�t�@�C���Ɋ܂܂�Ă���K�w�\�������ׂēǂݍ��݃m�[�h�Ƃ��Đ������܂��B
�m�[�h�ɕ����ݒ���s�Ȃ��ꍇ�́Agppbind���߂��g�p���Ă��������B
3D���f���f�[�^�̐ڐG����́A�S�̂��ދ�(�o�E���f�B���O��)���g�p����܂��B
^
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^p
	��:
	gpload id_model,"res/duck"		; ���f���ǂݍ���
^p
��̗�ł́Ares�t�H���_���ɂ���duck.gpb�t�@�C����ǂݍ��݂܂��B
���̍ۂɁA�}�e���A����񂪏�����Ă���duck.material�t�@�C�����Q�Ƃ���܂��B
����ɁA�e�N�X�`�����K�v�ȏꍇ�́A�����t�H���_���̉摜�t�@�C�����ǂݍ��܂�܂��B
^
gpload���߂œǂݍ��ނ��߂̃t�@�C��(.gpb�`��)�́Agameplay3D�ŕW���I�Ɏg�p����Ă���f�[�^�`���ł��B
HGIMG4�ł́A.gpb�`���𐶐����邽�߂�GPB�R���o�[�^�[(gpbconv.exe)��p�ӂ��Ă��܂��B
�ڂ����́AHGIMG4�}�j���A�����Q�Ƃ��Ă��������B
%href
gpdraw
gppbind


%index
gpplate
�m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,sizex,sizey,color,matobj
var        : �������ꂽ�I�u�W�F�N�gID����������ϐ���
sizex(1)   : ���������X�T�C�Y
sizey(1)   : ���������Y�T�C�Y
color(-1)  : �}�e���A���J���[(24bitRGB�l)
matobj(-1) : �}�e���A��ID
%inst
�����ɗ�����1���̔�(�l�p�`)��3D���f���f�[�^�Ƃ��ăm�[�h�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
���f����X,Y�T�C�Y��sizex,sizey�p�����[�^�[�Ŏw�肷�邱�Ƃ��ł��܂��B
color�p�����[�^�[�Ń��f���̐F(�}�e���A���J���[)��24bitRGB�l(0xRRGGBB�Ŏ������l)�ɂ��w�肵�܂��B
color�p�����[�^�[���ȗ����ꂽ�ꍇ�́A���F(0xffffff)���g�p����܂��B
matobj�p�����[�^�[�ŁA�}�e���A��ID���w�肷�邱�Ƃ��ł��܂��B
gpcolormat���߂Ȃǂɂ��A���[�U�[�����������}�e���A�����g�p����ꍇ�͎w�肵�Ă��������B
matobj�p�����[�^�[���ȗ����ꂽ�ꍇ�́A�W���̃}�e���A�����g�p����܂��B
^
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^
�m�[�h�ɕ����ݒ���s�Ȃ��ꍇ�́Agppbind���߂��g�p���Ă��������B
�m�[�h�̐ڐG����́A���Ƃ̃��f���Ɠ����`�󂪎g�p����܂��B
%href
gpdraw
gppbind


%index
gpfloor
���m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,sizex,sizey,color,matobj
var     : �������ꂽ�I�u�W�F�N�gID����������ϐ���
%inst
1���̏�(�l�p�`)��3D���f���f�[�^�Ƃ��ăm�[�h�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
���f����X,Y�T�C�Y��sizex,sizey�p�����[�^�[�Ŏw�肷�邱�Ƃ��ł��܂��B
color�p�����[�^�[�Ń��f���̐F(�}�e���A���J���[)��24bitRGB�l(0xRRGGBB�Ŏ������l)�ɂ��w�肵�܂��B
color�p�����[�^�[���ȗ����ꂽ�ꍇ�́A���F(0xffffff)���g�p����܂��B
matobj�p�����[�^�[�ŁA�}�e���A��ID���w�肷�邱�Ƃ��ł��܂��B
gpcolormat���߂Ȃǂɂ��A���[�U�[�����������}�e���A�����g�p����ꍇ�͎w�肵�Ă��������B
matobj�p�����[�^�[���ȗ����ꂽ�ꍇ�́A�W���̃}�e���A�����g�p����܂��B
^
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^
�m�[�h�ɕ����ݒ���s�Ȃ��ꍇ�́Agppbind���߂��g�p���Ă��������B
(�����f���͕W���ŁA�����ꏊ�ɌŒ肳�ꂽ�����������ݒ肳��܂�)
�m�[�h�̐ڐG����́A���Ƃ̃��f���Ɠ����`�󂪎g�p����܂��B
%href
gpdraw
gppbind


%index
gpbox
���m�[�h�𐶐�
%group
�g����ʐ��䖽��
%prm
var,size,color,matobj
var     : �������ꂽ�I�u�W�F�N�gID����������ϐ���
%inst
�w��T�C�Y�̗����̂�3D���f���f�[�^�Ƃ��ăm�[�h�𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��3D��Ԃ̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
���f����X,Y�T�C�Y��sizex,sizey�p�����[�^�[�Ŏw�肷�邱�Ƃ��ł��܂��B
color�p�����[�^�[�Ń��f���̐F(�}�e���A���J���[)��24bitRGB�l(0xRRGGBB�Ŏ������l)�ɂ��w�肵�܂��B
color�p�����[�^�[���ȗ����ꂽ�ꍇ�́A���F(0xffffff)���g�p����܂��B
matobj�p�����[�^�[�ŁA�}�e���A��ID���w�肷�邱�Ƃ��ł��܂��B
gpcolormat���߂Ȃǂɂ��A���[�U�[�����������}�e���A�����g�p����ꍇ�͎w�肵�Ă��������B
matobj�p�����[�^�[���ȗ����ꂽ�ꍇ�́A�W���̃}�e���A�����g�p����܂��B
^
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^
�m�[�h�ɕ����ݒ���s�Ȃ��ꍇ�́Agppbind���߂��g�p���Ă��������B
�m�[�h�̐ڐG����́A���Ƃ̃��f���Ɠ����`�󂪎g�p����܂��B
%href
gpdraw
gppbind


%index
gpspr
2D�X�v���C�g�m�[�h����
%group
�g����ʐ��䖽��
%prm
var,bufid,celid,gmode
var     : �������ꂽ�I�u�W�F�N�gID����������ϐ���
%inst
2D�X�v���C�g��\�����邽�߂̃m�[�h�͂͂𐶐����܂��B
var�Ŏw�肳�ꂽ�ϐ��ɁA�������ꂽ�I�u�W�F�N�g��ID���������܂��B
�������ꂽ�m�[�h��2D�X�N���[���̒��Ŏ��R�ɑ��삷�邱�Ƃ��\�ɂȂ�܂��B
bufid�p�����[�^�[�ŕ\�����̉摜���ǂݍ��܂�Ă���o�b�t�@ID���Acelid�p�����[�^�[�ŕ\������Z��ID���w�肵�܂��B
�܂��Agmode�p�����[�^�[��gcopy���߂Ŏw�肷����̂Ɠ��l�̃R�s�[���[�h���w�肵�܂��B
^p
	 gmode�l  |  ���e
	---------------------------------------------------
	    0,1      �A���t�@�`�����l������
	    2        �A���t�@�`�����l���L��
	    5        �F���Z�E�A���t�@�`�����l���L��
^p
�������ꂽ�I�u�W�F�N�g(�m�[�h)�̕`���gpdraw���߂ɂ��܂Ƃ߂čs�Ȃ��܂��B
^p
	; �X�v���C�g1������̕`��
	gmode [gmode�ݒ�l]
	pos [�m�[�hX���W],[�m�[�hY���W]
	celput [�o�b�t�@ID], [�Z��ID], [�m�[�hX�X�P�[��], [�m�[�hY�X�P�[��], [�m�[�hZ��]]
^p
�܂�A2D�X�v���C�g�m�[�h�͏�̂悤�ȏ��������炩���ߓo�^�����ݒ���܂Ƃ߂čs�Ȃ��@�\�ƍl���邱�Ƃ��ł��܂��B
�܂��Agetcoli���߂ɂ��2D�X�v���C�g�m�[�h���m�̐ڐG�������y�ɍs�Ȃ����Ƃ��\�ł��B
%href
gpdraw


%index
gplight
���C�g�m�[�h��ݒ�
%group
�g����ʐ��䖽��
%prm
id,opt,range,inner,outer
id(0)     : �I�u�W�F�N�g��ID
opt(0)    : ���C�g�����I�v�V����
range(1)  : �e���͈̓p�����[�^�[
inner(0.5): �����̌����p�����[�^�[
outer(1)  : �O���̌����p�����[�^�[
%inst
�����ς݂̃m�[�h�Ƀ��C�g�Ƃ��Ă̋@�\��ǉ����܂��B
id�p�����[�^�[�ŁA�m�[�h�̃I�u�W�F�N�gID���w�肵�܂��B
opt�p�����[�^�[�Ń��C�g�����I�v�V�����l���w�肷�邱�Ƃ��ł��܂��B
^p
	  opt�l               |  ���e
	--------------------------------------------------------------
	  GPOBJ_LGTOPT_NORMAL    ���s����(�f�B���N�V���i�����C�g)
	  GPOBJ_LGTOPT_POINT     �_����(�|�C���g���C�g)
	  GPOBJ_LGTOPT_SPOT      �X�|�b�g���C�g
^p
range�p�����[�^�[�́A�_�����y�уX�|�b�g���C�g�̉e���͈͂Ɋւ���ݒ���s�Ȃ��܂��B
�܂��Ainner,outer�p�����[�^�[�́A�X�|�b�g���C�g�̌������ʂɊւ���ݒ���s�Ȃ��܂��B
���݂̃o�[�W�����ł͕��s�����̂݃T�|�[�g����Ă��܂��B
^p
	��:
	gpnull id_alight			; �k���m�[�h�𐶐�����
	gplight id_alight, GPOBJ_LGTOPT_NORMAL	; ���C�g�Ƃ��ēo�^����
	gpuselight id_alight			; �f�t�H���g�̃��C�g�ɐݒ�
^p
�V�[�����ɔz�u���ꂽ���C�g�́Agpuselight���߂ɂ��؂�ւ��Ă���}�e���A���𐶐����邱�ƂŔ��f����܂��B
%href
gpuselight
gpnull


%index
gpcamera
�J�����m�[�h��ݒ�
%group
�g����ʐ��䖽��
%prm
id,fov,aspect,near,far
id(0)      : �I�u�W�F�N�g��ID
fov(45)    : ����(FOV)�p�����[�^�[
aspect(1.5): �A�X�y�N�g��
near(0.5)  : �j�A�N���b�vZ�l
far(768)   : �t�@�[�N���b�vZ�l
%inst
�����ς݂̃m�[�h�ɃJ�����Ƃ��Ă̋@�\��ǉ����܂��B
id�p�����[�^�[�ŁA�m�[�h�̃I�u�W�F�N�gID���w�肵�܂��B
fov�p�����[�^�[�Ŏ���(FOV)��ݒ肵�܂��B45���w�肵���ꍇ�́A45�x�̎���ƂȂ�܂��B
aspect�p�����[�^�[�ŃA�X�y�N�g��(�c����)���w�肵�܂��B
�܂��Anear,far�p�����[�^�[�ɂ��߂��Ɖ�����Z���W(�N���b�s���O�Ɏg����Z���W)���w�肷�邱�Ƃ��ł��܂��B
^p
	��:
	gpnull id_camera			; �k���m�[�h�𐶐�����
	gpcamera id_camera, 45, 1.5, 0.5, 768	; �J�����Ƃ��Đݒ肷��
	gpusecamera id_camera			; �g�p����J������I������
	setpos id_camera, 0,20,20		; �J�����ʒu��ݒ肷��
^p
�V�[�����ɔz�u���ꂽ�J�����́Agpusecamera���߂ɂ��؂�ւ��邱�Ƃ��ł��܂��B

%href
gpusecamera
gpnull


%index
gplookat
�w����W�Ɍ����ăm�[�h����]
%group
�g����ʐ��䖽��
%prm
objid,x,y,z
objid(0)  : �I�u�W�F�N�gID
x(0)      : �ڕW�ƂȂ�X���W
y(0)      : �ڕW�ƂȂ�Y���W
z(0)      : �ڕW�ƂȂ�Z���W
%inst
3D�m�[�h���A�w�肵�����W�Ɍ����ĉ�]�����܂��B
�J�����ɓK�p�����ꍇ�́A�w����W�𒍎�����p�x�ɐݒ肳��܂��B
%href


%index
gppbind
�m�[�h�ɕW���I�ȕ���������ݒ�
%group
�g����ʐ��䖽��
%prm
objid,mass,friction
objid(0)      : �I�u�W�F�N�gID
mass(1)       : �d��
friction(0.5) : ���C�W��
%inst
�m�[�h�I�u�W�F�N�g�ɑ΂��āA��{�I�ȕ����ݒ���s�Ȃ��܂��B
mass�p�����[�^�[�͕��̂̏d���Bfriction�p�����[�^�[�͖��C�W���ł��B�l���ȗ������ꍇ�́A�f�t�H���g�l���g�p����܂��B
�d��(mass)��0�ɂ��邱�ƂŐÓI����(�Փ˂͂��邪�A�����Ȃ�)�Ƃ��Đݒ肳��܂��B
����ȊO�̏ꍇ�́A�����@���ɏ]���ď��̂���ꏊ�܂ŗ������܂��B
^
������������ݒ肷��ꍇ�́A�K����(�n��)�ƂȂ镔�����쐬���Ă����Ă��������B
gpfloor���߂ɂ���Đ������ꂽ���ɕW���I�ȕ���������ݒ肷�邱�ƂŁA�Œ肳�ꂽ���ʂ𐶐����邱�Ƃ��ł��܂��B
�������݂��Ȃ������ꍇ�A���͉̂i���ɗ����𑱂��邱�ƂɂȂ�܂��B
^
�����ݒ���s�Ȃ����m�[�h�I�u�W�F�N�g�́A����ȍ~�������ē��삷��悤�ɂȂ�Asetpos�Ȃǂ̍��W�ύX�͖����ƂȂ�܂��B
���̂ɗ͂����������ꍇ�́Agppapply���߂��g�p���Ă��������B

%href
gppapply


%index
getwork2
�m�[�h���[�N�l2���擾
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�
%inst
�I�u�W�F�N�g�̎���work2�p�����[�^�[���擾���܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
���߂̍Ō�Ɂui�v��t�����邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B
%href
getwork2i


%index
getwork2i
�m�[�h���[�N�l2���擾(�����l)
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �擾����ϐ�
%inst
�I�u�W�F�N�g�̎���work2�p�����[�^�[���擾���܂��B
(x,y,z)�́A�����^�̕ϐ��Ƃ��Đݒ肳��܂��B
getwork2���߂��g�p���邱�ƂŁA�����l�Ƃ��Ēl���擾���邱�Ƃ��ł��܂��B
%href
getwork2


%index
selquat
�I�u�W�F�N��]����MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��quat(�N�H�[�^�j�I����]���)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href


%index
selwork2
�I�u�W�F�N�g���[�N2��MOC���ɐݒ�
%group
�g����ʐ��䖽��
%prm
id
id(0) : �I�u�W�F�N�gID
%inst
MOC�ݒ薽�߂̑ΏۂƂȂ�MOC�O���[�v��work2(���[�N2)�ɐݒ肵�܂�
id�́A�I�u�W�F�N�gID�ƂȂ�܂��B
%href


%index
setwork2
work2�O���[�v����ݒ�
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)
%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
work2�O���[�v(���[�N2�l)��(x,y,z)�Ŏw�肳�ꂽ�l��ݒ肵�܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
%href
setwork


%index
addwork2
work2�O���[�v�������Z
%group
�g����ʐ��䖽��
%prm
id,x,y,z
id      : �I�u�W�F�N�gID
(x,y,z) : �ݒ肷��l (�f�t�H���g=0)
%inst
�I�u�W�F�N�g�̎��p�����[�^�[��ݒ肵�܂��B
work2�O���[�v(���[�N2�l)��(x,y,z)�Ŏw�肳�ꂽ�l�����Z���܂��B
(x,y,z)�ɂ́A�����܂��͐����l���w�肷�邱�Ƃ��ł��܂��B
%href
addwork


%index
gpcnvaxis
3D���W�̕ϊ����s�Ȃ�
%group
�g����ʐ��䖽��
%prm
var_x,var_y,var_z,x,y,z,mode
var_x   : X�l����������ϐ�
var_y   : Y�l����������ϐ�
var_z   : Z�l����������ϐ�
x(0.0)  : �ϊ�����X�l
y(0.0)  : �ϊ�����Y�l
z(0.0)  : �ϊ�����Z�l
mode(0) : �ϊ����[�h
%inst
(����̃o�[�W�����ŃT�|�[�g���邽�߂̗\��L�[���[�h�ł��B�@�\�͌��݂܂���������Ă��܂���B)
%href


%index
gppset
�m�[�h�̕����p�����[�^�[��ݒ�
%group
�g����ʐ��䖽��
%prm
objid,prmid,x,y,z
objid(0)  : �I�u�W�F�N�gID
prmid(0)  : �p�����[�^�[ID
x(0.0)    : �ݒ�p�����[�^�[X�l
y(0.0)    : �ݒ�p�����[�^�[Y�l
z(0.0)    : �ݒ�p�����[�^�[Z�l
%inst
objid�Ŏw�肳�ꂽ�m�[�h�̏ڍׂȕ����p�����[�^�[��ݒ肵�܂��B
prmid�p�����[�^�[�ŁA�ݒ肷�鍀�ڂ��w�肵�AX,Y,Z�Ɏw�肳�ꂽ�l���A���ꂼ��̍��ڂɑΉ������l�Ƃ��ēK�p����܂��B
^p
        �}�N����                          ���e
    ----------------------------------------------------------------------------
	GPPSET_ENABLE                     X=����������ON/OFF(0=����)
	GPPSET_FRICTION                   X=���C�W��, Y=�e�͐ݒ�
	GPPSET_DAMPING                    X=linear����(0�`1.0), Y=angular����(0�`1.0)
	GPPSET_KINEMATIC                  X=Kinematic�ݒ��ON/OFF(0=����)
	GPPSET_ANISOTROPIC_FRICTION       X,Y,Z=�ٕ����̖��C
	GPPSET_GRAVITY                    X,Y,Z=�d��
	GPPSET_LINEAR_FACTOR              X,Y,Z=�x�N�g���ɉ������ړ��̐ݒ�
	GPPSET_ANGULAR_FACTOR             X,Y,Z=�x�N�g���ɉ�������]�̐ݒ�
	GPPSET_ANGULAR_VELOCITY           X,Y,Z=��]�x���V�e�B�[
	GPPSET_LINEAR_VELOCITY            X,Y,Z=���j�A�x���V�e�B�[
^p
�K��gppbind���߂Ŋ�{�I�ȕ���������ݒ肵����ŏڍאݒ���s�Ȃ��悤�ɂ��Ă��������B
�ݒ�l���������Ȃ��ꍇ�́A�G���[���������܂��B
%href
gppbind


%index
gpobjpool
�I�u�W�F�N�gID�����̐ݒ�
%group
�g����ʐ��䖽��
%prm
start,num
start(0) : ���蓖�ĊJ�n�ԍ�
num(-1)  : �ő劄�蓖�Đ�
%inst
�I�u�W�F�N�gID�̊��蓖�ĕ��@��ύX���܂��B
�I�u�W�F�N�gID�́A���炩���ߌ��߂�ꂽ�ő吔�̒��ŁA�g�p����Ă��Ȃ�ID�ԍ������蓖�Ă��܂��B
�I�u�W�F�N�g�ő吔�́A�f�t�H���g��1024�ƂȂ��Ă���Asysreq���߂ɂ���Ċg�����邱�Ƃ��\�ł��B
^p
	��:
	setreq SYSREQ_MAXOBJ,4096	; �I�u�W�F�N�g�ő吔��4096�Ɋg������
^p
gpobjpool���߂́AID�ԍ��̊��蓖�Ĕ͈͂�C�ӂɕύX���邱�Ƃ��ł��܂��B
start�p�����[�^�[�Ŏw�肳�ꂽ�ԍ������蓖�ĊJ�n�ԍ��ɐݒ肵�܂��B
num�p�����[�^�[�Ŏw�肳�ꂽ�ԍ������蓖�Ă���ő吔�ɐݒ肵�܂��B
num�p�����[�^�[���}�C�i�X�l���ȗ�����Ă����ꍇ�́A���蓖�ĊJ�n�ԍ�����ő������͈͂��ݒ肳��܂��B
^p
	��:
	gpobjpool 100,50	; �I�u�W�F�N�gID�����̐ݒ�ύX
^p
��̗�ł́AID�ԍ�100�`150�݂̂����蓖�đΏۂɕύX���܂��B
����ȍ~�̃I�u�W�F�N�g��������(gpbox��gpnull�Ȃ�)�ł́A�w�肳�ꂽ�͈͓��̃I�u�W�F�N�gID�݂̂����蓖�Ă��܂��B
�I�u�W�F�N�g�S�̂̒��œ���̌��܂ł�����������Ȃ��悤�ɐ����������ꍇ��A
�\��������������x�R���g���[���������ꍇ�ɗ��p�ł��܂��B
gpobjpool���߂ɂ���āA���炩���ߐݒ肳�ꂽ�I�u�W�F�N�g�ő吔���g�����邱�Ƃ͂ł��܂���B
�K���ő吔�͈͓̔��Őݒ���s�Ȃ��悤���ӂ��Ă��������B
%href
delobj


%index
gppapply
�m�[�h�ɕ����I�ȗ͂�K�p����
%group
�g����ʐ��䖽��
%prm
objid,action,x,y,z
objid(0)  : �I�u�W�F�N�gID
action(0) : �͂̎��(�^�C�v)
x(0.0)    : �ݒ�p�����[�^�[X�l
y(0.0)    : �ݒ�p�����[�^�[Y�l
z(0.0)    : �ݒ�p�����[�^�[Z�l
%inst
�m�[�h�ɑ΂���(x,y,z)�Ŏw�肵���x�N�g���̕����I�ȗ͂�K�p���܂��B
action�p�����[�^�[�Őݒ�ł���^�C�v�́A�ȉ��̒ʂ�ł��B
^p
        �}�N����                     ���e
    ----------------------------------------------------------------------------
	GPPAPPLY_FORCE               �ړ����悤�Ƃ���͂����Z����
	GPPAPPLY_IMPULSE             �u�ԓI�ȏՌ���^����
	GPPAPPLY_TORQUE              �g���N(�˂���)�͂�^����
	GPPAPPLY_TORQUE_IMPULSE      �g���N+�Ռ���^����
^p
�K��gppbind���߂Ŋ�{�I�ȕ���������ݒ肵����ŗ͂�K�p����悤�ɂ��Ă��������B
�ݒ�l���������Ȃ��ꍇ�́A�G���[���������܂��B
%href
gppbind


