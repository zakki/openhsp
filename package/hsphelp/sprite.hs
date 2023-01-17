;
;	HSP help manager用 HELPソースファイル
;	(先頭が「;」の行はコメントとして処理されます)
;

%type
拡張命令
%ver
3.7
%note
hsp3dish.asをインクルードすること。

%date
2022/07/26
%author
onitama
%dll
HSP3Dish
%url
http://hsp.tv/
%port
Win
%group
拡張入出力制御命令


%index
es_ini
システムの初期化
%group
拡張画面制御命令
%prm
p1,p2
p1(512)=スプライトの最大数
p2(1024)=キャラクタ定義の最大数
p3(64)=周の精度(64〜4096)

%inst
標準スプライトのシステム初期化を行ないます。
パラメータを省略すると、スプライトは512個まで、 キャラクタ定義数は1024個までを最大として
スプライトを初期化します。
es_ini命令は何度でも実行することができるので、スプライトをすべてクリアしたい時などにも使用可能です。
^
p3はes_adir命令などで使用する角度を、一周何度にするかを指定します。 指
定できる数値は、64と256の倍数、そして360の倍数です。それ以外の数値を指
定した場合は、指定した値未満で条件に合う一番近い数値が設定されます。
^
空きメモリが不足しているなど、何らかの理由でメモリ確保に失敗した時は、
statに0以外の値が返ります。


%index
es_screen
スプライト描画解像度設定
%group
拡張画面制御命令
%prm
p1,p2
p1(0)=X方向の描画解像度
p2(0)=Y方向の描画解像度

%inst
スプライトの描画解像度を再設定します。
p1,p2パラメーターで指定されたサイズを画面が描画解像度として設定されます。
p1,p2パラメーターに0またはマイナス値を指定した場合は、現在の描画先画面のサイズが使用されます。
通常は、es_ini命令で初期化された時点で画面の解像度は自動的に設定されますので、解像度を再設定する必要はありません。
es_screen命令は、解像度の異なる別なバッファに描画する際に設定を変更するために使用してください。
^
es_screen命令でスプライトの描画解像度が再設定されると、自動的にスプライト有効エリアも再設定されます。
%href
es_ini
es_area


%index
es_area
スプライト有効エリア設定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1(0)=有効エリアの左上X座標
p2(0)=有効エリアの左上Y座標
p3(0)=有効エリアの右下X座標
p4(0)=有効エリアの右下Y座標

%inst
スプライトの有効エリア(ボーダー)を設定します。
スプライト座標が(p1,p2)-(p3,p4)の範囲内にないものは、 自動的に削除されます。
^
es_ini命令、es_screen命令でスプライトの表示範囲が初期化されると、自動的にスプライト有効エリアも再設定されます。
%href
es_ini
es_screen


%index
es_size
キャラクタサイズ指定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1=キャラクタのXサイズ
p2=キャラクタのYサイズ
p3(100)=ヒットチェック領域(%)
p4($3ff)=p4=特殊効果(EP値)の指定

%inst
スプライトのキャラクタパターンを定義する際の、サイズを指定します。
(p1,p2)がキャラクタのX,Yサイズになります。
^
p3は当たり判定を行なう際のヒットチェック領域が、 何%になるかを指定します。100を指定すると、(p1,p2)で指定したサイズいっぱいにヒットチェックを行ないます。
0を指定すると、そのキャラクタは当たり判定を持たなくなります。
p4は、特殊効果(EP値)のデフォルト設定になります。通常は省略して構いません。
特殊効果(EP値)パラメーターは、半透明や加算合成などの設定を指定します。詳細は、標準スプライトプログラミングガイドを参照してください。
^
キャラクタのX,Yサイズには特に制限はありませんが、 オフスクリーンバッファからはみ出すようなキャラクタパターンの指定は無効になります。
es_size命令の設定は、以降のキャラクタ定義でずっと有効になります。
%href
es_pat


%index
es_pat
キャラクタ画像定義
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5
p1(-1)=キャラクタNo.
p2=キャラクタパターンの左上X座標
p3=キャラクタパターンの左上Y座標
p4(0)=表示フレーム数(0)
p5=ウインドウバッファID
%inst
スプライトのキャラクタパターンを定義します。
^
p1で指定したキャラクタNo.に、 (p2,p3)の座標からes_sizeで設定した大きさのキャラクタが登録されます。
ここで対象となる画像は、picload命令またはcelload命令であらかじめウインドウバッファに読み込んでおく必要があります。
p5で、ウインドウバッファIDが指定されていればそのウインドウバッファから、p5が省略されている場合は、現在の操作先にあたるウインドウバッファから、画像の中の一部を切り出してきてキャラクタパターンとして登録します。
^
p1パラメーターを省略するかマイナス値にした場合は、自動的に空いているキャラクタNo.が割り当てられます。この命令を実行後に、システム変数statに割り当てられたキャラクタNo.が代入されるので、それによってどのNo.が使われたかを知ることができます。
^
es_pat命令1回で、指定したキャラクタNo.にキャラクタパターンが登録されます。たくさんのキャラクタパターンが必要な場合は、そのぶん登録をしておく必要があります。
まとめてキャラクタパターンを登録するために、es_patanim命令も用意されています。
^
p4のパラメータは、キャラクタアニメーションをするための設定です。
0ならば、アニメーションなし。1以上ならば、指定したフレーム数だけそのキャラクタを表示した後、 次のキャラクタ(キャラクタNo.+1)を表示するように設定されます。
%href
es_link
es_patanim


%index
es_link
アニメーション設定
%group
拡張画面制御命令
%prm
p1,p2
p1=キャラクタNo.
p2=ループアニメーションするキャラクタNo.

%inst
キャラクタのループアニメーションを設定するための命令です。
p1で指定したキャラクタNo.が、指定されたフレームだけ表示した後に、 p2で
指定したキャラクタNo.に戻るように設定を行ないます。
%href
es_pat

%sample
es_size 32,32
es_pat 1,0,0,8
es_pat 2,32,0,8
es_pat 3,64,0,8
es_pat 4,96,0,8
es_link 4,1


%index
es_kill
スプライト削除
%group
拡張画面制御命令
%prm
p1
p1=スプライトNo.

%inst
p1で指定したスプライトNo.を削除します。

%href
es_clear


%index
es_clear
複数スプライト削除
%group
拡張画面制御命令
%prm
p1,p2
p1=スプライトNo.
p2=削除される個数

%inst
p1で指定したスプライトNo. 以降のスプライトが削除され未登録になります。
p2で削除されるスプライトの数を指定することができます。
p1とp2の指定を省略した場合は、すべてのスプライトが削除されます。
%href
es_kill


%index
es_exnew
新規スプライト取得
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1=新規No.が代入される変数名
p2=検索を開始するスプライトNo.
p3=検索を終了するスプライトNo.
p4=増分

%inst
この命令は、スプライトNo.の中で使われていないNo.を検索します。
p2〜p3で指定したNo.の間で空きのあるNo.を、p1で指定した変数に代入します。
空きがない場合は、-1が代入されます。
^
p4には検索するスプライトNo.の増分を指定します。 省略するとp2、p3から自
動的に設定するため、通常は明示する必要はありません。
^
※es_new命令と同様の処理を行いたい場合は、p3に-1を指定してください。
%href
es_new


%index
es_new
新規スプライト取得
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=新規No.が代入される変数名
p2=検索を開始するスプライトNo.
p3=検索を行うスプライトの数

%inst
この命令は、スプライトNo.の中で使われていないNo.を検索します。
p2で指定したNo.以降で空きのあるNo.を、p1で指定した変数に代入します。空
きがない場合は、-1が代入されます。
^
この命令は、以前のバージョンとの互換性のために残された命令です。
より詳細な検索を行う場合は、es_exnew命令を使用するようにしてください。
%href
es_exnew



%index
es_get
スプライト情報取得
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=情報が代入される変数名
p2=スプライトNo.
p3=info number

%inst
p1で指定した変数名に、p2のスプライトNo.の情報を代入します。
情報の種類は、p3のinfo numberで指定します。以下の値を設定することができます。
^p
値     マクロ           内容
----------------------------------------------------------
 0     ESI_FLAG        flag値(機能の状態設定)
 1     ESI_POSX        X座標
 2     ESI_POSY        Y座標
 3     ESI_SPDX        X移動値
 4     ESI_SPDY        Y移動値
 5     ESI_PRGCOUNT    プログレスカウント値((未使用)
 6     ESI_ANIMECOUNT  アニメーションカウンター
 7     ESI_CHRNO       キャラクタNo.
 8     ESI_TYPE        type値(ユーザー設定による属性)
 9     ESI_ACCELX      X加速度(落下用)
10     ESI_ACCELY      Y加速度(落下用)
11     ESI_BOUNCEPOW   反発力(落下用)
12     ESI_BOUNCEFLAG  反発設定(落下用)
13     ESI_OPTION      オプション値(ユーザー設定による)
14     ESI_PRIORITY    表示優先度
15     ESI_ALPHA       特殊効果(EP値)
16     ESI_FADEPRM     フェード用パラメーター
17     ESI_ZOOMX       X表示倍率
18     ESI_ZOOMY       Y表示倍率
19     ESI_ROTZ        回転角度
20     ESI_SPLINK      リンクするスプライトNo.
21     ESI_TIMER       タイマー値
22     ESI_TIMERBASE   タイマー値(マスター)
23     ESI_PROTZ       回転角度(加算値)
24     ESI_PZOOMX      X表示倍率(加算値)
25     ESI_PZOOMY      Y表示倍率(加算値)
</pre>
^p
すべての情報は32bitの整数で保存されています。スプライトの座標や、加速度、倍率などは固定小数値となっているため実際の値が、65536倍されているので注意してください。
スプライト情報を直接書き換える際には、es_setpを使用できます。

%href
es_setp


%index
es_setp
スプライトパラメータ設定
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=スプライトNo.
p2=info number
p3=変更する値
%inst
スプライトの情報を直接変更します。
p1で指定されたスプライトNo.が持つp2のパラメーターを直接p3の値に書き換えます。
情報の種類は、p3のinfo numberで指定します。以下の値を設定することができます。
^p
値     マクロ           内容
----------------------------------------------------------
 0     ESI_FLAG        flag値(機能の状態設定)
 1     ESI_POSX        X座標
 2     ESI_POSY        Y座標
 3     ESI_SPDX        X移動値
 4     ESI_SPDY        Y移動値
 5     ESI_PRGCOUNT    プログレスカウント値((未使用)
 6     ESI_ANIMECOUNT  アニメーションカウンター
 7     ESI_CHRNO       キャラクタNo.
 8     ESI_TYPE        type値(ユーザー設定による属性)
 9     ESI_ACCELX      X加速度(落下用)
10     ESI_ACCELY      Y加速度(落下用)
11     ESI_BOUNCEPOW   反発力(落下用)
12     ESI_BOUNCEFLAG  反発設定(落下用)
13     ESI_OPTION      オプション値(ユーザー設定による)
14     ESI_PRIORITY    表示優先度
15     ESI_ALPHA       特殊効果(EP値)
16     ESI_FADEPRM     フェード用パラメーター
17     ESI_ZOOMX       X表示倍率
18     ESI_ZOOMY       Y表示倍率
19     ESI_ROTZ        回転角度
20     ESI_SPLINK      リンクするスプライトNo.
21     ESI_TIMER       タイマー値
22     ESI_TIMERBASE   タイマー値(マスター)
23     ESI_PROTZ       回転角度(加算値)
24     ESI_PZOOMX      X表示倍率(加算値)
25     ESI_PZOOMY      Y表示倍率(加算値)
</pre>
^p
すべての情報は32bitの整数で保存されています。ほとんどのパラメーターは設定するための命令が別途用意されているので、es_setp命令を使用する必要はありません。
また、スプライトの座標や、加速度、倍率などは固定小数値となっているため実際の値と異なります。その場合は、es_pos命令などをお使いください。
スプライト情報を直接取得する際には、es_getを使用できます。
%href
es_get
es_pos


%index
es_find
スプライト検索
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5
p1=スプライトNo.が代入される変数名
p2=検索対象となるtype値
p3=検索を開始するスプライトNo.
p4=検索を終了するスプライトNo.
p5=増分

%inst
登録されているスプライトの中で指定したtype値を持つスプライトNo. を検索
します。
p2のtype値には、複数のtypeを同時に指定することができます。
たとえば、type1とtype4を対象にする場合は、1+4で5を指定します。
^
p2の指定を省略するか、 0を指定した場合にはすべてのtype値を持つスプライ
トが検索の対象になります。
^
検索は、p3で指定されたスプライトNo.からp4で指定されたNo.まで順番に探していきます。
これを省略すると、No.0からすべてのスプライトを検索します。
該当するスプライトが見つかった時点で、p1に結果を代入して終わります。
検索の結果、該当するスプライトがなかった場合には、-1が代入されます。
^
p5は検索するスプライトNo.の増分を指定するもので、 省略するとp3、p4から自動的に設定されますので通常は指定しなくても構いません。


%index
es_check
衝突判定取得
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=結果が代入される変数名
p2=チェックの対象となるスプライトNo.
p3=検索対象となるtype値

%inst
スプライト同士の衝突判定を行ないます。
^
p2で指定されたスプライトNo.と衝突している(重なっている) スプライトを検
索して、p1で指定した変数に結果を代入します。
^
p3で衝突判定の対象となるtype値を指定することができます。
p3が省略されるか、 0の場合は、すべてのスプライトとの衝突を判定します。
p3のtype値には、複数のtypeを同時に指定することができます。
たとえば、type1とtype4を対象にする場合は、1+4で5を指定します。
^
衝突判定には、キャラクタパターンを登録した時に指定したヒットチェック領
域(%)が使用されます。 実際に画像が重なっていても、ヒットチェック領域の
範囲が重ならない限りは衝突とみなされません。
スプライトの表示倍率は衝突の範囲に反映されますが、回転した場合でも矩形の衝突範囲は変わりませんので注意してください。
^
結果はp1で指定した変数に代入されます。もし、衝突しているスプライトがな
かった場合には-1が、 衝突しているスプライトがあれば、そのスプライトNo.
が代入されます。衝突しているスプライトが複数あった場合には、スプライト
No.の小さいものが優先されます。
%href
es_type
es_size


%index
es_offset
オフセット座標設定
%group
拡張画面制御命令
%prm
p1,p2
p1=オフセットX値
p2=オフセットY値

%inst
すべてのスプライトの表示を、オフセット値で指定した数だけずらして表示し
ます。この命令で設定したオフセット値は、 es_draw命令で描画を行なった時
に反映されます。
%href
es_draw


%index
es_set
スプライト設定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5,p6
p1(-1)=スプライトNo.
p2=スプライトX座標
p3=スプライトY座標
p4=キャラクタNo.
p5(0)=オプション値
p6(0)=優先順位

%inst
スプライトを登録します。
p1でスプライトNo.を指定して、(p2,p3)が画面上でのスプライトのX,Y座標になります。
この座標を左上として、p4で指定したキャラクタNo.が表示されます。
スプライト座標は、-32767〜32767までの範囲が設定可能です。
^
p1を省略するか、マイナス値にした場合は、自動的に空いているスプライトNo.を割り当てます。
この場合、命令実行後に設定されたスプライトNo.がシステム変数statに代入されます。
^
p5はユーザーが自由に使用できるoption値を設定します。
(option値の詳細については、標準スプライトプログラミングガイドを参照してください)^
p6でスプライトの優先順位を指定します。優先順位は値が小さいほど手前に表示されるようになり、同一値の場合はスプライトの小さい方が優先されます。
また、 従来通りスプライトNo.の小さい順に描画するようにすることもできます。
^
特に必要ない場合は、p5,p6パラメーターは省略しても問題ありません。

%href
es_pat
es_draw


%index
es_flag
flag値設定
%group
拡張画面制御命令
%prm
p1,p2
p1=スプライトNo.
p2=flag値

%inst
p1で指定したスプライトのflag値を変更します。
flag値は、スプライトが有効になっている場合は、 $100(256)が自動的に設定されています。通常は特にいじる必要はありません。
flag値が示す値は以下の通りです。[]内は定義されているマクロ名です。
^p
flag値=
  0    :  スプライト未登録
  bit 0-7 : 1〜127 カウントダウンタイマー(HSPDX互換)
  bit 8 :  $100 スプライト表示ON [ESSPFLAG_STATIC]
  bit 9 :  $200 スプライト移動ON [ESSPFLAG_MOVE]
  bit10 :  $400 自由落下移動ON [ESSPFLAG_GRAVITY]
  bit11 :  $800 親とリンクして移動 [ESSPFLAG_SPLINK]
  bit12 : $1000 ボーダー消去無効ON [ESSPFLAG_NOWIPE]
  bit13 : $2000 ボーダーXで反転SWITCH [ESSPFLAG_XBOUNCE]
  bit14 : $4000 ボーダーYで反転SWITCH [ESSPFLAG_YBOUNCE]
  bit15 : $8000 カウントダウンタイマー時点滅SWITCH [ESSPFLAG_BLINK]
  bit16 : $10000 非表示SWITCH [ESSPFLAG_NODISP]
  bit17 : $20000 カウントダウンタイマー時フェードインSWITCH [ESSPFLAG_FADEIN]
  bit18 : $40000 カウントダウンタイマー時フェードアウトSWITCH [ESSPFLAG_FADEOUT]
  bit19 : $80000 カウントダウンタイマー終了時消滅SWITCH [ESSPFLAG_TIMERWIPE]
  bit20 : $100000 カウントダウンタイマー時消滅SWITCH2 [ESSPFLAG_BLINK2]
  bit21 : $200000 カウントダウンタイマー時末尾フェードSWITCH [ESSPFLAG_EFADE]
  bit22 : $400000 カウントダウンタイマー時末尾フェードSWITCH2 [ESSPFLAG_EFADE2]
^p
%href
es_get


%index
es_chr
chr値設定
%group
拡張画面制御命令
%prm
p1,p2
p1=スプライトNo.
p2=キャラクタNo.

%inst
p1で指定したスプライトのキャラクタNo.を変更します。
キャラクタNo.は、あらかじめes_pat命令で設定されている必要があります。
%href
es_pat


%index
es_type
type値設定
%group
拡張画面制御命令
%prm
p1,p2
p1=スプライトNo.
p2=type値

%inst
p1で指定したスプライトのtype値を変更します。
スプライトのtype値は、ユーザーが自由に設定することができ、ゲームなどで物体の識別をする時に有効に使うことができます。
設定できる値は、1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768…といった整数値になります。
これは2進数の各ビットを示している値です。これを32bit分、計32種類まで使用できます。
es_set命令でスプライトを設定した直後は、type値は1になっています。
%href
es_set


%index
es_pos
スプライト座標設定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1=スプライトNo.
p2=スプライトX座標
p3=スプライトY座標
p4(0)=設定オプション

%inst
スプライト座標などの情報を変更します。
p1でスプライトNo.を指定して、(p2,p3)でX,Y座標を設定します。
p4の設定オプションにより、スプライトのX,Y座標以外を設定することができます。
^p
   p4    マクロ名        内容
--------------------------------------------------
      0  ESSPSET_POS     スプライトX,Y座標
      1  ESSPSET_ADDPOS  スプライトX,Y移動成分
      2  ESSPSET_FALL    スプライトX,Y落下速度
      3  ESSPSET_BOUNCE  スプライトバウンド係数
      4  ESSPSET_ZOOM    スプライトX,Y表示倍率
 0x1000  ESSPSET_DIRECT  直接32bit値を設定する
 0x2000  ESSPSET_MASKBIT 固定小数部分を保持する
^p
es_pos命令が設定する座標値は、内部では16bit固定小数になっています。通常は、自動的に変換されますが、設定オプションにESSPSET_DIRECTを付加することで、変換は無効になります。
また、ESSPSET_MASKBITを付加することで、16bit固定小数の変換時にそれまでの小数部分を保持するようになります。
^
es_pos命令は、設定済みのスプライトの座標だけを変更する命令です。新規にスプライトを設定する場合は、es_set命令を使用してください。

%href
es_set
es_getpos


%index
es_setrot
スプライト回転角度・表示倍率設定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1=スプライトNo.
p2(0)=角度値
p3(-1)=X方向の表示倍率(%)
p4(-1)=Y方向の表示倍率(%)

%inst
p1で指定したスプライトの回転角度、及び表示倍率を変更します。
p2で指定した角度にスプライトが回転されます。p2の値は0以上の整数で大きい値ほど右回りに回転していきます。角度が一周する値は、es_ini命令で指定されます。
^
(p3,p4)パラメーターによりX,Y方向の表示倍率を変更します。
p3またはp4の値を省略するかマイナス値の場合は、それまでの倍率を変更せずに保持します。
表示倍率は100%を1倍として換算します。250を指定した場合は、2.5倍となります。
es_set命令でスプライトを設定した直後は、角度は0に倍率は100%になっています。

%href
es_set


%index
es_apos
スプライト移動設定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1=スプライトNo.
p2=1フレームにX方向に移動するドット数
p3=1フレームにY方向に移動するドット数
p4=移動スピード(%)

%inst
スプライトを自動的に移動させるための設定をします。
p1でスプライトNo.、p2,p3でX,Y方向の増分を指定します。
^
p4で移動スピードを%で指定します。p4を省略するか、100を指定した場合は、
100%のスピードとなり、1フレームに(p2,p3)で指定した増分だけ移動し続けます。
もし、移動スピードを50(%)にして、増分が(+4,-2)に指定された場合は、実際には、(+2,-1)の増分になります。
増分の単位は、1ドット以下になった場合でも正確に移動を行ないます。 たとえば、1フレームに(1,0)の移動を10%で行なった場合でも、10フレーム後に1ドット移動するように計算されます。
%href
es_adir
es_aim


%index
es_setgosub
スプライト表示コールバック設定
%group
拡張画面制御命令
%prm
p1,p2
p1=スプライトNo.
p2=設定するサブルーチンのラベル

%inst
p1で指定したスプライトの表示コールバックを設定します。
p2でサブルーチンのラベルを指定します。以降は、そのスプライトが表示されるごとにgosub命令と同様にサブルーチンが呼び出されます。
^
実際にサブルーチンが呼び出された際には、システム変数iparamにスプライトNo.が、
wparamにtype値が、lparamにキャラクタNo.が代入されます。
^
呼び出しを行う際のサブルーチンは、コールバックルーチンとして機能します。
時間待ちなど一部の命令を実行できないので注意してください。詳しくは、コールバックルーチンについて参照してください。

%href
gosub


%index
es_adir
スプライト移動方向設定
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=スプライトNo.
p2=移動する方向(0〜)
p3=移動スピード(%)

%inst
スプライトを自動的に移動させるための設定をします。
^
p1でスプライトNo.、p2で方向を指定します。 方向は、es_iniで指定した数値
までで指定します。0が真下となり、反時計回りに増加していきます。
^
p3で移動スピードを%で指定します。 p3を省略するか、100(%)を指定した場合
には、指定した方向に1フレームにつき1ドットの距離を移動します。


%index
es_aim
スプライト参照座標設定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1=スプライトNo.
p2=移動先のX座標
p3=移動先のY座標
p4=移動スピード(%)

%inst
es_aim命令は、 es_adir命令と同じく指定した方向にスプライトを移動させる
ためのものです。 es_aim命令では、方向の替わりに移動する目標となるX,Y座
標を指定します。スプライトは、現在の座標から、目標となる座標への方向を
計算し移動を開始します。
^
この命令は、たとえば敵から発射されるミサイルがプレイヤーを狙って移動す
るようにしたい時などに役立ちます。
^
p4で移動スピードを%で指定します。 p3を省略するか、100(%)を指定した場合
には、指定した方向に1フレームにつき1ドットの距離を移動します。
^
この命令を実行するとシステム変数statに移動方向が返ります。
これを利用して自機を狙う3方向弾などを作成することができます。
%href
es_apos
es_adir


%index
es_draw
スプライト描画
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5
p1=描画開始スプライトNo.
p2(-1)=描画するスプライトの個数
p3(0)=処理保留フラグ
p4(-1)=優先順位の開始値
p5(-1)=優先順位の終了値

%inst
登録されているスプライトを画面に描画します。
通常は、 p1,p2のパラメータを省略して使用すれば、すべてのスプライトを描画することが可能です。必ずredraw 0〜redraw 1の間に描画するようにしてください。
^
登録されているスプライトの一部だけを描画したい場合は、p1に開始スプライトNo.、p2に描画する個数を指定してください。
p1,p2の指定を省略した場合は、すべてのスプライトが描画対象になります。
^
p3パラメーターにより、内部処理を保留することができます。
^p
 値     マクロ名          内容
------------------------------------------------------------------------
  0  ESDRAW_NORMAL        すべての処理を実行する
  1  ESDRAW_NOMOVE        移動処理を保留する
  2  ESDRAW_NOANIM        アニメーションを保留する
  4  ESDRAW_NOCALLBACK    コールバックルーチンを保留する
  8  ESDRAW_NODISP        表示を保留する
 16  ESDRAW_NOSORT        ソートを保留する
^p
通常は、命令を実行すると、スプライト移動→アニメーション処理→表示処理→コールバック処理が実行されますが、それぞれの処理ごとに保留させることができます。
ESDRAW_NO*マクロは加算することで同時に指定することが可能です。
これにより一時的に移動やアニメーションを停止させることができます。通常は、p3パラメーターを省略しておいて問題ありません。
^
p4,p5パラメーターを指定すると、es_set命令やes_setpri命令で指定した優先順位が参照され、値の順にソートしてスプライトを描画します。その際に、p3〜p4の範囲だけを描画させることが可能です。
p4,p5パラメーターを指定した場合は、スプライトの優先順位に従ってソートされ、優先順位の値が大きいものが手前に表示されます。(ただし、処理保留フラグにESDRAW_NOSORTが指定されている場合は、ソートを無効にします)
p4,p5パラメーターがマイナスか省略された場合は、優先順位の値は無視され、スプライトNo.が小さいほど手前の表示となります
^
この命令を実行するとシステム変数statに描画対象として認識されたスプライトの個数が返ります。
%sample
*gmain
	stick ky,$1f				; キーの情報を取得
	if ky&$80 : goto *owari			; [ESC]中断チェック
	redraw 0				; 画面クリア
	es_draw 				; スプライト描画
	redraw 1 				; 画面の更新
	await 1000/60 				; Systemアイドル
	goto *gmain
%href
es_set
es_setpri
es_setgosub


%index
es_gravity
落下加速度設定
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=スプライトNo.(-1〜)
p2=X方向の加速度(-32767〜32767)
p3=Y方向の加速度(-32767〜32767)

%inst
es_flag命令で自由落下移動をONにしたときの加速度を設定します。
^
p2、p3は1フレームごとに加算される移動量で、256で1ドットとなります。
p1に-1を指定すると、デフォルト値を設定することができます。　この値は、
es_set命令を実行した時に設定される値で、初期値はp2が0、p3が256となって
います。


%index
es_bound
弾みやすさ設定
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=スプライトNo.(-1〜)
p2=弾みやすさ(0〜256)
p3=フラグ(1=X方向 2=Y方向 3=両方 デフォルト=3)

%inst
es_flag命令で自由落下移動をONにしたときに、 画面下部(または上部)で跳ね
返る際の弾みやすさを設定します。この値が大きいほど跳ね返り時に勢いが失
われなくなります。
^
p3は画面の上下端、あるいは左右端に当たった際に跳ね返りを行うか行わない
かを設定できます。ただし、このフラグは自由落下が発生する方向にのみ適用
されます。
^
p1に-1を指定すると、デフォルト値を設定することができます。　この値は、
es_set命令を実行した時に設定される値で、初期値は128となっています。


%index
es_effect
スプライト特殊効果設定
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=スプライトNo.
p2($3ff)=エフェクトパメーター(EP値)
p3(-1)=ライト色RGB値(0〜$ffffff)(未実装)
%inst
スプライトを描画する際のエフェクト(特殊効果)を設定します。
p2で指定する値は、EP値と呼ばれ以下の意味を持っています。
^p
  EP値     内容
-----------------------------------------------------------
  0〜255   αチャンネル値(0=透明、255=不透明)
  +$300    αチャンネルによる合成を有効にする(gmode3相当)
  +$500    元の画像に対して加算合成を行う(gmode5相当)
  +$600    元の画像に対して減算合成を行う(gmode6相当)
^p
この値は、αチャンネル値とgmode命令による合成パラメーターを合わせたものになっています。
デフォルト値は、$3ff(αチャンネル=255、gmode3相当)が設定されています。
p3パラメーターにより、スプライト描画時に特定のライト色を乗算することができます。このパラメーターは現在未実装となっています。


%index
es_fade
スプライト点滅・フェード設定
%group
拡張画面制御命令
%prm
p1,p2,p3
p1(0)=スプライトNo.
p2(1)=フェードモード
p3(30)=タイマー初期値

%inst
p1で指定したスプライトにタイマーを設定して、一定時間だけ点滅やフェードなどを実行します。
p2でフェードモードを設定します。省略した場合は、1(ESSPF_TIMEWIPE)が選択されます。
^p
 フェードモード  マクロ              内容
------------------------------------------------------------------------------------
    1            ESSPF_TIMEWIPE      タイマー時間が経過したら消滅
    2            ESSPF_BLINK         点滅させる、タイマー時間が経過したら終了
    3            ESSPF_BLINKWIPE     点滅させる、タイマー時間が経過したら消滅
    4            ESSPF_BLINK2        ゆっくり点滅させる、タイマー時間が経過したら終了
    5            ESSPF_BLINKWIPE2    ゆっくり点滅させる、タイマー時間が経過したら消滅
    6            ESSPF_FADEOUT       タイマー時間でフェードアウトを行う
    7            ESSPF_FADEOUTWIPE   タイマー時間でフェードアウトを行う、その後消滅
    8            ESSPF_FADEIN        タイマー時間でフェードインを行う
    9            ESSPF_FADEINWIPE    タイマー時間でフェードインを行う、その後消滅
   10            ESSPF_EFADE         タイマー時間の最後にフェードアウトを行う
   11            ESSPF_EFADEWIPE     タイマー時間の最後にフェードアウトを行う、その後消滅
   12            ESSPF_EFADE2        タイマー時間の最後にゆっくりフェードアウトを行う
   13            ESSPF_EFADEWIPE2    タイマー時間の最後にゆっくりフェードアウトを行う、その後消滅
^p
p3でタイマー時間(フレーム数)を指定します。このフレーム数が経過すると、点滅やフェード動作を終了します。
ESSPF_FADEOUT/ESSPF_FADEINは、指定したタイマー時間全体でフェードを行うのに対して、ESSPF_EFADE及びESSPF_EFADEWIPE2は、タイマー時間に関係なく一定の速度でフェードを行います。
p3に-1を設定すると、カウントは無限になります。
%href
es_effect



%index
es_move
スプライト移動
%group
拡張画面制御命令
%inst
この命令は現在未実装となっています。


%index
es_setpri
スプライト優先順位設定
%group
拡張画面制御命令
%prm
p1,p2
p1(0)=スプライトNo.
p2(0)=優先順位(0〜)
%inst
スプライトの優先順位を変更します。
p1で指定したスプライトに、p2で指定した値を設定します。
実際に優先順位に従って描画を行う場合には、es_draw命令で表示するスプライトの優先順位設定パラメーターを指定する必要があります。
%href
es_set
es_draw


%index
es_put
キャラクタ画面表示
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5,p6,p7
p1=表示する左上X座標
p2=表示する左上Y座標
p3=表示するキャラクタNo.
p4=EP値
p5=表示X倍率
p6=表示Y倍率
p7=表示角度

%inst
スプライト用のキャラクタパターンとして登録されているデータを、指定した座標に表示します。
この命令は、スプライトとは関係なく画面にキャラクタを表示する命令です。


%index
es_ang
角度取得
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1=基準点のX座標
p2=基準点のY座標
p3=目的点のX座標
p4=目的点のY座標

%inst
システム変数statに(p1,p2)から見た(p3,p4)の方向が返ります。
es_aimを使っても方向を得ることはできますが、この命令を使えばスプライト
を使わずに方向を得ることができます。


%index
es_cos
三角関数
%group
拡張画面制御命令
%prm
p1
p1=角度(0〜±n) ※n=es_ini第3パラメータで設定した精度
%inst
角度p1のコサインをシステム変数statに代入します。
p1の範囲はes_iniで設定した値までです。
得られる値は、小数部10ビットの固定小数です。つまり、本来得られるべき値
を1024倍した整数が返ってきます。


%index
es_sin
三角関数
%group
拡張画面制御命令
%prm
p1
p1=角度(0〜±n) ※n=es_ini第3パラメータで設定した精度
%inst
角度p1のサインをシステム変数statに代入します。
p1の範囲はes_iniで設定した値までです。
得られる値は、小数部10ビットの固定小数です。つまり、本来得られるべき値
を1024倍した整数が返ってきます。


%index
es_dist
2点間距離算出
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5
p1=結果を代入する変数
p2,p3=点Aの座標
p4,p5=点Bの座標

%inst
(p2,p3)から(p4,p5)までの距離を求め、変数p1に代入します。計算結果は小数
部8bitの固定小数です。


%index
es_bye
スプライトシステム解放
%group
拡張画面制御命令
%inst
標準スプライトシステムの切り離しをします。
確保されていたメモリをすべて解放します。 これは、クリーンアップ関数としてHSP終了時に自動的に呼び出されます。
通常は、特に記述する必要はありません。


%index
es_opt
スプライト反発座標の設定
%group
拡張画面制御命令
%prm
p1,p2
p1=X座標の設定
p2=Y座標の設定

%inst
スプライトに重力を与えた際に、反発する地上の座標を設定します。
この設定を行わない場合、画面の最下段で反発します。


%index
es_patanim
まとめてキャラクタ画像定義
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5
p1(-1)=キャラクタNo.
p2=定義する個数
p3=キャラクタパターンの左上X座標
p4=キャラクタパターンの左上Y座標
p5(0)=表示フレーム数(0)
p6=ウインドウバッファID
%inst
スプライトのキャラクタパターンをまとめて定義します。
^
p1で指定したキャラクタNo.以降に、p2で指定した個数だけキャラクタパターンが登録されます。単一のキャラクタNo.を定義する場合は、es_pat命令を使用してください。
登録されるキャラクタパターンは、画像の中で連続した横並びの領域が対象となります。(p3,p4)の座標からes_sizeで設定した大きさで右方向にパターンが並んでいるものとしてキャラクタが登録されます。
ここで対象となる画像は、picload命令またはcelload命令であらかじめウインドウバッファに読み込んでおく必要があります。
p5で、ウインドウバッファIDが指定されていればそのウインドウバッファから、p5が省略されている場合は、現在の操作先にあたるウインドウバッファから、画像の中の一部を切り出してきてキャラクタパターンとして登録します。
^
p1パラメーターを省略するかマイナス値にした場合は、自動的に空いているキャラクタNo.が割り当てられます。この命令を実行後に、システム変数statに割り当てられたキャラクタNo.が代入されるので、それによってどのNo.が使われたかを知ることができます。
^
p5のパラメータは、キャラクタアニメーションをするための設定です。
0ならば、アニメーションなし。1以上ならば、指定したフレーム数だけそのキャラクタを表示した後、 次のキャラクタ(キャラクタNo.+1)を表示するように設定されます。
^
通常は、p2パラメーターで指定した個数のパターンをp5の待ちフレームで繰り返すアニメーションが定義されます。
p2パラメーターにESSPPAT_1SHOT($1000)を加算した場合、複数のパターンをアニメーション表示後に消滅するパターンを定義します。
%href
es_link
es_pat


%index
es_getpos
スプライト座標取得
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1=スプライトNo.
p2=X座標が代入される変数名
p3=Y座標が代入される変数名
p4(0)=設定オプション

%inst
スプライト座標などのX,Y情報を取得して2つの変数に代入します。
p1でスプライトNo.を指定して、p2,p3パラメーターで代入される変数を設定します。
p4の設定オプションにより、どのような座標を取得するかを指定できます。
^p
   p4    マクロ名        内容
--------------------------------------------------
      0  ESSPSET_POS     スプライトX,Y座標
      1  ESSPSET_ADDPOS  スプライトX,Y移動成分
      2  ESSPSET_FALL    スプライトX,Y落下速度
      3  ESSPSET_BOUNCE  スプライトバウンド係数
      4  ESSPSET_ZOOM    スプライトX,Y表示倍率
 0x1000  ESSPSET_DIRECT  直接32bit値を取得する
^p
es_getpos命令が取得する座標値は、内部では16bit固定小数になっています。通常は、自動的に変換されますが、設定オプションにESSPSET_DIRECTを付加することで、変換は無効になります。

%href
es_set
es_pos


%index
es_bgmap
BGマップを初期化
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1=BGNo.(0〜15)
p2=マップデータを格納する変数名
p3(16)=マップ全体のXサイズ
p4(16)=マップ全体のYサイズ
p5(16)=マップ表示部分のXサイズ
p6(16)=マップ表示部分のXサイズ
p7(0)=マップパーツを格納する画面バッファID
p8(0)=設定オプション

%inst
任意のサイズを持つBGマップを初期化します。
p1で初期化するBGNo.を指定します。BGNo.は0〜15までを指定可能です。
p2にマップデータを格納する変数を指定します。
この変数はあらかじめ、「マップ全体のXサイズ×マップ全体のYサイズ」の要素を持つ配列変数としてdim命令で初期化されている必要があります。
(p3,p4)でマップ全体のX,Yサイズを指定します。
(p5,p6)でマップを表示する部分のX,Yサイズを指定します。
p3〜p6のパラメーターは、いずれもマップパーツの単位となります。たとえば、全体サイズが4×4だった場合は、「dim map,4*4」で初期化した変数を指定することになります。
この変数は、直接マップデータの内容を持ち値が0の場合は、マップパーツ(セルID)が0というように、パーツのIDをそのまま格納します。
p7で、マップパーツの画像が読み込まれている画面バッファIDを指定します。このバッファには、あらかじめpicloadまたはcelload命令により画像を読み込んでおく必要があります。(マップパーツ画像は、celdiv命令によりパーツサイズを設定してください。)
p8の設定オプションにより、BGマップの挙動を設定します。この項目は、将来拡張するための項目で現在は未実装となっています。
^
es_bgmap命令はマップ表示に関する設定を行います。実際のマップ表示は、es_putbg命令で行います。
%href
es_putbg
dim
celload
celdiv


%index
es_putbg
BGマップを表示
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5
p1=BGNo.(0〜15)
p2(0)=表示開始X座標
p3(0)=表示開始Y座標
p4(0)=表示開始マップX位置
p5(0)=表示開始マップY位置

%inst
指定されたBGNo.のBGマップを表示します。
あらかじめes_bgmap命令でBGマップのサイズやパーツ情報などを初期化する必要があります。
(p2,p3)パラメーターで画面上の表示開始位置(左上)を指定します。
(p4,p5)パラメーターでマップの表示開始位置(左上)をドット単位で指定します。
通常は、マップ全体の中で(0,0)の位置からマップを表示します。
マップの表示開始位置を指定することにより、全体マップの一部を表示している時の、左上にあたるマップの位置を変更することができます。
広いマップをスクロール表示させるような場合に、マップの表示開始位置(p4,p5)を利用することができます。
%href
es_bgmap


%index
es_bgmes
BGマップに文字列を書き込み
%group
拡張画面制御命令
%prm
p1,p2,p3,"str",p4
p1(0)=BGNo.(0〜15)
p2(0)=マップX位置
p3(0)=マップY位置
"str"=書き込み文字列
p4(0)=文字コードオフセット値

%inst
指定されたBGNo.のBGマップに、"str"で指定された文字列のコードを書き込みます。
あらかじめes_bgmap命令でBGマップのサイズやパーツ情報などを初期化する必要があります。
es_bgmes命令は、BGマップとしてASCIIコード順の文字フォントを表示できる状態であることを前提に動作します。
(p2,p3)で指定されたマップの位置から、文字列に含まれる文字コードを右に向かって書き込みます。
^
p4パラメーターで、文字コードに対するオフセット値を指定します。通常は0か省略して構いません。たとえば「A」という文字は文字コード65で、65という値をマップに対して書き込みます。
改行コードが含まれている場合は、次の行に移動します。

%href
es_bgmap


%index
es_setparent
スプライトの親設定
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=スプライトNo.
p2=親となるスプライトNo.
p3=設定オプション

%inst
指定したスプライトの親にあたるスプライトを設定します。
p2パラメーターに親のスプライトNo.を設定することにより、親の座標からの相対的な座標にスプライトが表示されるようになります。
p2にマイナス値を指定した場合は、親スプライトの設定を解除し、通常のスプライト表示に戻ります。
^
p3パラメーターの設定オプションは通常は0を指定してください。
p3に1を指定することにより、BGマップを親として表示するスプライト設定になります。その場合は、p2パラメーターにBGNo.を指定することができます。


%index
es_modaxis
スプライト情報をまとめて変更
%group
拡張画面制御命令
%prm
p1,p2,p3
p1(0)=開始スプライトNo.
p2(-1)=終了スプライトNo.
p3(0)=type値オプション
p4(0)=変化させるX値
p5(0)=変化させるY値
p6(0)=設定オプション

%inst
p1からp2までのNo.を持つスプライトに対して、まとめて座標を変化させます。
p1,p2の指定を省略した場合は、すべてのスプライトが対象となります。
^
p3でtype値を指定することができます。p3に4を指定した場合は、type値4を持つスプライトが対象となります。
p3パラメーターを省略するか0を指定した場合は、すべてのtype値が対象となります。
^
(p4,p5)パラメーターでスプライトの座標パラメーターX,Yそれぞれに加算する値を指定することができます。マイナス値を指定した場合は、減算となります。
変更の対象となるスプライトすべてに、ここで指定した値が加算(減算)されることになります。
^
p6の設定オプションにより、スプライトのX,Y座標以外を設定することができます。
^p
   p4    マクロ名        内容
--------------------------------------------------
      0  ESSPSET_POS     スプライトX,Y座標
      1  ESSPSET_ADDPOS  スプライトX,Y移動成分
      2  ESSPSET_FALL    スプライトX,Y落下速度
      3  ESSPSET_BOUNCE  スプライトバウンド係数
      4  ESSPSET_ZOOM    スプライトX,Y表示倍率
 0x1000  ESSPSET_DIRECT  直接32bit値を設定する
 0x2000  ESSPSET_MASKBIT 固定小数部分を保持する
^p
設定オプションの内容は、es_pos命令と同じものを使用できます。

%href
es_pos



%index
es_arot
スプライト自動回転ズーム設定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1(0)=スプライトNo.
p2(0)=1フレームに加算する回転角度
p3(0)=1フレームにX方向に加算する倍率(1/100)
p4(0)=1フレームにY方向に加算する倍率(1/100)

%inst
スプライトに設定された回転角度、X倍率、Y倍率を自動的に加算するための設定をします。
p1でスプライトNo.、p2に1フレームに加算する回転角度、p3,p4でX,Y方向にそれぞれ加算する倍率を指定します。
p3,p4の値はes_setrot命令の倍率設定と同様に、1倍を100とする単位で計算されます。
^
指定されたスプライトは、1フレームごとに指定された値が加算されることになります。
p2,p3,p4の値にすべて0を指定した場合は、自動的な加算は行われません。
%href
es_setrot
es_apos


%index
es_bgparam
BGマップパラメーター設定
%group
拡張画面制御命令
%prm
p1,p2,p3
p1(0)=BGNo.(0〜15)
p2(0)=設定値
p3(0)=設定タイプ

%inst
BGマップの各種パラメーター値を設定します。
p1パラメーターでBGNo.を指定します。BGNo.は0〜15までを指定可能です。
p3パラメーターで指定された設定タイプに、p2パラメーターの値を設定します。
設定タイプは以下の値を指定することができます。
^p
  設定タイプ値　マクロ名           内容
------------------------------------------------------------
           0    ESMAP_PRM_GMODE    エフェクトパメーター(EP値)
           1    ESMAP_PRM_ANIM     アニメーションインデックス値
           2    ESMAP_PRM_GROUP    アトリビュートグループ値
           3    ESMAP_PRM_OPTION   BG設定オプション値(ESBGOPT_*)
^p
何らかの理由で設定に失敗した時は、システム変数statに0以外の値が返ります。
%href
es_bgmap
es_putbg


%index
es_bgattr
BGマップアトリビュート値を設定
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1(0)=BGNo.(0〜15)
p2(0)=キャラクタNo.(開始)
p3($ffff)=キャラクタNo.(終了)
p4(0)=アトリビュート値(0〜255)
%inst
BGマップのアトリビュート値を設定します。
アトリビュート値は、BGマップが使用するキャラクターNo.ごとに設定される補助的な情報です。
p1でBGNo.を指定します。BGNo.は0〜15までを指定可能です。
p2とp3で指定されたキャラクターNo.の範囲に、p4で指定された値がアトリビュート値として設定されます。
アトリビュート値は、0から255までの値を設定することができます。この情報は、es_bghit命令によるBGとの当たり判定に使用されます。
アトリビュート値を示すためのマクロが定義されています。以下のような意味を持っています。
^p
      値　マクロ名         内容
--------------------------------------------------
       0  ESMAP_ATTR_NONE  侵入可能な場所(デフォルト)
       1  ESMAP_ATTR_ITEM  侵入可能で当たり判定あり(アイテムなど)
     128  ESMAP_ATTR_HOLD  侵入可能だが足場になる
     192  ESMAP_ATTR_WALL  侵入不可の壁
 0x10000  ESMAP_ATTR_MAX   キャラクタNo.の最大値
^p
何らかの理由で設定に失敗した時は、システム変数statに0以外の値が返ります。
%href
es_bgmap
es_putbg
es_getbgattr
es_bghit


%index
es_getbgattr
BGマップアトリビュート値を取得
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=アトリビュート値が代入される変数名
p2(0)=BGNo.(0〜15)
p3(0)=キャラクタNo.
%inst
es_bgattr命令によって設定されたBGマップのアトリビュート値を取得します。
アトリビュート値は、BGマップが使用するキャラクターNo.ごとに設定される補助的な情報です。0から255までの値が設定されており、es_bghit命令によるBGとの当たり判定に使用されます。
p2でBGNo.を指定します。BGNo.は0〜15までを指定可能です。
p3で指定されたキャラクターNo.に設定されたアトリビュート値が、p1で指定された変数に代入されます。p1の変数は自動的に整数型として設定されます。
何らかの理由で設定に失敗した時は、システム変数statに0以外の値が返ります。
%href
es_bgmap
es_putbg
es_bgattr


%index
es_bghit
BGマップとの当たり判定を実行
%group
拡張画面制御命令
%prm
p1,p2,p3,p4,p5,p6,p7,p8
p1(0)=BGNo.(0〜15)
p2(0)=判定を行うBG上のX座標(ドット単位)
p3(0)=判定を行うBG上のY座標(ドット単位)
p4(0)=判定を行うXサイズ(ドット単位)
p5(0)=判定を行うYサイズ(ドット単位)
p6(0)=X方向の移動量
p7(0)=Y方向の移動量
p8(0)=座標モードスイッチ(0=16bit/1=32bit)
%inst
BGマップに設定されたアトリビュート値をもとに当たり判定を実行します。
あらかじめ、es_bgattr命令によりアトリビュート値を設定する必要があります。
es_bghit命令は、任意の矩形を移動させた場合にBGマップのキャラクタに接触するかどうかを判定し、結果のリストを作成します。結果は、es_getbghit命令により取得することが可能です。
p1でBGNo.を指定します。BGNo.は0〜15までを指定可能です。
(p2,p3)パラメーターで、矩形の左上座標を指定します。これはBGマップ上の座標をドット単位で指定します。
(p4,p5)パラメーターで、矩形のX,Yサイズをドット単位で指定します。
(p6,p7)パラメーターで、移動させるX,Y方向の移動量をドット単位で指定します。
命令実行後に、システム変数statに当たり判定結果が作成された個数が代入されます。通常は少なくとも1個以上の結果が作成されます。
p8パラメーターが1の場合は、(p2,p3)及び(p6,p7)の座標値をドット単位ではなく標準スプライトの32bit値(下位16bitを含めた座標)として扱います。
何らかの理由で設定に失敗した時は、システム変数statに0の値が返ります。
複数のキャラクタに同時に当たった場合などは、複数の結果が作成されます。その場合は、es_getbghit命令で結果のインデックス値を指定して取得してください。
%href
es_bgmap
es_putbg
es_bgattr
es_getbghit


%index
es_getbghit
BGマップとの当たり判定結果を取得
%group
拡張画面制御命令
%prm
p1,p2,p3
p1=当たり判定結果が代入される変数名
p2(0)=BGNo.(0〜15)
p3(0)=判定結果インデックス(0〜)
%inst
es_bghit命令によって実行されたBGマップ当たり判定の結果を取得します。
BGマップの当たり判定は、BGマップが使用するキャラクターNo.ごとに設定されたアトリビュート値をもとに実行されます。アトリビュート値は、es_bgattr命令で設定することができます。
p2パラメーターでBGNo.を指定します。BGNo.は0〜15までを指定可能です。
p3パラメーターで判定結果インデックスを指定します。これは判定結果が複数作成された場合のインデックス値で、0から開始されます。
判定結果がいくつ作成されたかどうかは、es_bghit命令実行後にシステム変数statに代入されます。
es_getbghit命令実行後に、p1パラメーターで指定された変数に情報が代入されます。p1の変数は自動的に整数型の配列変数として設定されます。
変数の配列要素0〜6に結果が代入されます。たとえば、resultという変数の場合は、result(0)〜result(6)までに結果が代入されます。
^p
    配列要素　内容
----------------------------------------------------------
         (0)  判定結果(ESMAPHIT_*)
         (1)  接触したキャラクタNo.
         (2)  接触したキャラクタNo.のアトリビュート値
         (3)  接触したマップのX座標
         (4)  接触したマップのY座標
         (5)  判定した座標の左上X座標
         (6)  判定した座標の左上Y座標
^p
変数(0)の内容は、判定結果になります。この値は、ESMAPHIT_*というマクロで定義されています。
アトリビュート値をもとに以下の値が代入されます。
^p
      値　マクロ名        内容
--------------------------------------------------
       0  ESMAPHIT_NONE   接触なし(移動可能)
       1  ESMAPHIT_HITX   X方向の移動時に接触あり
       2  ESMAPHIT_HITY   Y方向の移動時に接触あり
       4  ESMAPHIT_EVENT  接触情報あり(移動可能)
^p
es_getbghit命令実行後に、正しく結果が取得された場合は、システム変数statに0が代入されます。
何らかの理由で取得に失敗した時は、システム変数statはマイナス値が返ります。
%href
es_bgmap
es_putbg
es_bgattr
es_bghit


%index
es_move
スプライト描画
%group
拡張画面制御命令
%prm
p1,p2,p3,p4
p1(1)=移動を行うフレーム数(1〜)
p2(0)=移動開始スプライトNo.
p3(-1)=移動するスプライトの個数
p4(0)=アニメーション制御フラグ(0〜1)
%inst
スプライトの移動処理を行います。 es_draw命令からスプライトの描画を抜いたもので、主に処理落ち時のフレームスキップに用います。
p1パラメーターで指定されたフレーム数だけ、移動処理が実行されます。
登録されているスプライトの一部だけを移動したい場合は、p2に開始スプライトNo.、p3に描画する個数を指定してください。
p2,p3の指定を省略した場合は、すべてのスプライトが移動対象になります。
^
p4パラメーターにより、アニメーション処理を保留することができます。
^p
 値  内容
------------------------------------------------------------------------
  0  アニメーションを行う
  1  アニメーションを行わない
^p
この命令は、古いライブラリ(hspdxfix)との互換のために用意されたものです。同様の処理は、es_draw命令でも実現可能ですので、通常はes_draw命令をご使用ください。
この命令を実行するとシステム変数statに移動対象として認識されたスプライトの個数が返ります。
%href
es_draw


