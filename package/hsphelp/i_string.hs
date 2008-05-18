;
;	HSP help manager用 HELPソースファイル
;	(先頭が「;」の行はコメントとして処理されます)
;

%type
内蔵命令
%ver
3.1
%note
ver3.1標準命令
%date
2004/10/12
%author
onitama
%url
http://www.onionsoft.net/
%port
Win
Cli
Let



%index
getstr
バッファから文字列読み出し
%group
文字列操作命令
%prm
p1,p2,p3,p4,p5
p1=変数   : 内容を読み出す先の変数名
p2=変数   : バッファを割り当てた変数名
p3=0〜    : バッファのインデックス(Byte単位)
p4=0〜255 : 区切りキャラクタのASCIIコード
p5=0〜(1024) : 読み出しを行なう最大文字数

%inst
メモリ上のバッファの任意の場所にある内容を文字列として変数に読み出しま
す。文字列は、00というコードか、改行コードがあるまで読み出されます。改
行コードは文字列には含まれません。
^
また、区切りキャラクタコードを指定することができ任意の文字で区切られた
文字列を取り出すこともできます。
^
この命令で読み出されたByte数は自動的に strsizeというシステム変数に代入
されます。strsizeは、次のインデックスまでの移動量を得る時に使用します。
^
たとえば、変数bのバッファに
'A' 'B' 'C' ',' 'D' 'E' 'F' 00(終了コード)
というデータが入っている場合、
^p
getstr a,b,0,','
^p
を実行すると、変数aの内容は、
'A' 'B' 'C' の部分が読み出されて"ABC"という文字列になり、strsize は4に
なります。
^
p5パラメーターにより、読み出しを行なう最大文字数(byte数)を指定することができます。
p5パラメーターが省略された場合には、1024文字(byte)までの読み出しを行ないます。
(p1で指定された変数のバッファは自動的に確保されるので、sdim命令等で
バッファの設定を行なっておく必要はありません。)
^
この命令は、複数行を含むテキスト文字列データや、特定の文字で区切られた
データを効率よく切り出すためのものです。
複数行を含むテキストを扱うためには、他にもメモリノートパッド命令セット
があります。また、文字列から特定数の文字を取り出すためには、strmid命令
が用意されています。

%href
strmid




%index
noteadd
指定行の追加・変更
%group
文字列操作命令
%prm
p1,p2,p3
p1=文字列  : 追加・変更をする文字列または変数名
p2=0〜(-1) : 追加するインデックス
p3=0〜1(0) : 上書きモード指定(0=追加・1=上書き)

%inst
メモリノートパッドの内容を追加・変更します。
^
p1に追加・変更するための文字列を指定します。p2で、対象となるインデック
スを指定します。
p2パラメータを省略するか、-1を指定すると最終行が対象になります。
p3パラメータで、追加か上書きかを指定します。省略するか、0を指定すると、
追加モードとなり、対象となるインデックス以降が１つづつシフトします。
p3が1の場合は、上書きモードとなり、 対象となるインデックスの内容は消去
され、指定した文字列に置き換えられます。
^
noteaddは、 変数バッファにsdim命令などであらかじめ確保された容量を超え
て内容を追加しようとした場合は、自動的に確保容量を増加させて格納しま
す。つまり、「sdim a,64」 で６４文字までしか記憶できないメモリバッファ
であっても、追加するサイズに応じて自動的にメモリサイズを調節して安全に
記憶させることができます。
^
メモリノートパッド命令(noteget,noteadd,notedel,noteinfo)を使用するため
には、最初にnotesel命令で対象となるバッファを設定しなければなりません。

%href
notesel

%sample
	sdim a,10000
	notesel a
	noteadd "newidx1"
	noteadd "newidx3"
	noteadd "newidx2",1
	mes a
	stop




%index
notedel
行の削除
%group
文字列操作命令
%prm
p1
p1=0〜 : 削除するインデックス

%inst
メモリノートパッドの指定したインデックスを削除します。
p1で指定したインデックスの内容は削除され、以降のインデックスが１つづつ
シフトします。
^
メモリノートパッド命令(noteget,noteadd,notedel,noteinfo)を使用するため
には、最初にnotesel命令で対象となるバッファを設定しなければなりません。

%href
notesel




%index
noteget
指定行を読み込み
%group
文字列操作命令
%prm
p1,p2
p1=変数   : 読み出し先の変数名
p2=0〜(0) : 読み出すインデックス

%inst
メモリノートパッド内の、p2で指定したインデックスの内容をp1で指定された
変数に代入します。メモリノートパッド内の任意の行にある内容を読み出すこ
とができます。
^
インデックスは0から始まるので注意してください。
p1で指定する変数には、変数バッファにsdim命令などであらかじめ確保された
容量を超えて内容を追加しようとした場合は、自動的に確保容量を増加させて
格納します。また、p1の変数は強制的に文字列型に変更されます。
^
メモリノートパッド命令(noteget,noteadd,notedel,noteinfo)を使用するため
には、最初にnotesel命令で対象となるバッファを設定しなければなりません。

%href
notesel

%sample
	a="idx0\nidx1\nidx2"
	notesel a
	noteget b,1
	mes b
	stop




%index
noteinfo
メモリノートパッド情報取得
%group
文字列操作関数
%prm
(p1)
p1(0) : 情報取得モード

%inst
noteinfo関数は、現在対象となっているメモリノートパッドについての情報を
取得します。
p1で情報取得モードを指定します。また、それぞれのモードに対応したマクロ
が定義されています。
^p
   モード : マクロ    内容
 -----------------------------------------------------------
      0   : notemax   全体の行数
      1   : notesize  全体の文字数(バイト数)
^p
notemaxマクロは、 複数行の文字列ですべての行に対して繰り返し処理を行な
いたい場合などに使用します。
全体の行数とは、つまりメモリノートパッド内にある要素の数です。
「APPLE」「ORANGE」「GRAPE」という行がある場合には、3になります。
この場合、インデックスは0〜2までになります。
^
メモリノートパッド命令(noteget,noteadd,notedel,noteinfo)を使用するため
には、最初にnotesel命令で対象となるバッファを設定しなければなりません。

%href
notesel
noteget
notedel
notemax
notesize

%sample
	nmax=0
	notesel a
	noteload "aaa.txt"
	idx=0
	repeat notemax
		noteget b,idx
		print "index"+idx+"="+b
		idx++
	loop
	stop




%index
notesel
対象バッファ指定
%group
文字列操作命令
%prm
p1
p1=変数 : バッファを割り当てた変数名

%inst
p1で指定した変数をメモリノートパッド命令のバッファに設定します。
^
p1で指定した変数は、強制的に文字列型に変更されます。
他のメモリノートパッド命令(noteget,noteadd,notedel,noteinfo)を使用する
ためには、最初に notesel命令で対象となるバッファを設定しなければなりま
せん。

%href
noteunsel
noteget
noteadd
notedel
noteinfo
notemax
notesize

%sample
notesel a
noteadd "test strings"
mes a
stop


%index
noteunsel
対象バッファの復帰
%group
文字列操作命令
%prm

%inst
noteunsel命令は、notesel命令で対象となるバッファを設定する前に設定され
ていたバッファ設定に戻します。
noteunsel命令は必ず入れておく必要はありませんが、
notesel命令で設定したバッファを使い終わった後に入れておくことで、
noteselによるバッファ指定が多重に行なわれることを防止します。

%href
notesel





%index
strmid
文字列の一部を取り出す
%group
文字列操作関数
%prm
(p1,p2,p3)
p1=変数名 : 取り出すもとの文字列が格納されている変数名
p2=-1〜   : 取り出し始めのインデックス
p3=0〜    : 取り出す文字数
%inst
p1で指定した文字列型変数の中から、 p2,p3で指定した条件で文字を取り出し
たものを返します。
p2で取り出し始めるインデックスを指定します。これは、文字列の始まり１文
字目を0として、1,2,3...と順番に増えていくものです。
１から始まりではないので注意してください。
p3で取り出す文字数を指定します。実際に格納されている文字数よりも多く指
定した場合は、実際の文字数までが取り出されます。
また、p2に-1を指定すると文字列の右からp3で指定した文字数だけ取り出しま
す。
%sample
	b="ABCDEF"
	a=strmid(b,-1,3)   ; 右から３文字を取り出す
	a=strmid(b,1,3)    ; 左から２文字目から３文字を取り出す
%href
getstr


%index
instr
文字列の検索をする
%group
文字列操作関数
%prm
(p1,p2,"string")
p1=変数名 : 検索される文字列が格納されている文字列型変数名
p2=0〜(0) : 検索を始めるインデックス
"string"  : 検索する文字列
%inst
p1で指定した文字列型変数の中に、"string"で指定した文字列があるかどうか
調べて、インデックスを返します。
^
指定した文字列が見つかった場合には、インデックス値が返されます。これは、
文字列の始まり１文字目を0として、   1,2,3...と順番に増えていくものです
(strmid命令で指定するインデックスと同様です)。
１から始まりではないので注意してください。
(p2を指定した場合、インデックスはp2を起点(0)とするものになります。)
もし、指定した文字列が見つからなかった場合には-1が返されます。
%href
strmid




%index
notesave
対象バッファ保存
%group
文字列操作命令
%prm
"filename"
"filename" : 書き込みファイル名
%inst
メモリノートパッド命令のバッファの内容を指定したファイルにテキスト
ファイルとして保存します。
必ず最初にnotesel命令で対象となるバッファを設定する必要があるので注意
してください。
notesave命令は、指定バッファに含まれる文字列の長さで保存します。

%href
notesel
noteload
noteget
noteadd
notedel
noteinfo
%port-
Let



%index
noteload
対象バッファ読み込み
%group
文字列操作命令
%prm
"filename",p1
"filename" : 読み込みファイル名
p1(-1)     : 読み込みサイズの上限値
%inst
指定したファイルをメモリノートパッド命令のバッファに読み込みます。
通常は、テキストファイルを読み込み、メモリノートパッド命令で読み出す対
象とします。メモリノートパッド命令のバッファは、自動的にファイルのサイ
ズに従って確保サイズが調節されるため、バッファのサイズをあらかじめ指定
しておく必要はありません。
p1で、読み込むファイルの最大サイズを指定することができます。
指定を省略またはマイナス値にした場合は、どんなサイズでも読み込みます。
テキストファイル以外のファイルを読み込むことも可能です。
必ず最初にnotesel命令で対象となるバッファを設定する必要があるので注意
してください。
%href
notesel
notesave
noteget
noteadd
notedel
noteinfo
notemax
notesize


%index
getpath
パスの一部を取得
%group
文字列操作関数
%prm
(p1,p2)
p1=文字列 : 取り出す元の文字列
p2=0〜    : 情報のタイプ指定
%inst
p1で指定したファイルパスを示す文字列をp2で指定したタイプの情報に変換し
たものを文字列として返します。
^p
例 :
	a="c:\\disk\\test.bmp"
	b = getpath(a,8+1)
	mes b
	↓(結果)
	"test"となる
^p
タイプ指定の詳細は以下の通りです。
^p
   タイプ : 内容
 -----------------------------------------------------------
     0    : 文字列のコピー(操作なし)
     1    : 拡張子を除くファイル名
     2    : 拡張子のみ(.???)
     8    : ディレクトリ情報を取り除く
    16    : 文字列を小文字に変換する
    32    : ディレクトリ情報のみ
^p
タイプ値は、合計することで複数指定を行なうことが可能です。
タイプ16が指定された場合は、すべての英文字列を小文字に変換します。
%href
getstr
instr





%index
strf
書式付き文字列に変換
%group
文字列操作関数
%prm
("format",p1)
"format" : 書式指定文字列
p1       : 書式指定パラメーター
%inst
整数または実数値を適切な書式で文字列に変換した文字列を返します。
"format"で、書式指定文字列を指定します。
書式指定文字列は、Cランタイムライブラリがサポートしているsprintfの書式
をそのまま流用することができます。
^p
例 :
	a=123
	mes strf("10進[%d]",a)
	mes strf("16進[%x]",a)
	mes strf("10進桁数指定付き[%05d]",a)
	mes strf("16進桁数指定付き[%05x]",a)
	a=sqrt(2)
	mes strf("10進実数[%f]",a)
	mes strf("10進実数桁数指定付き[%3.10f]",a)
^p
「%d」は整数値を、「%x」は１６進整数値を、「%c」は文字コード、「%f」は
実数値をそれぞれ表示させることができます。(「%s」 はサポートしていませ
ん)１つのstrf関数には、1つのパラメーターのみ指定することができます。
複数のパラメーターを処理する場合は、strf関数を複数使用して文字列を結合
するようにしてください。
書式指定文字列には1023文字までの文字列が認識されます。
%href
mes
print




%index
cnvwtos
unicodeを通常文字列に変換
%group
文字列操作関数
%prm
(p1)
p1=変数 : 内容を読み出す元の変数名

%inst
変数に保存されたデータをunicodeとして読み取り、 通常の文字列に変換した
ものを返します。
unicodeデータを扱う場合や、外部DLL、 COMオブジェクトとのデータ変換など
で使用することができます。

%href
cnvstow
str
%port-
Let




%index
cnvstow
通常文字列をunicodeに変換
%group
文字列操作命令
%prm
p1,"string"
p1=変数  : 結果を書き込む変数名
"string" : 変換元の文字列

%inst
"文字列"で指定されたデータをunicode文字列に変換して変数バッファに保存
します。
unicodeデータを扱う場合や、外部DLL、 COMオブジェクトへのデータ変換など
で使用することができます。

%href
cnvwtos
str
%port-
Let


