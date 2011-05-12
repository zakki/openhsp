%type
ユーザー拡張命令

%group
環境変数制御命令

%port
Win
Cli

%dll
getenv

%note
mod_getenv.asをインクルードすること。

%author
onitama
%ver
3.3
%date
2009/08/01
%index
getenv
環境変数の値を取得

%prm
p1, "環境変数名"
p1 : 環境変数の値を代入する文字列型変数
"環境変数名" : 取得する環境変数の名前

%inst
環境変数の値を取得し、変数に代入します。
変数は文字列型でなければなりません。

%sample
#include "mod_getenv.as"
	sdim path, 255
	getenv path, "PATH"
	mesbox path, ginfo_winx, ginfo_winy
	stop
