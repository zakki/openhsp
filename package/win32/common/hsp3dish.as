;
; HSP3DISH Default define and macros
;
#ifndef __hsp3dish__
#define __hsp3dish__
#define global _HSP3DISH

#runtime "hsp3dish"

#const global FILTER_NONE 0
#const global FILTER_LINEAR 1
#const global FILTER_LINEAR2 2

#const global FLAG_NONE 0
#const global FLAG_ENTRY 1
#const global FLAG_VISIBLE 2
#const global FLAG_MOVING 4

#const global OBJ_HIDE 1
#const global OBJ_TREE 2
#const global OBJ_XFRONT 4
#const global OBJ_MOVE 32
#const global OBJ_FLIP 64
#const global OBJ_BORDER 0x80
#const global OBJ_2D 0x100
#const global OBJ_SORT 0x400
#const global OBJ_STATIC 0x800
#const global OBJ_GRAVITY 0x1000
#const global OBJ_LATE 0x4000
#const global OBJ_FIRST 0x8000

#const global OBJ_STAND 0x10000
#const global OBJ_GROUND 0x20000
#const global OBJ_LAND 0x40000
#const global OBJ_LOOKAT 0x80000

#const global OBJ_BOUND 0x100000
#const global OBJ_ALIEN 0x200000
#const global OBJ_WALKCLIP 0x400000
#const global OBJ_EMITTER 0x800000

#enum global PRMSET_MODE = 0
#enum global PRMSET_FLAG
#enum global PRMSET_SHADE
#enum global PRMSET_TIMER
#enum global PRMSET_MYGROUP
#enum global PRMSET_COLGROUP

#const global HGOBJ_CAMERA 0
#const global HGOBJ_LIGHT 1

#const global CAM_MODE_NORMAL 0
#const global CAM_MODE_LOOKAT 1
#const global CAM_MODE_LOOKOBJ 2
#const global CAM_MODE_AUTOMOVE 3

#const global HGMODEL_ROTORDER_ZYX 0
#const global HGMODEL_ROTORDER_XYZ 1
#const global HGMODEL_ROTORDER_YXZ 2

#const global MOVEMODE_LINEAR 0
#const global MOVEMODE_SPLINE 1
#const global MOVEMODE_LINEAR_REL 2
#const global MOVEMODE_SPLINE_REL 3
#const global MOVEMODE_FROMWORK 16

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
#enum global SYSREQ_PLATFORM

#const global PLATFORM_WINDOWS 0
#const global PLATFORM_IOS 1
#const global PLATFORM_ANDROID 2

#define global SYSREQ_DEBUG $10000

#define global ginfo_accx ginfo(0x100)
#define global ginfo_accy ginfo(0x101)
#define global ginfo_accz ginfo(0x102)

#regcmd 9
#cmd gfilter $3f
#cmd setreq $40
#cmd getreq $41

#endif

