
;	form_decodeモジュール
;	form_decode命令を使用するには以下の行を最初に入れてください
;
;	#include "form_decode.as"
;
#module
	;	form_decode命令
	;	form_decode 文字変数1, 文字変数2, 変換スイッチ
	;
	;	送信用にエンコードされたテキストを元の日本語にデコードします。
	;	文字変数2の内容をデコードして文字変数1に格納します。
	;	変換スイッチを1にすると'&'を改行に変換。
	;		     2にすると'+'を空白に変換。
	;		     3にすると両方とも変換します。
	;
#deffunc form_decode var cnvbf,var txtbf,int sw
	sz=strlen(txtbf)
	i=0 :w=0
*cnv
	a=peek(txtbf,i)
	if a='%' { c=strmid(txtbf,i+1,2)			; 日本語変換
		 c="$"+c :a=int(c) :i+=2
	}
	if (sw&1>0)&(a='&') :poke cnvbf,w,13 :a=10 :w+		; '&'は改行に
	if (sw&2>0)&(a='+') :a=32				; '+'は空白に
	poke cnvbf,w,a :i+ :w+
	if (a!0)&(w<sz) :goto *cnv
	return

#global
