;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.31
%note
hsp3dish.as���C���N���[�h���邱�ƁB

%date
2012/09/03
%author
onitama
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


