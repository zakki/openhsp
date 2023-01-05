#ifndef __DOT_FW
#define __DOT_FW

#include "hsp3dish.as"
#include "layer_fade.as"
#include "mod_joystick2.as"

;
;
;============================================================
; �쉹�h�b�g�t���[�����[�N
;  �h�b�g�G���g����2D�Q�[�������̃t���[�����[�N
;  (HSP3�ėp���C�u����)

	randomize
	_dotfw_flag = 0					; �������t���O
	_dotfw_opt = 0					; �ݒ�I�v�V����
	_dotfw_style = 0				; �Q�[���X�^�C��
	_dotfw_sx = 320					; ���T�C�Y
	_dotfw_sy = 224					; �c�T�C�Y
	_dotfw_dir = 0					; ����=0,�c��=1
	_dotfw_zoom = 300				; �E�C���h�E�\���g�嗦
	_dotfw_aspect = 100				; �A�X�y�N�g��
	_dotfw_fps = 60					; �t���[�����[�g
	_dotfw_sprmax = 256				; �G�t�F�N�g�X�v���C�g�ő吔
	_dotfw_essmax = 1024			; HSP3Dish�X�v���C�g�ő吔
	_dotfw_bgpic_max = 6			; �w�iBG�ő吔
	_dotfw_frame = 0				; �t���[��
	_dotfw_enemy = 0				; �G�\����
	_dotfw_player = 0				; �v���C���[�\����
	_dotfw_effect = 0				; �G�t�F�N�g�\����
	_dotfw_cursp = 0				; �J�����g�X�v���C�g
	_dotfw_hitsp = 0				; �ڐG�X�v���C�g
	_dotfw_curemode = 0				; �J�����g�G���[�h
	_dotfw_curemis = 0				; �J�����g�G�~�T�C��
	_dotfw_interval = 8				; �A�˃C���^�[�o��
	_dotfw_myx =0					; �v���C���[X
	_dotfw_myy =0					; �v���C���[Y
	_dotfw_cx =0					; �GX
	_dotfw_cy =0					; �GY
	_dotfw_movex =0					; �ړ�����X
	_dotfw_movey =0					; �ړ�����Y
	_dotfw_enemy_turn =0			; �G�ݒ�(�^�[����)
	_dotfw_enemy_timer =0			; �G�ݒ�(�^�C�}�[�l)
	_dotfw_enemy_speed =0			; �G�ݒ�(���x%)
	_dotfw_enemy_dir =0				; �G�ݒ�(����)
	_dotfw_enemy_exprm =0			; �G�ݒ�(exprm)
	_dotfw_update_flag =0			; �X�V�t���O(UPDATE_*)

	_dotfw_soundflag = 0			; �T�E���h�������t���O(0=none/1=OK)
	_dotfw_music = 0				; �T�E���h(���y)�Ή�
	_dotfw_se = 0					; �T�E���h(���ʉ�)�Ή�
	dim _dotfw_res, 16
	_dotfw_resmax = 0
	sdim _dotfw_cfghash,256
	sdim s1,256
	sdim s2,256
	sdim s3,256
	key = 0							; �L�[�R�[�h(stick�̒l)

#module HSP3MOD_DOTFW

#define global DOTFW_AFONT (0)
#define global DOTFW_BFONT (1)
#define global DOTFW_CFONT (2)

#define global DOTFW_FONTID (3)
#define global DOTFW_TAMAID (4)
#define global DOTFW_STARID (5)
#define global DOTFW_TAMARES "tamane16.png"

#const global DOTFW_CHRX 16
#const global DOTFW_CHRY 16

#const global STYLE_DEFAULT (0)
#const global STYLE_SHOOT (1)
#const global STYLE_JUMP (2)

#const global UPDATE_NOWAIT (1)
#const global UPDATE_PAUSE (2)

#const global TYPE_NONE (0)
#const global TYPE_PLAYER (1)
#const global TYPE_NPC (2)
#const global TYPE_ITEM (4)
#const global TYPE_PMISSLE (8)
#const global TYPE_PBOMB (16)
#const global TYPE_EMISSLE (32)
#const global TYPE_ENEMY (64)

#const global DIR_UP (128)
#const global DIR_DOWN (0)
#const global DIR_LEFT (192)
#const global DIR_RIGHT (64)
#const global DIR_AIM (-1)

#const global CHR_TAMANE (0)
#const global CHR_TAMANE2 (4)
#const global CHR_TAMANE3 (8)
#const global CHR_TAMANE4 (12)
#const global CHR_MONSTER1 (16)
#const global CHR_MONSTER2 (18)
#const global CHR_MONSTER3 (20)
#const global CHR_MONSTER4 (22)
#const global CHR_BOM (24)
#const global CHR_MISSILE (30)
#const global CHR_MISSILE2 (31)
#const global CHR_DOT1 (32)
#const global CHR_DOT2 (33)
#const global CHR_DOT3 (34)
#const global CHR_DOT4 (35)
#const global CHR_BALL1 (36)
#const global CHR_BALL2 (37)
#const global CHR_BALL3 (38)
#const global CHR_BALL4 (39)
#const global CHR_WAVE (40)
#const global CHR_SHIP1 (41)
#const global CHR_SHIP2 (42)
#const global CHR_SHIP3 (43)
#const global CHR_SOUPCUP (44)
#const global CHR_HSED (45)
#const global CHR_ONION (46)
#const global CHR_LIGHT (47)
#const global CHR_CIRCLE (48)
#const global CHR_UFO (50)
#const global CHR_VADER (51)
#const global CHR_STONE1 (52)
#const global CHR_STONE2 (53)
#const global CHR_STONE3 (54)
#const global CHR_STONE4 (55)
#const global CHR_COIN (56)
#const global CHR_BOX (57)
#const global CHR_MEAT (58)
#const global CHR_SWORD (59)
#const global CHR_ITEM1 (60)
#const global CHR_ITEM2 (61)
#const global CHR_ITEM3 (62)
#const global CHR_ITEM4 (63)
#const global CHR_ITEM5 (64)

#const global PACTION_CONTROL (0)
#const global PACTION_KEY (1)
#const global PACTION_BUTTON (2)
#const global PACTION_BUTTON2 (3)
#const global PACTION_BUTTON3 (4)
#const global PACTION_MISS (5)
#const global PACTION_ITEM (6)

#const global PLAYER_BUTTON_NORMAL (0)
#const global PLAYER_BUTTON_INT1 (1)
#const global PLAYER_BUTTON_INT2 (2)
#const global PLAYER_BUTTON_INT4 (4)
#const global PLAYER_BUTTON_INT8 (8)

#const global PLAYER_KEY_BUTTON1 ($1050)
#const global PLAYER_KEY_BUTTON2 ($800)
#const global PLAYER_KEY_BUTTON3 ($2000)
#const global PLAYER_KEY_ESC ($80)

#const global EACTION_CONTROL (0)
#const global EACTION_HIT (1)
#const global EACTION_SHOT (2)
#const global EACTION_DESTROY (3)

#const global EMODE_SEQ ($10000)

#const global EMODE_XAIM (1)
#const global EMODE_YAIM (2)

#define global DOTFW_USE_STARFIELD (4)
#define global DOTFW_USE_BGPIC (8)
#define global DOTFW_USE_BGMAP (16)

#const global DOTFW_SPRSCALE 16
#const global DOTFW_SPRSHIFT 4

#define global DOTFW_BGID_TEXT (0)
#define global DOTFW_BGID_BGMAP (1)
#define global DOTFW_BGID_MAPMAX (4)


#const SPR_NONE 0
#const SPR_TIMER $fff
#const SPR_OK $1000
#const SPR_MES $2000
#const SPR_FMES $4000
#const SPR_MOVE $8000
#const SPR_ANIM4 $10000
#const SPR_ANIM8 $20000
#const SPR_ANIM16 $30000

#const BGID_MAP $10000

#deffunc df_reset int _p1

	;	�h�b�g�t���[�����[�N�̏�����
	;
	if _p1>0 : _dotfw_opt@|=_p1
	;
	if _dotfw_flag@ = 0 {
		_dotfw_flag@=$10000+_dotfw_opt@
		sx = _dotfw_sx@
		sy = _dotfw_sy@
		zoomx = double(_dotfw_zoom@)/100.0
		zoomy = zoomx * _dotfw_aspect@ / 100.0
		wx = int( zoomx * sx )
		wy = int( zoomy * sy )
		screen 0,wx,wy
		viewcalc vptype_2d, zoomx, zoomy
		_dotfw_dir@ = 0
		if wy>wx : _dotfw_dir@ = 1
	}
	;
	es_ini _dotfw_essmax@,1024,256		; �X�v���C�g������
	_dotfw_rotbase@ = 6.28318530718 / 256
	es_area  -DOTFW_CHRX,-DOTFW_CHRY,sx+DOTFW_CHRX,sy+DOTFW_CHRY

	setcls CLSMODE_NONE
	;
	redraw 0
	rgbcolor 0:boxf
	redraw 1

	if _dotfw_soundflag@ = 0 {
		_dotfw_soundflag@=1
	}

	;	�t�F�[�h�o�^
	layer_fade

	;	8x8�t�H���g
	;
	fntfile="afont8.png"
	poke fntfile, 0, (_dotfw_flag@ & 3)+'a'
	celload fntfile, DOTFW_FONTID
	celdiv DOTFW_FONTID,8,8
	texbg=0
	texsx=sx/8:texsy=sy/8		; �e�L�X�g�̃}�b�v�T�C�Y
	dim tvram,texsx*texsy		; �}�b�v�f�[�^�ϐ�
	es_bgmap texbg,tvram,texsx,texsy,texsx,texsy,DOTFW_FONTID	; �}�b�v�o�^

	;	�쉹16dot
	;
	buffer DOTFW_TAMAID
	picload DOTFW_TAMARES
	celdiv DOTFW_TAMAID,DOTFW_CHRX,DOTFW_CHRY
	es_size DOTFW_CHRX,DOTFW_CHRY,60
	aniframe=4
	;	�쉹�����
	es_patanim 0, 4, 0,0, aniframe
	es_patanim 4, 4, 4*DOTFW_CHRX,0, aniframe
	es_patanim 8, 4, 0, DOTFW_CHRX, aniframe
	es_patanim 12, 4, 4*DOTFW_CHRX, DOTFW_CHRY, aniframe
	;	�G�����X�^�[
	no=CHR_MONSTER1
	repeat 4
	es_patanim no, 2, 2*DOTFW_CHRX*cnt, 2*DOTFW_CHRY, 8
	no+=2
	loop
	es_patanim CHR_BOM, 6, 0, 3*DOTFW_CHRY, 8
	repeat 4
	es_pat CHR_STONE1+cnt, (4+cnt)*DOTFW_CHRX,6*DOTFW_CHRY
	es_pat CHR_COIN+cnt, cnt*DOTFW_CHRX,7*DOTFW_CHRY
	es_pat CHR_ITEM1+cnt, (4+cnt)*DOTFW_CHRX,7*DOTFW_CHRY
	loop
	repeat 8
	es_pat CHR_WAVE+cnt, cnt*DOTFW_CHRX,5*DOTFW_CHRY
	loop
	es_patanim CHR_CIRCLE, 2, 0, 6*DOTFW_CHRY, 8
	es_pat CHR_UFO, 2*DOTFW_CHRX,6*DOTFW_CHRY
	es_pat CHR_VADER, 3*DOTFW_CHRX,6*DOTFW_CHRY
	es_patanim CHR_ITEM5, 2, 0, 3*DOTFW_CHRY, 8

	es_size DOTFW_CHRX,DOTFW_CHRY,80
	es_pat CHR_MISSILE, 6*DOTFW_CHRX,3*DOTFW_CHRY
	es_pat CHR_MISSILE2, 7*DOTFW_CHRX,3*DOTFW_CHRY
	repeat 8
	es_pat CHR_DOT1+cnt, cnt*DOTFW_CHRX,4*DOTFW_CHRY
	loop
	gsel 0

	;	��(Star Field)
	;
	if _dotfw_flag@ & DOTFW_USE_STARFIELD {
		buffer DOTFW_STARID,256,256,screen_offscreen
		dim bitmap,256*256
		celdiv DOTFW_STARID,256,256,128,128
		gsel 0
		star_zx = 1.0
		star_zy = 1.25
		star_rot = 0
		star_rate = 1
		if sy>sx {
			star_zx = 1.25
			star_zy = 1.0
			star_rot = 1
		}
	}

	;	�v���C���[�ݒ�
	;
	sp_player_mode=-1
	sp_player=0
	sp_player_tamane=0
	sp_player_speedx=2
	sp_player_speedy=2
	sp_player_x1=0
	sp_player_y1=0
	sp_player_x2=sx-DOTFW_CHRX
	sp_player_y2=sy-DOTFW_CHRY
	player_actlb=*actdefault
	player_keylb=*pcont_normal
	player_btn1lb=*player_act_shot
	player_btn2lb=*actdefault
	player_btn3lb=*actdefault
	player_misslb=*player_act_miss
	player_itemlb=*actdefault

	player_button_cnt=0
	player_button_int=_dotfw_interval@

	;	�G�ݒ�
	;
	dim enemy_mode,_dotfw_essmax@
	dim enemy_cnt,_dotfw_essmax@
	dim enemy_interval,_dotfw_essmax@
	dim enemy_misrate,_dotfw_essmax@
	dim enemy_seqid,_dotfw_essmax@
	dim enemy_speed,_dotfw_essmax@
	dim enemy_dir,_dotfw_essmax@
	dim enemy_timer,_dotfw_essmax@
	dim enemy_turn,_dotfw_essmax@
	dim enemy_exprm,_dotfw_essmax@
	;
	enemy_modemax=1
	ldim enemy_modelb,16
	;
	enemy_addrate=10
	enemy_addinterval=8
	enemy_actlb=*enemy_act_move
	enemy_hitlb=*enemy_act_hit
	enemy_shotlb=*enemy_act_shot
	enemy_destlb=*actdefault
	enemy_def_mode=0
	enemy_def_interval=8
	enemy_def_misrate=10
	enemy_def_chr=CHR_MONSTER1
	enemy_def_speed=200
	enemy_def_exprm=0
	enemy_def_timer=0
	enemy_def_opt=0
	enemy_x1=-DOTFW_CHRX
	enemy_y1=-DOTFW_CHRX
	enemy_x2=sx
	enemy_y2=sy
	;
	dim eseq_mode,16
	dim eseq_timer,16
	dim eseq_exprm,16
	eseq_max=0
	;
	dim bgp_id,_dotfw_bgpic_max@
	dim bgp_gx,_dotfw_bgpic_max@
	dim bgp_gy,_dotfw_bgpic_max@
	dim bgp_px,_dotfw_bgpic_max@
	dim bgp_py,_dotfw_bgpic_max@
	dim bgp_sx,_dotfw_bgpic_max@
	dim bgp_sy,_dotfw_bgpic_max@
	;
	df_emodesub *esub_xaim,EMODE_XAIM
	df_emodesub *esub_yaim,EMODE_YAIM


	;	�G�t�F�N�g�p�����X�v���C�g
	;
	sprmax=_dotfw_sprmax@
	dim sprflag,sprmax
	dim sprx,sprmax
	dim spry,sprmax
	dim sprchr,sprmax
	dim sprid,sprmax
	dim sprgx,sprmax
	dim sprgy,sprmax
	dim sprgxp,sprmax
	dim sprcnt,sprmax
	dim spranim,sprmax
	sdim sprmes,64,sprmax

	redraw 0
	gosub *df_bgput
	return

*df_bgput
	;	�w�i�\��
	;
	gfilter FILTER_NONE
	;
	rgbcolor 0:boxf
	gmode 1
	;gfilter FILTER_LINEAR2

	if _dotfw_flag@ & DOTFW_USE_STARFIELD {
		if star_rate>=0 {
			celbitmap DOTFW_STARID,bitmap,$1000+star_rate
			gmode 0
			pos _dotfw_sx@/2,_dotfw_sy@/2
			rot = 4.71239 * star_rot
			celput DOTFW_STARID,0,star_zx,star_zy,rot
		}
	}
	gmp_mode=1
	repeat _dotfw_bgpic_max@
	gmp_id = bgp_id(cnt)
	if gmp_id=0 : continue
	pos 0,0

		bgp_gx(cnt)+=bgp_px(cnt)
		bgp_gy(cnt)+=bgp_py(cnt)
		x=bgp_gx(cnt)>>10
		y=bgp_gy(cnt)>>10
		if x>=bgp_sx(cnt) {
			x=0
			bgp_gx(cnt)=0
		}
		if (x<0) {
			x=bgp_sx(cnt)-1
			bgp_gx(cnt)=x<<10
		}
		if y>=bgp_sy(cnt) {
			y=0
			bgp_gy(cnt)=0
		}
		if (y<0) {
			y=bgp_sy(cnt)-1
			bgp_gy(cnt)=y<<10
		}

		if gmp_id&BGID_MAP {
			gmode 1
			gmp_id=gmp_id & (BGID_MAP-1)
			es_putbg gmp_id,0,0,x,y				; �}�b�vBG��`��
			continue
		}

		gmode gmp_mode,_dotfw_sx@,_dotfw_sy@,255:gcopy gmp_id,x,y
		bgi=bgp_sx(cnt)-x
		if bgi<_dotfw_sx@ {
			pos bgi-1,0:gcopy gmp_id,0,y
		}
		bgi=bgp_sy(cnt)-y
		if bgi<_dotfw_sy@ {
			pos 0,bgi-1:gcopy gmp_id,x,0
		}
		gmp_mode=3
	loop
	;
	return

*actdefault
	;	�A�N�V�����p�f�t�H���g���x��(�������Ȃ�)
	return


;------------------------------------------------------------
;	�����p�X�v���C�g
;------------------------------------------------------------

#deffunc dfi_sprdel int _p1

	;	(�����p)�X�v���C�g�폜
	;	id
	;
	sprflag(_p1)=SPR_NONE
	return

#deffunc dfi_sprtimer int _p1, int _p2

	;	(�����p)�폜�^�C�}�[�ݒ�
	;	id, timer
	;
	flg=sprflag(_p1)&$fffff000
	sprflag(_p1)=flg+_p2
	return

#deffunc dfi_sprmove int _p1, int _p2, int _p3

	;	(�����p)�X�v���C�g���W�ݒ�
	;	id, x,y
	;
	sprx(_p1)=_p2<<DOTFW_SPRSHIFT
	spry(_p1)=_p3<<DOTFW_SPRSHIFT
	return

#deffunc dfi_sprchr int _p1, int _p2, int _p3

	;	(�����p)�X�v���C�g�L�����N�^�[�ݒ�
	;	id, chr, bufid
	;
	sprid(_p1)=_p3
	if sprid(_p1) <= 0 : sprid(_p1)=DOTFW_TAMAID
	sprchr(_p1)=_p2
	return

#deffunc dfi_sprset int _p1, int _p2, int _p3, int _p4, int _p5

	;	(�����p)�X�v���C�g�ݒu
	;	id, x,y, chr, bufid
	;
	sprflag(_p1)=SPR_OK
	sprx(_p1)=_p2<<DOTFW_SPRSHIFT
	spry(_p1)=_p3<<DOTFW_SPRSHIFT
	dfi_sprchr _p1, _p4, _p5
	sprgx(_p1)=0
	sprgy(_p1)=0
	sprgxp(_p1)=0
	sprcnt(_p1)=0
	spranim(_p1)=0
	return

#deffunc dfi_move int _p1, int _p2, int _p3

	;	(�����p)�X�v���C�g�g���p�����[�^�[�ݒ�
	;	id, gx,gy
	;
	sprflag(_p1)|=SPR_MOVE
	sprgx(_p1)=_p2
	sprgy(_p1)=_p3
	return

#deffunc dfi_rotmove int _p1, int _p2, int _p3

	;	(�����p)�X�v���C�g�g���p�����[�^�[�ݒ�
	;	id, rot, factor(16=1.0)
	;
	sprflag(_p1)|=SPR_MOVE
	rot=_dotfw_rotbase@*_p2
	px=int(sin(rot)*_p3)
	py=int(cos(rot)*_p3)
	sprgx(_p1)=px
	sprgy(_p1)=py
	return

#deffunc dfi_sprstr int _p1, str _p2, int _p3, int _p4

	;	(�����p)�X�v���C�g�����ݒ�
	;	id, "str", color, wait
	;
	sprflag(_p1)=SPR_MES
	sprmes(_p1)=_p2
	sprgx(_p1)=_p3
	spranim(_p1)=_p4
	return

#deffunc dfi_spranim int _p1, int _p2, int _p3, local i

	;	(�����p)�X�v���C�g�A�j���[�V�����ݒ�
	;	id, count, animpat
	;
	spranim(_p1)=_p2
	i=0
	if _p3>=4 : i=SPR_ANIM4
	if _p3>=8 : i=SPR_ANIM8
	if _p3>=16 : i=SPR_ANIM16
	sprflag(_p1)|=i
	return

#deffunc dfi_sprnew

	;	(�����p)�X�v���C�g�V�KID
	;
	spid=sprmax-1
	repeat sprmax
		if sprflag(spid)=SPR_NONE : break
		spid--
	loop
	if spid<0 : spid=sprmax-1
	return spid

#deffunc dfi_sprupdate

	;	(�����p)�X�v���C�g�X�V
	;
	gmode 2,16,16
	repeat sprmax
	flg=sprflag(cnt)
	if flg=SPR_NONE : continue

	i=flg&SPR_TIMER
	if i>0 {
		sprflag(cnt)=flg-1
		i--:if i=0 : sprflag(cnt)=0
	}
	sprcnt(cnt)++

	if flg&SPR_OK {
		if flg&SPR_MOVE {
			sprx(cnt)+=sprgx(cnt)
			spry(cnt)+=sprgy(cnt)
		}
		if spranim(cnt)>0 {
			if sprcnt(cnt)>=spranim(cnt) {
				sprcnt(cnt)=0
				i=2
				if flg&SPR_ANIM4 : i*=2
				if flg&SPR_ANIM8 : i*=4
				sprgxp(cnt)++
				if sprgxp(cnt)>=i {
					sprgxp(cnt)=0
				}
			}
		}
		continue
	}
	if flg&SPR_MES {
		if spranim(cnt)>0 {
			i=sprgxp(cnt)
			if sprcnt(cnt)>=spranim(cnt) {
				sprcnt(cnt)=0
				sprgxp(cnt)++
			}
		}
		continue
	}
	if flg&SPR_FMES {
		if spranim(cnt)>0 {
			if sprcnt(cnt)>=spranim(cnt) {
				sprcnt(cnt)=0
				sprgxp(cnt)++
			}
		}
		continue
	}
	loop
	return

#deffunc dfi_sprdraw

	;	(�����p)�X�v���C�g�`��
	;
	_dotfw_effect@=0
	gmode 2,16,16
	repeat sprmax
	flg=sprflag(cnt)
	if flg=SPR_NONE : continue

	_dotfw_effect@++
	x=sprx(cnt)>>DOTFW_SPRSHIFT:y=spry(cnt)>>DOTFW_SPRSHIFT

	if flg&SPR_OK {
		pos x,y
		celput sprid(cnt),sprchr(cnt)+sprgxp(cnt)
		continue
	}
	if flg&SPR_MES {
		s1=sprmes(cnt)
		nstr_end=1
		if spranim(cnt)>0 {
			i=sprgxp(cnt)
			a1=peek(s1,i)
			if a1!=0 : nstr_end=0
			poke s1,i,0
		}
		es_bgmes texbg,x,y,s1,256*sprgx(cnt)
		if nstr_end {
			sprflag(cnt)=SPR_NONE		; �S���o���I�����
		}
		continue
	}
	if flg&SPR_FMES {
		s1=sprmes(cnt)
		if spranim(cnt)>0 {
			i=sprgxp(cnt)
			gosub *nstr_wipe
		}
		pos x,y:rgbcolor sprgx(cnt):mes s1
		continue
	}
	loop
	return

*nstr_wipe
	;	1�������o��(i�̃J�E���g�ŋ�؂�)
	j=0
	nstr_end=0
	skipbyte=2
	if hspstat&$20000 : skipbyte=3		; UTF8�̊ȈՓI�ȑΉ�
	repeat i
		a1=peek(s1,j)
		if a1=0 {
			nstr_end=1
			break
		}
		if a1>=128 {
			j+=skipbyte : continue
		}
		j++
	loop
	poke s1,j,0
	return



;------------------------------------------------------------
;	�O���p(�V�X�e��)
;------------------------------------------------------------

#deffunc df_screen int _p1, int _p2, int _p3, int _p4

	;	�𑜓x�ݒ�
	;	sx,sy,zoom,fps
	;
	if _p1>0 : _dotfw_sx@ = _p1
	if _p2>0 : _dotfw_sy@ = _p2
	if _p3>0 : _dotfw_zoom@ = _p3
	if _p4>0 : _dotfw_fps@ = _p4
	_dotfw_flag@ = 0
	return


#deffunc df_zoom int _p1, int _p2

	;	�Y�[���ݒ�
	;	zoom, aspect
	;
	_dotfw_zoom@ = 300
	if _p1>0 : _dotfw_zoom@ = _p1
	_dotfw_aspect@ = 100
	if _p2>0 : _dotfw_aspect@ = _p2
	_dotfw_flag@ = 0
	return


#deffunc df_config str _p1

	;	�^�O���ɂ��ݒ�
	;	"tag1 tag2..."
	;
	_dotfw_opt@=0
	_dotfw_cfghash@=_p1
	index=0
	errflg=0
	repeat
		getstr s1,_dotfw_cfghash@,index,32,64
		if strsize=0 : break
		index+=strsize
		gosub *hashchk
		if errflg : dialog "#Unknown Tag : "+s1 : break
	loop
	return

*hashchk
	value=0+strmid(s1,1,64)
	a1=peek(s1,0)
	if a1='Z' {
		_dotfw_zoom@ = value
		_dotfw_flag@ = 0
		return
	}
	if a1='A' {
		_dotfw_aspect@ = value
		_dotfw_flag@ = 0
		return
	}
	if a1='X' {
		_dotfw_sx@ = value
		_dotfw_flag@ = 0
		return
	}
	if a1='Y' {
		_dotfw_sy@ = value
		_dotfw_flag@ = 0
		return
	}
	if a1='F' {
		_dotfw_fps@ = value
		return
	}
	if a1='K' {
		_dotfw_interval@ = value
		return
	}

	if s1="star" : _dotfw_opt@ |= DOTFW_USE_STARFIELD : return
	if s1="afont" : _dotfw_opt@ |= DOTFW_AFONT : return
	if s1="bfont" : _dotfw_opt@ |= DOTFW_BFONT : return
	if s1="cfont" : _dotfw_opt@ |= DOTFW_CFONT : return

	if s1="pce" : df_screen 320,224 : return
	if s1="md" : df_screen 320,224 : return
	if s1="fc" : df_screen 256,224 : _dotfw_aspect@=85 : return
	if s1="sfc" : df_screen 256,224 : _dotfw_aspect@=85 : return
	if s1="gb" : df_screen 160,144 : return
	if s1="gba" : df_screen 240,160 : return
	if s1="nds" : df_screen 256,192 : return
	if s1="3ds" : df_screen 320,240 : return
	if s1="n64" : df_screen 320,240 : return
	if s1="ngc" : df_screen 640,480 : return
	if s1="ss" : df_screen 320,224 : return
	if s1="dc" : df_screen 640,480 : return
	if s1="ps1" : df_screen 320,240 : return
	if s1="ps2" : df_screen 640,480 : return
	if s1="psp" : df_screen 480,272 : return
	if s1="vita" : df_screen 960,544 : return
	if s1="msx" : df_screen 256,192 : return
	if s1="msx2" : df_screen 512,424 : return
	if s1="appleii" : df_screen 280,192 : return
	if s1="c64" : df_screen 320,200 : _dotfw_aspect@=120 : return
	if s1="pc60" : df_screen 256,192 : return
	if s1="pc80" : df_screen 320,200 : _dotfw_aspect@=120 : return
	if s1="pc88" : df_screen 640,200 : _dotfw_aspect@=240 : return
	if s1="pc98" : df_screen 640,400 : _dotfw_aspect@=120 : return
	if s1="x68k" : df_screen 768,512 : return
	if s1="arcade" : df_screen 224,320 : return
	if s1="neogeo" : df_screen 320,224 : return

	if s1="se" : _dotfw_se@ = 1 : return
	if s1="music" : _dotfw_music@ = 1 : return

	if s1="shoot" : _dotfw_style@ = STYLE_SHOOT : return
	if s1="jump" : _dotfw_style@ = STYLE_JUMP : return

	errflg++
	return


#deffunc df_star int _p1, int _p2, int _p3, int _p4

	;	���\���p�����[�^�[�ݒ�
	;
	star_rate = _p1
	if _p1<0 : return
	x=100:if _p2>0 : x=_p2
	y=100:if _p3>0 : y=_p3
	star_zx = double(x)/100.0
	star_zy = double(y)/100.0
	star_rot = _p4
	return


#deffunc df_mes str _p1, int _p2, int _p3, int _p4

	;	�e�L�X�g�\��
	;
	es_bgmes texbg,_p2,_p3,_p1,256*_p4
	return


#deffunc df_vpoke int _p1, int _p2, int _p3, int _p4

	;	�e�L�X�g�ɃL�����N�^�R�[�h��������
	;	x,y,code,length
	x=_p1:i=texsx*_p2+x:z=_p4:a=_p3
	if z<=0 : z=1
	repeat z
		tvram(i)=a
		x++:if x>=texsx : break
		i++
	loop
	return


#defcfunc df_vpeek int _p1, int _p2

	;	�e�L�X�g�̃L�����N�^�R�[�h��Ԃ�
	;
	if _p1<0|_p1>=texsx : return -1
	if _p2<0|_p2>=texsy : return -1
	return tvram(texsx*_p2+_p1)


#deffunc df_vshift int _p1

	;	�e�L�X�g��C�ӂ̕����ɃV�t�g
	;
	i=texsx*(texsy-1)*4
	a=texsx*4
	if _p1=DIR_UP {
		memcpy tvram,tvram,i,0,a
		memset tvram,0,a,i
		return
	}
	if _p1=DIR_DOWN {
		repeat texsy-1
		memcpy tvram,tvram,a,i,i-a
		i-=a
		loop
		memset tvram,0,a,0
		return
	}
	if _p1=DIR_LEFT {
		memcpy tvram,tvram,i+a-4,0,4
		i=texsx-1
		repeat texsy
			tvram(i)=0:i+=texsx
		loop
		return
	}
	if _p1=DIR_RIGHT {
		memcpy tvram,tvram,i+a-4,4,0
		i=0
		repeat texsy
			tvram(i)=0:i+=texsx
		loop
		return
	}
	return


#deffunc df_celload var _p1, str _p2

	;	�摜�ǂݍ���
	;		var,"file"
	;
	exist _p2
	if strsize<0 {
		dialog "No File Error ["+_p2+"]"
		return
	}
	;
	celload _p2
	_p1 = stat
	return


#deffunc df_setbgpic int _p1, int _p2

	;	�w�i�摜���w��
	;		BGNo., �E�C���h�EID
	;
	i=_p2
	a=_p1
	if a<0 | a>_dotfw_bgpic_max@ : dialog "Invalid BG#"+a : return

	gsel i
	bgp_id(a)=i
	bgp_gx(a)=0
	bgp_gy(a)=0
	bgp_px(a)=0
	bgp_py(a)=0
	bgp_sx(a)=ginfo_sx
	bgp_sy(a)=ginfo_sy
	gsel 0
	return


#deffunc df_setbgpicfile int _p1, str _p2

	;	�w�i�摜���w��
	;		BGNo., "filename"
	;
	a=_p1
	if a<0 | a>_dotfw_bgpic_max@ : dialog "Invalid BG#"+a : return

	df_celload i, _p2
	gsel i
	bgp_id(a)=i
	bgp_gx(a)=0
	bgp_gy(a)=0
	bgp_px(a)=0
	bgp_py(a)=0
	bgp_sx(a)=ginfo_sx
	bgp_sy(a)=ginfo_sy
	gsel 0
	return


#deffunc df_loadbgmap int _p1, str _p2

	;	�w�i�}�b�v�ǂݍ���
	;		BGNo. , "file"
	;
	a=_p1
	if a<0 | a>_dotfw_bgpic_max@ : dialog "Invalid BG#"+a : return
	gmp_id= _p1+ DOTFW_BGID_BGMAP

	headsize=128
	sdim header,headsize
	bload _p2,header,headsize
	if header!="TMAP" : dialog "Invalid tmap file ["+_p2+"]." : return

	msx = lpeek(header,8)
	msy = lpeek(header,12)
	celsizex = lpeek(header,16)
	celsizey = lpeek(header,20)
	headsize = lpeek(header,32)
	attrmax = lpeek(header,36)/4
	sdim celfile,256
	memcpy celfile,header,32,0,96
	celload celfile
	bufid = stat

	a=_p1
	df_setbgmap a,bufid, msx, msy, celsizex

	dim attr,attrmax
	bload _p2,attr,attrmax*4,headsize

	map=0
	if gmp_id=1 : dup map, gmp_map1
	if gmp_id=2 : dup map, gmp_map2
	if gmp_id=3 : dup map, gmp_map3
	if gmp_id=4 : dup map, gmp_map4

	bload _p2,map,msx*msy*4,headsize+attrmax*4

	return


#deffunc df_setbgmap int _p1, int _p2, int _p3, int _p4, int _p5, int _p6

	;	�w�i�}�b�v���w��
	;		BGNo., bufid, xsize, ysize, celsize, option
	;
	a=_p1
	if a<0 | a>_dotfw_bgpic_max@ : dialog "Invalid BG#"+a : return
	gmp_size=16
	if _p5>0 : gmp_size=_p5

	gmp_id= _p1+ DOTFW_BGID_BGMAP
	gmp_buf = _p2
	mapsx=sx/gmp_size
	mapsy=sy/gmp_size
	mapvx=_dotfw_sx@/gmp_size
	mapvy=_dotfw_sy@/gmp_size
	if _p3>0 : mapsx=_p3
	if _p4>0 : mapsy=_p4
	celdiv gmp_buf, gmp_size, gmp_size
	if gmp_id=1 : dim gmp_map1,mapsx*mapsy : es_bgmap gmp_id, gmp_map1, mapsx, mapsy, mapvx, mapvy, gmp_buf : goto *bgmap_ent
	if gmp_id=2 : dim gmp_map2,mapsx*mapsy : es_bgmap gmp_id, gmp_map2, mapsx, mapsy, mapvx, mapvy, gmp_buf : goto *bgmap_ent
	if gmp_id=3 : dim gmp_map3,mapsx*mapsy : es_bgmap gmp_id, gmp_map3, mapsx, mapsy, mapvx, mapvy, gmp_buf : goto *bgmap_ent
	if gmp_id=4 : dim gmp_map4,mapsx*mapsy : es_bgmap gmp_id, gmp_map4, mapsx, mapsy, mapvx, mapvy, gmp_buf : goto *bgmap_ent
	dialog "Invalid BG#"+a
	return
*bgmap_ent
	bgp_id(a)=gmp_id | BGID_MAP
	bgp_gx(a)=0
	bgp_gy(a)=0
	bgp_px(a)=0
	bgp_py(a)=0
	bgp_sx(a)=gmp_size*mapsx
	bgp_sy(a)=gmp_size*mapsy
	return


#deffunc df_getbgmap var _p1, int _p2

	;	�w�i�}�b�v�ϐ����擾
	;		var, BGNo.
	;
	a=_p2
	if a<0 | a>_dotfw_bgpic_max@ | (bgp_id(_p2)&BGID_MAP)=0 : dialog "Invalid BG#"+a : return
	gmp_id= _p2+ DOTFW_BGID_BGMAP
	if gmp_id=1 : dup _p1, gmp_map1 : return
	if gmp_id=2 : dup _p1, gmp_map2 : return
	if gmp_id=3 : dup _p1, gmp_map3 : return
	if gmp_id=4 : dup _p1, gmp_map4 : return
	return


#deffunc df_setbgmapfile int _p1, str _p2

	;	�w�i�}�b�v���w��
	;		BGNo., "MAPfile"
	;
	if a<0 | a>_dotfw_bgpic_max@ : dialog "Invalid BG#"+a : return
	return


#deffunc df_bgpoint int _p1, int _p2, int _p3

	;	�w�i�Q�ƃ|�C���g���w��
	;		BGNo., x, y
	;
	a=_p1
	bgp_gx(a)=_p2<<10
	bgp_gy(a)=_p3<<10
	bgp_px(a)=0
	bgp_py(a)=0
	return


#deffunc df_bgscroll int _p1, int _p2, int _p3

	;	�w�i�X�N���[�����w��
	;		BGNo., dir, speed
	;
	a=_p1
	bgp_gx(a)=0
	bgp_gy(a)=0
	es_cos _p2:x=stat
	es_sin _p2:y=stat
	x=x*_p3/100
	y=y*_p3/100
	bgp_px(a)=-x
	bgp_py(a)=-y
	return


#deffunc df_update int _p1

	;	��ʍX�V
	;
	_dotfw_update_flag@=_p1
	if _dotfw_update_flag@&UPDATE_PAUSE {
		es_draw	ESDRAW_NOMOVE|ESDRAW_NOANIM	; �X�v���C�g�`��
	} else {
		es_draw					; �X�v���C�g�`��
	}
	if (_dotfw_update_flag@&UPDATE_PAUSE)=0 {
		dfi_sprupdate				; �����X�v���C�g�X�V
	}
	dfi_sprdraw					; �����X�v���C�g�`��
	gmode 1
	es_putbg texbg				; �e�L�X�gVRAM��`��
	;
	redraw 1

	if (_dotfw_update_flag@&UPDATE_NOWAIT)=0 {
		await 1000/_dotfw_fps@
		_dotfw_frame@++
	}

	i=15
	if player_button_int>0 : i=15|PLAYER_KEY_BUTTON1
	jstick key@,i

	redraw 0
	gosub *df_bgput

	;	�Q�[���R���g���[��
	if (_dotfw_update_flag@&UPDATE_NOWAIT)=0 {
		gosub *player_main
		gosub *enemy_main
	}
	return


*player_main
	;	�v���C���[�R���g���[�����C��
	;
	if sp_player_mode<0 : return
	;
	_dotfw_cursp@ = sp_player
	gosub player_keylb
	i=key@&PLAYER_KEY_BUTTON1
	player_button_cnt++
	if player_button_int>0 {
		if player_button_cnt<player_button_int : i=0
	}
	if i {
		player_button_cnt=0
		gosub player_btn1lb
	}
	i=key@&PLAYER_KEY_BUTTON2
	if i {
		gosub player_btn2lb
	}
	i=key@&PLAYER_KEY_BUTTON3
	if i {
		gosub player_btn3lb
	}

	;	����`�F�b�N
	es_check res, sp_player, TYPE_ENEMY|TYPE_EMISSLE
	if res>=0 {
		_dotfw_cursp@ = res
		gosub player_misslb
	}
	;	�A�C�e���`�F�b�N
	es_check res, sp_player, TYPE_ITEM
	if res>=0 {
		_dotfw_cursp@ = res
		gosub player_itemlb
	}

	gosub player_actlb
	return

*player_act_shot
	;	�{�^�������������̏���(�f�t�H���g)
	df_getplayer
	if _dotfw_dir@ {
		df_addpmis _dotfw_myx@,_dotfw_myy@, DIR_UP, 400, CHR_MISSILE			; �~�T�C������
	} else {
		df_addpmis _dotfw_myx@,_dotfw_myy@, DIR_RIGHT, 400, CHR_MISSILE2		; �~�T�C������
	}
	return

*player_act_miss
	;	�~�X���̏���(�f�t�H���g)
	if sp_player_mode<0 : return
	;
	df_getplayer
	df_addbom _dotfw_myx@,_dotfw_myy@,3
	es_kill sp_player
	sp_player_mode=-1
	return


*enemy_main
	;	�G�R���g���[�����C��
	;
	_dotfw_enemy@=0
	n=0
	chk_type=TYPE_PMISSLE|TYPE_PBOMB
	df_getplayer
	repeat
		es_find n,TYPE_ENEMY|TYPE_ITEM,n
		if n=-1 : break				; �X�v���C�g�����o
		_dotfw_cursp@ = n
		es_get etype,n,ESI_TYPE
		if etype=TYPE_ITEM : goto *skip_echk

		_dotfw_enemy@++
		es_check res,n,chk_type			; �Փ˃`�F�b�N
		if res>=0 {
			_dotfw_hitsp@ = res
			gosub enemy_hitlb
		}

*skip_echk
		_dotfw_curemode@ = enemy_mode(n)
		_dotfw_enemy_exprm@ = enemy_exprm(n)
		gosub enemy_actlb

		enemy_cnt(n)++
		if enemy_cnt(n)>=enemy_interval(n) {
			enemy_cnt(n)=0
			if _dotfw_curemode@>0 {
				gosub enemy_modelb(_dotfw_curemode@)
			}
			if rnd(100)<enemy_misrate(n) {
				if sp_player_mode>=0 {
					gosub enemy_shotlb
				}
			}
			enemy_turn(n)++
			if enemy_timer(n) {			; �V�[�P���X����
				enemy_timer(n)--
				if enemy_timer(n)=0 {
					sp_enemy=n
					seqid=enemy_seqid(n)+1
					enemy_seqid(n)=seqid
					e_mode=eseq_mode(seqid)
					e_timer=eseq_timer(seqid)
					e_exprm=eseq_exprm(seqid)
					e_dir=enemy_dir(sp_enemy)
					gosub *dfi_setenemymode
				}
			}
		}
		n+
	loop
	return

*enemy_act_hit
	;	�q�b�g��(�f�t�H���g)
	df_getaxis
	df_addbom _dotfw_cx@,_dotfw_cy@,1
	es_kill _dotfw_cursp@
	es_kill _dotfw_hitsp@
	gosub enemy_destlb
	return

*enemy_act_shot
	;	�V���b�g��(�f�t�H���g)
	df_getaxis
	df_addemis _dotfw_cx@,_dotfw_cy@, DIR_AIM, 200
	return

*enemy_act_move
	;	�ړ���(�f�t�H���g)
	return

*esub_xaim
	df_getaxis
	if _dotfw_cx@<_dotfw_myx@ : _dotfw_movex@ += $2000
	if _dotfw_cx@>_dotfw_myx@ : _dotfw_movex@ -= $2000
	df_putaxis
	;es_aim _dotfw_cursp@,_dotfw_myx@,_dotfw_myy@,enemy_speed(n)
	return
*esub_yaim
	df_getaxis
	if _dotfw_cy@<_dotfw_myy@ : _dotfw_movey@ += $2000
	if _dotfw_cy@>_dotfw_myy@ : _dotfw_movey@ -= $2000
	df_putaxis
	return


;------------------------------------------------------------

#deffunc df_addplayer int _p1, int _p2, int _p3, int _p4

	;	�v���C���[�X�v���C�g�o�^
	;		x,y,chr,opt
	;
	sp_player_tamane=1
	i=CHR_TAMANE
	x=sx/2:y=sy/2
	if _p1>0 : x=_p1
	if _p2>0 : y=_p2
	if _p3>0 : i=_p3 : sp_player_tamane=0
	es_new sp_player
	if sp_player<0 : return
	es_set sp_player,x,y,i,_p4
	es_type a,TYPE_PLAYER

	_dotfw_cursp@ = sp_player
	sp_player_mode=0
	return


#deffunc df_addpmis int _p4, int _p5, int _p1, int _p2, int _p3, int _p6

	;	�v���C���[�e�o�^
	;	x,y, direction, speed, chrno, option
	;
	i=CHR_MISSILE
	if _p3>0 : i=_p3
	spno=-1
	spd=100
	if _p2>0 : spd=_p2

	es_new spno
	_dotfw_cursp@ = spno
	if spno<0 : return

	es_set spno,_p4,_p5,i,_p6
	es_type spno,TYPE_PMISSLE
	es_adir spno,_p1,spd
	return


#deffunc df_getplayer

	;	�v���C���[���W���擾����
	;
	es_getpos sp_player,_dotfw_myx@,_dotfw_myy@
	return


#deffunc df_getaxis

	;	�J�����g�X�v���C�g���W���擾����
	;
	es_getpos _dotfw_cursp@,_dotfw_cx@,_dotfw_cy@
	es_getpos _dotfw_cursp@,_dotfw_movex@,_dotfw_movey@,ESSPSET_ADDPOS|ESSPSET_DIRECT
	return


#deffunc df_putaxis

	;	�J�����g�X�v���C�g�ړ��ʂ��Đݒ肷��
	;	(df_getaxis�����Ă�������)
	;
	es_setp _dotfw_cursp@,ESI_SPDX,_dotfw_movex@
	es_setp _dotfw_cursp@,ESI_SPDY,_dotfw_movey@
	return


#deffunc df_getenemyprm

	;	���䒆�̓G�����擾����
	;
	spno=_dotfw_cursp@
	_dotfw_enemy_turn@ = enemy_turn(spno)
	_dotfw_enemy_timer@ = enemy_timer(spno)
	_dotfw_enemy_speed@ = enemy_speed(spno)
	_dotfw_enemy_dir@ = enemy_dir(spno)
	return


#deffunc df_putenemyprm

	;	���䒆�̓G�����Đݒ肷��
	;
	spno=_dotfw_cursp@
	enemy_turn(spno) = _dotfw_enemy_turn@
	enemy_timer(spno) = _dotfw_enemy_timer@
	enemy_speed(spno) = _dotfw_enemy_speed@
	enemy_dir(spno) = _dotfw_enemy_dir@
	return


#deffunc df_parea int _p1, int _p2, int _p3, int _p4

	;	�v���C���[�ړ��͈͂�ݒ肷��
	;
	sp_player_x1=_p1
	sp_player_y1=_p2
	sp_player_x2=_p3
	sp_player_y2=_p4
	return


#deffunc df_pmode int _p1, int _p2, int _p3

	;	�v���C���[�R���g���[���ݒ�
	;		mode, speedx, speedy
	;
	sp_player_mode=_p1
	if _p2>0 : sp_player_speedx=_p2 : sp_player_speedy=_p2
	if _p3>0 : sp_player_speedy=_p3
	return

*pcont_normal
	;	�m�[�}���ړ�
	ky=key@
	es_getpos sp_player,myx,myy
	if ky&2 {
		myy-=sp_player_speedy
		if myy<sp_player_y1 : myy=sp_player_y1
	}
	if ky&8 {
		myy+=sp_player_speedy
		if myy>sp_player_y2 : myy=sp_player_y2
	}
	if ky&1 {
		myx-=sp_player_speedx
		if myx<sp_player_x1 : myx=sp_player_x1
	}
	if ky&4 {
		myx+=sp_player_speedx
		if myx>sp_player_x2 : myx=sp_player_x2
	}
	es_pos sp_player,myx,myy			; �X�v���C�g���W�ݒ�
	return


#deffunc df_paction label _p1, int _p2

	;	�v���C���[�̃A�N�V�������색�x����ݒ�
	;		label, mode
	;
	if _p2=PACTION_CONTROL {
		player_actlb=_p1
	}
	if _p2=PACTION_HIT {
		player_hitlb=_p1
	}
	if _p2=PACTION_KEY {
		player_keylb=_p1
	}
	if _p2=PACTION_BUTTON {
		player_btn1lb=_p1
	}
	if _p2=PACTION_BUTTON2 {
		player_btn2lb=_p1
	}
	if _p2=PACTION_BUTTON3 {
		player_btn3lb=_p1
	}
	if _p2=PACTION_MISS {
		player_misslb=_p1
	}
	if _p2=PACTION_ITEM {
		player_itemlb=_p1
	}
	return


;------------------------------------------------------------

#deffunc df_earea int _p1, int _p2, int _p3, int _p4

	;	�G�l�~�[�o���͈͂�ݒ肷��
	;
	enemy_x1=_p1
	enemy_y1=_p2
	enemy_x2=_p3
	enemy_y2=_p4
	return

#deffunc df_emode int _p1, int _p2, int _p3, int _p4, int _p5, int _p6, int _p7

	;	�G�l�~�[�����ݒ�
	;		mode, chr, misrate, interval, speed, exprm, opt
	;
	enemy_def_seq = 0
	enemy_def_timer = 0
	enemy_def_exprm=_p6
	enemy_def_mode=_p1

	if enemy_def_mode & EMODE_SEQ {						; �V�[�P���X����
		enemy_def_seq=enemy_def_mode & (EMODE_SEQ-1)
		if enemy_def_seq>eseq_max : dialog "SEQ ID error" : enemy_def_seq=0
		enemy_def_mode=eseq_mode(enemy_def_seq)
		enemy_def_timer=eseq_timer(enemy_def_seq)
		enemy_def_exprm=eseq_exprm(enemy_def_seq)
	}
	enemy_def_chr=_p2
	enemy_def_misrate=_p3
	enemy_def_interval=8
	if _p4>0 : enemy_def_interval=_p4
	enemy_def_speed=200
	if _p5>0 : enemy_def_speed=_p5
	enemy_def_opt=_p7
	return

#deffunc df_eaction label _p1, int _p2

	;	�G�l�~�[�̃A�N�V�������색�x����ݒ�
	;		label, mode
	;
	if _p2=EACTION_CONTROL {
		enemy_actlb=_p1
	}
	if _p2=EACTION_HIT {
		enemy_hitlb=_p1
	}
	if _p2=EACTION_SHOT {
		enemy_shotlb=_p1
	}
	if _p2=EACTION_DESTROY {
		enemy_destlb=_p1
	}
	return


#deffunc df_addenemy int _p1, int _p2, int _p3, int _p4

	;	�G�~�l�[�X�v���C�g�o�^
	;		x,y,dir,speed
	;
	es_new sp_enemy
	if sp_enemy<0 : return
	es_set sp_enemy,_p1,_p2,enemy_def_chr,enemy_def_opt
	es_type sp_enemy,TYPE_ENEMY
	speed = enemy_def_speed
	if _p4>0 : speed = _p4
	es_adir sp_enemy,_p3,speed
	;
	e_mode = enemy_def_mode
	e_dir = _p3
	e_timer = enemy_def_timer
	e_exprm = enemy_def_exprm
	gosub *dfi_setenemymode

	enemy_interval(sp_enemy) = enemy_def_interval
	enemy_misrate(sp_enemy) = enemy_def_misrate

	enemy_seqid(sp_enemy) = enemy_def_seq
	enemy_speed(sp_enemy) = speed
	return

*dfi_setenemymode
	;	�G�~�l�[���[�h�ݒ�
	;	(sp_enemy) e_mode, e_dir, e_timer, e_exprm
	;
	if e_mode>enemy_modemax : e_mode=0
	enemy_mode(sp_enemy) = e_mode
	enemy_cnt(sp_enemy) = 0
	enemy_dir(sp_enemy) = e_dir
	enemy_timer(sp_enemy) = e_timer
	enemy_turn(sp_enemy) = 0
	enemy_exprm(sp_enemy) = e_exprm
	return


#deffunc df_enemygen int _p1, int _p2, int _p3

	;	���Ԃ��Ƃ̃G�l�~�[����
	;		dir, rate, interval
	;
	if _dotfw_update_flag@&UPDATE_PAUSE : return
	;
	enemy_addinterval=4
	if _p3>0 : enemy_addinterval=_p3
	if _dotfw_frame@\enemy_addinterval : return

	enemy_addrate=10
	if _p2>0 : enemy_addrate=_p2
	if rnd(100)>=enemy_addrate : return
	;
	i=enemy_x2-enemy_x1
	a=enemy_y2-enemy_y1
	;
	if _p1=DIR_UP {
		x=enemy_x1
		if i>0 : x+=rnd(i)
		y=enemy_y2
		df_addenemy x,y,_p1
		return
	}
	if _p1=DIR_DOWN {
		x=enemy_x1
		if i>0 : x+=rnd(i)
		y=enemy_y1
		df_addenemy x,y,_p1
		return
	}
	if _p1=DIR_LEFT {
		y=enemy_y1
		if a>0 : y+=rnd(a)
		x=enemy_x2
		df_addenemy x,y,_p1
		return
	}
	if _p1=DIR_RIGHT {
		y=enemy_y1
		if a>0 : y+=rnd(a)
		x=enemy_x1
		df_addenemy x,y,_p1
		return
	}
	return


#deffunc df_emodesub label _p1, int _p2

	;	�G�l�~�[�̃��[�h���색�x����ݒ�
	;		label, mode
	;
	i=_p2
	if i=0 {
		i = enemy_modemax+1
	}
	if enemy_modemax<i : enemy_modemax=i
	enemy_modelb(i)=_p1
	return i


#deffunc df_addseq int _p1, int _p2, int _p3, int _p4

	;	�G�l�~�[�̃V�[�P���X�o�^
	;		id, mode, timer, exprm
	;
	seqid=_p1
	if seqid=0 : seqid=eseq_max+1
	if eseq_max<seqid : eseq_max=seqid
	eseq_mode(seqid)=_p2
	eseq_timer(seqid)=_p3
	eseq_exprm(seqid)=_p4
	return seqid


#deffunc df_addemis int _p4, int _p5, int _p1, int _p2, int _p3, int _p6

	;	�G�l�~�[�e�o�^
	;	x,y, direction, speed, chrno, option
	;
	x=_p4:y=_p5
	;
	i=CHR_CIRCLE
	if _p3>0 : i=_p3
	spno=-1
	spd=100
	if _p2>0 : spd=_p2

	es_new spno
	_dotfw_cursp@ = spno
	if spno<0 : return

	edir=_p1
	if edir=DIR_AIM {
		es_ang x,y,_dotfw_myx@,_dotfw_myy@
		edir=stat
	}
	es_set spno,x,y,i,_p6
	es_type spno,TYPE_EMISSLE
	es_adir spno,edir,spd
	return


#deffunc df_additem int _p1, int _p2, int _p3, int _p4, int _p5, int _p6

	;	�A�C�e���X�v���C�g�o�^
	;		x,y,chr,mode,dir,speed
	;
	es_new sp_enemy
	if sp_enemy<0 : return
	es_set sp_enemy,_p1,_p2,_p3,enemy_def_opt
	es_type sp_enemy,TYPE_ITEM
	speed = enemy_def_speed
	if _p6>0 : speed = _p6
	es_adir sp_enemy,_p3,speed
	;
	e_mode = _p4
	e_dir = _p5
	e_timer = 0
	gosub *dfi_setenemymode

	enemy_interval(sp_enemy) = enemy_def_interval
	enemy_misrate(sp_enemy) = 0

	enemy_seqid(sp_enemy) = enemy_def_seq
	enemy_speed(sp_enemy) = speed
	return

;------------------------------------------------------------

#deffunc df_efftimer int _p1

	;	�G�t�F�N�g�^�C�}�[�ݒ�
	;		time
	;
	if spid<0 : return
	dfi_sprtimer spid, _p1
	return

#deffunc df_effanim int _p1, int _p2

	;	�G�t�F�N�g�A�j���[�V�����ݒ�
	;		count, pattern, px, py
	;
	if spid<0 : return
	dfi_spranim spid, _p1, _p2
	return

#deffunc df_effmove int _p1, int _p2

	;	�G�t�F�N�g�ړ��ݒ�
	;		px, py
	;
	if spid<0 : return
	dfi_move spid, _p1*100/16, _p2*100/16
	return

#deffunc df_addbom int _p1, int _p2, int _p3, int _p4

	;	�����G�t�F�N�g�o�^
	;		x,y,level,aniframe
	;
	aniframe=4
	if _p4>0 : aniframe=_p4
	;
	dfi_sprnew
	if _p3>0 : goto *bomlev1
*bomlev0
	dfi_sprset spid, _p1, _p2, CHR_BOM
	dfi_spranim spid, aniframe, 8
	dfi_sprtimer spid, aniframe*5
	return
*bomlev1
	if _p3>1 : goto *bomlev2
	dfi_sprset spid, _p1, _p2, CHR_BOM
	dfi_spranim spid, aniframe, 8
	dfi_sprtimer spid, aniframe*6
	return
*bomlev2
	dfi_sprset spid, _p1, _p2, CHR_BOM
	dfi_spranim spid, aniframe, 8
	dfi_sprtimer spid, aniframe*6
	;
	bomkaz=4
	if _p3>2 : bomkaz=8
	repeat bomkaz
		dfi_sprnew
		gosub *bomlev0
		x=rnd(16)-8:y=rnd(16)-8
		if _p3>2 : x*=2 : y*=2
		dfi_move spid, x,y
	loop
	return

#deffunc df_addfire int _p1, int _p2, int _p3, int _p4, int _p5, int _p6

	;	�ԉ΃G�t�F�N�g�o�^
	;		x,y,color,level,speed, frame
	;
	bomframe=50
	if _p6>0 : bomframe=_p6
	bomspeed=100
	if _p5>0 :bomspeed=_p5
	bomkaz=8
	if _p4>0 : bomkaz=16
	bomrot=256/bomkaz
	bomspeed=16*bomspeed/100
	repeat bomkaz
		dfi_sprnew
		dfi_sprset spid, _p1, _p2, CHR_DOT1+_p3
		dfi_rotmove spid, cnt*bomrot, bomspeed
		dfi_sprtimer spid, bomframe
	loop
	return


#deffunc df_addeff int _p1, int _p2, int _p3, int _p4, int _p5

	;	�ėp�X�v���C�g�G�t�F�N�g�o�^
	;		x,y,celid,bufid
	;
	dfi_sprnew
	dfi_sprset spid, _p2, _p3, _p4, _p5
	return

#deffunc df_addfmes str _p1, int _p2, int _p3, int _p4, int _p5

	;	�t�H���g���b�Z�[�W�o�^(�G�t�F�N�g)
	;		"mes",x,y,color,wait
	;
	dfi_sprnew
	dfi_sprset spid, _p2, _p3, 0
	dfi_sprstr spid, _p1, _p4, _p5
	sprflag(spid)=SPR_FMES
	dfi_sprtimer spid, _dotfw_fps@*10
	return

#deffunc df_addmes str _p1, int _p2, int _p3, int _p4, int _p5

	;	BG���b�Z�[�W�o�^(�G�t�F�N�g)
	;		"mes",x,y,color,wait
	;
	dfi_sprnew
	dfi_sprset spid, _p2, _p3, 0
	dfi_sprstr spid, _p1, _p4, _p5
	return



;------------------------------------------------------------
#global
#endif

