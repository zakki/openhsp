@echo off
echo HSP Document Library によって作成された設定ファイル、データファイルを消去します。
echo (プログラム本体 およびドキュメントファイルは削除されません。)
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
