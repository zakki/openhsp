;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.6
%note
hsp3dish.as���C���N���[�h���邱�ƁB

%date
2019/12/03
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
	PLATFORM_WEBGL      3   hsp3dish.js(WebGL/JavaScript)��
	PLATFORM_LINUX      4   Linux��
	PLATFORM_RASPBIAN   5   Raspberry Pi(raspbian)��
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
setcls
��ʃN���A�ݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
mode,color,tex
mode(0)  : ��ʃN���A�̃��[�h
color(0) : ��ʃN���A�F(24bitRGB�R�[�h)
%inst
redraw 0�ɂ���ʏ��������ɍs�Ȃ����ʃN���A�̂��߂̐ݒ���s�Ȃ��܂��B
mode�l�̐ݒ�ɂ��A��ʃN���A���s�Ȃ����߂̃��[�h��ݒ肵�܂��B
1��ݒ肵���ꍇ�̓N���A�A0�̏ꍇ�̓N���A���s�Ȃ��܂���B
�X�N���v�g���ŉ�ʂ̃N���A���s�Ȃ��Ă���ꍇ�́A�V�X�e�����Ŕw�i�N���A�����Ȃ������������x�̌���ɂȂ���܂��B
^p
	���[�h�l  ���e
	------------------------------------------------------
	    0     ��ʃN���A���s�Ȃ�Ȃ�
	    1     ��ʃN���A���s�Ȃ�
^p
color�ŃN���A����ۂ̐F��ݒ肷�邱�Ƃ��ł��܂��B�F�́A24bitRGB�R�[�h($rrggbb)�̐��l�Őݒ肵�܂��B


%href
redraw


%index
celputm
�����̃Z�����܂Ƃ߂ĕ`��
%group
�g���}���`���f�B�A���䖽��
%prm
vxpos,vypos,vcelid,bufid,count
vxpos    : �\��X���W���i�[���ꂽ�����^�z��ϐ���
vypos    : �\��Y���W���i�[���ꂽ�����^�z��ϐ���
vcelid   : �Z��ID���i�[���ꂽ�����^�z��ϐ���
bufid(0) : �Z�����i�[����Ă���o�b�t�@ID
count(1) : �z��ϐ�������o�����ڐ�
%inst
�����^�̔z��ϐ��ɑ�����ꂽ���W�A�Z��ID�����Ƃ�celput�Ɠ��l�̕\����z��v�f���ƂɎ��s���܂��B
�z��ɕۑ����ꂽ�����̍��ڂɂ��āA��x�ɏ������s�Ȃ��邽�ߌ������ƍ������ɂȂ���܂��B
count�Ŕz��ϐ�������o�����ڂ̐����w�肵�܂��B�z��ϐ�����́A�v�f0���珇�Ԃɒl�����o����܂��B
vxpos�ɂ�X���W�Avypos�ɂ�Y���W�Avcelid�ɂ̓Z��ID���������Ă���K�v������܂��B
�Z��ID���}�C�i�X�l�̏ꍇ�́A�`��͍s�Ȃ��܂���B
celputm���߂̎��s��A���ۂɕ\�����ꂽ�Z���̐����V�X�e���ϐ�stat�ɑ������܂��B

%href
celput


%index
httpload
http�ʐM�̊J�n
%group
�g�����o�͐��䖽��
%prm
"url","postdata"
"url" : ���N�G�X�g���s�Ȃ��t�@�C����
"postdata" : POST���s�Ȃ��ۂ̕�����f�[�^

%inst
�w�肳�ꂽURL�ɑ΂��āAhttp�ʐM���J�n���܂��B
���̖��߂́A�ʐM�̃��N�G�X�g���J�n���邾���ŁA�����Ɍ��ʂ͎擾����܂���B
�ʐM�̌��ʂ́Ahttpinfo���߂��g�p���Đ������f�[�^����M�������Ƃ��m�F������ŁA�擾����K�v������܂��B
^
httpload�́A�ʏ��"url"�̎w��Ń��N�G�X�g���s�Ȃ�URL�X�L�[��(�uhttp://www.onionsoft.net/about.html�v�̂悤�ȕ�����)���w�肷�邱�ƂŁAHTTP�ʐM���J�n���܂��B
^p
;��:
;	URL���w�肵�ĒʐM���J�n����
httpload "http://www.onionsoft.net/about.html"
^p
CGI��WebAPI�ȂǂɃA�N�Z�X���邽�߂ɁAPOST�`���ŒʐM���s�Ȃ��ꍇ�́A"postdata"�Ƀp�����[�^�[��������w�肵�Ă��������B
("postdata"�̎w����ȗ������ꍇ�́A�ʏ��GET�`���ɂ��HTTP�ʐM���s�Ȃ��܂��B)
^p
;��:
;	URL���w�肵��POST�`���̒ʐM���J�n����
httpload "http://www.onionsoft.net/hsp/beta/betabbs.cgi","mode=find&cond=and&log=0&word=script"
^p
POST�`���̒ʐM�́A"postdata"�̌`����d�l�ɂ��ẮACGI��http���N�G�X�g�ɂ��Ă̒m��������l�Ɍ����ėp�ӂ���Ă�����̂ł��B
httpload���߂����s���ꂽ��́A�V�X�e���ϐ�stat�Ƀ��N�G�X�g�������s�Ȃ�ꂽ�����������l���������܂��B
�V�X�e���ϐ�stat���A0�̏ꍇ�͐��������N�G�X�g���������Ă��܂��B�V�X�e���ϐ�stat���A0�ȊO�̏ꍇ�́A�G���[�ɂ�胊�N�G�X�g���ł��Ȃ��������Ƃ������Ă��܂��B
httpload���߂Ő����http�ʐM���J�n������́Ahttpinfo���߂ɂ���M�m�F�ƃf�[�^�擾�������X�N���v�g���ōs�Ȃ��K�v������܂��B
�B
^p
;��:
	;	URL���w�肵�ĒʐM���J�n����
	httpload "http://www.onionsoft.net/about.html"
	if stat : goto *bad	; ���������N�G�X�g���ł��Ȃ�����
*main
	;	���ʑ҂��̂��߂̃��[�v
	httpinfo res,HTTPINFO_MODE		; ���݂̃��[�h���擾
	if res = HTTPMODE_READY : goto *ok	; �ʐM���I������
	if res <= HTTPMODE_NONE : goto *bad	; �G���[����������
	await 50				; ���ԑ҂����s�Ȃ�
	goto *main
*bad
	;	�G���[
	httpinfo estr,HTTPINFO_ERROR		; �G���[��������擾����
	dialog "ERROR "+estr
	stop
*ok
	;	����
	httpinfo buf,HTTPINFO_DATA		; ���ʃf�[�^���擾����
	httpinfo size,HTTPINFO_SIZE		; �f�[�^�T�C�Y���擾����
^p
http�ʐM�ɂ���Ď擾�����f�[�^�́A�ϐ������������Ɋi�[����܂��B
�傫�ȃt�@�C�����擾�����ꍇ�́A���̃T�C�Y�����������������̂Œ��ӂ��Ă��������B
�����܂ł��A��������Ɏ擾�ł���͈͂̃T�C�Y��z�肵���ȈՓI�ȒʐM�̎d�g�݂ł��邱�Ƃ��������̏�g�p���Ă��������B
Windows��ł���΁AHSPINET�v���O�C���ɂ��A����ɏڍׂ�HTTP�ʐM���s�Ȃ����Ƃ��\�ł��B

%href
httpinfo


%index
httpinfo
http�ʐM�̏����擾
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1    : �f�[�^����������ϐ�
p2(0) : �f�[�^�̎��ID

%inst
http�ʐM�Ɋւ�������擾���܂��B
httpload���߂ɂ��Ahttp�ʐM���s�Ȃ������ʂȂǂ��擾���邱�Ƃ��ł��܂��B
p2�Ŏw�肳�ꂽ�擾���[�h�ɑΉ�������e���Ap1�Ŏw�肳�ꂽ�ϐ��ɑ�����܂��B
�擾���[�h�̒l�́A�ȉ��̒ʂ�ł��B
^p
	  ���ID              ���e
	------------------------------------------------------
	HTTPINFO_MODE 0       ���݂̒ʐM���[�h
	HTTPINFO_SIZE 1       �f�[�^�T�C�Y
	HTTPINFO_DATA 16      �擾�f�[�^(*)
	HTTPINFO_ERROR 17     �G���[������(*)

(*)�̍��ڂ́A������^�ϐ��Ƃ��đ������܂��B
^p
��M�f�[�^(HTTPINFO_DATA)�̓ǂݏo�����s�Ȃ��ƁA��M�f�[�^�̓��e�̓N���A�����̂Œ��ӂ��Ă��������B
�����Ȏ��ID���w�肳�ꂽ�ꍇ�́A0�܂���""(��̕�����)���Ԃ���܂��B
^
�ʐM���[�h�̒l�́A�ȉ��̓��e�ɂȂ��Ă��܂��B
^p
	  �ʐM���[�h�l        ���e
	------------------------------------------------------
	HTTPMODE_NONE         �ʐM�������G���[
	HTTPMODE_READY        �ʐM�\���
	HTTPMODE_REQUEST      ���N�G�X�g�ʐM����
	HTTPMODE_SEND         ���N�G�X�g���M
	HTTPMODE_DATAWAIT     �ʐM���ʑҋ@��
	HTTPMODE_DATAEND      �ʐM�I��
	HTTPMODE_ERROR        �G���[����
^p

%href
httpload



%index
gmulcolor
�e�N�X�`����Z�l�̐ݒ�
%prm
p1,p2,p3
p1,p2,p3=0�`255(255) : �F�R�[�h�iR,G,B�̋P�x�j
%inst
�摜(�e�N�X�`��)�R�s�[���s�Ȃ��ۂ̃J���[��Z�l���w�肵�܂��B
p1,p2,p3�����ꂼ��AR,G,B�̋P�x�ɂȂ�܂��B
gcopy,gzoom,celput,grotate(�摜�g�p��)�ȂǂŃR�s�[�����摜�ɑ΂��āA�w�肵��R,G,B�l����Z����܂��B
�����l�́ARGB���ꂼ��255���w�肳��Ă��܂��B�e�N�X�`����Z�l��ݒ肷�邱�Ƃɂ��A���̉摜�̐F��ω������邱�Ƃ��ł��܂��B
�摜�R�s�[�̍ۂɁAgmode���߂Ŏw�肳���R�s�[���[�h��0�܂���1(�A���t�@�`�����l���𔽉f���Ȃ�)�̏ꍇ�́A�e�N�X�`����Z�l�͖����ɂȂ�̂Œ��ӂ��Ă��������B
�e�N�X�`����Z�l�́Ames���߂ɂ�镶���̕`��A�y��gsquare���߂ɂ͔��f����܂���B�܂��Aboxf,line���߂ȂǒP�F�̕`��ɂ͔��f����܂���B

%href
color
gcopy
gzoom
grotate
gsquare
celput


