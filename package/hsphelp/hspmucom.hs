%dll
hspmucom

%ver
3.6

%date
2019/07/10

%author
onitama

%url
http://hsp.tv/

%note
hspmucom.asをインクルードすること。

%type
拡張命令

%group
拡張サウンド出力制御命令

%port
Win


%index
mucominit
MUCOM88初期化

%prm
p1, option
p1(0) : ウインドウハンドル
option(0) : 初期化オプション

%inst
MUCOM88の初期化を行います。
MUCOM88の各種機能を使用するためには、最初に初期化を行っておく必要があります。
p1パラメーターは、サウンドドライバーが使用するウインドウのハンドルを指定します。
p1を省略または0を指定した場合は、現在アクティブなウインドウが対象となります。
通常は、hwnd(HSPのウインドウハンドル)を指定してください。
optionパラメーターは、以下の値を指定することができます。
^p
   値   : 内容
 ---------------------------------------------------------------
    +1  : FM音源のシミュレート(fmgen)を無効にする
    +2  : SCCIを有効にする(scci.dllが必要です)
^p
SCCIを有効にした場合は、scci.dllを経由した外部機器上でのFM音源コントロールが可能です。
詳しくは、MUCOM88のマニュアルを参照してください。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucombye


%index
mucombye
MUCOM88を解放

%prm

%inst
MUCOM88の解放処理を行います。
MUCOM88の各種機能を使用しない時に呼び出してください。
MUCOM88が持つすべてのリソースや割り込みを終了します。
通常はHSPの終了時に自動的に呼び出されるため、記述する必要はありません。

%href
mucombye


%index
mucomreset
MUCOM88をリセット

%prm
option
option(0) : リセットオプション

%inst
MUCOM88をリセットします。
演奏中の音楽や音色のデータも含めてすべてリセットされます。
音楽の再生やMMLのコンパイル時には、最初にリセットを行う必要があります。
optionパラメーターは、以下の値を指定することができます。
^p
   ラベル                 : 内容
 ---------------------------------------------------------------
   MUCOM_RESET_PLAYER       音楽プレイヤーとしてMUCOM88をリセット
   MUCOM_RESET_COMPILE      MMLコンパイラとしてMUCOM88をリセット
   MUCOM_RESET_EXTFILE      MMLコンパイラ初期化時に内部ファイルを参照しない
^p
リセット時には、必ず音楽プレイヤー(MUCOM_RESET_PLAYER)か、MMLコンパイラ(MUCOM_RESET_COMPILE)のどちらかを選択する必要があります。(MMLコンパイル後に音楽を再生する場合は、MMLコンパイラとしてリセットした後、音楽プレイヤーとして再度リセットする必要があります。)
MUCOM_RESET_EXTFILEは、MUCOM88が使用するPC-8801用ドライバファイル(muc88,msub等)を外部ファイルとして読み込むためのオプションです。通常は、指定する必要はありません。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomload
mucomcomp


%index
mucomplay
音楽の再生

%prm
p1
p1(0) : バンクNo.

%inst
指定されたバンクNo.の音楽を再生します。
最初に、mucomload命令によりMUCOM88音楽データ(.mub)を読み込んでおく必要があります。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomload
mucomstop


%index
mucomstop
再生の停止

%prm
p1
p1(0) : 停止オプション

%inst
mucomplay命令により再生された音楽を停止します。
通常は、p1の停止オプションは0か省略して構いません。
p1に$1000を指定した場合は、ドライバを含めた強制的な停止処理を行います。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomplay
mucomfade


%index
mucomfade
フェードアウト再生

%prm
p1
p1(0) : フェード速度

%inst
mucomplay命令により再生された音楽をフェードアウトします。
※この命令は現在正しく使用できないためサポート外となります
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomplay


%index
mucomload
音楽データ読み込み

%prm
"filename",p1
"filename" : MUCOM88音楽データファイル(.mub)
p1(0) : バンクNo.

%inst
MUCOM88音楽データ(.mub)を読み込みます。
p1で読み込む先のバンクNo.(0～15)を指定することで、"filename"のファイルを読み込み再生の準備を行います。
MUCOM88音楽データ(.mub)は、あらかじめ音楽ツール(MUCOM88Win)で作成するか、MMLファイル(.muc)をコンパイルして生成する必要があります。
mucomload命令を使用する際には、最初に、mucomreset命令により音楽プレイヤーとしてMUCOM88をリセットしておく必要があります。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomreset
mucomplay


%index
mucomloadpcm
PCMデータ読み込み

%prm
"filename"
"filename" : MUCOM88PCMデータファイル(.bin)

%inst
デフォルトで使用されるMUCOM88PCMデータファイル(.bin)を読み込みます。
PCMデータファイルは、MMLコンパイル時にPCMを無指定だった際に参照されます。
特に指定する必要のない場合は、「mucomloadpcm ""」(無指定)を記述しておいてください。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomcomp


%index
mucomloadvoice
FM音色データ読み込み

%prm
"filename"
"filename" : MUCOM88FM音色データファイル(.dat)

%inst
デフォルトで使用されるMUCOM88FM音色データファイル(.dat)を読み込みます。
FM音色データファイルは、MMLコンパイル時に音色ファイルが無指定だった際に参照されます。
通常はMMLから自動的に参照されるため、記述する必要はありません。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomcomp


%index
mucomtag
タグデータの取得

%prm
var,"tagname"
var : 取得されたデータが代入される変数
"tagname" : タグ文字列

%inst
mucomload命令により読み込まれたMUCOM88音楽データの中で定義されているタグを取得します。
"tagname"によりタグ文字列を指定することで、そのタグ文字列に対応した定義内容が変数に代入されます。
「mucomtag a,"title"」と記述した場合は、変数aに"title"タグの内容が代入されます。
タグ文字列を空文字("")に指定した場合は、すべての定義テーブルを変数に代入します。
エラーが発生した場合は、変数には空文字("")が代入され、システム変数statに0以外が代入されます。

%href
mucomload


%index
mucomcomp
MMLのコンパイル

%prm
"mmlfile","outfile",option
"mmlfile" : 読み込まれるMUCOM88 MMLファイル(.muc)
"outfile" : 出力されるMUCOM88音楽データファイル(.mub)
option(0) : コンパイルオプション

%inst
MUCOM88の形式で記述されたMMLファイル(.muc)をコンパイルして、MUCOM88音楽データファイル(.mub)を出力します。
optionパラメーターは、以下の値を指定することができます。
^p
   値   : 内容
 ---------------------------------------------------------------
    0   : 通常のMUCOM88コンパイルを行う
    +1  : #voiceタグを無視する
^p
コンパイル結果のメッセージをmucomres命令により取得することができます。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomres


%index
mucomloadtag
タグデータの読み込み

%prm
var,"mmlfile"
var : 取得されたデータが代入される変数
"mmlfile" : 読み込まれるMUCOM88 MMLファイル(.muc)

%inst
MUCOM88の形式で記述されたMMLファイル(.muc)から、定義されたタグ情報のみを取り出して変数に代入します。
コンパイルすることなく、タグ情報だけを取り出したい時に使用することができます。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomload


%index
mucomres
MUCOM88実行結果を取得

%prm
var
var : 取得されたデータが代入される変数

%inst
mucomcomp命令によるコンパイル結果のメッセージを取得します。
MUCOM88が出力したメッセージバッファの内容をすべて文字列として変数に代入します。
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomcomp


%index
mucomstat
MUCOM88のステータス取得

%prm
var,option
var : 取得されたデータが代入される変数
option(0) : 取得オプション

%inst
MUCOM88再生時の内部ステータスを取得して変数に代入します。
最初に、mucomreset命令により音楽プレイヤーとしてMUCOM88をリセットしておく必要があります。
取得される内容は、optionパラメーターにより指定されます。
optionパラメーターは、以下の値を指定することができます。取得される数値はすべて整数型となります。
^p
   ラベル                 : 内容
 ---------------------------------------------------------------
   MUCOM_STATUS_PLAYING     演奏中フラグ (停止=0/演奏中=1)
   MUCOM_STATUS_INTCOUNT    割り込みカウント(トータル)
   MUCOM_STATUS_PASSTICK    ストリーム再生にかかった負荷(ms)
   MUCOM_STATUS_MAJORVER    メジャーバージョンコード
   MUCOM_STATUS_MINORVER    マイナーバージョンコード
   MUCOM_STATUS_COUNT       割り込みカウント
   MUCOM_STATUS_MAXCOUNT    カウントの最大数
   MUCOM_STATUS_MUBSIZE     音楽データのサイズ
   MUCOM_STATUS_MUBRATE     音楽データのメモリ使用率(%)
   MUCOM_STATUS_BASICSIZE   MMLデータのサイズ
   MUCOM_STATUS_BASICRATE   MMLデータのメモリ使用率(%)
^p
エラーが発生した場合は、システム変数statに0以外が代入されます。

%href
mucomplay
mucomcomp




