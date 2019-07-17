------------------------------------------------------------------------------
HSP ver3.6 beta TESTING MANUAL                      HSP : Hot Soup Processor  
�g�r�o���e�X�g�Ő�����               Copyright 2019 (c) ONION software/onitama
------------------------------------------------------------------------------

�E�͂��߂�

���̃A�[�J�C�u�ɂ́AHot Soup Processor ver3.6���ł̃t�@�C�����܂܂�Ă��܂��B
Hot Soup Processor 3.6���ł́A�A�b�v�f�[�g���ꂽHSP3.5�̋@�\��SDK��
���؂��邽�߂̃o�[�W�����ƂȂ��Ă��܂��B
���̃A�[�J�C�u�Ɋ܂܂����e�́A�e�X�g�łł��薢�����̋@�\��A
�s����܂܂�Ă��邱�Ƃ��������̏エ�g���������B


�E�C���X�g�[�����@

�A�[�J�C�u�́A�ȉ��̍\���ɂȂ��Ă��܂��B

+---hsp36beta             ���[�g�t�H���_
    +---common	          �W���̃X�N���v�g�w�b�_
    +---hsphelp	          �����L�[�w���v�f�[�^
    +---doclib	          �h�L�������g�t�H���_
    +---android	          android��HSP3Dish�����^�C��
    +---iOS	          iOS��HSP3Dish�����^�C��
    +---hsp3js	          WebGL��HSP3Dish�����^�C��
    +---runtime	          Windows�Ń����^�C��
    +---sample	          �T���v���X�N���v�g

�A�[�J�C�u�Ɋ܂܂��uhsp35beta�v�t�H���_���A�n�[�h�f�B�X�N�ɓW�J���Ă��g�p���������B(�����p�X�́uC:\hsp36beta�v�ɂȂ�܂�)
���ł́AHSP3.5(�܂���3.51)�����[�X�łƋ��������邱�Ƃ��\�ł��BHSP3.5�����[�X�ł��C���X�g�[������Ă���t�H���_(�ʏ�́A�uC:\hsp35�v�ɂȂ�܂�)�ɏ㏑�����Ȃ��悤���ӂ��Ă��������B(HSP3.6���ł̊e��ݒ�́A������HSP3.5�Ƃ����L����܂��B)
hsp35beta�t�H���_�ȉ��ɂ���X�N���v�g�G�f�B�^(hsed3.exe)���n�߂Ƃ���e��c�[�����g�p���āA3.6���ł̋@�\�𗘗p���邱�Ƃ��ł��܂��B
(�ȑO�̃��ł��g�p���Ă�����́A�Â��uhsp36beta�v�t�H���_���폜������ɁA�ēx�R�s�[���s�Ȃ��Ă�������)


�EOneDrive�ł̍ŐV�ł̒񋟂ɂ���

�J�����̍ŐV�ł́A����OneDrive�ł����J����܂��B
�u�_�E�����[�h�v����S�̂̃A�[�J�C�u(hsp35beta�t�H���_�̓��e)���擾�\�ł��B

HSP3.6����(OneDrive)
https://onedrive.live.com/embed?cid=EC425522ED849DA7&resid=EC425522ED849DA7%211229&authkey=AB-pNztAqBp6BcU


�ELinux�ł̒񋟂ɂ���

Linux��GUI��(X Window System)�y��Raspberry Pi(Raspbian)�œ��삷��o�[�W�����ɂ��ẮA
�ŐV�ł�github�ɂČ��J���Ă��܂��B

git clone https://github.com/onitama/OpenHSP

�̂悤�Ȍ`�Ŏ擾���Ă��������B
�ڂ����́A�ȉ��̃y�[�W���������������B
�ŐV�ł̓���y�сA�C���X�g�[�����@�ɂ��Ă���������Ă��܂��B

HSP3 for Linux/Raspberry Pi
http://hsp.tv/make/hsp3linux_pi.html


�Eobjcolor���߂ɂ���

	�z�u�I�u�W�F�N�g�̔z�F���w�肷�邽�߂�objcolor���߂��V�K�ɒǉ�����Ă��܂��B

	objcolor p1,p2,p3	�z�u�I�u�W�F�N�g�̔z�F���w�肷��

		p1,p2,p3=0�`255(0) : �F�R�[�h�iR,G,B�̋P�x�j

	���̓{�b�N�X���̔z�F��ݒ肷�邱�Ƃ��ł��܂��B
	objcolor���߂ɂ��z�F��L���ɂ��邽�߂ɂ́A���炩����objmode���߂̃I�v�V������
	�uobjmode_usecolor�v���w�肷��K�v������܂��B

		objmode objmode_usecolor

	mesbox�Ainput���߂ɂ����̓{�b�N�X�́Argbcolor�Ŏw�肵�������F�Acolor���߂Ŏw�肵��
	�w�i�F���K�p����܂��B
	�܂��Amesbox�ɂ��e�L�X�g���̓{�b�N�X�́A[ctrl]+[A]�L�[�ɂ��S�I���ł���悤
	�C������Ă��܂��B


�Ergbcolor���߂ɂ���

	24bit�J���[�R�[�h���w�肷�邽�߂�rgbcolor���߂��ǉ�����Ă��܂��B
	�]���ARGB���ꂼ����ucolor 1,2,3�v�̂悤�ɕ����ăp�����[�^�[���L�q���Ă������̂�
	�urgbcolor $010203�v�̂悤�Ȍ`�ŋL�q���邱�Ƃ��ł��܂��B
	Web(html)���Ŏg�p����u#112233�v�̂悤��RGB�R�[�h�Ɛe�a���̍����w����@�ł��B


�Ezip�t�@�C���̈��k�𓀃T�|�[�g�ɂ���

	ZLibWrap.dll���C�u�������g�p����zip�t�@�C�����k�𓀂��T�|�[�g���܂����B
	�V���v����2�̖��߂ŁA�X�N���v�g����t�@�C���̈��k�A�𓀂��s�����Ƃ��\�ł��B

		#include "zipfile.as"

	���L�q���邱�ƂŁA�ȉ��̖��߂��g�p���邱�Ƃ��ł��܂��B
	(���s�̍ۂɂ́AZLibWrap.dll�t�@�C�����K�v�ƂȂ�܂��B)

	ZipCompress "srcfiles", "zipfile"

		"srcfiles"�Ŏw�肵���t�@�C��(���C���h�J�[�h�g�p��)��
		"zipfile"�Ŏw�肵���t�@�C���Ɉ��k���ĕۑ����܂��B

	ZipExtract "zipfile", "path"

		"zipfile"�Ŏw�肵�����k�t�@�C�����A"path"�Ŏw�肵���t�H���_�ɉ𓀂��܂��B

	�ڂ����́A���ꂼ��̖��߃w���v�A�T���v�����Q�Ƃ��Ă�������


�EMUCOM88�v���O�C���ɂ���

	HSP3.6�ł́AMML�L�q�ɂ��FM�����Đ����T�|�[�g����MUCOM88�v���O�C����W���œ������Ă��܂��B
	NEC�̃p�\�R��PC-8801�V���[�Y�œ��삵�Ă����AFM�����̃h���C�o�[���Č�����MUCOM88 Windows�����@�\��
	�R���g���[�����邱�Ƃ��ł��܂��B
	MUCOM88�v���O�C�����g�p���邱�Ƃɂ��A�P���ȉ��y�̍Đ�����AMML�̉��߂܂ŃX�N���v�g���ꂩ��
	���L�����䂷�邱�Ƃ��ł��܂��B
	FM����(OPNA)6��+PSG����(3��)+���Y������+PCM�����̍��v11�`�����l����MML����ɂ��L�q�ł��܂��B
	Windows�̃T�E���h�Đ������́ADirectX8�ȍ~��DirectSound���g�p���AWindows XP�ȍ~�̊��ŁA
	�ǉ��̃R���|�[�l���g��p�ӂ��邱�ƂȂ����삳���邱�Ƃ��ł��܂��B
	MUCOM88�v���O�C���̏ڍׂ́A�t���̃}�j���A��(docs/hspmucom.txt)���ꂼ��̖��߃w���v�A
	�T���v��(samples/mucom88)���Q�Ƃ��Ă��������B

	HSPMUCOM�́AOpen MUCOM88�v���W�F�N�g�̈ꕔ�Ƃ��Č��J����Ă��܂��B
	Open MUCOM88�v���W�F�N�g�ɂ��ẮA�ȉ����Q�Ƃ��Ă��������B

	Open MUCOM88
	https://onitama.tv/mucom88/

	Windows��œ��삷��MUCOM88 Windows�c�[���y�уT���v��MML�����J����Ă��܂��B
	HSPMUCOM.DLL�y�у\�[�X�R�[�h�́A����(��c��)�ł������͎��R�ɏЉ�A
	�����A�Ĕz�z���邱�Ƃ��ł��܂��B���̍ۂɂ͕K���h�L�������g��
	���C�Z���X�\�L���܂߂�悤�ɂ��Ă��������B

	�EPortable Z80 emulation��� Yasuo Kuwahara��
	  http://www.geocities.jp/kwhr0/
	�Efmgen��� cisc��
	  http://www.retropc.net/cisc/
	�EMUCOM88��� �Ñ�S�O��
	  https://twitter.com/yuzokoshiro
	�EHSPMUCOM��� ���ɂ���(ONION software)
	  https://www.onionsoft.net/


�Ehspinet�v���O�C���̍X�V�ɂ���

	hspinet�v���O�C����http/https���N�G�X�g�ŁA
	PUT/DELETE���\�b�h�ɑΉ�����netrequest_put�Anetrequest_delete��
	���߂��ǉ�����Ă��܂��B
	����ɂ��A��葽����WebAPI�𗘗p���邱�Ƃ��\�ɂȂ�܂��B


�E64bit(x64)�Ń����^�C���ɂ���

	64bit(x64)�A�v���Ƃ��ē��삷��HSP3�W�������^�C��(hsp3_64.exe)�́A
	�W����unicode(UTF-8)�����x�[�X�œ��삷����̂ɕύX����܂����B
	�g�p����ꍇ�́A�X�N���v�g�̐擪�Ɉȉ��̍s���w�肵�Ă��������B

		#include "hsp3_64.as"

	����̎d�l�́AHSP3UTF(UTF-8)�Ń����^�C���Ɠ��l�ɂȂ��Ă��܂��B
	64bit(x64)�����^�C���́A64bit�ł�Windows��ł̂ݓ��삵�܂��B


�EHSP3Dish��iOS,android�ōX�V�ɂ���

	HSP3Dish��iOS,android�ł́A���ꂼ��̐V����SDK�ɑΉ����Ă��܂��B

	iOS��	  : XCode9�ȍ~�p iOS12,64bit�Ή�
	android�� : Android SDK 7.0 (API 24),64bit�Ή��A
	            SDKr25�ANDK r12�ȍ~�AAdMob(Google Firebase)�Ή�

	iOS�Aandroid�łƂ���64bit�o�C�i���̏o�͂ɑΉ����Ă��܂��B
	���ꂼ��Ή������o�[�W������SDK��J�������K�v�ƂȂ�܂��̂ŁA
	�ڂ����́A�}�j���A�����Q�Ƃ��Ă��������B

		hsp3dish.htm (HSP3Dish�}�j���A���C���f�b�N�X)

	�����̃v���W�F�N�g���������r���h�ł��Ȃ��Ȃ�\�������邽�߁A
	�����̃v���W�F�N�g�́A�ēx�쐬���������Ƃ𐄏����܂��B


�EHGIMG4�̍X�V�ɂ���

	HSP3.6��1�łł́A����܂ł�HGIMG4����傫���C�����s�Ȃ��Ă��܂��B
	��苭�͂Ŏg���₷���Ȃ�悤�A�e��@�\���������܂����B
	�ȑO�̃o�[�W��������̏�ʌ݊��œ��삷��悤�݌v����Ă��܂����A
	�ꕔ�̋@�\�œ��삪�قȂ�ꍇ������܂��̂ŁA�ߋ��ɍ쐬�����X�N���v�g��
	���삳����ۂɂ͂����ӂ��������B
	�ڂ����g�����́AHGIMG4�v���O���~���O�K�C�h���������������B

		HGIMG4�v���O���~���O�K�C�h
		docs/hgimg4.html

	HSP3.6���łŒǉ��ύX���ꂽ���ڂ̊T�v�͈ȉ��̒ʂ�ł��B

	�EFBX���f���ϊ��̍X�V

	���G��FBX���f����ϊ�����ۂɃG���[���o�邱�Ƃ�������������啝�ɏC�����܂����B
	�{�[�����܂ރ��f�����A�j���[�V�������܂߂Đ������ϊ����邱�Ƃ��ł��܂��B
	�V�����AHGIMG4 Unity�A�g�K�C�h�𓯍����܂����B
	3D�c�[���uUnity�v�ƘA�g���ă��f���f�[�^��A�j���[�V�����̕ϊ����s�����@��������Ă��܂��B

		HGIMG4 Unity�A�g�K�C�h
		docs/hgimg4_unity.html

	���̘A�g�𗘗p���č��ꂽ�A�u�v���������f���v(sample/pronama3d)��
	�T���v���Ƃ��ē�������Ă��܂��B

	�E�V�X�e���̈��艻�ƃG���[���O�擾

	�G���[�����������ۂ̌�����m�邽�߂̃��O�o�͂��������܂����B
	3D���f���̃��[�h����A�A�j���[�V�����K�p���A�V�F�[�_�[�R���p�C�����Ȃǂ�
	�ڍׂȃG���[�����O�Ƃ��ďo�͂���܂��B
	�܂��A���O�̏o�͂�On/Off���邽�߂̃X�C�b�`��sysreq(�V�X�e�����N�G�X�g)���ڂ�
	�ǉ�����Ă��܂��B

		setreq SYSREQ_LOGWRITE,0	; ���O�o�͂�}��

	�Egpscrmat���߂̒ǉ�

	gpscrmat���߂��ǉ�����Ă��܂��B����ɂ��A�I�t�X�N���[���e�N�X�`���o�b�t�@���Q�Ƃ���
	�}�e���A���𐶐����܂��B�}�e���A����Ǝ��ɐ������邱�Ƃɂ��A�I�t�X�N���[���Ƀ����_�����O���ꂽ
	�摜�C���[�W���e�N�X�`���Ƃ��ăV�F�[�_�[����ė��p���邱�Ƃ��\�ɂȂ�܂��B

	�I�t�X�N���[���ɕ`�悵�����e���e�N�X�`���Ƃ��čė��p���邱�ƂŁA�ڍׂȋ��ʔ���(�f�荞��)�A
	�e�̐����Ȃǂɉ��p���邱�Ƃ��ł��܂��B

	�Egpcamera���߂ɕ��s���e�J�����̃I�v�V������ǉ�

	�J�����𐶐�����gpcamera���߂ɃJ�����^�C�v�̃p�����[�^�[�I�v�V������ǉ����Ă��܂��B
	�J�����^�C�v�l��1���w�肷�邱�ƂŁA���s���e(Orthographic)���s���J������ݒ肷�邱�Ƃ��\�ł��B

	�E�L���[�u�}�b�v�e�N�X�`���̃T�|�[�g

	�}�e���A���̃I�v�V�����p�����[�^�[�ɁAGPOBJ_MATOPT_CUBEMAP���ǉ�����Ă��܂��B
	�L���[�u�}�b�v�́A6�ʕ����̉摜���܂Ƃ߂�����Ȍ`���Ŋ��}�b�v��X�J�C�{�b�N�X�Ȃǂ�
	���p���邱�Ƃ��ł��܂��B
	(�L���[�u�}�b�v�摜�́A+X,-X,+Y,-Y,+Z,-Z������6�摜���c�ɘA������1����.PNG�`�����g�p����
	�K�v������܂��B)

	�E�J�������Ƃ̃����_�����O�O���[�v�ݒ�

	�I�u�W�F�N�g�̃����_�����O�O���[�v��ݒ肷��Asetobjrender���߂��ǉ�����Ă��܂��B
	����ɂ��A�J�������Ƃɕ\������/���Ȃ��Ƃ����ݒ���I�u�W�F�N�g�ɗ^���邱�Ƃ��ł��܂��B
	�܂��A���C�e�B���O�̃O���[�v���ݒ肷�邱�Ƃ��ł��A�I�u�W�F�N�g���ƂɃ��C�g�̔��f��
	�R���g���[�����邱�Ƃ��ł��܂��B

		setobjrender id,rendergroup,lightgroup

			id(0) : �I�u�W�F�N�gID
			 rendergroup(1) : �����_�����O�O���[�v�l
			lightgroup(1) : ���C�e�B���O�O���[�v�l

	�����_�����O�O���[�v�l�́A�J�����⃉�C�g���������_�����O�O���[�v�l�Ɠ���ł���ꍇ�́A
	�L���ƂȂ�܂��B
	�ʏ�́A�I�u�W�F�N�g�A�J�����Ƃ��ɃO���[�v1���ݒ肳��Ă��܂��B����̃J��������̕\���̂�
	�\���𖳌��ɂ������ꍇ�Ȃǂɗ��p�ł��܂��B
	���C�e�B���O�O���[�v�l�́A����̃��C�g�ɑ΂��ėL��/������؂�ւ�����̂ł��B
	���C�g�������C�e�B���O�O���[�v�l�ƈقȂ�ꍇ�́A���C�g�������ƂȂ�܂��B
	���ꂼ��̃O���[�v�l�́A1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768�̒�����
	�C�ӂ̃r�b�g��g�ݍ��킹�Ďw��\�ł��B


�E�Â��v���O�C���E�����^�C���̓����I���ɂ���

	�ȉ��̃v���O�C���E�����^�C���́A�Â��o�[�W������HSP3�ŃT�|�[�g���Ă��܂�����
	HSP3.6�ɂ͕t�����Ă��܂���B

		�EHSPLet�����^�C��
		�EHGIMG/HGIMGX�v���O�C��
		�Ellmod3���W���[��

	�����͒������ԍX�V���Ȃ��A�Â��V�X�e���Ɉˑ����Ă��邽�ߐV�����g�p���邱�Ƃ͐����ł��܂���B
	�A�b�v�f�[�g���ꂽHSP����g�p�ł��Ȃ��Ȃ�킯�ł͂���܂��񂪁A�t���Z�b�g�łւ̓�����
	�I�������Ē����܂��̂ł��������������B


�E�X�V����

	�ڂ����X�V�����́Adocs/history.txt ���������������B


�E�ӎ�

	OpenHSP�ő����̂����͂𒸂����Azakki����Afujidig����Asharkpp����Ɋ��Ӓv���܂��B
	�����̏����𒸂���HSP-Dev ML�����o�[�̊F�l�A���肪�Ƃ��������܂����B


�E���쌠����јA����

	���ł��g�p�����X�N���v�g�E���s�t�@�C���̌��J�A���C�Z���X�ɂ��Ă�
	HSP3.5�Ɠ��l�̋K��Ŏ��R�ɍs�Ȃ��Ă��������č\���܂���B
	�������A�\���e�X�g���s�Ȃ��Ă��Ȃ��e�X�g�łł��邱�Ƃ𗯈ӂ��Ă����Ă��������B
	�����܂ŁA���Ȃ̐ӔC�͈̔͂ŉ^�p���Ă��������B
	�s��₨�C�Â��̓_������܂�����A���m�点������Ɗ������ł��B

	onion software�͖{�v���O�����ɂ���Đ������A�����Ȃ鑹�Q�ɂ��Ă�
	�ۏ؂������܂���B���Ȃ̐ӔC�͈̔͂Ŏg�p���Ă��������B
	HSP����ю��Ӄc�[���́AMicrosoft Visual Studio 2017�ɂ���ăR���p�C������Ă��܂��B

	���̃\�t�g�Ɋւ��邨�₢���킹�A���z�A���ӌ��Ȃǂ͈ȉ��̃��[���A�h���X�܂ŁB

	Homepage: http://www.onionsoft.net/
	          http://hsp.tv/
        e-mail  : hsp@onionsoft.net

------------------------------------------------------------------------------
                                                     README.TXT / end of file 
------------------------------------------------------------------------------
