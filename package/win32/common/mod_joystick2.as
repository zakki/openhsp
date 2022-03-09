;----------------------------------------------------------------
; ジョイスティック入力モジュール2
; jstick命令をstick命令互換でジョイスティック対応にします
; (mod_joystickの上位互換としても使用できます)
;  MIA 2004 / onitama 2005,2020
;  使用に関する制限はありません。ご自由にお使いください。
;----------------------------------------------------------------
;2020/4 修正
;jstick命令をstick命令と互換にして、キーボードの値も取得するようにしました。
;stick命令をjstick命令に置き換えるだけでジョイスティック対応になります。
;「jstick 変数,トリガー指定,ポート番号」の書式で使用できます。
;
;エラーの処理と自動復帰にも対応しています。
;(エラーが発生している間は、変数「modjoy_err(ポート)」が1になります。)
;変数「modjoy_err(ポート)」が0の間はジョイスティックの値を取りにいきます。
;(※既存のjstick命令はjstick_org命令に置き換えました)

#module "joy"

#const BORDER_LOW   32768 - 4096
#const BORDER_HIGH  32768 + 4096

#uselib "winmm.dll"
#func _joyGetPosEx "joyGetPosEx" int, var

#deffunc joyGetPosEx array p1, int p2
	p1.15=0:p1=52,255
	_joyGetPosEx p2,p1
	return

#deffunc jstick_org var p1, int p2

	;	jstick 変数,ポート番号
	;	(stick命令互換の値を変数に返す)
	;
	if length(modjoy_err@)=1 {
		dim modjoy_err@,16
	}
	if modjoy_err@(p2) : goto *jstick_resume
	;
	jdata.15=0:jdata=52,255
	_joyGetPosEx p2,jdata
	if stat!=0 : goto *jstick_err
	res=(jdata.8)<<4
	if jdata.2<BORDER_LOW : res|=1
	if jdata.2>BORDER_HIGH : res|=4
	if jdata.3<BORDER_LOW : res|=2
	if jdata.3>BORDER_HIGH : res|=8
	p1=res
	return
*jstick_resume
	_joyGetPosEx p2,jdata
	if stat!=0 : goto *jstick_err
	p1=0
	modjoy_err@(p2)=0
	return
*jstick_err
	p1=0
	modjoy_err@(p2)=1
	return

#deffunc jstick var _p1, int _p2, int _p3

	;	jstick 変数,ポート番号
	;	(stick命令互換の値を変数に返す)
	;
	stick@hsp key_now,$3ffff
	jstick_org jkey,_p3
	key_now|=jkey
	trg_key=key_now^last_key&key_now
	last_key=key_now
	_p1 = (last_key & _p2) + ( trg_key & (0xfffff ^ _p2) )
	return

#global



;----------------------------------------------------------------
; サンプルコード
;----------------------------------------------------------------
;----------------------------------------------------------------
; joyGetPosEx data, ポート番号
;   stat = 0 であれば入力は正常です。
;	data.0 = 常に 52  が入ります
;	data.1 = 常に 255 が入ります
;	data.2 = 第 1 軸の状態（普通のジョイスティックの X 軸）
;	data.3 = 第 2 軸の状態（普通のジョイスティックの Y 軸）
;	data.4 = 第 3 軸の状態（スロットル等）
;	data.5 = 第 4 軸の状態
;	data.6 = 第 5 軸の状態
;	data.7 = 第 6 軸の状態
;	data.8 = ボタンの状態（最大32ボタン）
;	data.9 = 同時に押されているボタンの数
;	data.10 = POV スイッチの状態
;	data.11 = 予備情報1
;	data.12 = 予備情報2
;----------------------------------------------------------------
/*
	repeat
		redraw 0
		color 255,255,255 : boxf : color 0,0,0
		joyGetPosEx data, 0
		pos 0,0 : mes "stat = " + stat
		repeat 13 : mes data.cnt : loop
		redraw 1 : await 30
	loop
*/

