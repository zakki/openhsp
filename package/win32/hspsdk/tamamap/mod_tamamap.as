#ifndef __MOD_TAMAMAP
#define __MOD_TAMAMAP

;TamaMap Module

#include "mod_appconfig.as"

#uselib "kernel32"
#cfunc GetUserDefaultUILanguage "GetUserDefaultUILanguage"

#define STRMAP_EN "en.strmap"

goto *_end_mod_tamamap

//---------------------------------------------------------

#define INIFILE "tamamap.ini"
#define APPNAME "TamaMap"

#deffunc tamamap_init

	;	アプリ設定の初期化(起動時)
	;
	fontname=""
	fontsize=14

#ifdef _DEBUG
	filedir=dir_cur
#else
	filedir=dir_exe	;dir_mydoc
#endif
	author="???"
	url=""
	recent=""
	uuid=""
	weburl="https://hsp.tv/"
	fgcolor=$1e1e1e
	bgcolor=$dcdcdc
	selcolor=$ff0000

	sdim celfile,256
	celsizex=16
	celsizey=16
	mapsizex=256
	mapsizey=256
	mapzoom=4
	celzoom=1

	def_wx=1280:def_wy=720
	app_winx=-1
	app_winy=-1
	initopt=0
	langset=0

	langid = GetUserDefaultUILanguage()
	if langid!=$411 : langset=1
	;if langset : strexchange STRMAP_EN

	cfg_init INIFILE,APPNAME
	cfg_load:modcfg=stat
	if modcfg {	; iniファイル読み込み
		def_wx=0+cfg_getvar("wx")
		def_wy=0+cfg_getvar("wy")
		app_winx=0+cfg_getvar("winx")
		app_winy=0+cfg_getvar("winy")
		cfg_getvari langset,"langset"
		fontname=cfg_getvar("fontname")
		fontsize=0+cfg_getvar("fontsize")
		fgcolor=0+cfg_getvar("fgcolor")
		bgcolor=0+cfg_getvar("bgcolor")
		selcolor=0+cfg_getvar("selcolor")

		filedir=cfg_getvar("filedir")
		author=cfg_getvar("author")
		url=cfg_getvar("url")
		recent=cfg_getvar("recent")
		uuid=cfg_getvar("uuid")

		if fgcolor=0&&bgcolor=0 : bgcolor=$dcdcdc : fgcolor=$1e1e1e

		celsizex=0+cfg_getvar("celsizex")
		celsizey=0+cfg_getvar("celsizey")
		mapsizex=0+cfg_getvar("mapsizex")
		mapsizey=0+cfg_getvar("mapsizey")
		mapzoom=0+cfg_getvar("mapzoom")
		celzoom=0+cfg_getvar("celzoom")
		celfile=cfg_getvar("celfile")

	}

	if uuid="" {
		uuid = strf("%04d%02d%02d%02d%02d%02d",gettime(0),gettime(1),gettime(3),gettime(4),gettime(5),gettime(6))
	}
	return

#deffunc tamamap_term

	;	アプリ設定の保存(終了時)
	;
	if wx<640 : wx=640
	if wy<480 : wy=480

	cfg_init INIFILE,APPNAME
	cfg_seti "wx",def_wx
	cfg_seti "wy",def_wy
	cfg_seti "winx",ginfo_wx1
	cfg_seti "winy",ginfo_wy1
	cfg_seti "langset",langset
	cfg_sets "fontname",fontname
	cfg_seti "fontsize",fontsize
	cfg_seti "fgcolor",fgcolor
	cfg_seti "bgcolor",bgcolor
	cfg_seti "selcolor",selcolor

	cfg_sets "filedir",filedir
	cfg_sets "author",author
	cfg_sets "url",url
	cfg_sets "recent",recent
	cfg_sets "uuid",uuid

	cfg_seti "celsizex",celsizex
	cfg_seti "celsizey",celsizey
	cfg_seti "mapsizex",mapsizex
	cfg_seti "mapsizey",mapsizey
	cfg_seti "mapzoom",mapzoom
	cfg_seti "celzoom",celzoom
	cfg_sets "celfile",celfile


	cfg_save

	return

//---------------------------------------------------------

*_end_mod_tamamap

#endif

