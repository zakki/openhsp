%type
拡張命令
%ver
3.6

%dll
ZLibWrap
%url
http://hsp.tv/
%port
Win

%date
2019/07/16
%author
onitama

%url
http://hsp.tv/

%note
zipfile.asをインクルードすること。

%type
ユーザー定義命令

%group
ファイル入出力制御命令

%port
Win
Cli

%index
zipcompress
zipファイルに圧縮

%prm
"srcfile","zipfile"
srcfile : 圧縮ファイル名の指定(ワイルドカード可)
zipfile : 保存先のzipファイル名

%inst
指定されたファイルをzip形式で圧縮して保存します。
srcfileで、圧縮されるファイル名を指定します。この指定には、ワイルドカードを使用することができます。
「*.jpg」を指定した場合は、拡張子.jpgを持つすべてのファイル、「*.*」を指定した場合はすべてのファイルが対象となります。
フォルダが含まれている場合は、フォルダ以下もすべて圧縮対象となります。
zipfileで保存先のzipファイル名を指定します。
処理が成功した場合は、システム変数statに0が代入されます。エラーが発生した場合は、0以外が代入されます。

%sample
#include "zipfile.as"
	;	(hspインストールフォルダ内のcommonフォルダ以下を圧縮してcommon.zipとして保存します)
	fname = "common.zip"
	s1=dir_exe+"\\common\\*.*"
	ZipCompress s1, fname
	if stat : dialog "zip圧縮に失敗しました"

	mes "圧縮元パス:"+s1
	mes fname+"を保存しました。"
	stop


%index
zipextract
zipファイルを解凍

%prm
"zipfile","path"
zipfile  : 解凍するzipファイル名
path("") : 解凍先のフォルダパス(""の場合はカレント)

%inst
指定されたzip形式のファイルを解凍します。圧縮ファイルに含まれているファイルすべてが解凍対象となります。
zipfileで、圧縮されたzipファイル名を指定します。
pathに、解凍先のパスを指定します。「""」が指定された場合は、カレントフォルダが対象となります。
パスワード付きのzipファイルはサポートされていません。
処理が成功した場合は、システム変数statに0が代入されます。エラーが発生した場合は、0以外が代入されます。

%sample
#include "zipfile.as"
	;	onibtn.zipを解凍します(onibtn.gifが取り出されます)
	fname = "onibtn.zip"
	s1 = dir_cur
	mes "解凍元ファイル:"+fname
	mes "解凍先フォルダ:"+s1
	;
	ZipExtract fname, s1
	if stat : dialog "zip解凍に失敗しました"
	mes "解凍しました。"
	stop


