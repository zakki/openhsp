;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;
%ver
3.7
%date
2022/06/01
%group
���o�͐��䖽��

%type
���[�U�[�g������

%note
layer_fade.as���C���N���[�h���邱�ƁB

%author
onitama
%dll
layer_fade
%url
https://hsp.tv/
%port
Win
%portinfo
HSP3�W�������^�C��/HSP3Dish/HGIMG4��œ��삵�܂��B


%index
layer_fade
�t�F�[�h�C���A�E�g���W���[���̏�����
%inst
�t�F�[�h�C���A�E�g���W���[��(layer_fade)�̏��������s���܂��B
����ȍ~�́Afadein/fadeout���߂ɂ��t�F�[�h�C���E�A�E�g�����p�ł��܂��B
�t�F�[�h�C���A�E�g���W���[���́A���C���[�I�u�W�F�N�g��1�Ƃ��ē��삵�܂��B
(stop���߂�redraw���߂��g�p���Ă��Ȃ��X�N���v�g�ł͐��������삵�܂���̂ł����ӂ�������)
�܂��Acls���߂Ȃǂŉ�ʏ��������s��ꂽ�ۂɂ́A�ēx���������s���K�v������܂��B
�t�F�[�h�C���A�E�g���W���[���́AHSP3�W�������^�C���y��HSP3Dish/HGIMG4��œ��삵�܂��B
�������AHSP3�W�������^�C���ł͎d�l�ɂ��A�{�^���Ȃǂ̔z�u�I�u�W�F�N�g�ɑ΂��ăt�F�[�h�͓K�p����܂���̂ł����ӂ��������B
%sample
#include "layer_fade.as"	; �t�F�[�h���W���[�����g�p

	screen 0,640,480
	layer_fade		; �t�F�[�h���W���[����������
	fadecolor $000000	; �t�F�[�h�F��ݒ�
	fadespeed 8		; �t�F�[�h���x��ݒ�
	fadein			; �t�F�[�h�C��
*main
	redraw 0
	rgbcolor $ffffff
	boxf
	color 255,0,0
	font msgothic,60,1
	pos 100,180:mes "�t�F�[�h���܂�",mesopt_outline
	redraw 1
	await 1000/30

	stick key
	if key&32 : fadeout	; [Enter]�L�[�Ńt�F�[�h�A�E�g

	goto *main
%href
fadein
fadeout
fadespeed
fadecolor



%index
fadein
��ʂ̃t�F�[�h�C�����s��
%inst
�t�F�[�h�C���A�E�g���W���[���ɂ���ʂ̃t�F�[�h�C�����s���܂��B
�K���Alayer_fade���߂ɂ�鏉�������s���Ă����K�v������܂��B
%href
layer_fade


%index
fadeout
��ʂ̃t�F�[�h�A�E�g���s��
%inst
�t�F�[�h�C���A�E�g���W���[���ɂ���ʂ̃t�F�[�h�A�E�g���s���܂��B
�K���Alayer_fade���߂ɂ�鏉�������s���Ă����K�v������܂��B
%href
layer_fade


%index
fadespeed
�t�F�[�h�C���A�E�g�̑��x��ݒ肷��
%prm
p1
p1(0) : �t�F�[�h���x(1�`128)
%inst
�t�F�[�h�C���A�E�g���W���[���ɂ���ʂ̃t�F�[�h���x��ݒ肵�܂��B
�t�F�[�h���x�Ƃ��Đݒ肵���l���A1�t���[��������̕ω��ʂƂȂ�܂��B
�l�́A1�`128���x���w�肵�܂��B�l�����Ȃ��قǂ������ƃt�F�[�h���܂��B�l���傫���Ȃ�قǃt�F�[�h����������܂ł̎��Ԃ͑����Ȃ�܂��B
�K���Alayer_fade���߂ɂ�鏉�������s���Ă����K�v������܂��B
%href
layer_fade


%index
fadecolor
�t�F�[�h�C���A�E�g�̐F��ݒ肷��
%prm
color
color(0) : �t�F�[�h�F�R�[�h(RGB)
%inst
�t�F�[�h�C���A�E�g���W���[���ɂ���ʂ̃t�F�[�h�F��ݒ肵�܂��B
�F�R�[�h�́Argbcolor���߂Ɠ��l��RGB�`���ɂȂ�܂��B
�K���Alayer_fade���߂ɂ�鏉�������s���Ă����K�v������܂��B
%href
layer_fade


