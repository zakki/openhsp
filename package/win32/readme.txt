------------------------------------------------------------------------------
HSP ver3.5 beta TESTING MANUAL                      HSP : Hot Soup Processor  
�g�r�o���e�X�g�Ő�����               Copyright 2016 (c) ONION software/onitama
------------------------------------------------------------------------------

�E�͂��߂�

���̃A�[�J�C�u�ɂ́AHot Soup Processor ver3.5���ł̃t�@�C�����܂܂�Ă��܂��B
Hot Soup Processor 3.5���ł́A�A�b�v�f�[�g���ꂽHSP3.4�̋@�\��SDK��
���؂��邽�߂̃o�[�W�����ƂȂ��Ă��܂��B
���̃A�[�J�C�u�Ɋ܂܂����e�́A�e�X�g�łł��薢�����̋@�\��A
�s����܂܂�Ă��邱�Ƃ��������̏エ�g���������B


�E�C���X�g�[�����@

�A�[�J�C�u�́A�ȉ��̍\���ɂȂ��Ă��܂��B

+---hsp35beta             ���[�g�t�H���_
    +---common	          �W���̃X�N���v�g�w�b�_
    +---hsphelp	          �����L�[�w���v�f�[�^
    +---doclib	          �h�L�������g�t�H���_
    +---android	          android��HSP3Dish�����^�C��
    +---iOS	          iOS��HSP3Dish�����^�C��
    +---hsp3js	          WebGL��HSP3Dish�����^�C��
    +---runtime	          Windows�Ń����^�C��
    +---sample	          �T���v���X�N���v�g

�A�[�J�C�u�Ɋ܂܂��uhsp35beta�v�t�H���_���A�n�[�h�f�B�X�N�ɓW�J���Ă��g�p���������B(�����p�X�́uC:\hsp35beta�v�ɂȂ�܂�)
���ł́AHSP3.4�����[�X�łƋ��������邱�Ƃ��\�ł��BHSP3.4�����[�X�ł��C���X�g�[������Ă���t�H���_(�ʏ�́A�uC:\hsp34�v�ɂȂ�܂�)�ɏ㏑�����Ȃ��悤���ӂ��Ă��������B(HSP3.5���ł̊e��ݒ�́A������HSP3.4�Ƃ����L����܂��B)
hsp35beta�t�H���_�ȉ��ɂ���X�N���v�g�G�f�B�^(hsed3.exe)���n�߂Ƃ���e��c�[�����g�p���āA3.5���ł̋@�\�𗘗p���邱�Ƃ��ł��܂��B
(�ȑO�̃��ł��g�p���Ă�����́A�Â��uhsp35beta�v�t�H���_���폜������ɁA�ēx�R�s�[���s�Ȃ��Ă�������)


�E�ŐV�ł̒񋟂ɂ���

�J�����̍ŐV�ł́A����OneDrive�ł����J����܂��B
�u�_�E�����[�h�v����S�̂̃A�[�J�C�u(hsp35beta�t�H���_�̓��e)���擾�\�ł��B

HSP3.5����(OneDrive)
https://onedrive.live.com/embed?cid=EC425522ED849DA7&resid=EC425522ED849DA7%211229&authkey=AB-pNztAqBp6BcU


�E#bootopt���߂ɂ���

�V�K�v���v���Z�b�T���߁A#bootopt���ǉ�����Ă��܂��B
����̓����^�C���ׂ̍�������ݒ���s�Ȃ����߂̂��̂ł��B
�ȉ��̏����Őݒ��ύX���邱�Ƃ��ł��܂��B

	#bootopt �I�v�V������  �ݒ�X�C�b�`

	�I�v�V������ : �I�v�V�����̎��
	�ݒ�X�C�b�` : 1�܂���0�̐��l

	�X�N���v�g�����^�C���ׂ̍�������ݒ���s�Ȃ��܂��B
	�I�v�V�������A�̌�X�y�[�X���� TAB �����Đݒ�X�C�b�`
	1��0�̐��l���L�q���ĉ������B
	#bootopt�́A�X�N���v�g���̔C�ӂ̈ʒu�ɋL�q���邱�Ƃ��\�ł��B
	�����̎w�肪�������ꍇ�́A�Ō�ɐݒ肳�ꂽ���̂��S�̂̐ݒ�ƂȂ�܂��B

	#bootopt�Ŏw��ł���I�v�V�������͈ȉ��̒ʂ�ł��B

	  �I�v�V���� |      ��      �e                | �����l
	 ----------------------------------------------------------
	  notimer    | �����x�^�C�}�[�̎g�p           | �����ݒ�
	             | (0=�g�p����/1=�g�p���Ȃ�)      |
	 ----------------------------------------------------------

	�ȉ��̗�ł́A�����x�^�C�}�[�̎g�p��}�����܂��B

	�� :
		#cmpopt notimer 1


�E�\�[�g�@�\�̕W�����ɂ���

	HSP3.5�ł́AHSPDA�v���O�C���ŗp�ӂ���Ă����\�[�g(���בւ�)�@�\�̂��߂�
	sortval,sortstr,sortnote,sortget���߂��W�����߂ɕύX����Ă��܂��B
	���߂̎��@�\�͕ς�肠��܂��񂪁A�����̖��߂ɂ��ẮA
	HSPDA�v���O�C�����Ȃ��Ă����p���邱�Ƃ��ł��܂��B
	�\�[�g�@�\��HSP3Dish�AHGIMG3�Ȃǂ��ׂẴ����^�C���ŃT�|�[�g����Ă��܂��B


�EHSP3Dish�̊O��DLL�T�|�[�g�ɂ���

	Windows�ł�HSP3Dish�A�y��HGIMG4�ł́A�v���O�C���E�O��DLL�̎g�p���\�ɂȂ�܂����B
	����́A�����܂ł�Windows��œ��삷�郉���^�C���݂̂ŃT�|�[�g����Ă�����̂ŁA
	iOS��android�ȂǁA���̃v���b�g�t�H�[����ł́AWindows�p�̃v���O�C���EDLL�͓��삵�Ȃ��̂Œ��ӂ��Ă��������B
	�܂��ACOM�I�u�W�F�N�g��ActiveX�̋@�\�ɂ��ẮA�܂��T�|�[�g����Ă��܂���B
	�܂��AHSP3Dish������̈Ⴂ�ɂ��A�ꕔ��HSP3�p�v���O�C�������������삵�Ȃ�
	�\��������܂��B���삪�ۏ؂���Ȃ��@�\�Ƃ��āA�ȉ��̂��̂��l�����܂��B
	�E�{�^���Ȃǂ̔z�u�I�u�W�F�N�g�Ɋւ��鑀��A�g�����s�Ȃ�����(llmod3�Ȃ�)
	�E��ʂ̕`��Ɋւ����́A�g���������(HSPCV,HGIMG�Ȃ�)
	�ECOM,ActiveX�ƘA�g���邽�߂̃v���O�C��

	HSP3Dish�̊O��DLL�T�|�[�g�ł́A���Windows API�̌Ăяo���A
	�f�[�^������s�Ȃ��v���O�C���Ȃǌ���I�ȗp�r�Ŏg�p����悤�ɂ��Ă��������B


�EHSP3Dish��setcls�Acelputm���߃T�|�[�g�ɂ���

	HGIMG4�ł̂ݎg�p���\�������Asetcls�Acelputm���߂�HSP3Dish�x�[�X��
	�����^�C���S�̂ŃT�|�[�g����悤�ɏC������܂����B
	setcls���߂́A�w�i�N���A�Ɋւ���ݒ���s�Ȃ��܂��B
	celputm���߂́A������2D�摜���ʂɕ\�������邽�߂̖��߂ł��B
	�ڂ����́A���ꂼ��̖��߃��t�@�����X���Q�Ƃ��Ă��������B


�EHSP3Dish��iOS,android�ōX�V�ɂ���

	HSP3Dish��iOS,android�ł́A���ꂼ��̐V����SDK�ɑΉ����Ă��܂��B

	iOS��	  : XCode6.3�ȍ~�p iOS8,64bit�Ή�
	android�� : Android SDK 5.0.1 (API 21)�ANDK r10�ȍ~�p
	(r11�Ar12�̃o�[�W������Windows��ł̃r���h�ɕs������邽�ߌ����_�ł͑Ή����Ă��܂���)
		    AdMob(Google Play Services)�Ή�

	���ꂼ��Ή������o�[�W������SDK��J�������K�v�ƂȂ�܂��B
	�����̃v���W�F�N�g���������r���h�ł��Ȃ��Ȃ�\�������邽�߁A
	�����̃v���W�F�N�g�́A�ēx�쐬���������Ƃ𐄏����܂��B


�EHSP3Dish��http�ʐM�@�\�ɂ���

	Windows�ł�HSP3Dish�A�y��HGIMG4�ł́A�V����http�ʐM���s�Ȃ����߂�
	httpload,httpinfo���߂��ǉ�����Ă��܂��B
	����ɂ��Aweb(HTTP)�T�[�o�[�ւ̃l�b�g���[�N�A�N�Z�X�y�сA
	�f�[�^�̎擾���s�Ȃ����Ƃ��ł��܂��B
	(hspinet�v���O�C����http�ʐM�@�\�̊ȈՔłƂ����ʒu�t���ł�)

	�����܂ł��A��{�I��http�ʐM�@�\���T�|�[�g������̂ŁA
	���ׂĂ�web�T�[�o�[�Ƃ̒ʐM��ۏ؂�����̂ł͂���܂���B
	http�ʐM�@�\�́A���݂̃o�[�W�����ł�Windows,Emscripten,android��
	�v���b�g�t�H�[����ŃT�|�[�g����Ă��܂��B
	����A���ׂẴv���b�g�t�H�[����ŃT�|�[�g�����\��ł��B
	�ڂ����́A���߃w���v�y�сAHSP3Dish�}�j���A�����Q�Ƃ��Ă��������B

		doclib/hsp3dish_prog.htm#HTTP


�EHSP3UTF(UTF-8)�Ń����^�C���ɂ���

HSP3�̕W�������^�C����unicode(UTF-8)�����x�[�X�œ��삳���邽�߂�
HSP3UTF�����^�C��(hsp3utf.exe)����������Ă��܂��B

�ʏ��HSP3�����^�C���Ɠ����̋@�\�������Ă��܂����A������̈����̂�
unicode(UTF-8)�ƂȂ��Ă��܂��B
SJIS�̕����R�[�h�������W����HSP�ł͕\���ł��Ȃ��������������Ƃ̂ł���
�V����HSP3�Ƃ��č�����i���𑱂���\��ł��B
�g�p����ꍇ�́A�X�N���v�g�̐擪�Ɉȉ��̍s���w�肵�Ă��������B

	#include "hsp3utf.as"

�ڂ����́A�h�L�������g hsp3utf.txt���������������B


�E64bit(x64)�Ń����^�C���ɂ���

64bit(x64)�A�v���Ƃ��ē��삷��HSP3�W�������^�C��(hsp3_64.exe)�𓯍����Ă��܂��B
�g�p����ꍇ�́A�X�N���v�g�̐擪�Ɉȉ��̍s���w�肵�Ă��������B

	#include "hsp3_64.as"

64bit(x64)�����^�C���́A64bit�ł�Windows��ł̂ݓ��삵�܂��B
���̃o�[�W�����́A������64bit���Ɍ����Ẵe�X�g�łƂ��l�����������B
�ʏ�́A�W����32bit��HSP3�����^�C��(hsp3.exe)�����g�p�����Ė�肠��܂���B

����ł́A64bit�����^�C���Ɉȉ��̒��ӓ_������܂��B

	�E�]����HSP�X�N���v�g��64bit�A�v���Ƃ��ē��삳���郉���^�C���ł�
	�@(�����l�͈̔͂ȂǏ]���̎d�l���ς����̂ł͂���܂���)
	�E1�̕ϐ����g�p���郁�����o�b�t�@��2GB(32bit)������ƂȂ�܂�
	�@(�X�N���v�g�S�̂��g�p�ł��郁�����T�C�Y��64bit�A�v���ɏ������܂�)
	�E�]����32bit�Ńv���O�C���Ƃ͌݊���������܂���
	�ECOM�֘A�̖��߂����������삵�Ȃ����Ƃ�����܂�


�EHGIMG4�̃}���`�v���b�g�t�H�[���Ή��ɂ���

	���x��3D�\���A���Z�������s�Ȃ�HGIMG4�����^�C���̃}���`�v���b�g�t�H�[���Ή����s�Ȃ��Ă��܂��B

	Windows�� : �ʏ��(OpenGL��)�ɉ�����DirectX9�ł̃����^�C���𓯍����Ă��܂�
	WebGL��   : HSP3Dish helper����html�R�[�h���o�͉\�ł�
	android�� : HSP3Dish helper����v���W�F�N�g���o�͉\�ł�
	iOS��     : �����̃o�[�W�����őΉ��\��ł�


�EHGIMG4 DirectX9�Ń����^�C���ɂ���

	HGIMG4�́AOpenGL�ł�DirectX9(angle)�ł�I�����邱�Ƃ��ł��܂��B
	�]���́AOpenGL�o�[�W����3.1�ȏオ�C���X�g�[�����ꂽ���œ��삵�Ă��܂������A
	DirectX9(angle)�ł́AWindows7�ȍ~�ŁADirectX9�ŐV�ł̃����^�C�����C���X�g�[�����ꂽ���œ��삵�܂��B
	DirectX9(angle)�ł́A���s�ɂ������Ĉȉ���DLL��K�v�Ƃ��܂��B
	(����DLL�́AHSP�C���X�g�[���t�H���_�ɕt�����Ă��܂��B
	���[�U�[�����삵���A�v���P�[�V������z�z����ꍇ�́A����DLL���z�z����
	�K�v������܂�)

		d3dcompiler_47.dll	�ǉ�DLL
		libEGL.dll		�ǉ�DLL
		libGLESv2.dll		�ǉ�DLL

	������DLL�́AOpenGL�ł��g�p����ꍇ�͕K�v����܂���B
	HGIMG4 DirectX9�Ń����^�C�����g�p����ꍇ�ɂ́A

	#include "hgimg4dx.as"

	���X�N���v�g�̐擪�ɋL�q���Ă��������B
	��́AOpenGL�łƓ��l�Ɏg�p���邱�Ƃ��\�ł��B


�E�Â��v���O�C���E�����^�C���̓����I���ɂ���

	HSP3.5�����[�X�łł́A�������̌Â��v���O�C���E�����^�C���̓������I������\��ł��B
		�EHSPLet�����^�C��
		�EHGIMG/HGIMGX�v���O�C��
		�Ellmod3���W���[��

	�����͒������ԍX�V���Ȃ��A�Â��V�X�e���Ɉˑ����Ă��邽�ߐV�����g�p���邱�Ƃ͐����ł��܂���B
	�A�b�v�f�[�g���ꂽHSP����g�p�ł��Ȃ��Ȃ�킯�ł͂���܂��񂪁A�t���Z�b�g�łւ̓����͏I�������Ē����\��ł��̂ł��������������B


�E�X�V����

	2016/07/29 3.5 beta4

	�I�t�B�V�����쉹2D�f��(tamaface)�ƃT���v���Q�[����ǉ�
	�V���A���ڑ��ɂ��arduino����̂��߂̃��W���[���Aarduino.as��ǉ�
	hspext�v���O�C���Ƀo�C�i���f�[�^�𑗐M���s�Ȃ�computb���߂�ǉ�
	�X�N���v�g�G�f�B�^�̃c�[�����j���[�𐮗�(�񐄏��@�\���T�u���j���[�Ɉړ�)
	�\�[�X�ɑS�p����������ۂɃX�N���v�g�G�f�B�^�̃��x���ꗗ�Ő��������x�������o����Ȃ��Ȃ�s����C��
	�g���v���O�C���T���v��hpi3sample.as�����삵�Ȃ��s����C��
	mesbox,input���߂ɂ����̓{�b�N�X����32767�ȏ�̕�������擾�ł��Ȃ��s����C��
	strrep���߂����q�ɂ���ƈӐ}������������Ȃ��s����C��(HSP3BT#17)
	�������UTF8�ŏo�͂���I�v�V������#cmdopt���߂ɒǉ�
	[HSP3Dish][Windows] mmstat���߂�wav�t�@�C���ȊO�̍Đ���Ԏ擾���ł��Ȃ������s����C��
	[hsp3utf] UTF-8��hsp3�����^�C��(hsp3utf)�𓯍�
	[hsp3utf] UTF-8��ANSI(SJIS)�̑��ݕϊ����s�Ȃ�cnvstoa���߁Acnvatos�֐���ǉ�
	Win32�R�}���h���C���ŃR�[�h�R���p�C��(hspcmp)�𓯍�

	tds12����ɂ��OpenHSP�C���𔽉f
	�f�o�b�O�E�B���h�E��UTF8�����R�[�h�ɑΉ�

	ue_dai����ɂ��OpenHSP�o�O�C���Ƌ@�\�g���𔽉f
	[hsp3][Windows] oncmd���߂Ŗ��o�^�̃E�C���h�E���b�Z�[�W���L�����ł���s����C��
	[hsp3][Windows] stick,getkey���߂��V�X�e���̃}�E�X�N���b�N�̍��E���]�ݒ�ɑΉ�
	[hsp3] logmes���߂�mes���߂Ɠ��l�ɔC�ӂ̌^�̒l���󂯎��悤�ɏC��
	[hsp3] limit,limitf�֐��̉����A����̃p�����[�^���ȗ��\�ɏC��
	[hsp3] �z��ϐ��̗v�f�g����������
	[hsp3] varptr�֐����s���ɕϐ��̃o�b�t�@�T�C�Y���V�X�e���ϐ�strsize�ɕԂ��悤�ɏC��
	[hsp3_64] ���W���[���ϐ��̃f�[�^(STRUCTPRM)���j����������C��
	[hspcmp] ��3�̃v���v���Z�b�T�[���u{�v�u}�v�𕶂̋�؂�L���Ƃ��ĉ��߂���ύX��������(�\�[�X��݊����������邽��)
	[hspcmp] ��3�̃R���p�C���ŃG���[���������邱�Ƃ�����s����C��
	�X�N���v�g�G�f�B�^�̃t�H���g�ݒ肪ASCII�����ɂ����K�p����Ă��Ȃ����������C��

	2016/01/19 3.5 beta3

	�I�t�B�V�����쉹2D�f��(tamadot)�𓯍�
	�f�o�b�O�E�C���h�E�ɃR�[���X�^�b�N�^�u��ǉ�
	[HSP3Dish] �摜�R�s�[���̐F��Z�l���w�肷��gmulcolor���߂�ǉ�
	[HSP3Dish][iOS] 64bit���̎��s���G���[���C��
	[HSP3Dish][android][iOS] �G���[�������ɔԍ��ƃ��b�Z�[�W���o�͂���悤�ɏC��
	[HSP3Dish][android] ����SDK��Android 5.0.1 (API 21)�ɕύX
	[HSP3Dish][android] �r���h����HSP���C�u�����t�H���_���Q�Ƃ�����@�ɕύX
	[HSP3Dish][android] ��2�ł�AdMob�r���h���������ł��Ȃ������s����C��
	[HSP3Dish][android] HGIMG4�g�p�v���W�F�N�g�ɑΉ�
	[HSP3Dish][android] JDK7�ȍ~�ł̏����ɑΉ�
	[HSP3Dish][android] zipalign�c�[���̑��݂��m�F����悤�ɏC��
	[HSP3Dish][android] �_�C�A���O�ȊO�̕������^�b�`����ƒ�~����s����C��
	[HSP3Dish][Windows] mmvol���߂ɂ�鉹�ʂ���ނɂ���ĈقȂ��Ă����̂��C��

	ue_dai����ɂ��OpenHSP�o�O�C���𔽉f
	[hsp3] �A�z�z��^��array/local�����G�C���A�X��Y���������ɎQ�Ƃ����Ƃ��ɗ�����o�O���C��
	[hsp3] ���[�U�[��`����/�֐��ł̃��x�������̎���
	[hsp3] sortstr�̃o�O�C�������sort�n���߂̍�����
	[hspcmp] hsc3_messize�̃o�b�t�@�T�C�Y�擾�̏C��
	[hspcmp] �}�N���^�O�̖��O���ő�56�����ɂ���
	[hspcmp] �v���v���Z�X�Łu{�v�u}�v�𕶂̋�؂�L���Ƃ��ĉ��߂���悤�ɏC��
	[hspcmp] #const�̌�Ɂudouble�v�uint�v�̌^���w��ł���悤�ɏC��
	[hspcmp] #func�Ő錾���ꂽDLL�֐����A�֐��Ƃ��Ă��g�p�ł���悤�ɏC��
	[hspcmp] ���W���[������local�w�肳�ꂽ�֐����A��`����O�̍s����g�p�ł���悤�ɏC��
	[hspcmp] ���g�p���W���[���̃R�[�h�폜���s���S�������������C��
	[hspcmp] �V���{���̑��d��`�G���[�Œ�`���ꂽ�ʒu���o�͂���悤�ɏC��
	[hspcmp] �悭����G���[���b�Z�[�W�̓��{�ꉻ
	[hspcmp] �����������l�̏d���f�[�^�팸�ɂ��o�̓T�C�Y�̍œK��������

	2015/05/27 3.5 beta2

	[HGIMG4] �e�N�X�`���𕡐��ǂݍ��񂾍ۂɃG���[����������s����C��
	[HGIMG4] �J�����o�R�ŉ���ς݃I�u�W�F�N�g�ɃA�N�Z�X���ăN���b�V��������̏C��
	[HGIMG4] DirectX9 API�g�p�̃����^�C��(hsp3gpdx)��ǉ�
	[HSP3Dish] HGIMG4�Ɠ�����setcls�Acelputm���߂��T�|�[�g
	[HSP3Dish][Windows] ��1�ł�wav�t�@�C�����Đ�����Ȃ����Ƃ�����s����C��
	[hspinet] ftpdirlist���߂Ń��������������m�ۂ���Ȃ��s����C��
	���߂̑�2�p�����[�^�[�ȍ~��sysinfo�֐����g�����ۂɑ�1�p�����[�^�[�̒l���ύX�����s����C��
	beta1��objimage���߂����������삵�Ȃ��s����C��
	�����s�����񂩂����̕���������s����������notefind�֐���ǉ�
	�������̃T���v���X�N���v�g��ǉ�
	�摜�t�@�C���f�R�[�_�[���X�V�A1,2,4bit PNG�ɑΉ�
	64bit(x64)�Ń����^�C����DLL�Ăяo���ɑΉ�
	64bit(x64)�Ń����^�C����input���߂ŃG���[����������s����C��
	64bit(x64)�Ń����^�C���Ń��W���[���ϐ��g�p���ɃG���[����������s����C��
	HSP3�\�[�X�R���o�[�^�[�Ŕz��W�J�Ɏ��s����s����C��(Mantis:0000011)
	HSP3�\�[�X�R���o�[�^�[�ŉ��Z�̍œK�����ɃX�^�b�N�ɕs�������N����s����C��
	�X�N���v�g�G�f�B�^��SDK�@�\�̈ꕔ(HSED_GETCARETLINE��HSED_GETCARETPOS)��L����
	[HSP3Dish][iOS] 64bit���̎��s����EXC_BAD_ACCESS����������s����C��
	�h�L�������g�̈ꕔ�C��
	[HSP3Dish][android] httpload,httpinfo���߂ɂ��l�b�g���[�N�A�N�Z�X���T�|�[�g
	[HSP3Dish][android] mes���߂̉��s���F������Ȃ��s����C��
	[HSP3Dish][android] dialog���߂ɂ��W���_�C�A���O�\�����T�|�[�g
	[HSP3Dish][android] dpm�t�@�C�����F������Ȃ����Ƃ�����s����C��
	[HSP3Dish][android] beta1��mes���߂̌��gcopy���߂��������\������Ȃ��s����C��

	2015/02/18 3.5 beta1

	64bit(x64)�Ń����^�C���Ahsp3_64��ǉ�
	HSP3Dish��note�n���߂ōs�����ԈႦ��s����C��
	HSPDA�v���O�C����sortval,sortstr,sortnote,sortget��W�����߂Ƃ��Ď���
	�V�K�v���v���Z�b�T���߁A#bootopt��ǉ�
	#bootopt���߂ɂ��^�C�}�[���x�̐ݒ�ύX�ɑΉ�
	[HSP3Dish] (Windows�ȊO)grect���߂̔������J���[�`�悪���������f����Ȃ��s����C��
	[HSP3Dish][iOS] �ŐV��iOS�y��64bit�o�C�i���̃r���h(arm64)�ɑΉ�
	[HSP3Dish][android] NDK r10�AAdMob�̍X�V�ɑΉ�
	[HSP3Dish][android] hsp3dish.ini�̐ݒ��荞�݂ɑΉ�
	[HSP3Dish][android] HSP3Dish Helper�̍X�V
	[HSP3Dish][Windows] httpload,httpinfo���߂�ǉ�
	[HSP3Dish][HGIMG4][Windows] (Windows�ł̂�)�v���O�C���E�O��DLL�g�p���\�ɏC��
	�����\�[�X�̃R���p�C��������(zakki)


�E�ӎ�

OpenHSP�ő����̂����͂𒸂����Azakki����Afujidig����Asharkpp����Ɋ��Ӓv���܂��B
�����̏����𒸂���HSP-Dev ML�����o�[�̊F�l�A���肪�Ƃ��������܂����B


�E���쌠����јA����

���ł��g�p�����X�N���v�g�E���s�t�@�C���̌��J�A���C�Z���X�ɂ��Ă�
HSP3.4�Ɠ��l�̋K��Ŏ��R�ɍs�Ȃ��Ă��������č\���܂���B
�������A�\���e�X�g���s�Ȃ��Ă��Ȃ��e�X�g�łł��邱�Ƃ𗯈ӂ��Ă����Ă��������B
�����܂ŁA���Ȃ̐ӔC�͈̔͂ŉ^�p���Ă��������B
�s��₨�C�Â��̓_������܂�����A���m�点������Ɗ������ł��B

onion software�͖{�v���O�����ɂ���Đ������A�����Ȃ鑹�Q�ɂ��Ă�
�ۏ؂������܂���B���Ȃ̐ӔC�͈̔͂Ŏg�p���Ă��������B
HSP����ю��Ӄc�[���́AMicrosoft Visual Studio 2013�ɂ���ăR���p�C������Ă��܂��B

���̃\�t�g�Ɋւ��邨�₢���킹�A���z�A���ӌ��Ȃǂ͈ȉ��̃��[���A�h���X�܂ŁB

	Homepage: http://www.onionsoft.net/
	          http://hsp.tv/
        e-mail  : onitama@onionsoft.net

------------------------------------------------------------------------------
                                                     README.TXT / end of file 
------------------------------------------------------------------------------
