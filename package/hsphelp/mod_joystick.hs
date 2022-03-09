%ver
3.6
%date
2020/06/04
%group
入出力制御命令

%type
ユーザー拡張命令

%note
mod_joystick2.asをインクルードすること。

%author
MIA / onitama

%dll
mod_joystick2

%port
Win
%index
joyGetPosEx
ジョイスティックの入力を取得する

%prm
p1, p2
p1 : 入力状態を代入する数値型配列変数
p2 : ポート番号

%inst
ジョイスティックの入力を取得します。
配列変数p1には以下の情報が代入されます。

	data(0) = 常に 52  が入ります
	data(1) = 常に 255 が入ります
	data(2) = 第 1 軸の状態（普通のジョイスティックの X 軸）
	data(3) = 第 2 軸の状態（普通のジョイスティックの Y 軸）
	data(4) = 第 3 軸の状態（スロットル等）
	data(5) = 第 4 軸の状態
	data(6) = 第 5 軸の状態
	data(7) = 第 6 軸の状態
	data(8) = ボタンの状態（最大32ボタン）
	data(9) = 同時に押されているボタンの数
	data(10) = POV スイッチの状態
	data(11) = 予備情報1
	data(12) = 予備情報2

システム変数statが0であれば入力は正常です。

%sample
	repeat
		redraw 0
		color 255,255,255 : boxf : color 0,0,0
		joyGetPosEx data, 0
		pos 0,0 : mes "stat = " + stat
		repeat 13 : mes data(cnt) : loop
		redraw 1 : await 30
	loop

%href
jstick

%index
jstick
stick命令互換の値を取得する

%prm
p1, p2, p3
p1 : 代入する変数
p2 : 非トリガータイプキー指定
p3 : ポート番号

%inst
stick命令互換の値を変数に返します。
stick命令によるキーボードの取得も同時に行い、ジョイスティックとキーボードの入力に同時に対応します。
p1,p2で指定されたパラメーターは、stick命令と同じ機能を持ちます。
キーボードから取得された情報は、ポート番号とは関係なく反映されますのでご注意ください。
ジョイスティックの取得などでエラーが発生した場合は、以降の取得がキャンセルされ、再度接続された場合に取得を再開します。
使用する場合は、「#include "mod_joystick2.as"」を記述してください。
(従来の「mod_joystick.as」を指定した場合は、以前の古い仕様で動作し、エラーの復帰などは行われません。)

%href
joyGetPosEx
stick

