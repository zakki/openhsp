%dll
encode

%author
onitama

%note
encode.asをインクルードすること。
InternetExplorer 4.0以降がインストールされている必要があります。

%port
Win
Cli

%group
文字列操作命令

%type
ユーザー拡張命令

%date
2007/12/03
%index
sjis2eucjp
シフトJISをEUC-JPへ変換

%prm
p1, p2
p1 : 変換した文字列を代入する変数
p2 : 変換する文字列

%sample
#include "encode.as"
	before = "変換対象文字列"
	sjis2eucjp after, before
	mes after // 変換されているため文字化けする
	stop

%url
http://ja.wikipedia.org/wiki/EUC-JP

%href
sjis2jis
sjis2utf7n
sjis2utf8n
eucjp2sjis
%index
sjis2jis
シフトJISをJISへ変換

%prm
p1, p2
p1 : 変換した文字列を代入する変数
p2 : 変換する文字列

%sample
#include "encode.as"
	before = "変換対象文字列"
	sjis2jis after, before
	mes after // 変換されているため文字化けする
	stop

%href
sjis2eucjp
sjis2utf7n
sjis2utf8n
jis2sjis

%index
sjis2utf7n
シフトJISをUTF-7へ変換

%prm
p1, p2
p1 : 変換した文字列を代入する変数
p2 : 変換する文字列

%sample
#include "encode.as"
	before = "変換対象文字列"
	sjis2utf7n after, before
	mes after // 変換されているため文字化けする
	stop

%href
sjis2eucjp
sjis2jis
sjis2utf8n
utf7n2sjis
%index
sjis2utf8n
シフトJISをUTF-8へ変換

%prm
p1, p2
p1 : 変換した文字列を代入する変数
p2 : 変換する文字列

%sample
#include "encode.as"
	before = "変換対象文字列"
	sjis2utf8n after, before
	mes after // 変換されているため文字化けする
	stop

%url
http://ja.wikipedia.org/wiki/UTF-8

%href
utf8n2sjis
sjis2eucjp
sjis2jis
sjis2utf7n
%index
eucjp2sjis
EUC-JPをシフトJISへ変換

%prm
(p1)
p1 : 変換するEUC-JPの文字列

%sample
#include "encode.as"
	before = "変換対象文字列"
	sjis2eucjp after, before
	mes after             // 変換されているため文字化けする
	mes eucjp2sjis(after) // 文字化けしない
	stop

%url
http://ja.wikipedia.org/wiki/EUC-JP

%href
sjis2eucjp
jis2sjis
utf7n2sjis
utf8n2sjis
%index
jis2sjis
JISをシフトJISへ変換

%prm
(p1)
p1 : 変換するJISの文字列

%sample
#include "encode.as"
	before = "変換対象文字列"
	sjis2jis after, before
	mes after             // 変換されているため文字化けする
	mes jis2sjis(after) // 文字化けしない
	stop

%href
sjis2jis
eucjp2sjis
utf7n2sjis
utf8n2sjis
%index
utf7n2sjis
UTF-7をシフトJISへ変換

%prm
(p1)
p1 : 変換するUTF-7の文字列

%sample
#include "encode.as"
	before = "変換対象文字列"
	sjis2utf7n after, before
	mes after             // 変換されているため文字化けする
	mes utf7n2sjis(after) // 文字化けしない
	stop

%href
sjis2utf7n
eucjp2sjis
jis2sjis
utf8n2sjis
%index
utf8n2sjis
UTF-8の文字列をシフトJISへ変換

%prm
(p1)
p1 : 変換するUTF-8の文字列

%sample
#include "encode.as"
	before = "変換対象文字列"
	sjis2utf8n after, before
	mes after             // 変換されているため文字化けする
	mes utf8n2sjis(after) // 文字化けしない
	stop

%url
http://ja.wikipedia.org/wiki/UTF-8

%href
sjis2utf8n
eucjp2sjis
jis2sjis
utf7n2sjis
