
;	form_decode���W���[��
;	form_decode���߂��g�p����ɂ͈ȉ��̍s���ŏ��ɓ���Ă�������
;
;	#include "form_decode.as"
;
#module
	;	form_decode����
	;	form_decode �����ϐ�1, �����ϐ�2, �ϊ��X�C�b�`
	;
	;	���M�p�ɃG���R�[�h���ꂽ�e�L�X�g�����̓��{��Ƀf�R�[�h���܂��B
	;	�����ϐ�2�̓��e���f�R�[�h���ĕ����ϐ�1�Ɋi�[���܂��B
	;	�ϊ��X�C�b�`��1�ɂ����'&'�����s�ɕϊ��B
	;		     2�ɂ����'+'���󔒂ɕϊ��B
	;		     3�ɂ���Ɨ����Ƃ��ϊ����܂��B
	;
#deffunc form_decode var cnvbf,var txtbf,int sw
	sz=strlen(txtbf)
	i=0 :w=0
*cnv
	a=peek(txtbf,i)
	if a='%' { c=strmid(txtbf,i+1,2)			; ���{��ϊ�
		 c="$"+c :a=int(c) :i+=2
	}
	if (sw&1>0)&(a='&') :poke cnvbf,w,13 :a=10 :w+		; '&'�͉��s��
	if (sw&2>0)&(a='+') :a=32				; '+'�͋󔒂�
	poke cnvbf,w,a :i+ :w+
	if (a!0)&(w<sz) :goto *cnv
	return

#global
