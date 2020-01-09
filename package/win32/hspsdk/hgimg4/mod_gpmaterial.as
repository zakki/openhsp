#module

#define global DEF_DLIGHT (1)
#define global DEF_PLIGHT (2)
#define global DEF_SLIGHT (4)
#define global DEF_SKINNING (8)

#define global DEF_SPECULAR (32)
#define global DEF_MODCOLOR (64)
#define global DEF_MODALPHA (128)
#define global DEF_DISCARDALPHA (256)

#deffunc matload str _p1

	sdim matdata,$10000
	sdim matname,$1000
	sdim matbase,$1000
	sdim s1,256
	sdim s2,256
	sdim s3,256
	mat_fname=""

	mat_textured = 0
	mat_colored = 0

	mat_max=0
	dim mat_idx,256
	dim mat_inherit,256
	dim mat_colored,256

	exist _p1
	if strsize<=0 : return

	mat_fname=_p1
	notesel matdata
	noteload mat_fname

	if notemax<=1 : return

	;	material検索
	repeat notemax
		noteget s1,cnt
		if strmid(s1,0,9)="material " {
			mat_idx(mat_max)=cnt
			mat_inherit(mat_max)=-1
			s2=strmid(s1,9,255)
			getstr s3,s2,0,' ',64
			i=strsize
			matname+=s3+"\n"
			if s3="textured" : mat_textured=cnt
			if s3="colored" : mat_colored=cnt

			if peek(s2,i)=' ' : i++
			if peek(s2,i)=':' : i++
			if peek(s2,i)=' ' : i++
			s3=strmid(s2,i,64)
			matbase+=s3+"\n"
			if s3="textured" : mat_inherit(mat_max) = mat_textured
			if s3="colored" : mat_inherit(mat_max) = mat_colored : mat_colored(mat_max)=1

			mat_max++
		}
	loop

	list_mat@=matname

	if mat_max<=0 : return
	;mes "MAX="+mat_max
	;mes matname
	;mes matbase

	dim mat_rs_inherit,mat_max
	dim mat_defval,mat_max
	dim mat_deflight,mat_max
	dim mat_defjoint,mat_max
	dim mat_specular, mat_max

	sdim mat_name, 128, mat_max
	sdim mat_path, 128, mat_max
	sdim mat_color, 128, mat_max
	sdim mat_define, 128, mat_max
	sdim mat_wrapS, 16, mat_max
	sdim mat_wrapT, 16, mat_max
	sdim mat_mipmap, 16, mat_max
	sdim mat_minfilter, 32, mat_max
	sdim mat_magfilter, 32, mat_max
	sdim mat_rs_cull, 16, mat_max
	sdim mat_rs_depth, 16, mat_max
	sdim mat_rs_depthfunc, 16, mat_max
	sdim mat_rs_depthwrt, 16, mat_max
	sdim mat_rs_blend, 16, mat_max
	sdim mat_rs_blendsrc, 32, mat_max
	sdim mat_rs_blenddst, 32, mat_max

	j=-1	
	repeat mat_max
		id=cnt
		notesel matname
		noteget mat_name(cnt),cnt
		notesel matdata
		i=mat_idx(cnt):element="u_diffuseColor":gosub *srch_string
		mat_color(cnt)=s2
		i=mat_idx(cnt):element="u_specularExponent":gosub *srch_string
		mat_specular(cnt)=0+s2

		i=mat_idx(cnt):element="path":gosub *srch_string
		mat_path(cnt)=s2
		i=mat_idx(cnt):element="defines":gosub *srch_string
		mat_define(cnt)=s2
		gosub *srch_defines

		i=mat_idx(cnt):element="wrapS":gosub *srch_string
		mat_wrapS(cnt)=s2
		i=mat_idx(cnt):element="wrapT":gosub *srch_string
		mat_wrapT(cnt)=s2
		i=mat_idx(cnt):element="mipmap":gosub *srch_string
		mat_mipmap(cnt)=s2
		i=mat_idx(cnt):element="minFilter":gosub *srch_string
		mat_minfilter(cnt)=s2
		i=mat_idx(cnt):element="magFilter":gosub *srch_string
		mat_magfilter(cnt)=s2

		no_inherit=0
		i=mat_idx(cnt):element="cullFace":gosub *srch_string
		mat_rs_cull(cnt)=s2
		i=mat_idx(cnt):element="depthTest":gosub *srch_string
		mat_rs_depth(cnt)=s2
		i=mat_idx(cnt):element="depthFunc":gosub *srch_string
		mat_rs_depthfunc(cnt)=s2
		i=mat_idx(cnt):element="depthWrite":gosub *srch_string
		mat_rs_depthwrt(cnt)=s2
		i=mat_idx(cnt):element="blend":gosub *srch_string
		mat_rs_blend(cnt)=s2
		i=mat_idx(cnt):element="blendSrc":gosub *srch_string
		mat_rs_blendsrc(cnt)=s2
		i=mat_idx(cnt):element="blendDst":gosub *srch_string
		mat_rs_blenddst(cnt)=s2

		mat_rs_inherit(cnt)=no_inherit

#if 0
		mes "Material:"+mat_name(cnt)+" Colored:"+mat_colored(cnt)+" Defval:"+mat_defval(cnt)
		gosub *make_defines
		mes "Defines:"+mat_define(cnt)

		if mat_colored(cnt) {
			mes "color:"+mat_color(cnt)
		} else {
			mes "path:"+mat_path(cnt)
		}
		mes "cull:"+mat_rs_cull(cnt)+" depth:"+mat_rs_depth(cnt)
		mes "blend:"+mat_rs_blend(cnt)+" src:"+mat_rs_blendsrc(cnt)+" dst:"+mat_rs_blenddst(cnt)
#endif
	loop

	return

*srch_defines
	;	mat_define(id)からmat_defval値を求める(結果はmat_defval(id)に入る)
	;	(material IDをidに入れておくこと)
	;	DEF_*の組み合わせを解析する
	;
	s2=mat_define(id)
	;
	a=0
	a1=instr(s2,0,"DIRECTIONAL_LIGHT_COUNT")
	if a1>=0 {
		a=DEF_DLIGHT
		getstr s3,s2,a1+23,';',16
		mat_deflight(id)=0+s3
	}
	a1=instr(s2,0,"POINT_LIGHT_COUNT")
	if a1>=0 {
		a=DEF_PLIGHT
		getstr s3,s2,a1+17,';',16
		mat_deflight(id)=0+s3
	}
	a1=instr(s2,0,"SPOT_LIGHT_COUNT")
	if a1>=0 {
		a=DEF_SLIGHT
		getstr s3,s2,a1+16,';',16
		mat_deflight(id)=0+s3
	}

	a1=instr(s2,0,"SKINNING_JOINT_COUNT")
	if a1>=0 {
		a|=DEF_SKINNING
		getstr s3,s2,a1+20,';',16
		mat_defjoint(id)=0+s3
	}
	a1=instr(s2,0,"SPECULAR")
	if a1>=0 {
		a|=DEF_SPECULAR
	}
	a1=instr(s2,0,"MODULATE_COLOR")
	if a1>=0 {
		a|=DEF_MODCOLOR
	}
	a1=instr(s2,0,"MODULATE_ALPHA")
	if a1>=0 {
		a|=DEF_MODALPHA
	}
	a1=instr(s2,0,"TEXTURE_DISCARD_ALPHA")
	if a1>=0 {
		a|=DEF_DISCARDALPHA
	}

	mat_defval(id)=a
	return

*srch_string
	;	i行から"element=***"を検索する(結果はs2)
	;	(j>=0の場合はindex=jとして継承元を検索する)
	;
	s2=""
*srch_string_main
	noteget s1,i
	if s1="}" {
		if j<0 : return
		i=j
		goto *srch_string_main2
	}
	a1=instr(s1,0,element)
	if a1>=0 {
		a2=instr(s1,0,"=")
		if a2>=0 {
			a2++
			if peek(s1,a2)=' ' : a2++
			s2=strmid(s1,a2,255)
			no_inherit=1
			return
		}
	}
	i++
	goto *srch_string_main

*srch_string_main2
	noteget s1,i
	if s1="}" : return
	a1=instr(s1,0,element)
	if a1>=0 {
		a2=instr(s1,0,"=")
		if a2>=0 {
			a2++
			if peek(s1,a2)=' ' : a2++
			s2=strmid(s1,a2,255)
			return
		}
	}
	i++
	goto *srch_string_main2


#deffunc matsave

	;	matmakeで再構築したデータを差し替える
	;	(読み込まれているファイルを修正する)
	;	(再構築後はmatloadで再読み込みが必要)
	;
	if mat_fname="" : return

	sdim wrt,$10000
	s3="material "+mat_name(id)

	notesel matdata
	i=0
*matsave1
	if i>=notemax : goto *matsave_ov

	noteget s1,i
	if instr(s1,0,s3)=0 : goto *matsave2
	wrt+=s1+"\n"
	i++
	goto *matsave1

*matsave2
	i++
	if i>=notemax : goto *matsave_ov
	noteget s1,i
	if s1="}" {
		wrt+=mat_rebuild
		i++
		goto *matsave1
	}
	goto *matsave2
*matsave_ov
	notesel wrt
	notesave mat_fname
	sdim wrt,64
	return


#deffunc matmake int _p1

	;	idのマテリアルファイルを再構築する
	;
	id=_p1
	sdim mat_rebuild,$1000
	s3="material "+mat_name(id)
	notesel matdata
	i=notefind(s3,1)
	if i<0 : return -1
	flag_rs=0

*matmake_1
	notesel matdata
	if i>=notemax : goto *matmake_ov

	noteget s1,i
	if instr(s1,0,"sampler u_diffuseTexture")>=0 {
		gosub *make_material_smp
		goto *matmake_skip
	}
	if instr(s1,0,"renderState")>=0 {
		gosub *make_material_rs
		flag_rs++
		goto *matmake_skip
	}
	if instr(s1,0,"technique")>=0 {
		if flag_rs=0 {
			a1=(mat_rs_cull(id)+mat_rs_depth(id)+mat_rs_blend(id)+mat_rs_depthwrt(id))=""
			if a1=0 {
				gosub *make_material_rs
				flag_rs++
				goto *matmake_1
			}
		}
	}
	a1=instr(s1,0,"defines = ")
	if a1>=0 {
		gosub *make_defines
		s1=strmid(s1,0,a1+10)+s2
	}
	a1=instr(s1,0,"u_specularExponent = ")
	if a1>=0 {
		if mat_specular(id)!="" {
			s1=strmid(s1,0,a1+21)+mat_specular(id)
		}
	}
	if s1="}" : goto *matmake_ov
	mat_rebuild+=s1+"\n"

	i++
	goto *matmake_1

*matmake_skip
	;	次のブロックまでを読み飛ばす
	if i>=notemax : goto *matmake_ov
	i++
	noteget s1,i
	if s1!="    }" : goto *matmake_skip
	i++
	goto *matmake_1

*matmake_ov
	mat_rebuild+=s1+"\n"

	;mes mat_rebuild
	return 0

*make_material_smp
	;	materialのsampler定義を再現する(結果はmat_rebuild)
	;	(material IDをidに入れておくこと)
	;
	mat_rebuild+="    sampler u_diffuseTexture\n    {\n"

	mat_rebuild+="        path = "+mat_path(id)+"\n"
	mat_rebuild+="        wrapS = "+mat_wrapS(id)+"\n"
	mat_rebuild+="        wrapT = "+mat_wrapT(id)+"\n"

	if mat_mipmap(id)!="" {
		mat_rebuild+="        mipmap = "+mat_mipmap(id)+"\n"
	}
	if mat_minfilter(id)!="" {
		mat_rebuild+="        minFilter = "+mat_minfilter(id)+"\n"
	}
	if mat_magfilter(id)!="" {
		mat_rebuild+="        magFilter = "+mat_magfilter(id)+"\n"
	}

	mat_rebuild+="    }\n"
	return

*make_material_rs
	;	materialのrenderState定義を再現する(結果はmat_rebuild)
	;	(material IDをidに入れておくこと)
	;
	mat_rebuild+="    renderState\n    {\n"

	if mat_rs_cull(id)!="" {
		mat_rebuild+="        cullFace = "+mat_rs_cull(id)+"\n"
	}
	if mat_rs_depth(id)!="" {
		mat_rebuild+="        depthTest = "+mat_rs_depth(id)+"\n"
	}
	if mat_rs_depthfunc(id)!="" {
		mat_rebuild+="        depthFunc = "+mat_rs_depthfunc(id)+"\n"
	}
	if mat_rs_depthwrt(id)!="" {
		mat_rebuild+="        depthWrite = "+mat_rs_depthwrt(id)+"\n"
	}
	if mat_rs_blend(id)!="" {
		mat_rebuild+="        blend = "+mat_rs_blend(id)+"\n"
	}
	if mat_rs_blendsrc(id)!="" {
		mat_rebuild+="        blendSrc = "+mat_rs_blendsrc(id)+"\n"
	}
	if mat_rs_blenddst(id)!="" {
		mat_rebuild+="        blendDst = "+mat_rs_blenddst(id)+"\n"
	}

	mat_rebuild+="    }\n"
	return

*make_defines
	;	mat_defval(id)値からdefinesを求める(結果はmat_define(id)に入る)
	;	(material IDをidに入れておくこと)
	;	DEF_*の組み合わせを展開する(再現しないものもある)
	;
	s2=""
	a=mat_defval(id)

	if a&DEF_DLIGHT {
		s2+="DIRECTIONAL_LIGHT_COUNT "+mat_deflight(id)
	}
	if a&DEF_PLIGHT {
		s2+="POINT_LIGHT_COUNT "+mat_deflight(id)
	}
	if a&DEF_SLIGHT {
		s2+="SPOT_LIGHT_COUNT "+mat_deflight(id)
	}

	if a&DEF_SKINNING {
		if s2!="" : s2+=";"
		s2+="SKINNING;SKINNING_JOINT_COUNT "+mat_defjoint(id)
	}
	if a&DEF_SPECULAR {
		if s2!="" : s2+=";"
		s2+="SPECULAR"
	}
	if a&DEF_MODCOLOR {
		if s2!="" : s2+=";"
		s2+="MODULATE_COLOR"
	}
	if a&DEF_MODALPHA {
		if s2!="" : s2+=";"
		s2+="MODULATE_ALPHA"
	}
	if a&DEF_DISCARDALPHA {
		if s2!="" : s2+=";"
		s2+="TEXTURE_DISCARD_ALPHA"
	}

	mat_define(id)=s2
	return

#defcfunc gbool_str int _p1

	if _p1=1 : return "false"
	if _p1=2 : return "true"
	return ""

#defcfunc gstr_bool str _p1

	if _p1="" : return 0
	if _p1="true" : return 2
	if _p1="TRUE" : return 2
	return 1

#defcfunc gstr_wrap str _p1

	if _p1="CLAMP" : return 1
	if _p1="REPEAT" : return 2
	return 0

#defcfunc gstr_filter str _p1

	if _p1="NEAREST" : return 1
	if _p1="LINEAR" : return 2
	if _p1="NEAREST_MIPMAP_NEAREST" : return 3
	if _p1="LINEAR_MIPMAP_NEAREST" : return 4
	if _p1="NEAREST_MIPMAP_LINEAR" : return 5
	if _p1="LINEAR_MIPMAP_LINEAR" : return 6
	return 0

#defcfunc gstr_dfunc str _p1

	if _p1="NEVER" : return 1
	if _p1="LESS" : return 2
	if _p1="EQUAL" : return 3
	if _p1="LEQUAL" : return 4
	if _p1="GREATER" : return 5
	if _p1="NOTEQUAL" : return 6
	if _p1="GEQUAL" : return 7
	if _p1="ALWAYS" : return 8
	return 0

#defcfunc gstr_blend str _p1

	if _p1="ZERO" : return 1
	if _p1="ONE" : return 2
	if _p1="SRC_COLOR" : return 3
	if _p1="ONE_MINUS_SRC_COLOR" : return 4
	if _p1="DST_COLOR" : return 5
	if _p1="ONE_MINUS_DST_COLOR" : return 6
	if _p1="SRC_ALPHA" : return 7
	if _p1="ONE_MINUS_SRC_ALPHA" : return 8
	if _p1="DST_ALPHA" : return 9
	if _p1="ONE_MINUS_DST_ALPHA" : return 10
	if _p1="CONSTANT_ALPHA" : return 11
	if _p1="ONE_MINUS_CONSTANT_ALPHA" : return 12
	if _p1="SRC_ALPHA_SATURATE" : return 13
	return 0

#deffunc matgui_apply

	;	マテリアルGUIの内容を反映させる
	;
	a = mat_defval(id) & DEF_SKINNING

	if chk_lighting : a|=DEF_DLIGHT
	if chk_specular : a|=DEF_SPECULAR
	if chk_modcolor : a|=DEF_MODCOLOR
	if chk_modalpha : a|=DEF_MODALPHA
	if chk_discardalpha : a|=DEF_DISCARDALPHA
	mat_defval(id)=a

	mat_deflight(id) = in_lights
	mat_specular(id) = in_specular
	mat_color(id) = in_color
	mat_path(id) = in_path

	mat_mipmap(id) = gbool_str(sel_mipmap)

	notesel selstr_wrap
	noteget mat_wrapS(id),sel_wraps
	noteget mat_wrapT(id),sel_wrapt
	notesel selstr_filter
	noteget mat_minfilter(id),sel_minfilter
	noteget mat_magfilter(id),sel_magfilter

	mat_rs_cull(id) = gbool_str(sel_cull)
	mat_rs_depth(id) = gbool_str(sel_depth)

	mat_rs_depthwrt(id) = gbool_str(sel_depthwrt)
	mat_rs_blend(id) = gbool_str(sel_blend)

	notesel selstr_dfunc
	noteget mat_rs_depthfunc(id),sel_depthfunc

	notesel selstr_blend
	noteget mat_rs_blendsrc(id),sel_blendsrc
	noteget mat_rs_blenddst(id),sel_blenddst

	return

#deffunc matgui int _p1

	;	idのマテリアルGUIを構築する
	;
	id=_p1

	selstr_bool = "\nfalse\ntrue"
	selstr_wrap = "\nCLAMP\nREPEAT"
	selstr_filter = "\nNEAREST\nLINEAR\nNEAREST_MIPMAP_NEAREST\nLINEAR_MIPMAP_NEAREST\nNEAREST_MIPMAP_LINEAR\nLINEAR_MIPMAP_LINEAR"
	selstr_dfunc = "\nNEVER\nLESS\nEQUAL\nLEQUAL\nGREATER\nNOTEQUAL\nGEQUAL\nALWAYS"
	selstr_blend = "\nZERO\nONE\nSRC_COLOR\nONE_MINUS_SRC_COLOR\nDST_COLOR\nONE_MINUS_DST_COLOR\nSRC_ALPHA\nONE_MINUS_SRC_ALPHA\nDST_ALPHA\nONE_MINUS_DST_ALPHA\nCONSTANT_ALPHA\nONE_MINUS_CONSTANT_ALPHA\nSRC_ALPHA_SATURATE"

	x=8:y=400

	chk_lighting=0
	chk_specular=0
	chk_modcolor=0
	chk_modalpha=0
	chk_discardalpha=0
	in_lights=mat_deflight(id)
	in_specular=mat_specular(id)
	in_color = mat_color(id)
	in_path = mat_path(id)
	sel_mipmap = gstr_bool( mat_mipmap(id) )
	sel_wraps = gstr_wrap( mat_wrapS(id) )
	sel_wrapt = gstr_wrap( mat_wrapT(id) )
	sel_minfilter = gstr_filter( mat_minfilter(id) )
	sel_magfilter = gstr_filter( mat_magfilter(id) )

	sel_cull = gstr_bool( mat_rs_cull(id) )
	sel_depth = gstr_bool( mat_rs_depth(id) )
	sel_depthfunc = gstr_dfunc( mat_rs_depthfunc(id) )
	sel_depthwrt = gstr_bool( mat_rs_depthwrt(id) )
	sel_blend = gstr_bool( mat_rs_blend(id) )
	sel_blendsrc = gstr_blend( mat_rs_blendsrc(id) )
	sel_blenddst = gstr_blend( mat_rs_blenddst(id) )

	sysfont 17
	objmode objmode_guifont

	if mat_colored(id) : s1="colored" : else : s1="textured"

	xx=x:yy=y
	pos x,y
	mes "Material : "+mat_name(id)+" ("+s1+")"

	objsize 240,24
	if mat_colored(id) {
		pos x,y+20:mes "Color :"
		pos x+40,y+16:input in_color
	} else {
		pos x,y+20:mes "Path :"
		pos x+40,y+16:input in_path
	}

	if mat_colored(id)=0 {
		objsize 90,24
		pos x,y+60:mes "Mipmap :"
		pos x+50,y+56:combox sel_mipmap,,selstr_bool
		pos x+160,y+60:mes "WrapS :"
		pos x+200,y+56:combox sel_wraps,,selstr_wrap
		pos x+320,y+60:mes "WrapT :"
		pos x+360,y+56:combox sel_wrapt,,selstr_wrap
		objsize 180,24
		pos x,y+84:mes "MinFilter :"
		pos x+60,y+80:combox sel_minfilter,,selstr_filter
		pos x+280,y+84:mes "MagFilter :"
		pos x+340,y+80:combox sel_magfilter,,selstr_filter
	}

	pos x+320,y
	a=mat_defval(id)
	if a&DEF_SKINNING {
		mes "Skinning (joint:"+mat_defjoint(id)+")"
	}
	if a&DEF_DLIGHT {
		chk_lighting=1
	}
	if a&DEF_SPECULAR {
		chk_specular=1
	}
	if a&DEF_MODCOLOR {
		chk_modcolor=1
	}
	if a&DEF_MODALPHA {
		chk_modalpha=1
	}
	if a&DEF_DISCARDALPHA {
		chk_discardalpha=1
	}

	x=xx:y=yy+128
	pos x,y
	objsize 160,24
	chkbox "Directional Light",chk_lighting
	chkbox "Specular",chk_specular
	chkbox "Modulate Color",chk_modcolor
	chkbox "Modulate Alpha",chk_modalpha
	chkbox "Discard Alpha",chk_discardalpha

	objsize 60,24
	pos x+200,y: mes "Lights :"
	pos x+250,y-2: input in_lights
	pos x+350,y: mes "Specular :"
	pos x+410,y-2: input in_specular

	pos x+200,y+40: mes "cullFace :"
	pos x+260,y+36: combox sel_cull,,selstr_bool
	pos x+200,y+70: mes "depthTest :"
	pos x+260,y+66: combox sel_depth,,selstr_bool
	pos x+350,y+70: mes "depthWrite :"
	pos x+410,y+66: combox sel_depthwrt,,selstr_bool

	objsize 120,24
	pos x+200,y+100: mes "depthFunc :"
	pos x+260,y+96: combox sel_depthfunc,,selstr_dfunc

	objsize 60,24
	pos x,y+130: mes "blend :"
	pos x+40,y+126: combox sel_blend,,selstr_bool

	objsize 200,24
	pos x+20,y+160: mes "blendSrc :"
	pos x+80,y+156: combox sel_blendsrc,,selstr_blend
	pos x+20,y+190: mes "blendDst :"
	pos x+80,y+186: combox sel_blenddst,,selstr_blend

	objsize 140,40
	pos x+470,y+160
	return


#global

