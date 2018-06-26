;--------------------------------------------------
; HSP ヘルプ ソースファイル (hs 形式)
; hs ファイルの書式については、HS_BIBLE.txt を参照してください。

;--------------------------------------------------
; この hs ファイルのデフォルトのフィールド値を設定

%dll
; プラグイン/モジュール名 を記入
encode.as

%ver
; バージョン を記入

%date
2008/06/05

%author
sharkpp

%url
https://wiki.hsp.moe/Module%EF%BC%8F%E6%96%87%E5%AD%97%E3%82%B3%E3%83%BC%E3%83%89%E5%A4%89%E6%8F%9B%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB.html

%note
encode.as をインクルードしてください。

%type
ユーザー拡張命令

%port
; 対応環境 を記入
Windows 版 HSP

%portinfo
; 移植のヒント を記入

%index
sjis2eucjp
SJIS を EUC-JP に変換

%prm
euc_jp, sjis
euc_jp : [変数] 変換する文字列
sjis   : [変数] 変換された文字列

%inst
sjisに指定した文字コード Shift_JIS の文字列を EUC-JP に変換し、結果を euc_jp に返します。

%sample
#include "encode.as"
src = "HSPでWindowsの世界が広がります。"
dest = ""

mes src
mes ""

sjis2eucjp dest, src
mes "SJIS -> EUC-JP"
mes dest
mes ""

mes "EUC-JP -> SJIS"
mes eucjp2sjis(dest)


%href
sjis2jis
sjis2utf7n
sjis2utf8n
eucjp2sjis

%group
; グループ を記入
Shift_JIS から変換

%index
sjis2jis
SJIS を JIS に変換

%prm
jis, sjis
jis  : [変数] 変換する文字列
sjis : [変数] 変換された文字列

%inst
sjisに指定した文字コード Shift_JIS の文字列を JIS に変換し、結果を jis に返します。

%sample
#include "encode.as"
src = "HSPでWindowsの世界が広がります。"
dest = ""

mes src
mes ""

sjis2jis dest, src
mes "SJIS -> JIS"
mes dest
mes ""

mes "JIS -> SJIS"
mes jis2sjis(dest)


%href
sjis2eucjp
sjis2utf7n
sjis2utf8n
jis2sjis

%group
; グループ を記入
Shift_JIS から変換
%index
sjis2utf7n
SJIS を UTF-7 に変換

%prm
utf7n, sjis
utf7n : [変数] 変換する文字列
sjis  : [変数] 変換された文字列

%inst
sjisに指定した文字コード Shift_JIS の文字列を UTF-7 に変換し、結果を utf7n に返します。

%sample
#include "encode.as"
src = "HSPでWindowsの世界が広がります。"
dest = ""

mes src
mes ""

sjis2utf7n dest, src
mes "SJIS -> UTF-7"
mes dest
mes ""

mes "UTF-7 -> SJIS"
mes utf7n2sjis(dest)


%href
sjis2eucjp
sjis2jis
sjis2utf8n
utf7n2sjis

%group
; グループ を記入
Shift_JIS から変換
%index
sjis2utf8n
SJIS を UTF-8 に変換

%prm
utf8n, sjis
utf8n : [変数] 変換する文字列
sjis  : [変数] 変換された文字列

%inst
sjisに指定した文字コード Shift_JIS の文字列を UTF-8 に変換し、結果を utf8n に返します。

%sample
#include "encode.as"
src = "HSPでWindowsの世界が広がります。"
dest = ""

mes src
mes ""

sjis2utf8n dest, src
mes "SJIS -> UTF-8"
mes dest
mes ""

mes "UTF-8 -> SJIS"
mes utf8n2sjis(dest)

%href
sjis2eucjp
sjis2jis
sjis2utf7n
utf8n2sjis

%group
; グループ を記入
Shift_JIS から変換


%index
eucjp2sjis
EUC-JP を SJIS に変換

%prm
(euc_jp)
euc_jp : [変数] 変換する文字列
val    : [変数] 変換された文字列

%inst
euc_jp に指定した文字コード EUC-JP の文字列を Shift_JIS に変換して結果を val に返します。

%sample
#include "encode.as"
src = "HSPでWindowsの世界が広がります。"
dest = ""

mes src
mes ""

sjis2eucjp dest, src
mes "SJIS -> EUC-JP"
mes dest
mes ""

mes "EUC-JP -> SJIS"
mes eucjp2sjis(dest)


%href
jis2sjis
utf7n2sjis
utf8n2sjis
sjis2eucjp

%group
; グループ を記入
Shift_JIS に変換

%index
jis2sjis
JIS を SJIS に変換

%prm
(jis)
jis : [変数] 変換する文字列
val : [変数] 変換された文字列

%inst
jis に指定した文字コード JIS の文字列を Shift_JIS に変換して結果を val に返します。

%sample
#include "encode.as"
src = "HSPでWindowsの世界が広がります。"
dest = ""

mes src
mes ""

sjis2jis dest, src
mes "SJIS -> JIS"
mes dest
mes ""

mes "JIS -> SJIS"
mes jis2sjis(dest)


%href
eucjp2sjis
utf7n2sjis
utf8n2sjis
sjis2jis

%group
; グループ を記入
Shift_JIS に変換

%index
utf7n2sjis
UTF-7 を SJIS に変換

%prm
(utf7n)
utf7n : [変数] 変換する文字列
val   : [変数] 変換された文字列

%inst
utf7n に指定した文字コード UTF-7 の文字列を Shift_JIS に変換して結果を val に返します。

%sample
#include "encode.as"
src = "HSPでWindowsの世界が広がります。"
dest = ""

mes src
mes ""

sjis2utf7n dest, src
mes "SJIS -> UTF-7"
mes dest
mes ""

mes "UTF-7 -> SJIS"
mes utf7n2sjis(dest)


%href
eucjp2sjis
jis2sjis
utf8n2sjis
sjis2utf7n

%group
; グループ を記入
Shift_JIS に変換

%index
utf8n2sjis
UTF-7 を SJIS に変換

%prm
(utf8n)
utf8n : [変数] 変換する文字列
val   : [変数] 変換された文字列

%inst
utf8n に指定した文字コード UTF-8 の文字列を Shift_JIS に変換して結果を val に返します。

%sample
#include "encode.as"
src = "HSPでWindowsの世界が広がります。"
dest = ""

mes src
mes ""

mes "UTF-8 -> SJIS"
mes utf8n2sjis(dest)

%href
eucjp2sjis
jis2sjis
utf7n2sjis
sjis2utf8n

%group
; グループ を記入
Shift_JIS に変換

