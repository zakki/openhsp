@echo off
echo HSP Docs Library によって作成された設定ファイル、データファイルを消去します。
echo (プログラム本体 およびドキュメントファイルは削除されません。)
pause

del "%TMP%\HDL\*.HTM"
rmdir "%TMP%\HDL"

del "%APPDATA%\Hot Soup Processor\hdl*.*"
del "%APPDATA%\Hot Soup Processor\hhw*.*"
rmdir "%APPDATA%\Hot Soup Processor"

reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION" /v hdl.exe /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_GPU_RENDERING" /v hdl.exe /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_USE_LEGACY_JSCRIPT" /v hdl.exe /f
