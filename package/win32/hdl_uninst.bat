@echo off
echo HSP Document Library �ɂ���č쐬���ꂽ�ݒ�t�@�C���A�f�[�^�t�@�C�����������܂��B
echo (�v���O�����{�� ����уh�L�������g�t�@�C���͍폜����܂���B)
pause
:// temp
del "%TMP%\HDL\HDLCACHE*.HTM"
rmdir "%TMP%\HDL"
:// for w2k
del "%APPDATA%\Hot Soup Processor\hdl_config*.dat"
del "%APPDATA%\Hot Soup Processor\hhw_config*.dat"
del "%APPDATA%\Hot Soup Processor\hdl_data*.db"
rmdir "%APPDATA%\Hot Soup Processor"
:// for w9x
del hdl_config*.dat
del hhw_config*.dat
del hdl_data*.db
:// Old version
del "%TMP%\HDLCACHE*.HTM"
del hdlbase.xdb
