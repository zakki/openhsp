@echo off
echo HSP Docs Library によって作成された設定ファイル、データファイルを消去します。
echo (プログラム本体 およびドキュメントファイルは削除されません。)
pause

del "%TMP%\HDL\*.HTM"
rmdir "%TMP%\HDL"

del "%APPDATA%\Hot Soup Processor\hdl*.*"
del "%APPDATA%\Hot Soup Processor\hhw*.*"
rmdir "%APPDATA%\Hot Soup Processor"
