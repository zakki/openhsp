%type
���[�U�[�g������

%group
���ϐ����䖽��

%port
Win
Cli

%dll
getenv

%note
mod_getenv.as���C���N���[�h���邱�ƁB

%author
onitama

%date
2007/12/03
%index
getenv
���ϐ��̒l���擾

%prm
p1, "���ϐ���"
p1 : ���ϐ��̒l�������镶����^�ϐ�
"���ϐ���" : �擾������ϐ��̖��O

%inst
���ϐ��̒l���擾���A�ϐ��ɑ�����܂��B
�ϐ��͕�����^�łȂ���΂Ȃ�܂���B

%sample
#include "mod_getenv.as"
	sdim path, 255
	getenv path, "PATH"
	mesbox path, ginfo_winx, ginfo_winy
	stop
