;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;
%ver
3.7
%date
2021/05/31
%group
���o�͐��䖽��

%type
���[�U�[�g������

%note
hgimg4.as(hgimg4dx.as)�����mod_posteffect.as���C���N���[�h���邱�ƁB

%author
onitama
%dll
mod_posteffect
%url
https://hsp.tv/make/hgimg4.html
%port
Win
%portinfo
Windows/Linux/android/iOS��HGIMG4���T�|�[�g����V�X�e����œ��삵�܂��B


%index
post_reset
�|�X�g�G�t�F�N�g������
%prm
option
option(0) : �������I�v�V����
%inst
�|�X�g�G�t�F�N�g�̏��������s�Ȃ��܂��B�|�X�g�G�t�F�N�g�̏������́A��ʏ��������ɂP�񂾂��s���܂��B
mod_posteffect���W���[���ɂ��|�X�g�G�t�F�N�g�́A�K��HGIMG4�����^�C����Ŏ��s����K�v������܂��B
option�Őݒ肵�����e�ɂ���ď������̓��e���ς��܂��B
^p
	�I�v�V�����l  ���e
	-------------------------------------------------------------------------
	POST_RESET_OWNDRAW         �|�X�g�G�t�F�N�g�̕`������[�U�[���g�ōs��
	POST_RESET_POSTLAYER       GUI���C���[���|�X�g�G�t�F�N�g�Ɋ܂߂�
^p
�ʏ�́A�������I�v�V�����͏ȗ����Ă����Ė�肠��܂���B
�|�X�g�G�t�F�N�g�̏���������������ƁA�E�C���h�EID1���|�X�g�G�t�F�N�g�p�̕`��E�C���h�E�Ƃ��ăV�X�e�����m�ۂ��܂��B(�܂��A�G�t�F�N�g�p�̃o�b�t�@�Ƃ���ID64�ȍ~���g�p����܂��B)
�ʏ��3D�ŕ`�悳�����(gpdraw���߂ŕ`�悳�����)���|�X�g�G�t�F�N�g�̑ΏۂƂȂ�A2D���ڕ`��(mes���߂Ȃ�)�͑ΏۂƂȂ�܂���B�I�v�V������POST_RESET_POSTLAYER���w�肵���ꍇ�́A2D���ڕ`����ΏۂƂȂ�܂��B
�|�X�g�G�t�F�N�g���g�p����ۂɂ́Aredraw 0�`redraw 1�Ƃ�����ʍX�V�̑���ɁApost_drawstart�`post_drawend���g�p���čX�V���s���Ă��������B
post_drawend�����s���ꂽ�ۂɁA�����I�ɂ���܂ŕ`�悳�ꂽ��ʂɑ΂��ă|�X�g�G�t�F�N�g�𔽉f�����܂��B
�I�v�V������POST_RESET_OWNDRAW���w�肵���ꍇ�́Apost_drawend���s���Ƀ|�X�g�G�t�F�N�g�̕`����s���܂���B���̏ꍇ�́A���[�U�[���g�ŃE�C���h�EID0���X�V���ă|�X�g�G�t�F�N�g��`����s���K�v������܂��B
%href
post_select
post_drawstart
post_drawend


%index
post_select
�|�X�g�G�t�F�N�gID���w��
%prm
id
id(0) : �|�X�g�G�t�F�N�gID
%inst
�|�X�g�G�t�F�N�gID���w�肵�āA��ʂ̌��ʂ�L���ɂ��܂��B 
�K��post_reset���߂ɂ��|�X�g�G�t�F�N�g�̏��������s�Ȃ��Ă����K�v������܂��B
�|�X�g�G�t�F�N�gID�́A�ȉ��̂悤�Ȓl���w�肷�邱�Ƃ��ł��܂��B
^p
	ID               ���e                �I�v�V����
	-------------------------------------------------------------------------
	POSTID_NONE      �Ȃ�
	POSTID_SEPIA     �Z�s�A
	POSTID_GRAY      �O���[�X�P�[��
	POSTID_BLUR      �ڂ���              level(4.0)
	POSTID_BLUR2     �ڂ���(���i��)      level(6.0)
	POSTID_MOSAIC    ���U�C�N
	POSTID_CONTRAST  �R���g���X�g        level(2.0),bright(-0.2)
	POSTID_SOBEL     �֊s���o
	POSTID_CRT       �u���E����          �p�ȗ�X(0.5),�p�ȗ�Y(0.4)
	POSTID_OLDFILM   �Â��t�B����
	POSTID_GLOW      �O���[              rate(64),bright(0.3)
	POSTID_GLOW2     �O���[(���i��/���Z) rate(128),cutoff(0.5),level(10)
	POSTID_GLOW3     �O���[(���i��)      rate(128),cutoff(0.5),level(10)
	POSTID_CUTOFF    �J�b�g�I�t          ratio(0.8)
^p
�|�X�g�G�t�F�N�gID��L���ɂ�����́Apost_setprm���߂ɂ����ʂ��Ƃ̃I�v�V�����l��ݒ肷�邱�Ƃ��ł��܂��B(��\�̃I�v�V�������ڂɂ���p�����[�^�[���w��ł��܂��B�J�b�R���̓f�t�H���g�l�ł��B)
%href
post_reset
post_setprm


%index
post_setprm
�|�X�g�G�t�F�N�g�I�v�V�������w��
%prm
p1,p2,p3
p1(0.0) : �|�X�g�G�t�F�N�g�p�����[�^�[1(����)
p2(0.0) : �|�X�g�G�t�F�N�g�p�����[�^�[2(����)
p3(0)   : �|�X�g�G�t�F�N�g�p�����[�^�[3(����)
%inst
post_select���߂Őݒ肳�ꂽ�|�X�g�G�t�F�N�g�ɕt������I�v�V�����l��ݒ肵�܂��B
�I�v�V�����l�́A�ݒ肳�ꂽ�|�X�g�G�t�F�N�g�̌��ʂ𒲐����邱�Ƃ��ł�����̂ŁA�|�X�g�G�t�F�N�g�̎�ނɂ��ݒ�\�ȃI�v�V�������قȂ�܂��B
%href
post_select


%index
post_drawstart
�|�X�g�G�t�F�N�g�p�̉�ʕ`��J�n
%inst
�|�X�g�G�t�F�N�g���W���[���g�p���ɉ�ʕ`��J�n�̃^�C�~���O���w�肵�܂��B
�K��post_reset���߂ɂ��|�X�g�G�t�F�N�g�̏��������s�Ȃ��Ă����K�v������܂��B
�|�X�g�G�t�F�N�g���g�p����ۂɂ́Aredraw 0�`redraw 1�Ƃ�����ʍX�V�̑���ɁApost_drawstart�`post_drawend���g�p���čX�V���s���Ă��������B
%href
post_drawend


%index
post_drawend
�|�X�g�G�t�F�N�g�p�̉�ʕ`��I��
%inst
�|�X�g�G�t�F�N�g���W���[���g�p���ɉ�ʕ`��I���̃^�C�~���O���w�肵�܂��B
�K��post_reset���߂ɂ��|�X�g�G�t�F�N�g�̏��������s�Ȃ��Ă����K�v������܂��B
�|�X�g�G�t�F�N�g���g�p����ۂɂ́Aredraw 0�`redraw 1�Ƃ�����ʍX�V�̑���ɁApost_drawstart�`post_drawend���g�p���čX�V���s���Ă��������B
%href
post_drawstart


%index
post_getname
�|�X�g�G�t�F�N�g�����擾
%prm
var
var : ���ʂ���������ϐ���
%inst
���ݗL���ɂȂ��Ă���|�X�g�G�t�F�N�g�̖��̂�var�Ŏw�肳�ꂽ�ϐ��ɑ�����܂��B
�|�X�g�G�t�F�N�g���͕�����Ƃ��đ������܂��B
%href
post_getmaxid
post_select


%index
post_getmaxid
�|�X�g�G�t�F�N�gID�ő�l���擾
%prm
var
var : ���ʂ���������ϐ���
%inst
var�Ŏw�肳�ꂽ�ϐ��Ƀ|�X�g�G�t�F�N�gID�Ƃ��Ďg�p�ł���ő�l�������܂��B
�|�X�g�G�t�F�N�gID�́Apost_select�Ŏw�肷��|�X�g�G�t�F�N�g�̎�ʂɂȂ�܂��B
%href
post_getname
post_select


