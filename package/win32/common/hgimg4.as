;
; HGIMG4 Default define and macros
;
#ifndef __hgimg4__
#define __hgimg4__
#define __hsp3dish__
#define global _HSP3DISH
#define global _HGIMG4

#runtime "hsp3gp"

#const global FILTER_NONE 0
#const global FILTER_LINEAR 1
#const global FILTER_LINEAR2 2

#const global CLSMODE_NONE 0
#const global CLSMODE_SOLID 1
#const global CLSMODE_TEXTURE 2
#const global CLSMODE_BLUR 3

#const global GPOBJ_MODE_HIDE 1
#const global GPOBJ_MODE_TREE 2
#const global GPOBJ_MODE_XFRONT 4
#const global GPOBJ_MODE_MOVE 32
#const global GPOBJ_MODE_FLIP 64
#const global GPOBJ_MODE_BORDER 0x80
#const global GPOBJ_MODE_2D 0x100
#const global GPOBJ_MODE_TIMER 0x200
#const global GPOBJ_MODE_SORT 0x400
#const global GPOBJ_MODE_STATIC 0x800
#const global GPOBJ_MODE_GRAVITY 0x1000
#const global GPOBJ_MODE_LATE 0x4000
#const global GPOBJ_MODE_FIRST 0x8000
#const global GPOBJ_MODE_STAND 0x10000
#const global GPOBJ_MODE_GROUND 0x20000
#const global GPOBJ_MODE_LAND 0x40000
#const global GPOBJ_MODE_LOOKAT 0x80000

#const global GPOBJ_SCENE  0x100001
#const global GPOBJ_CAMERA 0x100002
#const global GPOBJ_LIGHT  0x100003

#const global GPOBJ_MATOPT_NOLIGHT (1)
#const global GPOBJ_MATOPT_NOMIPMAP (2)
#const global GPOBJ_MATOPT_NOCULL (4)
#const global GPOBJ_MATOPT_NOZTEST (8)
#const global GPOBJ_MATOPT_NOZWRITE (16)
#const global GPOBJ_MATOPT_BLENDADD (32)

;
;	system request
;
#enum global SYSREQ_MAXMODEL=1
#enum global SYSREQ_MAXOBJ
#enum global SYSREQ_MAXTEX
#enum global SYSREQ_MAXMOC
#enum global SYSREQ_DXMODE
#enum global SYSREQ_DXHWND
#enum global SYSREQ_DXWIDTH
#enum global SYSREQ_DXHEIGHT
#enum global SYSREQ_COLORKEY
#enum global SYSREQ_RESULT
#enum global SYSREQ_RESVMODE
#enum global SYSREQ_PKTSIZE
#enum global SYSREQ_MAXEVENT
#enum global SYSREQ_PTRD3D
#enum global SYSREQ_PTRD3DDEV
#enum global SYSREQ_MDLANIM
#enum global SYSREQ_CALCNORMAL
#enum global SYSREQ_2DFILTER
#enum global SYSREQ_3DFILTER
#enum global SYSREQ_OLDCAM
#enum global SYSREQ_QUATALG
#enum global SYSREQ_DXVSYNC
#enum global SYSREQ_DEFTIMER
#enum global SYSREQ_NOMIPMAP
#enum global SYSREQ_DEVLOST
#enum global SYSREQ_MAXEMITTER
#enum global SYSREQ_THROUGHFLAG
#enum global SYSREQ_OBAQMATBUF
#enum global SYSREQ_2DFILTER2
#enum global SYSREQ_FPUPRESERVE
#enum global SYSREQ_CLSMODE
#enum global SYSREQ_CLSCOLOR
#enum global SYSREQ_CLSTEX
#enum global SYSREQ_TIMER

#define global ginfo_accx ginfo(0x100)
#define global ginfo_accy ginfo(0x101)
#define global ginfo_accz ginfo(0x102)

#define global SYSREQ_DEBUG $10000

#regcmd 9
#cmd gfilter $3f
#cmd setreq $40
#cmd getreq $41
#cmd mmvol $42
#cmd mmpan $43
#cmd mmstat $44
#cmd mtlist $45
#cmd mtinfo $46
#cmd devinfo $47
#cmd devinfoi $48
#cmd devprm $49
#cmd devcontrol $4a
#cmd setcls $4b
#cmd celputm $4c

#cmd gpreset $60
#cmd gpdraw $61
#cmd gpusescene $62
#cmd gpsetprm $63
#cmd gpgetprm $64
#cmd gppostefx $65
#cmd gpuselight $66

#cmd gpdelobj $70
#cmd gpcolormat $71
#cmd gptexmat $72
#cmd gpusermat $73
#cmd gpclone $74
#cmd gpload $75
#cmd gpmesh $76
#cmd gpfloor $77
#cmd gpbox $78
#cmd gpspr $79
#cmd gplight $7a
#cmd setobjmode $7b
#cmd gplookat $7c
#cmd gppbind $7d

#cmd getpos $80
#cmd getquat $81
#cmd getscale $82
#cmd getdir $83
#cmd getefx $84
#cmd getcolor $85
#cmd getwork $86
#cmd getwork2 $87

#cmd getposi $90
#cmd getquati $91
#cmd getscalei $92
#cmd getdiri $93
#cmd getefxi $94
#cmd getcolori $95
#cmd getworki $96
#cmd getwork2i $97

#cmd selpos $a0
#cmd selquat $a1
#cmd selscale $a2
#cmd seldir $a3
#cmd selefx $a4
#cmd selcolor $a5
#cmd selwork $a6
#cmd selwork2 $a7

#cmd setpos $b0
#cmd setquat $b1
#cmd setscale $b2
#cmd setdir $b3
#cmd setefx $b4
#cmd setcolor $b5
#cmd setwork $b6
#cmd setwork2 $b7
#cmd setaxang $b8
#cmd setang $b9
#cmd setangy $ba
#cmd setangz $bb

#cmd addpos $c0
#cmd addquat $c1
#cmd addscale $c2
#cmd adddir $c3
#cmd addefx $c4
#cmd addcolor $c5
#cmd addwork $c6
#cmd addwork2 $c7
#cmd addaxang $c8
#cmd addang $c9
#cmd addangy $ca
#cmd addangz $cc

#cmd objset $d0
#cmd objseti $d1
#cmd objadd $d2
#cmd objget $d3
#cmd objgeti $d4
#cmd objsetfv $d5
#cmd objgetvv $d6
#cmd objaddfv $d7

#cmd fvset $e0
#cmd fvseti $e1
#cmd fvadd $e2
#cmd fvsub $e3
#cmd fvmul $e4
#cmd fvdiv $e5
#cmd fvdir $e6
#cmd fvmin $e7
#cmd fvmax $e8
#cmd fvunit $e9
#cmd fvouter $ea
#cmd fvinner $eb
#cmd fvface $ec

#cmd fv2str $ed
#cmd f2str $ee
#cmd str2fv $ef

#cmd fvquat $f0
#cmd fvqaxang $f1
#cmd fvqangx $f2
#cmd fvqangy $f3
#cmd fvqangz $f4

#define fsin(%1,%2) %1=sin(%2)
#define fcos(%1,%2) %1=cos(%2)
#define fsqr(%1,%2) %1=sqrt(%2)
#define froti(%1,%2) %1=%2/6433.98175455188992



#endif

