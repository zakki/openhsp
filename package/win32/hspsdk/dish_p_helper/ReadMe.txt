+----------------------------------------------------------
|
| Dish P Helper
|
| Ver 2.3
|
+----------------------------------------------------------
|
| HSP3Dish Helper�p �v���W�F�N�g�⏕�A�v��
|
| By. ���܂���˂�
|
+----------------------------------------------------------

(0). �� ���� ��

    ������Ƀv���W�F�N�g�̏��ύX��Ƀr���h������ɂł��Ȃ��ꍇ�́A
    �V�K�Ńv���W�F�N�g��蒼���Ă��������B



(1). ���A�v���̊T�v

    HSP3Dish Helper��Android�̐V�K�v���W�F�N�g���쐬��A�쐬�����v���W�F�N�g�ɑ΂��ē��e���{��/�ύX�����邱�Ƃ��ł��܂��B
    ��̓I�ɂ́A�o�[�W�������A�p�b�P�[�W���A��ʂ̌����A��ʃT�C�Y�A�X�P�[�����O�A�A�v�����̉{��/�ύX���ł��܂��B
    �{���͊e�t�@�C���Ɋe��񂪂���̂ł��ꂼ��̃t�@�C�������ƂŒ����K�v������܂����A���̃A�v�����g���ƃ{�^���ꔭ�ŏ���ύX�ł��܂��B



(2). �{��/�ύX���o������ɂ���

    �E�o�[�W�����R�[�h(versionCode)

    �E�o�[�W�����l�[��(versionName)

    �E�ŏ��v��API(minSdk)

    �E�^�[�Q�b�gAPI(targetSdk)

    �E�p�b�P�[�W��(package/applicationId)

    �E��ʂ̌���(screenOrientation)

    �E��ʃT�C�Y(hgio_view)�@��/�c

    �E��ʕ\���{��(hgio_scale)�@��/�c

    �E�����g��k��(hgio_autoscale)

    �E�A�v����(�p��)

    �E�A�v����(���{��)




(3). ���A�v�����g������

    �EHSP3Dish Helper�ɂĐV�K�v���W�F�N�g�쐬
        ��
    �E���A�v���ɂď���ύX
        ��
    �EHSP3Dish helper�ɂăr���h



(4). ���A�v���N�����ɑI�������v���W�F�N�g���ɂ���

    HSP3Dish Helper�ɂčŌ�ɐV�K�v���W�F�N�g�쐬(�������̓r���h)���s��ꂽ�v���W�F�N�g�����I������܂��B



(5). �uhsp3dish.ini�o�́v�{�^���ɂ���

    [hsp3dish.ini]�t�@�C�����\�[�X�t�@�C���Ɠ����t�H���_�ɒu���Ă������ƂŁAHSP3Dish�𗘗p����Windows��ŋN�����̉�ʃT�C�Y���w�肷�邱�Ƃ��ł��܂��B
    ��{�I�ɂ���[hsp3dish.ini]�͎���͂ɂ��蓮�ō쐬������̂ł����A�uhsp3dish.ini�o�́v�{�^������w��̏ꏊ��[hsp3dish.ini]���쐬���邱�Ƃ��ł��܂��B
    �o�͂�����ʃT�C�Y�́A�u��ʃT�C�Y(hgio_view)�v�́u���v�A�u�c�v�̓��̓{�b�N�X�̒l���o�͂���܂��B



(6). ���A�v�����R�}���h���C������N������ꍇ

    ���A�v�����O���A�v������R�}���h���C���ŋN������ꍇ�ɁA�p�����[�^��t���邱�ƂŊO���A�v��������̕ύX�������s�����Ƃ��o���܂��B
    �܂����̏ꍇ�A���A�v���̃E�B���h�E�͔�\���ŏ������s���܂��B
    �R�}���h���C������N�������ꍇ�͖����͂̃`�F�b�N�͍s���܂���B

    �E�p�����[�^�ꗗ

        -prj=      ��� ��������Ώۂ̃v���W�F�N�g��
                           = �L�q�� : -prj=test_project;

        -vc=       ��� �o�[�W�����R�[�h(versionCode)
                           = �L�q�� : -vc=1;

        -vn=       ��� �o�[�W�����l�[��(versionName)
                           = �L�q�� : -vn=1.0;

        -msdk=     ��� �ŏ��v��API(minSdk)
                           = �L�q�� : -msdk=21;

        -tsdk=     ��� �^�[�Q�b�gAPI(targetSdk)
                           = �L�q�� : -tsdk=31;

        -pak=      ��� �p�b�P�[�W��(package/applicationId)
                           = �L�q�� : -pak=com.simakuroneko.test;

        -scr=      ��� ��ʂ̌���(screenOrientation)
                           = 0 : portrait(�c)
                             1 : landscape(��)
                           = �L�q�� : -scr=0;

        -hgv=      ��� ��ʃT�C�Y(hgio_view)
                           = �ڍ� : x���T�C�Y, y�c�T�C�Y
                           = �L�q�� : -hgv=320,480;

        -hgs=      ��� ��ʕ\���{��(hgio_scale)
                           = �ڍ� : x���{��, y�c�{��
                           = �L�q�� : -hgs=1.0f,1.0f;

        -hga=      ��� �����g��k��(hgio_autoscale)
                           = 0 : ��ʑS�̂Ɏ��܂�œK�ȑ傫��(�c����͈ێ�)
                             1 : X�����̃T�C�Y����Ɋg��k��(�c����͈ێ�)
                             2 : Y�����̃T�C�Y����Ɋg��k��(�c����͈ێ�)
                             3 : �c����͖������ĉ�ʑS�̂ɕ\��
                           = �L�q�� : -hga=0;

        -ape=      ��� �A�v����(�p��)
                           = �L�q�� : -ape=TEST APP;

        -apj=      ��� �A�v����(���{��)
                           = �L�q�� : -apj=�e�X�g�A�v��;


    �E�p�����[�^��؂蕶��
        �p�����[�^�𕡐��w�肷��ꍇ�A";" �ŋ�؂��Ă��������B

    �E�g�p��
        dish_p_helper.exe -prj=test; -vc=2; -vn=3.4; -msdk=21; -tsdk=31; -pack=com.simakuroneko.test; -scr=0; -hgv=320,480; -hga=0; -ape=testapp; -apj=�e�X�g�A�v��;



(7). ���A�v�����R�}���h���C������N������ꍇ(�����I���̍��})

    �O���A�v�����瓖�A�v�����p�����[�^�t���ŋN�����A���A�v���ɂ����ύX�������I������ƁA�����I���̍��}�Ƃ��ďI���p�t�@�C�����쐬����܂��B
    �I���t�@�C���̏ڍׂ͈ȉ��̒ʂ�ł��B

        �E�쐬�����t�H���_ : ���A�v��(dish_p_helper.exe)�����݂���t�H���_�B
        �E�쐬�����t�@�C�� : "�v���W�F�N�g��"_end.txt  ��"�v���W�F�N�g��"�̓p�����[�^�Ŏw�肵���v���W�F�N�g���ɂȂ�܂��B
        �E�t�@�C���̓��e     : ���������Ă��Ȃ���̃t�@�C���ƂȂ�܂��B
        �E�쐬��             : test_end.txt

    �I���t�@�C���͓��A�v������͍폜����Ȃ��̂ŁA���p����O���A�v������I�����Ă��������B



(8). ����

   2022/04/06 (Ver2.3) : �R���t�B�O�t�@�C���udish_p_helper_dat.ini�v�̒��̃f�[�^�̋�؂蕶����"="����TAB�ɕύX�B�i���̃A�v���ɍ��킹�邽�߁j

   2022/04/01 (Ver2.2) : �v���W�F�N�g��HSP3Dish�̏ꍇ�uHSP3Dish�v��F�ŕ\�����AHGIMG4�̏ꍇ�uHGIMG4�v��ԐF�ŕ\������悤�ɏC���B

   2022/03/28 (Ver2.1) : �v���W�F�N�g��HGIMG4���g�p���Ă���ꍇ�́A��ʃT�C�Y�A��ʕ\���{���A�����g��k�����g�p�s�ɂ����B

   2022/03/26 (Ver2.0) : �uhsp3dish.ini�o�́v�{�^���ŏo�͂���_�C�A���O���t�H���_�I���^�C�v�ɕύX�B

   2022/03/22 (Ver1.9) : �R���t�B�O�t�@�C���udish_p_helper_dat.ini�v���uC:\Users\���[�U��\AppData\Roaming\Hot Soup Processor�v�ɕۑ�����悤�ɕύX�B

   2022/03/15 (Ver1.8) : �R���t�B�O�t�@�C�������uconfig.ini�v����udish_p_helper_dat.ini�v�ɕύX�����B
                         �v���W�F�N�g�t�H���_�́uMainActivity.java�v�ɃS�~�������Ă��܂����ۂ��C���B

   2022/03/13 (Ver1.6) : �p�b�P�[�W���̕ύX���ł���悤�ɂ����B

   2022/01/06 (Ver1.5) : Gradle�łɑΉ��B

   2020/06/04 (Ver1.4) : ����̃R���{�{�b�N�X�Łu�g�p����/�g�p���Ȃ��v��I������ƁA���̂��Ƃ̃R���g���[���̎g�p����/�s�ɂ���悤�ɕύX�B

   2020/05/25 (Ver1.3) : jni/main.cpp�ɂ��Ή��B

   2019/09/02 (Ver1.2) : �Ώ�API(ID)(Project target) �̕\�L�� SDKVersion(ID)(Project target) �ɕύX�B

   2019/08/25 (Ver1.1) : targetSdkVersion�������͂̏ꍇ�AAndroidManifest.xml������"android:targetSdkVersion="���L�q���Ȃ��悤�ɏC���B

   2019/07/25 (Ver1.0) : armeabi-v7a(armv7)���폜�����B

   2018/12/04 (Ver0.9) : �v���W�F�N�g�t�H���_����̏ꍇ�ɓK�p�{�^���������Ă��G���[���o���Ȃ��悤�ɏC���B

   2018/11/18 (Ver0.8) : HSP3Dish helper���ɂăv���W�F�N�g�t�H���_�����ݒ�̏ꍇ�A�x���_�C�A���O��\������悤�ɏC���B

   2018/09/10 (Ver0.7) : �u�����͂̃`�F�b�N�v��݂����B�`�F�b�NOFF�̏�Ԃł���Ζ����͍��ڂ������Ă��K�p�\�ɂ����B
                         �R�}���h���C������N�����ꂽ�ꍇ�́u�����͂̃`�F�b�N�v�͖����Ƃ���悤�ɂ���B

   2018/09/06 (Ver0.6) : �v���W�F�N�g�t�H���_����AndroidManifest.xml�����݂���t�H���_�������R���{�{�b�N�X���̑ΏۂƂ���悤�ɏC���B

   2018/09/02 (Ver0.5) : AndroidManifest.xml���Ƀ^�[�Q�b�gAPI(targetSdkVersion)��ǉ�����悤�ɏC���B

   2016/06/19 (Ver0.4) : XML�t�@�C����ۑ����Ƀt�@�C���̐擪�ɈӐ}�I�ɁuBOM�v�������������Ă����̂����������Ȃ��悤�ɏC���B

   2016/01/10 (Ver0.3) : �u��ʕ\���{��(hgio_scale)�v�̏����擾�������Ɂu�c�v���̏�񂪂��������Ȃ��Ă����̂��C���B
                         �u�A�v����(���{��)�v���g�p���Ȃ��ꍇ�́A[values-ja]�t�H���_���ƍ폜����悤�ɏC���B

   2014/11/20 (Ver0.2) : �uhsp3dish.ini�o�́v�{�^����ǉ��B
                         �u��ʃT�C�Y(hgio_view)�v�̕\�����u��ʉ��T�C�Y(hgio_view)�v�ƌ�\������Ă����̂��C���B

   2014/11/14 (Ver0.1) : ���ŁB



(9). �z�z���ɂ���

    ���A�v���̓t���[�ł��B
    �Ĕz�z��OK�ł����A���̏ꍇ����Ō��\�ł��̂�E-Mail( simakuroneko@gmail.com )�܂ł��A�����������B

    �܂��A���Г��Ɍf�ڂ���ꍇ�����R�Ɍf�ڂ��Ă���������OK�ł��B
    ���̏ꍇ������Ō��\�ł��̂�E-Mail( simakuroneko@gmail.com )�܂ł��A��������Ɗ������ł��B



(10). ����m�FOS

    �EWindows 8.1
    �EWindows 10
    �EWindows 11



(11). ��ҏ��

    �n���h���l�[�� : ���܂���˂�
    Web�y�[�W      : https://sites.google.com/site/simakuroneko/
    Twitter        : https://twitter.com/simakuroneko_tw
    E-Mail         : simakuroneko@gmail.com
    �f����(BBS)    : http://simakuroneko.bbs.fc2.com/
