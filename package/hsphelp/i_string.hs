;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
��������
%ver
3.1
%note
ver3.1�W������
%date
2004/10/12
%author
onitama
%url
http://www.onionsoft.net/
%port
Win
Cli
Let



%index
getstr
�o�b�t�@���當����ǂݏo��
%group
�����񑀍얽��
%prm
p1,p2,p3,p4
p1=�ϐ�   : ���e��ǂݏo����̕ϐ���
p2=�ϐ�   : �o�b�t�@�����蓖�Ă��ϐ���
p3=0�`    : �o�b�t�@�̃C���f�b�N�X(Byte�P��)
p4=0�`255 : ��؂�L�����N�^��ASCII�R�[�h
p5=0�`(1024) : �ǂݏo�����s�Ȃ��ő啶����

%inst
��������̃o�b�t�@�̔C�ӂ̏ꏊ�ɂ�����e�𕶎���Ƃ��ĕϐ��ɓǂݏo����
���B������́A00�Ƃ����R�[�h���A���s�R�[�h������܂œǂݏo����܂��B��
�s�R�[�h�͕�����ɂ͊܂܂�܂���B
^
�܂��A��؂�L�����N�^�R�[�h���w�肷�邱�Ƃ��ł��C�ӂ̕����ŋ�؂�ꂽ
����������o�����Ƃ��ł��܂��B
^
���̖��߂œǂݏo���ꂽByte���͎����I�� strsize�Ƃ����V�X�e���ϐ��ɑ��
����܂��Bstrsize�́A���̃C���f�b�N�X�܂ł̈ړ��ʂ𓾂鎞�Ɏg�p���܂��B
^
���Ƃ��΁A�ϐ�b�̃o�b�t�@��
'A' 'B' 'C' ',' 'D' 'E' 'F' 00(�I���R�[�h)
�Ƃ����f�[�^�������Ă���ꍇ�A
^p
getstr a,b,0,','
^p
�����s����ƁA�ϐ�a�̓��e�́A
'A' 'B' 'C' �̕������ǂݏo�����"ABC"�Ƃ���������ɂȂ�Astrsize ��4��
�Ȃ�܂��B
^
p5�p�����[�^�[�ɂ��A�ǂݏo�����s�Ȃ��ő啶����(byte��)���w�肷�邱�Ƃ��ł��܂��B
p5�p�����[�^�[���ȗ����ꂽ�ꍇ�ɂ́A1024����(byte)�܂ł̓ǂݏo�����s�Ȃ��܂��B
(p1�Ŏw�肳�ꂽ�ϐ��̃o�b�t�@�͎����I�Ɋm�ۂ����̂ŁAsdim���ߓ���
�o�b�t�@�̐ݒ���s�Ȃ��Ă����K�v�͂���܂���B)
^
���̖��߂́A�����s���܂ރe�L�X�g������f�[�^��A����̕����ŋ�؂�ꂽ
�f�[�^�������悭�؂�o�����߂̂��̂ł��B
�����s���܂ރe�L�X�g���������߂ɂ́A���ɂ��������m�[�g�p�b�h���߃Z�b�g
������܂��B�܂��A�����񂩂���萔�̕��������o�����߂ɂ́Astrmid����
���p�ӂ���Ă��܂��B

%href
strmid




%index
noteadd
�w��s�̒ǉ��E�ύX
%group
�����񑀍얽��
%prm
p1,p2,p3
p1=������  : �ǉ��E�ύX�����镶����܂��͕ϐ���
p2=0�`(-1) : �ǉ�����C���f�b�N�X
p3=0�`1(0) : �㏑�����[�h�w��(0=�ǉ��E1=�㏑��)

%inst
�������m�[�g�p�b�h�̓��e��ǉ��E�ύX���܂��B
^
p1�ɒǉ��E�ύX���邽�߂̕�������w�肵�܂��Bp2�ŁA�ΏۂƂȂ�C���f�b�N
�X���w�肵�܂��B
p2�p�����[�^���ȗ����邩�A-1���w�肷��ƍŏI�s���ΏۂɂȂ�܂��B
p3�p�����[�^�ŁA�ǉ����㏑�������w�肵�܂��B�ȗ����邩�A0���w�肷��ƁA
�ǉ����[�h�ƂȂ�A�ΏۂƂȂ�C���f�b�N�X�ȍ~���P�ÂV�t�g���܂��B
p3��1�̏ꍇ�́A�㏑�����[�h�ƂȂ�A �ΏۂƂȂ�C���f�b�N�X�̓��e�͏���
����A�w�肵��������ɒu���������܂��B
^
noteadd�́A �ϐ��o�b�t�@��sdim���߂Ȃǂł��炩���ߊm�ۂ��ꂽ�e�ʂ𒴂�
�ē��e��ǉ����悤�Ƃ����ꍇ�ł��A�����I�Ɋm�ۗe�ʂ𑝉������Ċi�[����
���B�܂�A�usdim a,64�v �łU�S�����܂ł����L���ł��Ȃ��������o�b�t�@
�ł����Ă��Anoteadd���߂ł���΁A �ǉ�����T�C�Y�ɉ����Ď����I�Ƀ�����
�T�C�Y�𒲐߂��Ĉ��S�ɋL�������邱�Ƃ��ł��܂��B (�ʏ�̑�����߂ōs��
�����ꍇ�̓o�b�t�@�I�[�o�[�t���[�̃G���[�ƂȂ�܂�)
^
�������m�[�g�p�b�h����(noteget,noteadd,notedel,noteinfo)���g�p���邽��
�ɂ́A�ŏ���notesel���߂őΏۂƂȂ�o�b�t�@��ݒ肵�Ȃ���΂Ȃ�܂���B

%href
notesel

%sample
	sdim a,10000
	notesel a
	noteadd "newidx1"
	noteadd "newidx3"
	noteadd "newidx2",1
	mes a
	stop




%index
notedel
�s�̍폜
%group
�����񑀍얽��
%prm
p1
p1=0�` : �폜����C���f�b�N�X

%inst
�������m�[�g�p�b�h�̎w�肵���C���f�b�N�X���폜���܂��B
p1�Ŏw�肵���C���f�b�N�X�̓��e�͍폜����A�ȍ~�̃C���f�b�N�X���P�Â�
�V�t�g���܂��B
^
�������m�[�g�p�b�h����(noteget,noteadd,notedel,noteinfo)���g�p���邽��
�ɂ́A�ŏ���notesel���߂őΏۂƂȂ�o�b�t�@��ݒ肵�Ȃ���΂Ȃ�܂���B

%href
notesel




%index
noteget
�w��s��ǂݍ���
%group
�����񑀍얽��
%prm
p1,p2
p1=�ϐ�   : �ǂݏo����̕ϐ���
p2=0�`(0) : �ǂݏo���C���f�b�N�X

%inst
�������m�[�g�p�b�h���́Ap2�Ŏw�肵���C���f�b�N�X�̓��e��p1�Ŏw�肳�ꂽ
�ϐ��ɑ�����܂��B�������m�[�g�p�b�h���̔C�ӂ̍s�ɂ�����e��ǂݏo����
�Ƃ��ł��܂��B
^
�C���f�b�N�X��0����n�܂�̂Œ��ӂ��Ă��������B
p1�Ŏw�肷��ϐ��ɂ́A�ǂݏo���̂ɏ\���ȃo�b�t�@���m�ۂ���̂�Y��Ȃ�
�ł��������B�܂��Ap1�̕ϐ��͋����I�ɕ�����^�ɕύX����܂��B
^
�������m�[�g�p�b�h����(noteget,noteadd,notedel,noteinfo)���g�p���邽��
�ɂ́A�ŏ���notesel���߂őΏۂƂȂ�o�b�t�@��ݒ肵�Ȃ���΂Ȃ�܂���B

%href
notesel

%sample
	a="idx0\nidx1\nidx2"
	notesel a
	noteget b,1
	mes b
	stop




%index
noteinfo
�������m�[�g�p�b�h���擾
%group
�����񑀍�֐�
%prm
(p1)
p1(0) : ���擾���[�h

%inst
noteinfo�֐��́A���ݑΏۂƂȂ��Ă��郁�����m�[�g�p�b�h�ɂ��Ă̏���
�擾���܂��B
p1�ŏ��擾���[�h���w�肵�܂��B�܂��A���ꂼ��̃��[�h�ɑΉ������}�N��
����`����Ă��܂��B
^p
   ���[�h : �}�N��    ���e
 -----------------------------------------------------------
      0   : notemax   �S�̂̍s��
      1   : notesize  �S�̂̕�����(�o�C�g��)
^p
notemax�}�N���́A �����s�̕�����ł��ׂĂ̍s�ɑ΂��ČJ��Ԃ��������s��
�������ꍇ�ȂǂɎg�p���܂��B
�S�̂̍s���Ƃ́A�܂胁�����m�[�g�p�b�h���ɂ���v�f�̐��ł��B
�uAPPLE�v�uORANGE�v�uGRAPE�v�Ƃ����s������ꍇ�ɂ́A3�ɂȂ�܂��B
���̏ꍇ�A�C���f�b�N�X��0�`2�܂łɂȂ�܂��B
^
�������m�[�g�p�b�h����(noteget,noteadd,notedel,noteinfo)���g�p���邽��
�ɂ́A�ŏ���notesel���߂őΏۂƂȂ�o�b�t�@��ݒ肵�Ȃ���΂Ȃ�܂���B

%href
notesel
noteget
notedel
notemax
notesize

%sample
	nmax=0
	notesel a
	noteload "aaa.txt"
	idx=0
	repeat notemax
		noteget b,idx
		print "index"+idx+"="+b
		idx++
	loop
	stop




%index
notesel
�Ώۃo�b�t�@�w��
%group
�����񑀍얽��
%prm
p1
p1=�ϐ� : �o�b�t�@�����蓖�Ă��ϐ���

%inst
p1�Ŏw�肵���ϐ����������m�[�g�p�b�h���߂̃o�b�t�@�ɐݒ肵�܂��B
^
p1�Ŏw�肵���ϐ��́A�����I�ɕ�����^�ɕύX����܂��B
���̃������m�[�g�p�b�h����(noteget,noteadd,notedel,noteinfo)���g�p����
���߂ɂ́A�ŏ��� notesel���߂őΏۂƂȂ�o�b�t�@��ݒ肵�Ȃ���΂Ȃ��
����B

%href
noteunsel
noteget
noteadd
notedel
noteinfo
notemax
notesize

%sample
notesel a
noteadd "test strings"
mes a
stop


%index
noteunsel
�Ώۃo�b�t�@�̕��A
%group
�����񑀍얽��
%prm

%inst
noteunsel���߂́Anotesel���߂őΏۂƂȂ�o�b�t�@��ݒ肷��O�ɐݒ肳��
�Ă����o�b�t�@�ݒ�ɖ߂��܂��B
noteunsel���߂͕K������Ă����K�v�͂���܂��񂪁A
notesel���߂Őݒ肵���o�b�t�@���g���I�������ɓ���Ă������ƂŁA
notesel�ɂ��o�b�t�@�w�肪���d�ɍs�Ȃ��邱�Ƃ�h�~���܂��B

%href
notesel





%index
strmid
������̈ꕔ�����o��
%group
�����񑀍�֐�
%prm
(p1,p2,p3)
p1=�ϐ���  : ���o�����Ƃ̕����񂪊i�[����Ă���ϐ���
p2=-1�`(0) : ���o���n�߂̃C���f�b�N�X
p3=0�`(0)  : ���o��������
%inst
p1�Ŏw�肵��������^�ϐ��̒�����A p2,p3�Ŏw�肵�������ŕ��������o��
�����̂�Ԃ��܂��B
p2�Ŏ��o���n�߂�C���f�b�N�X���w�肵�܂��B����́A������̎n�܂�P��
���ڂ�0�Ƃ��āA1,2,3...�Ə��Ԃɑ����Ă������̂ł��B
�P����n�܂�ł͂Ȃ��̂Œ��ӂ��Ă��������B
p3�Ŏ��o�����������w�肵�܂��B���ۂɊi�[����Ă��镶�������������w
�肵���ꍇ�́A���ۂ̕������܂ł����o����܂��B
�܂��Ap2��-1���w�肷��ƕ�����̉E����p3�Ŏw�肵���������������o����
���B
%sample
	b="ABCDEF"
	a=strmid(b,-1,3)   ; �E����R���������o��
	a=strmid(b,1,3)    ; ������Q�����ڂ���R���������o��
%href
getstr


%index
instr
������̌���������
%group
�����񑀍�֐�
%prm
(p1,p2,"string")
p1=�ϐ��� : ��������镶���񂪊i�[����Ă��镶����^�ϐ���
p2=0�`(0) : �������n�߂�C���f�b�N�X
"string"  : �������镶����
%inst
p1�Ŏw�肵��������^�ϐ��̒��ɁA"string"�Ŏw�肵�������񂪂��邩�ǂ���
���ׂāA�C���f�b�N�X��Ԃ��܂��B
^
�w�肵�������񂪌��������ꍇ�ɂ́A�C���f�b�N�X�l���Ԃ���܂��B����́A
������̎n�܂�P�����ڂ�0�Ƃ��āA   1,2,3...�Ə��Ԃɑ����Ă������̂ł�
(strmid���߂Ŏw�肷��C���f�b�N�X�Ɠ��l�ł�)�B
�P����n�܂�ł͂Ȃ��̂Œ��ӂ��Ă��������B
(p2���w�肵���ꍇ�A�C���f�b�N�X��p2���N�_(0)�Ƃ�����̂ɂȂ�܂��B)
�����A�w�肵�������񂪌�����Ȃ������ꍇ�ɂ�-1���Ԃ���܂��B
%href
strmid




%index
notesave
�Ώۃo�b�t�@�ۑ�
%group
�����񑀍얽��
%prm
"filename"
"filename" : �������݃t�@�C����
%inst
�������m�[�g�p�b�h���߂̃o�b�t�@�̓��e���w�肵���t�@�C���Ƀe�L�X�g
�t�@�C���Ƃ��ĕۑ����܂��B
�K���ŏ���notesel���߂őΏۂƂȂ�o�b�t�@��ݒ肷��K�v������̂Œ���
���Ă��������B
notesave���߂́A�w��o�b�t�@�Ɋ܂܂�镶����̒����ŕۑ����܂��B

%href
notesel
noteload
noteget
noteadd
notedel
noteinfo
%port-
Let



%index
noteload
�Ώۃo�b�t�@�ǂݍ���
%group
�����񑀍얽��
%prm
"filename",p1
"filename" : �ǂݍ��݃t�@�C����
p1(-1)     : �ǂݍ��݃T�C�Y�̏���l
%inst
�w�肵���t�@�C�����������m�[�g�p�b�h���߂̃o�b�t�@�ɓǂݍ��݂܂��B
�ʏ�́A�e�L�X�g�t�@�C����ǂݍ��݁A�������m�[�g�p�b�h���߂œǂݏo����
�ۂƂ��܂��B�������m�[�g�p�b�h���߂̃o�b�t�@�́A�����I�Ƀt�@�C���̃T�C
�Y�ɏ]���Ċm�ۃT�C�Y�����߂���邽�߁A�o�b�t�@�̃T�C�Y�����炩���ߎw��
���Ă����K�v�͂���܂���B
p1�ŁA�ǂݍ��ރt�@�C���̍ő�T�C�Y���w�肷�邱�Ƃ��ł��܂��B
�w����ȗ��܂��̓}�C�i�X�l�ɂ����ꍇ�́A�ǂ�ȃT�C�Y�ł��ǂݍ��݂܂��B
�e�L�X�g�t�@�C���ȊO�̃t�@�C����ǂݍ��ނ��Ƃ��\�ł��B
�K���ŏ���notesel���߂őΏۂƂȂ�o�b�t�@��ݒ肷��K�v������̂Œ���
���Ă��������B
%href
notesel
notesave
noteget
noteadd
notedel
noteinfo
notemax
notesize


%index
getpath
�p�X�̈ꕔ���擾
%group
�����񑀍�֐�
%prm
(p1,p2)
p1=������ : ���o�����̕�����
p2=0�`(0) : ���̃^�C�v�w��
%inst
p1�Ŏw�肵���t�@�C���p�X�������������p2�Ŏw�肵���^�C�v�̏��ɕϊ���
�����̂𕶎���Ƃ��ĕԂ��܂��B
^p
�� :
	a="c:\\disk\\test.bmp"
	b = getpath(a,8+1)
	mes b
	��(����)
	"test"�ƂȂ�
^p
�^�C�v�w��̏ڍׂ͈ȉ��̒ʂ�ł��B
^p
   �^�C�v : ���e
 -----------------------------------------------------------
     0    : ������̃R�s�[(����Ȃ�)
     1    : �g���q�������t�@�C����
     2    : �g���q�̂�(.???)
     8    : �f�B���N�g��������菜��
    16    : ��������������ɕϊ�����
    32    : �f�B���N�g�����̂�
^p
�^�C�v�l�́A���v���邱�Ƃŕ����w����s�Ȃ����Ƃ��\�ł��B
�^�C�v16���w�肳�ꂽ�ꍇ�́A���ׂẲp��������������ɕϊ����܂��B
%href
getstr
instr





%index
strf
�����t��������ɕϊ�
%group
�����񑀍�֐�
%prm
("format",p1)
"format" : �����w�蕶����
p1       : �����w��p�����[�^�[
%inst
�����܂��͎����l��K�؂ȏ����ŕ�����ɕϊ������������Ԃ��܂��B
"format"�ŁA�����w�蕶������w�肵�܂��B
�����w�蕶����́AC�����^�C�����C�u�������T�|�[�g���Ă���sprintf�̏���
�����̂܂ܗ��p���邱�Ƃ��ł��܂��B
^p
�� :
	a=123
	mes strf("10�i[%d]",a)
	mes strf("16�i[%x]",a)
	mes strf("10�i�����w��t��[%05d]",a)
	mes strf("16�i�����w��t��[%05x]",a)
	a=sqrt(2)
	mes strf("10�i����[%f]",a)
	mes strf("10�i���������w��t��[%3.10f]",a)
^p
�u%d�v�͐����l���A�u%x�v�͂P�U�i�����l���A�u%c�v�͕����R�[�h�A�u%f�v��
�����l�����ꂼ��\�������邱�Ƃ��ł��܂��B(�u%s�v �̓T�|�[�g���Ă��܂�
��)�P��strf�֐��ɂ́A1�̃p�����[�^�[�̂ݎw�肷�邱�Ƃ��ł��܂��B
�����̃p�����[�^�[����������ꍇ�́Astrf�֐��𕡐��g�p���ĕ����������
����悤�ɂ��Ă��������B
�����w�蕶����ɂ�1023�����܂ł̕����񂪔F������܂��B
%href
mes
print




%index
cnvwtos
unicode��ʏ핶����ɕϊ�
%group
�����񑀍�֐�
%prm
(p1)
p1=�ϐ� : ���e��ǂݏo�����̕ϐ���

%inst
�ϐ��ɕۑ����ꂽ�f�[�^��unicode�Ƃ��ēǂݎ��A �ʏ�̕�����ɕϊ�����
���̂�Ԃ��܂��B
unicode�f�[�^�������ꍇ��A�O��DLL�A COM�I�u�W�F�N�g�Ƃ̃f�[�^�ϊ��Ȃ�
�Ŏg�p���邱�Ƃ��ł��܂��B

%href
cnvstow
str
%port-
Let




%index
cnvstow
�ʏ핶�����unicode�ɕϊ�
%group
�����񑀍얽��
%prm
p1,"string"
p1=�ϐ�  : ���ʂ��������ޕϐ���
"string" : �ϊ����̕�����

%inst
"������"�Ŏw�肳�ꂽ�f�[�^��unicode������ɕϊ����ĕϐ��o�b�t�@�ɕۑ�
���܂��B
unicode�f�[�^�������ꍇ��A�O��DLL�A COM�I�u�W�F�N�g�ւ̃f�[�^�ϊ��Ȃ�
�Ŏg�p���邱�Ƃ��ł��܂��B

%href
cnvwtos
str
%port-
Let


