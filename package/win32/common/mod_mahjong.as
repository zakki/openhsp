;----------------------------------------------------------------
; �����v�Ǘ����W���[�� / onitama 2022
; (�ȈՓI�Ȗ����̏������܂Ƃ߂����̂ł��A���S�ȃ��[���Ɠ_���v�Z�ɂ͑Ή����Ă��܂���)
;  �g�p�Ɋւ��鐧���͂���܂���B�����R�ɂ��g�����������B
;----------------------------------------------------------------

#ifndef __MOD_MAHJONG
#define __MOD_MAHJONG

#module "mod_mahjong"

#pack "janpai.png"

#define global MJID_WAN 1
#define global MJID_PIN 11
#define global MJID_SOU 21
#define global MJID_KAZE 31
#define global MJID_SANGEN 35
#define global MJID_URA 38
#define global MJID_FUSE 39
#define global MJID_MAX 40

#define global MJP_SX 36
#define global MJP_SY 54

#const global MJ_PMAX (34*4)	; �v��ID�ő�l
#define global MJ_HAND 14		; ��z�̐�


#deffunc mj_load int _p1

	;	mj_load id
	;
	;	�v�̉摜�ǂݍ���(id�ɓǂݍ��݉�ʃo�b�t�@ID)
	;
	mj_pcg=_p1
	if mj_pcg<=0 : mj_pcg=3
	celload "janpai.png",mj_pcg
	celdiv mj_pcg,MJP_SX,MJP_SY
	return

#deffunc mj_reset

	;	mj_reset
	;
	;	�v�̃��Z�b�g(�V���b�t��)
	;
	dim pai,MJ_PMAX:pnum=0
	repeat 4
	  repeat 9
	    pai.pnum=cnt+MJID_WAN:pnum++
	    pai.pnum=cnt+MJID_PIN:pnum++
	    pai.pnum=cnt+MJID_SOU:pnum++
	  loop
	  repeat 7
	    pai.pnum=cnt+MJID_KAZE:pnum++
	  loop
	loop
	repeat MJ_PMAX
	a=rnd(MJ_PMAX):b=pai(cnt)
	pai(cnt)=pai(a):pai(a)=b
	loop
	pnum=0
	return

#deffunc mj_put int _p1

	;	mj_put id
	;
	;	�v�̕\��(id=�v��ID)
	;
	if mj_pcg<=0 : return
	if _p1<=0 : return
	celput mj_pcg,_p1
	return

#deffunc mj_draw var _p1

	;	mj_draw var
	;
	;	�v��1������(var�̕ϐ��ɔv��ID������)
	;
	if pnum>=MJ_PMAX : _p1=0 : return
	_p1=pai(pnum):pnum++
	return

#deffunc mj_handcopy array _p1,array _p2

	;	mj_handcopy var, var2
	;
	;	��v�̃R�s�[(var=var2)
	;
	memcpy _p1,_p2,4*MJ_HAND
	return


#deffunc mj_handsort array _p1

	;	mj_handsort var
	;
	;	��v�̃\�[�g(var�̕ϐ��Ɏ�v������)
	;
	dim hand2,MJ_HAND
	dim hand3,MJ_HAND
	dim table,MJID_MAX
	a=0
	memcpy hand2,_p1,4*MJ_HAND
	repeat MJID_URA:n=cnt
	  repeat MJ_HAND
	  if hand2(cnt)=n {
	    hand3(a)=n
	    hand2(cnt)=-1
	    table(n)+
	    a+
	  }
	  loop
	  if a>=MJ_HAND : break
	loop
	memcpy _p1,hand3,4*MJ_HAND
	return

#deffunc mj_handchk var _p1

	;	mj_handchk var
	;
	;	��v�̏オ��`�F�b�N(var�Ɍ��ʁAmj_handsort�����邱��)
	;	(����:0=�Ȃ�/1=�a��)
	;
	win=0
	_p1=0
	gosub *agari1
	if win : _p1=win : return
	gosub *agari2
	if win : _p1=win : return
	return

*agari1
	;	��{�`�`�F�b�N
	atama=0
*ag1
	dim ctable,38
	memcpy ctable,table,38*4
*ag2
	if atama>=38 : return
	if ctable(atama)<2 : goto *ag3
	ctable(atama)-=2
	check=0:koutu=0:syuntu=0
*ag4
	if ctable(check)>=3 {
	  ctable(check)-=3:koutu++
	}
	a=check
	if ctable(a)=0 : goto *ag5
	if a>=MJID_KAZE : goto *ag6
	a+:if ctable(a)=0 : goto *ag6
	a+:if ctable(a)=0 : goto *ag6
	a=check:ctable(a)-
	a+:ctable(a)-
	a+:ctable(a)-
	syuntu++:goto *ag4
*ag5
	check+:if check<38 : goto *ag4
	win=1:return
*ag6
	atama+:goto *ag1
*ag3
	atama+:goto *ag2


*agari2
	;	�a���`�F�b�N(���Ύq)
	toitu=0
	repeat 38
	if table(cnt)>=2 : toitu++
	loop
	if toitu>=7 : win=2
	return


#deffunc mj_getwin var _p1, var _p2, var _p3

	;	mj_getwin var,var2,var3
	;
	;	�オ�茋�ʂ��擾(mj_handchk�Řa�����Ă��邱��)
	;	var  = ��
	;	var2 = ���q
	;	var3 = ���q
	;
	sdim yakulist,$4000
	if win=1 : yakulist+="�a��\n"
	if win=2 : yakulist+="���Ύq\n"

	_p1=yakulist
	_p2=syuntu
	_p3=koutu

	return


#global
#endif

