;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.4
%note
hsp3dish.as���C���N���[�h���邱�ƁB

%date
2013/04/09
%author
onitama
%dll
HSP3Dish
%url
http://hsp.tv/
%port
Win
%group
�g�����o�͐��䖽��


%index
setreq
�V�X�e�����N�G�X�g�ݒ�
%prm
type,val
type(0) : �ݒ�^�C�v(SYSREQ_???)
val(0)  : �ݒ肷��l
%inst
HSP3Dish�����^�C���ɑ΂��ėl�X�ȃV�X�e���ݒ���s�Ȃ��܂��B
�ݒ�^�C�v���Ŏw��ł���͈̂ȉ��̃V���{���ł��B
^p
	�ݒ�^�C�v��      �ǂݏ���(*)   ���e
------------------------------------------------------------------------
	SYSREQ_CLSMODE        RW        �w�i�̃N���A�t���O
	SYSREQ_CLSCOLOR       RW        �w�i�N���A�F
	SYSREQ_TIMER          R         �~���b�P�ʂ̃^�C�}�[�l
	SYSREQ_PLATFORM       R         HSP3Dish�����s���Ă���v���b�g�t�H�[��

	(*)���ڂ��ƂɁA�ǂ�(R)����(W)�̉ۂ��قȂ�܂�
^p

�ESYSREQ_CLSMODE�ASYSREQ_CLSCOLOR

redraw 0�ɂ��`��J�n���ɉ�ʂ��N���A���邩�ǂ�����ݒ肵�܂��B SYSREQ_CLSMODE��1��ݒ肵���ꍇ�̓N���A�A0�̏ꍇ�̓N���A���s�Ȃ��܂���B �X�N���v�g���ŉ�ʂ̃N���A���s�Ȃ��Ă���ꍇ�́A�V�X�e�����Ŕw�i�N���A�����Ȃ����� �������x�̌���ɂȂ���܂��B SYSREQ_CLSCOLOR�ŃN���A����ۂ̐F�R�[�h��ݒ肷�邱�Ƃ��ł��܂��B �F�R�[�h�́ARGB24bit($rrggbb)��1�ɂ������l�Őݒ肵�܂��B

�ESYSREQ_TIMER

�~���b�P�ʂ̃^�C�}�[�l��Ԃ��܂��B �v���b�g�t�H�[�����ƂɕԂ����l�͈قȂ�܂����A1�~���b�ɂ�1���l�����Z����Ă����܂��B

�ESYSREQ_PLATFORM

�ȉ���HSP3Dish�v���b�g�t�H�[���l��Ԃ��܂��B
^p
	�}�N����            �l  ���e
	-------------------------------------------
	PLATFORM_WINDOWS    0   Windows��
	PLATFORM_IOS        1   iOS��
	PLATFORM_ANDROID    2   android��
^p

%href
getreq


%index
getreq
�V�X�e�����N�G�X�g�擾
%prm
var,type
var  : ���ʂ���������ϐ���
type : �ݒ�^�C�v(SYSREQ_???)
%inst
HSP3Dish�����^�C�����ێ�����V�X�e���ݒ���擾���ĕϐ��ɑ�����܂��B
�ݒ�^�C�v���Ŏw��ł��閼�̂́Asetreq���߂Ɠ��l�ł��B

%href
setreq


%index
gfilter
�e�N�X�`����Ԃ̐ݒ�
%prm
type
type : �ݒ�^�C�v(FILTER_???)
%inst
HSP3Dish�����^�C�����`����s�Ȃ��ۂ́A�e�N�X�`�����(�t�B���^�����O)�̐ݒ���s�Ȃ��܂��B
�ݒ�^�C�v���Ŏw��ł��閼�̂́A�ȉ��̒ʂ�ł��B
^p
	�}�N����        �l      ���e
	-------------------------------------------
	FILTER_NONE     0       ��ԂȂ�(NEAREST)
	FILTER_LINEAR   1       �������(LINEAR)
	FILTER_LINEAR2  2       �G���A���(���x�ȕ�ԏ���)
^p
�t�B���^�����O�̐ݒ�ɂ��A�摜�̊g��E�k�����̃h�b�g��ԕ��@�� �I�Ԃ��Ƃ��ł��܂��BFILTER_NONE���w�肷�邱�ƂŁA��ԂȂ�(�j�A���X�g) �̏�ԂɂȂ�܂��BFILTER_LINEAR�́A����(���j�A)��ԁAFILTER_LINEAR2�� ��荂�x�ȕ�ԕ��@(�o�C���j�A�Ȃ�)��I�����܂��B gfilter���߂̐ݒ�́A�ȍ~�̂��ׂĂ̕`�施�߂ɓK�p����܂��B �܂��A�uredraw 0�v�ɂ���ʃN���A���ɂ́A�t�B���^�����O�ݒ�� FILTER_NONE�Ƀ��Z�b�g����܂��B

%href
gcopy
grotate
gsquare
celput


%index
mtlist
�|�C���gID���X�g�擾
%prm
var
var  : ���ʂ���������ϐ���
%inst
���݃^�b�`����Ă���������|�C���gID���X�g���擾���܂��B
�|�C���gID���X�g�́A�����̃|�C���gID��Ԃ����̂ŁA�}���`�^�b�`�ɂ�镡���̃|�C���g���܂ޏ��ɂȂ�܂��B
mtlist���߂����s�����ƁA���̎��_�ŉ�����Ă���(�G��Ă���)���ׂẴ|�C���gID(�����l)���Avar�Ŏw�肵���ϐ��ɔz��Ƃ��đ�����܂��B
���Ƃ��΁AID0��ID2�AID3�̂R�̏�񂪂���΁Avar(0)��0�Avar(1)��2�Avar(2)��3�Ƃ����l���������邱�ƂɂȂ�܂��B
������ꂽ�|�C���gID�̐��́A�V�X�e���ϐ�stat�ɕԂ���܂��B
���̖��߂œ���ꂽ�|�C���gID���g�p���āAmtinfo���߂ŏڍׂȃ^�b�`�����擾���邱�Ƃ��ł��܂��B
�}���`�^�b�`�̏����擾���邽�߂ɂ́A���ꂼ��̃f�o�C�X�Ń}���`�^�b�`�̐ݒ��L���ɂ���K�v������܂��B
�܂��AWindows��ł́AWindows7�ȍ~�̃}���`�^�b�`�ɑΉ������f�o�C�X���K�v�ɂȂ�܂��B

%href
mtinfo


%index
mtinfo
�^�b�`���擾
%prm
var,id
var  : ���ʂ���������ϐ���
id(0): �|�C���gID
%inst
�w�肳�ꂽ�|�C���gID�Ɋ֘A�t����ꂽ�^�b�`�����擾���܂��B
�^�b�`���́Avar�Ŏw�肵���ϐ��ɔz��Ƃ��đ������܂��B
^p
	�v�f�l  ���e
	-------------------------------------------
	  0     �^�b�`���(1=ON/0=OFF)
	  1     �^�b�`���ꂽX���W
	  2     �^�b�`���ꂽY���W
	  3     �^�b�`���ʗpID
^p
�܂�Avar(1)�ɂ̓^�b�`���ꂽX���W���Avar(0)�ɂ̓^�b�`�̏��(1�Ȃ�Ή�����Ă���)���������܂��B
var�Ŏw�肳�ꂽ�ϐ��͕K�������^�̔z��ϐ��Ƃ��ď���������܂��B
var(3)�̃^�b�`���ʗpID�́A���̃^�b�`�Ǝ��ʂ��邽�߂̐����l�ł��B���̒l�́A�f�o�C�X���ƂɈقȂ�܂��B

%href
mtlist


%index
devinfo
�f�o�C�X��񕶎���擾
%prm
var,"name"
var    : ���ʂ���������ϐ���
"name" : �f�o�C�X���
%inst
�����OS�A�y�уf�o�C�X�Ɉˑ����������擾���܂��B
������"name"�Ŏ����ꂽ�����Avar�Ŏw�肵���ϐ��ɑ�����܂��B(����������͕�����ƂȂ�܂��B)
���s��ɁA��������񂪎擾���ꂽ�ꍇ�́A�V�X�e���ϐ�stat��0�ȏ�ɂȂ�܂��B
��񂪑��݂��Ȃ����A�G���[�����������ꍇ�̓V�X�e���ϐ�stat���}�C�i�X�̒l�ƂȂ�܂��B

%href
devinfoi


%index
devinfoi
�f�o�C�X���l�擾
%prm
var,"name"
var    : ���ʂ���������ϐ���
"name" : �f�o�C�X���
%inst
�����OS�A�y�уf�o�C�X�Ɉˑ����������擾���܂��B
������"name"�Ŏ����ꂽ�����Avar�Ŏw�肵���ϐ��ɑ�����܂��B(����������͐����^�̔z��ƂȂ�܂��B)
���s��ɁA��������񂪎擾���ꂽ�ꍇ�́A�V�X�e���ϐ�stat��0�ȏ�ɂȂ�܂��B
��񂪑��݂��Ȃ����A�G���[�����������ꍇ�̓V�X�e���ϐ�stat���}�C�i�X�̒l�ƂȂ�܂��B

%href
devinfo


%index
devprm
�f�o�C�X����p�̃p�����[�^�[�ݒ�
%prm
"name","value"
"name" : �p�����[�^�[��������������
"value" : �ݒ肷�镶����
%inst
devcontrol���߂ɂ��f�o�C�X���䂷��ۂ̃p�����[�^�[(�t�����)��ݒ肵�܂��B
���s��ɁA���������s���s�Ȃ�ꂽ�ꍇ�́A�V�X�e���ϐ�stat��0�ȏ�̒l�ɂȂ�܂��B
�p�����[�^�[�����݂��Ȃ����A�G���[�����������ꍇ�̓V�X�e���ϐ�stat���}�C�i�X�̒l�ƂȂ�܂��B

%href
devcontrol


%index
devcontrol
�f�o�C�X��������s����
%prm
"command",p1,p2,p3
"command" : �R�}���h��������������
p1(0)     : ����p�����[�^�[1
p2(0)     : ����p�����[�^�[2
p3(0)     : ����p�����[�^�[3
%inst
�����OS�A�y�уf�o�C�X�Ɉˑ������f�o�C�X��������s���܂��B
���s��ɁA���������s���s�Ȃ�ꂽ�ꍇ�́A�V�X�e���ϐ�stat��0�ȏ�̒l�ɂȂ�܂��B
�p�����[�^�[�����݂��Ȃ����A�G���[�����������ꍇ�̓V�X�e���ϐ�stat���}�C�i�X�̒l�ƂȂ�܂��B

%href
devprm


%index
mmvol
���ʂ̐ݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1=0�`(0) : ���f�B�A�o�b�t�@ID
p2(0)     : �{�����[��(����)�l
%inst
mmplay���߂ɂ���čĐ�����郁�f�B�A�̉��ʂ�ݒ肵�܂��B

%href
mmplay


%index
mmpan
�p���j���O�̐ݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1=0�`(0) : ���f�B�A�o�b�t�@ID
p2(0)     : �p���j���O�l
%inst
mmplay���߂ɂ���čĐ�����郁�f�B�A�̃p���j���O(�X�e���I�̍��E�o�����X)��ݒ肵�܂��B

%href
mmplay


%index
mmstat
���f�B�A�̏�Ԏ擾
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2,p3
p1 : ��Ԃ��擾�����ϐ�
p2(0) : ���f�B�A�o�b�t�@ID
p3(0) : �擾���[�h
%inst
mmplay���߂ɂ���čĐ�����郁�f�B�A�̏�Ԃ��擾���āAp1�̕ϐ��ɑ�����܂��B
p3�Ŏ擾���郂�[�h���w�肷�邱�Ƃ��ł��܂��B
�擾���[�h�̒l�́A�ȉ��̒ʂ�ł��B
^p
	���[�h�l  ���e
	------------------------------------------------------
	    0     �ݒ�t���O�l
	    1     �{�����[���l
	    2     �p���j���O�l
	    3     �Đ����[�g(0=�I���W�i��)
	    4,5   ���[�v�|�C���g(���ʁA���16bit)
	    16    �Đ����t���O(0=��~��/1=�Đ���)
^p

%href
dmmplay


