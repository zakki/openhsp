#ifndef __MOD_DIRBOX
#define __MOD_DIRBOX
;
;
;============================================================
; mod_dirbox
;	リストボックスを使ったファイル選択を行います
;	「#include "mod_dirbox.as"」を追加することで
; 	以下の命令を使用できるようになります
;	サンプル「sample/new36/dirbox.hsp」を参考にしてください

;
; dirbox "filter",option,xsize,ysize
; 	"filter" : dirlist命令のフィルタと同じ、通常は「*.*」を指定
; 	 option  : dirlist命令の取得モードと同じ、通常は0を指定
; 	 xsize,ysize : ファイル選択オブジェクトのX,Yサイズ
;
;	カレントフォルダのファイル一覧を表示して選択できるようにします
;	必ず、一定時間ごとにdirbox_getを呼び出して選択を確認してください
;	結果は、dirbox_fullname,dirbox_nameで取得できます
;
; dirbox_refresh
; 
; 	カレントフォルダのファイル一覧を再取得します
; 
;
; dirbox_get var
; 	var : 結果が代入される変数
; 
; 	dirboxの選択動作を実行します
;	wait/await命令を含むループの中で呼び出してください
;	varに0が代入された場合は通常の処理、
;	1が代入された場合は、ダブルクリックでファイルが選択されたことを示します
;
; dirbox_fullname var
; 	var : 結果が代入される変数
; 
; 	最後に選択されたファイル名をフルパスで取得します
;	varで指定した変数に文字列としてパスの情報が入ります
;
; dirbox_name var
; 	var : 結果が代入される変数
; 
; 	dirbox_fullnameと同様ですが、パス名のないファイル名のみを取得します
; 
;

#module

#deffunc dirbox str _p1, int _p2, int _p3, int _p4

	sdim buf,$10000
	sdim s1,256
	d_filter=_p1
	d_option=_p2
	d_result=-1
	if d_filter="" : d_filter="*.*"

	gosub *dive_dirs

	objsize _p3,_p4
	listbox d_result,,buf
	d_objid = stat
	d_objcnt=objinfo(d_objid,16)

	return

*dive_dirs
	dirlist mydirs,"*.*",5
	d_mydir=dir_cur
	if strlen(d_mydir)>3 : mydirs="..\n"+mydirs
	notesel mydirs
	repeat notemax
		noteget s1,cnt
		noteadd "<"+s1+">",cnt,1
	loop
	noteunsel

	dirlist buf,d_filter,d_option
	buf+=mydirs
	sortnote buf,0
	return


#deffunc dirbox_refresh

	gosub *dive_dirs
	objprm d_objid,buf
	return


#deffunc dirbox_name var _p1

	if d_result<0 : _p1="" : return
	notesel buf
	noteget _p1,d_result
	noteunsel
	return

#deffunc dirbox_fullname var _p1

	if d_result<0 : _p1="" : return
	dirbox_name s1
	_p1=d_mydir+"\\"+s1
	return

#deffunc dirbox_get var _p1

	i=objinfo(d_objid,16)
	if i!=d_objcnt : goto *sel_name
	_p1=0
	return

*sel_name
	d_objcnt=i
	dirbox_name s1
	if peek(s1,0)='<' : goto *sel_name2
	_p1=1
	return
*sel_name2
	len=strlen(s1)-2
	s1=strmid(s1,1,len)
	chdir s1
	dirbox_refresh
	_p1=0
	return


#global
#endif

