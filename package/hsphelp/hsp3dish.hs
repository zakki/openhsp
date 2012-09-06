;
;	HSP help manager用 HELPソースファイル
;	(先頭が「;」の行はコメントとして処理されます)
;

%type
拡張命令
%ver
3.31
%note
hsp3dish.asをインクルードすること。

%date
2012/09/03
%author
onitama
%url
http://hsp.tv/
%port
Win
%group
拡張入出力制御命令


%index
setreq
システムリクエスト設定
%prm
type,val
type(0) : 設定タイプ(SYSREQ_???)
val(0)  : 設定する値
%inst
HSP3Dishランタイムに対して様々なシステム設定を行ないます。
設定タイプ名で指定できるのは以下のシンボルです。
^p
	設定タイプ名      読み書き(*)   内容
------------------------------------------------------------------------
	SYSREQ_CLSMODE        RW        背景のクリアフラグ
	SYSREQ_CLSCOLOR       RW        背景クリア色
	SYSREQ_TIMER          R         ミリ秒単位のタイマー値
	SYSREQ_PLATFORM       R         HSP3Dishを実行しているプラットフォーム

	(*)項目ごとに、読み(R)書き(W)の可否が異なります
^p

・SYSREQ_CLSMODE、SYSREQ_CLSCOLOR

redraw 0による描画開始時に画面をクリアするかどうかを設定します。 SYSREQ_CLSMODEに1を設定した場合はクリア、0の場合はクリアを行ないません。 スクリプト内で画面のクリアを行なっている場合は、システム側で背景クリアをしない方が 処理速度の向上につながります。 SYSREQ_CLSCOLORでクリアする際の色コードを設定することができます。 色コードは、RGB24bit($rrggbb)を1つにした数値で設定します。

・SYSREQ_TIMER

ミリ秒単位のタイマー値を返します。 プラットフォームごとに返される値は異なりますが、1ミリ秒につき1ずつ値が加算されていきます。

・SYSREQ_PLATFORM

以下のHSP3Dishプラットフォーム値を返します。
^p
	マクロ名            値  内容
	-------------------------------------------
	PLATFORM_WINDOWS    0   Windows版
	PLATFORM_IOS        1   iOS版
	PLATFORM_ANDROID    2   android版
^p

%href
getreq


%index
getreq
システムリクエスト取得
%prm
var,type
var  : 結果が代入される変数名
type : 設定タイプ(SYSREQ_???)
%inst
HSP3Dishランタイムが保持するシステム設定を取得して変数に代入します。
設定タイプ名で指定できる名称は、setreq命令と同様です。

%href
setreq


%index
gfilter
テクスチャ補間の設定
%prm
type
type : 設定タイプ(FILTER_???)
%inst
HSP3Dishランタイムが描画を行なう際の、テクスチャ補間(フィルタリング)の設定を行ないます。
設定タイプ名で指定できる名称は、以下の通りです。
^p
	マクロ名        値      内容
	-------------------------------------------
	FILTER_NONE     0       補間なし(NEAREST)
	FILTER_LINEAR   1       直線補間(LINEAR)
	FILTER_LINEAR2  2       エリア補間(高度な補間処理)
^p
フィルタリングの設定により、画像の拡大・縮小時のドット補間方法を 選ぶことができます。FILTER_NONEを指定することで、補間なし(ニアレスト) の状態になります。FILTER_LINEARは、直線(リニア)補間、FILTER_LINEAR2は より高度な補間方法(バイリニアなど)を選択します。 gfilter命令の設定は、以降のすべての描画命令に適用されます。 また、「redraw 0」による画面クリア時には、フィルタリング設定は FILTER_NONEにリセットされます。

%href
gcopy
grotate
gsquare
celput


