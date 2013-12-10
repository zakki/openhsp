;
;	HSP help manager用 HELPソースファイル
;	(先頭が「;」の行はコメントとして処理されます)
;

%type
内蔵命令
%ver
3.4
%note
ver3.4標準命令
%date
2013/12/09
%author
onitama
%url
http://hsp.tv/
%port
Win



%index
newcom
COMオブジェクト型変数の新規作成
%group
COMオブジェクト操作命令
%prm
p1,p2,p3,p4
p1    : 変数名
p2    : インターフェース名、またはクラスID
p3(0) : 作成モード(オプション)
p4    : 参照元ポインタ(オプション)

%inst
p1で指定した変数をCOMオブジェクト型として初期化を行ないます。
p1の変数がCOMオブジェクト型でない場合は、COMオブジェクト型として初期化されます。
^
すでにCOMオブジェクト型の場合、以前のオブジェクトは破棄されます。
p2でクラスIDかまたは、プログラムID(ProgID)を指定することができます。
^p
	例:
	newcom ie, "InternetExplorer.Application"	; ProgID
^p
上の例では、プログラムIDを使用して初期化を行なっています。
これにより変数ieは、COMオブジェクト型変数として初期化されます。
また、#usecom命令によりすでに定義されているインターフェース名を指定して初期化することが可能です。
^p
	例:
	#define IID_IDirectMusicPerformance8 "{679c4137-c62e-4147-b2b4-9d569acb254c}"
	#define IID_IDirectMusicLoader8      "{19e7c08c-0a44-4e6a-a116-595a7cd5de8c}"
	#usecom IDirectMusicLoader8 IID_IDirectMusicLoader8　CLSID_DirectMusicLoader
	newcom loader, IDirectMusicLoader8
^p
p3で作成モードを指定することができます。p3を省略した場合にはモード0となります。
^p
モード    内容
------------------------------------------------------------------
  0       指定されたクラスのCOMをサーバーとして呼び出す
 -1       p4で指定されたポインタとするCOMオブジェクト型変数を作成
^p
p3が-1の場合は、COMオブジェクトを新規に作成せずに、p4で指定された値を
ポインタとするCOMオブジェクト型変数を作成します。
^
COMオブジェクト型変数は、Windowsが持つCOMの仕組みをHSPから呼び出すための仕組みに使用されます。詳しくは、プログラミングマニュアル(hspprog.htm)を参照してください。


%href
#usecom
#comfunc
delcom
axobj
querycom
comres
mcall



%index
delcom
COMオブジェクト型変数の破棄
%group
COMオブジェクト操作命令
%prm
p1
p1 : 変数名

%inst
p1で指定したCOMオブジェクト型の変数のインスタンスを削除します。
p1は、newcom命令によってすでにCOMオブジェクト型が設定されている変数である必要があります。
^p
	例:
	delcom v
^p
delcom命令は、初期化されたCOMオブジェクトの参照カウントを減らし、変数に設定されているインスタンスを無効にします。
通常、生成されたCOMオブジェクトのインスタンスはHSP内部で自動的に破棄されるため、特にdelcom命令で明示的に破棄する必要はありません。
^
一度破棄されたCOMオブジェクト型の変数は、再度newcom命令により初期化されるまでは使用することができません。

%href
querycom
newcom



%index
comres
メソッド返値代入変数を設定する
%group
メモリ管理命令
%prm
p1
p1 : 変数名

%inst
p1で指定した変数を、メソッド返値代入変数として設定します。
メソッド返値代入変数は、COMオブジェクト型変数を使用してCOMオートメーション(IDispatch)のメソッド呼び出しが行なわれた際に、結果が代入される対象となります。
mcall命令によってメソッド呼び出しが行なわれた結果を取得するためには、comres命令によって変数が設定されている必要があります。

%href
mcall
querycom
newcom
delcom




%index
querycom
COMオブジェクト型変数の作成
%group
COMオブジェクト操作命令
%prm
p1,p2,p3
p1 : 変数名
p2 : 参照される変数名
p3 : インターフェース名

%inst
p2で指定されたCOMオブジェクト型変数のインターフェースに対して、別なインターフェースを問い合わせ、p1で指定した変数をCOMオブジェクト型として初期化を行ないます。
p1の変数がCOMオブジェクト型でない場合は、COMオブジェクト型として初期化されます。
すでにCOMオブジェクト型の場合、以前のオブジェクトは破棄されます。
p3ですでに定義されているインターフェース名を指定します。
インターフェース名は、#usecom命令により定義されたものである必要があります。

%href
#usecom
newcom
delcom
mcall



%index
comevent
COMイベントの取得開始
%group
COMオブジェクト操作命令
%prm
p1,p2,p3,*label
p1      : 変数名
p2      : イベント取得元の変数名
p3      : コネクションポイントGUID
*label  : イベントサブルーチンのラベル

%inst
p1で指定された変数をイベント処理を行なうためのCOMオブジェクト型として初期化します。
p2で指定された変数(COMオブジェクト型)から任意のイベントを取得して準備を行ないます。
p2で指定されたCOMオブジェクトは、すでにnewcom命令により初期化されている必要があります。
p3でコネクションポイントGUIDを文字列形式で指定します。
p3の指定を省略した場合は、IProvideClassInfo2によって得られたデフォルトのコネクションポイントを検索します。
*labelでイベント処理サブルーチンのラベルを指定します。
イベント取得の準備に失敗した場合は、エラーが発生します。
成功した場合は、これ以降イベントが発生するたびに*labelで指定された場所にサブルーチンジャンプの割り込みが発生します。
*labelで指定されたイベントサブルーチンでは、comevdisp関数、comevarg命令により
イベントの内容を細かく取得することが可能になります。

すでにイベントの取得が開始されている変数に対して、再度comevent命令を実行した場合は、以前のイベントキューの設定は無効になります。
イベントの取得は、delcom命令によりCOMオブジェクトが破棄されるまで継続されます。


%href
newcom
delcom
comevarg
comevdisp




%index
comevarg
COMイベントのパラメーターを取得
%group
COMオブジェクト操作命令
%prm
p1,p2,p3,p4
p1     : 結果が代入される変数名
p2     : 参照されるCOMオブジェクト型変数名
p3 (0) : パラメーターのインデックス
p4 (0) : 取得モード(0=通常の変換、1=文字列に変換 2=Variant変換)

%inst
p2で指定された変数(COMオブジェクト型)のイベントサブルーチン内で、イベントのパラメーター(引数)を取得します。
p2で指定された変数は、comevent命令により初期化されている必要があります。
取得は必ず、イベントサブルーチン内で行なう必要があります。

p3でパラメーターのインデックスを指定することができます。インデックスは、0から始まる数でイベントによって有効なインデックス範囲が異なります。
p4でパラメーター取得の方法を指定することができます。
0かまたは省略した場合には、デフォルトの変換方法(文字列型、数値型などの変換をシステムが自動的に行ないます)が使用されます。
p4に1を指定した場合は、COMのシステムが文字列に変換した状態で取得されます。
p4に2を指定した場合は、Variant型として値が取得されます。

%href
comevent
comevdisp



%index
sarrayconv
Variant型との一括変換を行なう
%group
COMオブジェクト操作命令
%prm
p1,p2,p3,p4
p1    : 結果を格納する変数
p2    : 変換元の変数
p3(0) : 変換のモード
p4(0) : バイナリーデータのサイズ

%inst
Variant型との一括変換を行ないます。
p3のモードにより、変換のモードを指定することができます。
指定できるモード値は以下の通りです。
^p
p3　　内容
---------------------------------------------
0 ：配列変数 p2 全体から SafeArray を作成し、
    p1 の Variant 型変数に格納します。
1 ：p2 で指定された Variant 型変数に格納されている
    SafeArray を配列変数 p1 に格納します。
    p1 の領域は再確保されます。
2 ：p2 で指定された Variant 型変数に格納されている
    1次元 SafeArray のバイナリデータを変数 p1 に格納します。
^p

%href
comevarg

