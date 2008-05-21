;
;	HSP help manager用 HELPソースファイル
;	(先頭が「;」の行はコメントとして処理されます)
;

%type
拡張命令
%ver
3.1
%note
hspcmp.asをインクルードすること。

%date
2005/07/01
%author
onitama
%dll
hspcmp
%url
http://www.onionsoft.net/
%port
Win


%index
hsc_ini
HSPCMP.DLLの初期化
%group
拡張入出力制御命令
%prm
"filename"
"filename" : コンパイルの対象となるファイル名


%inst
HSPCMP.DLLの初期化を行ないます。
HSPCMP.DLLの機能を使用する場合は、最初に初期化をする必要があります。
"filename"で指定したファイルをコンパイルの対象とします。
ファイル名は、拡張子(asでなくても構いません)も含めて指定して下さい。




%index
hsc_refname
エラー表示ファイル名の指定
%group
拡張入出力制御命令
%prm
"filename"
"filename" : エラーメッセージで表示されるファイル名


%inst
エラーメッセージで表示されるソーススクリプトファイル名を指定します。
これは、たとえば「test.as」という名前を一時的に「hsptmp」などの別名で保存してコンパイルする時にも、エラーメッセージには「test.as」ファイル内でエラーが起こっているということを表示させるためのものです。
ソーススクリプトファイル名が、hsc_iniで指定したファイルから変更する必要がない場合は、指定しなくても構いません。




%index
hsc_objname
出力オブジェクトファイル名の指定
%group
拡張入出力制御命令
%prm
"filename"
"filename" : 出力オブジェクトファイル名


%inst
出力されるオブジェクトファイル名を指定します。




%index
hsc_compath
共通ディレクトリの指定
%group
拡張入出力制御命令
%prm
"pathname"
"pathname" : 共通ディレクトリパス

%inst
#includeでサーチされる共通ディレクトリを指定します。
"pathname"は必ず「\」で終わる文字列である必要があります。
hsc_compathが指定されなかった場合は、hspcmp.dllを使用しているEXEの下にある「common」ディレクトリが参照されます。




%index
hsc_comp
オブジェクトファイル作成
%group
拡張入出力制御命令
%prm
p1,p2,p3
p1=0〜(0) : デバッグ情報の有無
p2=0〜(0) : マクロ定義の有無
p3=0〜(0) : デバッグウィンドウ表示の有無

%inst
HSPコードコンパイラで、ソースファイルをコンパイルして、オブジェクトファイルを作成します。
p1のパラメータで、デバッグ情報をオブジェクトファイルに出力するかを指定することができます。
p1が0かまたは省略されている場合は、エラー行表示などに必要なデバッグ情報がオブジェクトファイルに付加されません。
p1が1の場合は、デバッグ情報が付加されます。
p1が2の場合はプリプロセス処理のみ行います。
p2が0の場合は「__hsp30__」マクロが定義された状態でコンパイルを行ないます。
p2が1の場合は、マクロは定義されません。これは、スクリプトエディタの
「HSP拡張マクロを使用する」フラグをコンパイラに渡すためのものです。
p2の値を+4(bit2)すると、ソースに含まれる実行ファイル自動作成のための命令(#pack,#epack,#packopt)をもとにpackfile作成を行ないます。
p3が0以外の場合は、デバッグウインドゥを表示するフラグをオブジェクトファイルに埋め込みます。
hsc_comp命令を実行するためには、必ずhsc_ini命令で初期化とファイルの指定をする必要があります。
また、必要があればhsc_objnameで出力されるオブジェクトファイル名を指定します。(出力ファイル名は、デフォルトではhdc_iniで指定したファイル名の拡張子が「.ax」になったものになります)
さらに必要であれば、hsc_refname命令をあらかじめ実行しておいて下さい。コンパイルの手順としては、
^p
1.「hsc_ini」
2.「hsc_refname」(省略可)
3.「hsc_objname」(省略可)
4.「hsc_comp」
^p
のようになります。






%index
hsc_getmes
エラーメッセージ出力先指定
%group
拡張入出力制御命令
%prm
p1
p1 : エラーメッセージを受け取る文字列型変数

%inst
p1で指定した文字列型の変数に、エラーなどHSPCMP.DLLが出力したメッセージを代入します。




%index
hsc_clrmes
エラーメッセージのクリア
%group
拡張入出力制御命令
%inst
コンパイラが出力したメッセージのデータをすべてクリアします。




%index
hsc_ver
コンパイラのバージョンを取得
%group
拡張入出力制御命令
%inst
システム変数refstrに、HSPコードコンパイラのバージョン情報を文字列として返します。




%index
hsc_bye
コンパイラの終了処理
%group
拡張入出力制御命令
%inst
HSPコードコンパイラの終了処理を行ないます。
この命令は自動的に実行されるので、通常は使用しません。




%index
pack_ini
PACKFILEマネージャの初期化
%group
拡張入出力制御命令
%prm
"filename"
"filename" : 操作対象ファイル名
%inst
PACKFILEマネージャの初期化を行ないます。
PACKFILEの操作を行なう場合(「pack_」で始まる命令)は、最初に初期化をする必要があります。
"filename"で指定したファイルを操作の対象とします。
ファイル名は、拡張子のないものを指定して下さい。




%index
pack_view
PACKFILEの内容一覧を表示
%group
拡張入出力制御命令
%inst
pack_iniで指定したファイルをDPMファイルとして内容一覧を表示します。pack_viewの結果は、hsc_getmes命令で取得して下さい。




%index
pack_make
DPMファイルを作成
%group
拡張入出力制御命令
%prm
p1,p2
p1 : 作成モード( 0=標準EXEファイル用 / 1=外部DPMファイル用 )
p2 : 暗号化キー( 0=標準キーを使用する / その他=暗号化キー )
%inst
pack_iniで指定したファイル名でDPMファイルを作成します。
p1で、標準EXEファイル用か、外部読み込み用のDPMファイルなのかを指定する必要があります。
また、DPMファイルを作成する場合は、p2で暗号化キーについての設定を行なうことができます。
p2に0を指定した場合は、標準の暗号化によるDPMファイル(2.61互換)を作成します。
p2に0以外を指定した場合は、その値をキーとする暗号化を施します。
この場合は、DPM読み込みの際にスクリプト側で同じ値のキーをchdpm命令によって指定しなければ、正しいファイルとして復号されなくなるので注意してください。
DPMファイルに含めるファイルは、カレントディレクトリの「PACKFILE」内のテキストで指定されたファイルになります。



%index
pack_exe
実行ファイルを作成
%group
拡張入出力制御命令
%prm
p1
p1 : 作成モード(0=標準 / 1=フルスクリーンモード / 2=スクリーンセーバー)

%inst
pack_iniで指定したファイル名でEXEファイルを作成します。
p1で3つのモード(標準・フルスクリーン・スクリーンセーバー)を指定することができます。
EXEファイルに含めるファイルは、カレントディレクトリの「PACKFILE」内のテキストで指定されたファイルになります。
また、HSPランタイムファイル(hsprt)が適切なディレクトリに置かれている必要があります。




%index
pack_opt
実行ファイル作成オプションを指定
%group
拡張入出力制御命令
%prm
p1,p2,p3
p1=0〜(640) : 画面Xサイズ
p2=0〜(480) : 画面Yサイズ
p3=0〜(0) : 起動時の動作スイッチ

%inst
pack_exe命令でEXEファイルを作成する場合のオプションを指定します。
pack_exe命令を実行する前に、指定をしておく必要があります。
p3で指定する起動時の動作スイッチには、以下の値を指定することで特殊な起動動作にすることができます。
^p
	1 = 初期ウィンドウ非表示
	2 = ディレクトリ移動なし
^p
動作スイッチは、加算することで同時に機能を選択することが可能です。
特に特殊な動作が必要ない場合は、0を指定して下さい。




%index
pack_rt
HSPランタイムファイルを指定
%group
拡張入出力制御命令
%prm
"filename"
"filename" : HSPランタイムファイル(hsprt)のあるフルパス名

%inst
pack_exe命令でEXEファイルを作成する場合に参照されるHSPランタイムファイル(hsprt)のあるフルパス名を指定します。
HSPランタイムファイルがカレントディレクトリにない場合は、指定をしておいてください。
(例: pack_rt "c:\hsp\hsprt")




%index
pack_get
packfileからファイルを取り出す
%group
拡張入出力制御命令
%prm
"filename"
"filename" : 取り出すファイル名

%inst
pack_iniで指定したファイル名をDPMファイルとして、格納されているファイルを取り出します。
"filename"で指定したファイルが取り出され、カレントディレクトリにセーブされます。




%index
hsc3_getsym
シンボル名を取得
%group
拡張入出力制御命令
%inst
コンパイラのメッセージバッファにHSPで使用されるシンボル名を出力します。
出力は、「シンボル名,sys[|var/func/macro][|1/2]」の形式になります。




%index
hsc3_messize
コンパイラメッセージのサイズを取得
%group
拡張入出力制御命令
%prm
val
val : サイズを受け取る数値型変数

%inst
hsc_getmesで得られるメッセージ全体のサイズを、valで指定した変数に代入します。




%index
hsc3_make
実行ファイルの自動作成
%group
拡張入出力制御命令
%prm
"path"
"path" : HSPランタイムライブラリのあるフルパス

%inst
実行ファイルの自動作成を行ないます。
"path"でHSPランタイムライブラリのあるフルパスを指定します。
packfileのオプションに従って実行ファイルを作成します。
オプション付きのpackfile作成は、hsc_compで行ないます。




%index
hsc3_getruntime
ランタイムファイルの取得
%group
拡張入出力制御命令
%prm
val, "objfile"
val       : ランタイム名を取得する変数
"objfile" : オブジェクトファイル名

%inst
"objfile"で指定したオブジェクトファイルが必要とする
ランタイムファイル名をvalで指定した変数に取得します。
valの変数は文字列型で初期化されている必要があります。
ランタイムファイル名が空("")の場合は、デフォルトのランタイム(hsp3.exe)を使用することを示しています。



%index
hsc3_run
ランタイム実行
%group
拡張入出力制御命令
%prm
"string"
"string"   : 実行コマンドライン

%inst
"string"の内容をランタイム実行用のコマンドラインとして処理します。
"string"には、「ランタイム名」「オブジェクトファイル名」「起動オプション」をそれぞれスペースで区切った形で指定する必要があります。



