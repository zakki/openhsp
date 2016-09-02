// HSPプラグインの構造体や定数のヘッダファイル(Win64)

#ifndef HPI3STRUCTS64_H
#define HPI3STRUCTS64_H


// 定数

#const  PARAM_OK            0
#const  PARAM_SPLIT         (-1)
#const  PARAM_END           (-2)
#const  PARAM_DEFAULT       (-3)
#const  PARAM_ENDSPLIT      (-4)

#const  TYPE_MARK           0
#const  TYPE_VAR            1
#const  TYPE_STRING         2
#const  TYPE_DNUM           3
#const  TYPE_INUM           4
#const  TYPE_STRUCT         5
#const  TYPE_XLABEL         6
#const  TYPE_LABEL          7
#const  TYPE_INTCMD         8
#const  TYPE_EXTCMD         9
#const  TYPE_EXTSYSVAR      10
#const  TYPE_CMPCMD         11
#const  TYPE_MODCMD         12
#const  TYPE_INTFUNC        13
#const  TYPE_SYSVAR         14
#const  TYPE_PROGCMD        15
#const  TYPE_DLLFUNC        16
#const  TYPE_DLLCTRL        17
#const  TYPE_USERDEF        18

#const  HSP3_FUNC_MAX   TYPE_USERDEF
#const  HSP3_TYPE_USER  TYPE_USERDEF

#const  TYPE_ERROR      (-1)
#const  TYPE_CALCERROR  (-2)

#const  EXFLG_0         0x1000
#const  EXFLG_1         0x2000
#const  EXFLG_2         0x4000
#const  EXFLG_3         0x8000

#const  CSTYPE          0xfff

#const  HSPCTX_REFSTR_MAX       4096
#const  HSPCTX_CMDLINE_MAX      1024

#const  HSPVAR_MODE_NONE        (-1)
#const  HSPVAR_MODE_MALLOC      1
#const  HSPVAR_MODE_CLONE       2

#const  HSPVAR_FLAG_NONE        0
#const  HSPVAR_FLAG_LABEL       1
#const  HSPVAR_FLAG_STR         2
#const  HSPVAR_FLAG_DOUBLE      3
#const  HSPVAR_FLAG_INT         4
#const  HSPVAR_FLAG_STRUCT      5
#const  HSPVAR_FLAG_COMSTRUCT   6
#const  HSPVAR_FLAG_USERDEF     8
#const  HSPVAR_FLAG_MAX         HSPVAR_FLAG_USERDEF

#const  HSPVAR_SUPPORT_STORAGE      1
#const  HSPVAR_SUPPORT_FLEXSTORAGE  2
#const  HSPVAR_SUPPORT_FIXEDARRAY   4
#const  HSPVAR_SUPPORT_FLEXARRAY    8
#const  HSPVAR_SUPPORT_ARRAYOBJ     16
#const  HSPVAR_SUPPORT_MISCTYPE     HSPVAR_SUPPORT_ARRAYOBJ
#const  HSPVAR_SUPPORT_FLEXSIZE     32
#const  HSPVAR_SUPPORT_NOCONVERT    64
#const  HSPVAR_SUPPORT_VARUSE       128
#const  HSPVAR_SUPPORT_TEMPVAR      256
#const  HSPVAR_SUPPORT_USER1        0x4000
#const  HSPVAR_SUPPORT_USER2        0x8000

#const  HSPERR_NONE                         0
#const  HSPERR_UNKNOWN_CODE                 1
#const  HSPERR_SYNTAX                       2
#const  HSPERR_ILLEGAL_FUNCTION             3
#const  HSPERR_WRONG_EXPRESSION             4
#const  HSPERR_NO_DEFAULT                   5
#const  HSPERR_TYPE_MISMATCH                6
#const  HSPERR_ARRAY_OVERFLOW               7
#const  HSPERR_LABEL_REQUIRED               8
#const  HSPERR_TOO_MANY_NEST                9
#const  HSPERR_RETURN_WITHOUT_GOSUB         10
#const  HSPERR_LOOP_WITHOUT_REPEAT          11
#const  HSPERR_FILE_IO                      12
#const  HSPERR_PICTURE_MISSING              13
#const  HSPERR_EXTERNAL_EXECUTE             14
#const  HSPERR_PRIORITY                     15
#const  HSPERR_TOO_MANY_PARAMETERS          16
#const  HSPERR_TEMP_BUFFER_OVERFLOW         17
#const  HSPERR_WRONG_NAME                   18
#const  HSPERR_DIVIDED_BY_ZERO              19
#const  HSPERR_BUFFER_OVERFLOW              20
#const  HSPERR_UNSUPPORTED_FUNCTION         21
#const  HSPERR_EXPRESSION_COMPLEX           22
#const  HSPERR_VARIABLE_REQUIRED            23
#const  HSPERR_INTEGER_REQUIRED             24
#const  HSPERR_BAD_ARRAY_EXPRESSION         25
#const  HSPERR_OUT_OF_MEMORY                26
#const  HSPERR_TYPE_INITALIZATION_FAILED    27
#const  HSPERR_NO_FUNCTION_PARAMETERS       28
#const  HSPERR_STACK_OVERFLOW               29
#const  HSPERR_INVALID_PARAMETER            30
#const  HSPERR_INVALID_ARRAYSTORE           31
#const  HSPERR_INVALID_FUNCPARAM            32
#const  HSPERR_WINDOW_OBJECT_FULL           33
#const  HSPERR_INVALID_ARRAY                34
#const  HSPERR_STRUCT_REQUIRED              35
#const  HSPERR_INVALID_STRUCT_SOURCE        36
#const  HSPERR_INVALID_TYPE                 37
#const  HSPERR_DLL_ERROR                    38
#const  HSPERR_COMDLL_ERROR                 39
#const  HSPERR_NORETVAL                     40
#const  HSPERR_FUNCTION_SYNTAX              41

#const  HSPVAR_ERROR_INVALID                HSPERR_WRONG_EXPRESSION
#const  HSPVAR_ERROR_DIVZERO                HSPERR_DIVIDED_BY_ZERO
#const  HSPVAR_ERROR_TYPEMISS               HSPERR_TYPE_MISMATCH
#const  HSPVAR_ERROR_ARRAYOVER              HSPERR_ARRAY_OVERFLOW
#const  HSPVAR_ERROR_ILLEGALPRM             HSPERR_ILLEGAL_FUNCTION

#const  HSPERR_INTJUMP                      42
#const  HSPERR_EXITRUN                      43
#const  HSPERR_MAX                          44

#const  DEBUGINFO_GENERAL                   0
#const  DEBUGINFO_VARNAME                   1
#const  DEBUGINFO_INTINFO                   2
#const  DEBUGINFO_GRINFO                    3
#const  DEBUGINFO_MMINFO                    4
#const  DEBUGINFO_MAX                       5

#const  HSPDEBUG_NONE                       0
#const  HSPDEBUG_RUN                        1
#const  HSPDEBUG_STOP                       2
#const  HSPDEBUG_STEPIN                     3
#const  HSPDEBUG_STEPOVER                   4
#const  HSPDEBUG_MAX                        5

#const  CALCCODE_ADD    0
#const  CALCCODE_SUB    1
#const  CALCCODE_MUL    2
#const  CALCCODE_DIV    3
#const  CALCCODE_MOD    4
#const  CALCCODE_AND    5
#const  CALCCODE_OR     6
#const  CALCCODE_XOR    7
#const  CALCCODE_EQ     8
#const  CALCCODE_NE     9
#const  CALCCODE_GT     10
#const  CALCCODE_LT     11
#const  CALCCODE_GTEQ   12
#const  CALCCODE_LTEQ   13
#const  CALCCODE_RR     14
#const  CALCCODE_LR     15
#const  CALCCODE_MAX    16

#const  FLEXVAL_TYPE_NONE   0
#const  FLEXVAL_TYPE_ALLOC  1
#const  FLEXVAL_TYPE_CLONE  2

#const  HSP3_REPEAT_MAX     32

#const  HSPSTAT_NORMAL      0
#const  HSPSTAT_DEBUG       1
#const  HSPSTAT_SSAVER      2

#const  TYPE_EX_SUBROUTINE      0x100
#const  TYPE_EX_CUSTOMFUNC      0x101
#const  TYPE_EX_ENDOFPARAM      0x200
#const  TYPE_EX_ARRAY_VARS      0x201
#const  TYPE_EX_LOCAL_VARS      0x202

#const  HSPEVENT_ENABLE_COMMAND     0x1
#const  HSPEVENT_ENABLE_HSPIRQ      0x2
#const  HSPEVENT_ENABLE_GETKEY      0x4
#const  HSPEVENT_ENABLE_FILE        0x8
#const  HSPEVENT_ENABLE_MEDIA       0x10
#const  HSPEVENT_ENABLE_PICLOAD     0x20

#const  HSPEVENT_NONE               0
#const  HSPEVENT_COMMAND            1
#const  HSPEVENT_HSPIRQ             2
#const  HSPEVENT_GETKEY             3
#const  HSPEVENT_STICK              4
#const  HSPEVENT_FNAME              5
#const  HSPEVENT_FREAD              6
#const  HSPEVENT_FWRITE             6
#const  HSPEVENT_FEXIST             7
#const  HSPEVENT_FDELETE            8
#const  HSPEVENT_FMKDIR             9
#const  HSPEVENT_FCHDIR             10
#const  HSPEVENT_FCOPY              11
#const  HSPEVENT_FDIRLIST1          12
#const  HSPEVENT_FDIRLIST2          13
#const  HSPEVENT_GETPICSIZE         14
#const  HSPEVENT_PICLOAD            15
#const  HSPEVENT_MAX                16

#const  HSPIRQ_ONEXIT               0
#const  HSPIRQ_ONERROR              1
#const  HSPIRQ_ONKEY                2
#const  HSPIRQ_ONCLICK              3
#const  HSPIRQ_USERDEF              4
#const  HSPIRQ_MAX                  5

#const  IRQ_FLAG_NONE       0
#const  IRQ_FLAG_DISABLE    1
#const  IRQ_FLAG_ENABLE     2

#const  IRQ_OPT_GOTO        0
#const  IRQ_OPT_GOSUB       1
#const  IRQ_OPT_CALLBACK    2

#const  MODVAR_MAGICCODE    0x55aa

#const  HSPHED_BOOTOPT_DEBUGWIN             0x1
#const  HSPHED_BOOTOPT_WINHIDE              0x2
#const  HSPHED_BOOTOPT_DIRSAVE              0x4
#const  HSPHED_BOOTOPT_SAVER                0x100

#const  HSPHED_BOOTOPT_RUNTIME              0x1000
#const  HSPHED_BOOTOPT_NOMMTIMER            0x2000
#const  HSPHED_BOOTOPT_NOGDIP               0x4000
#const  HSPHED_BOOTOPT_FLOAT32              0x8000
#const  HSPHED_BOOTOPT_ORGRND               0x10000

#const  HPIDAT_FLAG_TYPEFUNC                0
#const  HPIDAT_FLAG_SELFFUNC                (-1)
#const  HPIDAT_FLAG_VARFUNC                 1
#const  HPIDAT_FLAG_DLLFUNC                 2

#const  MPTYPE_NONE     0
#const  MPTYPE_VAR      1
#const  MPTYPE_STRING   2
#const  MPTYPE_DNUM     3
#const  MPTYPE_INUM     4
#const  MPTYPE_STRUCT   5
#const  MPTYPE_LABEL    7

#const  MPTYPE_LOCALVAR     (-1)
#const  MPTYPE_ARRAYVAR     (-2)
#const  MPTYPE_SINGLEVAR    (-3)
#const  MPTYPE_FLOAT        (-4)
#const  MPTYPE_STRUCTTAG    (-5)
#const  MPTYPE_LOCALSTRING  (-6)
#const  MPTYPE_MODULEVAR    (-7)
#const  MPTYPE_PPVAL        (-8)
#const  MPTYPE_PBMSCR       (-9)
#const  MPTYPE_PVARPTR      (-10)
#const  MPTYPE_IMODULEVAR   (-11)

#const  MPTYPE_IOBJECTVAR   (-12)
#const  MPTYPE_LOCALWSTR    (-13)
#const  MPTYPE_FLEXSPTR     (-14)
#const  MPTYPE_FLEXWPTR     (-15)
#const  MPTYPE_PTR_REFSTR   (-16)
#const  MPTYPE_PTR_EXINFO   (-17)
#const  MPTYPE_PTR_DPMINFO  (-18)
#const  MPTYPE_NULLPTR      (-19)
#const  MPTYPE_TMODULEVAR   (-20)

#const  STRUCTPRM_SUBID_STACK       (-1)
#const  STRUCTPRM_SUBID_STID        (-2)
#const  STRUCTPRM_SUBID_DLL         (-3)
#const  STRUCTPRM_SUBID_DLLINIT     (-4)
#const  STRUCTPRM_SUBID_OLDDLL      (-5)
#const  STRUCTPRM_SUBID_OLDDLLINIT  (-6)
#const  STRUCTPRM_SUBID_COMOBJ      (-7)

#const  STRUCTCODE_THISMOD      (-1)

#const  TYPE_OFFSET_COMOBJ      0x1000

#const  STRUCTDAT_OT_NONE       0
#const  STRUCTDAT_OT_CLEANUP    1
#const  STRUCTDAT_OT_STATEMENT  2
#const  STRUCTDAT_OT_FUNCTION   4

#const  STRUCTDAT_INDEX_FUNC            (-1)
#const  STRUCTDAT_INDEX_CFUNC           (-2)
#const  STRUCTDAT_INDEX_STRUCT          (-3)
#const  STRUCTDAT_FUNCFLAG_CLEANUP      0x10000

#const  LIBDAT_FLAG_NONE        0
#const  LIBDAT_FLAG_DLL         1
#const  LIBDAT_FLAG_DLLINIT     2
#const  LIBDAT_FLAG_MODULE      3
#const  LIBDAT_FLAG_COMOBJ      4


// 構造体


#const  HSPEXINFO_ver                   0
#const  HSPEXINFO_min                   HSPEXINFO_ver                   +2
#const  HSPEXINFO_er                    HSPEXINFO_min                   +2      +4
#const  HSPEXINFO_pstr                  HSPEXINFO_er                    +8
#const  HSPEXINFO_stmp                  HSPEXINFO_pstr                  +8
#const  HSPEXINFO_mpval                 HSPEXINFO_stmp                  +8
#const  HSPEXINFO_actscr                HSPEXINFO_mpval                 +8
#const  HSPEXINFO_nptype                HSPEXINFO_actscr                +8
#const  HSPEXINFO_npval                 HSPEXINFO_nptype                +8
#const  HSPEXINFO_strsize               HSPEXINFO_npval                 +8
#const  HSPEXINFO_refstr                HSPEXINFO_strsize               +8
#const  HSPEXINFO_HspFunc_prm_getv      HSPEXINFO_refstr                +8
#const  HSPEXINFO_HspFunc_prm_geti      HSPEXINFO_HspFunc_prm_getv      +8
#const  HSPEXINFO_HspFunc_prm_getdi     HSPEXINFO_HspFunc_prm_geti      +8
#const  HSPEXINFO_HspFunc_prm_gets      HSPEXINFO_HspFunc_prm_getdi     +8
#const  HSPEXINFO_HspFunc_prm_getds     HSPEXINFO_HspFunc_prm_gets      +8
#const  HSPEXINFO_HspFunc_val_realloc   HSPEXINFO_HspFunc_prm_getds     +8
#const  HSPEXINFO_HspFunc_fread         HSPEXINFO_HspFunc_val_realloc   +8
#const  HSPEXINFO_HspFunc_fsize         HSPEXINFO_HspFunc_fread         +8
#const  HSPEXINFO_HspFunc_getbmscr      HSPEXINFO_HspFunc_fsize         +8
#const  HSPEXINFO_HspFunc_getobj        HSPEXINFO_HspFunc_getbmscr      +8
#const  HSPEXINFO_HspFunc_setobj        HSPEXINFO_HspFunc_getobj        +8
#const  HSPEXINFO_size26                HSPEXINFO_HspFunc_setobj        +8
#const  HSPEXINFO_npexflag              HSPEXINFO_HspFunc_setobj        +8
#const  HSPEXINFO_hspctx                HSPEXINFO_npexflag              +8
#const  HSPEXINFO_HspFunc_addobj        HSPEXINFO_hspctx                +8
#const  HSPEXINFO_HspFunc_puterror      HSPEXINFO_HspFunc_addobj        +8
#const  HSPEXINFO_HspFunc_getproc       HSPEXINFO_HspFunc_puterror      +8
#const  HSPEXINFO_HspFunc_seekproc      HSPEXINFO_HspFunc_getproc       +8
#const  HSPEXINFO_HspFunc_prm_next      HSPEXINFO_HspFunc_seekproc      +8
#const  HSPEXINFO_HspFunc_prm_get       HSPEXINFO_HspFunc_prm_next      +8
#const  HSPEXINFO_HspFunc_prm_getd      HSPEXINFO_HspFunc_prm_get       +8
#const  HSPEXINFO_HspFunc_prm_getdd     HSPEXINFO_HspFunc_prm_getd      +8
#const  HSPEXINFO_HspFunc_prm_getlb     HSPEXINFO_HspFunc_prm_getdd     +8
#const  HSPEXINFO_HspFunc_prm_getpval   HSPEXINFO_HspFunc_prm_getlb     +8
#const  HSPEXINFO_HspFunc_prm_getva     HSPEXINFO_HspFunc_prm_getpval   +8
#const  HSPEXINFO_HspFunc_prm_setva     HSPEXINFO_HspFunc_prm_getva     +8
#const  HSPEXINFO_HspFunc_malloc        HSPEXINFO_HspFunc_prm_setva     +8
#const  HSPEXINFO_HspFunc_free          HSPEXINFO_HspFunc_malloc        +8
#const  HSPEXINFO_HspFunc_expand        HSPEXINFO_HspFunc_free          +8
#const  HSPEXINFO_HspFunc_addirq        HSPEXINFO_HspFunc_expand        +8
#const  HSPEXINFO_HspFunc_hspevent      HSPEXINFO_HspFunc_addirq        +8
#const  HSPEXINFO_HspFunc_registvar     HSPEXINFO_HspFunc_hspevent      +8
#const  HSPEXINFO_HspFunc_setpc         HSPEXINFO_HspFunc_registvar     +8
#const  HSPEXINFO_HspFunc_call          HSPEXINFO_HspFunc_setpc         +8
#const  HSPEXINFO_HspFunc_mref          HSPEXINFO_HspFunc_call          +8
#const  HSPEXINFO_HspFunc_dim           HSPEXINFO_HspFunc_mref          +8
#const  HSPEXINFO_HspFunc_redim         HSPEXINFO_HspFunc_dim           +8
#const  HSPEXINFO_HspFunc_array         HSPEXINFO_HspFunc_redim         +8

#const  HSPEXINFO_SIZE30_               HSPEXINFO_HspFunc_array         +8
#const  HSPEXINFO_HspFunc_varname       HSPEXINFO_HspFunc_array         +8
#const  HSPEXINFO_HspFunc_seekvar       HSPEXINFO_HspFunc_varname       +8

#const  HSPEXINFO_SIZE31_               HSPEXINFO_HspFunc_seekvar       +8
#const  HSPEXINFO_SIZE_                 HSPEXINFO_SIZE31_


#const  LOOPDAT_time        0
#const  LOOPDAT_cnt         LOOPDAT_time    +4
#const  LOOPDAT_step        LOOPDAT_cnt     +4
#const  LOOPDAT_pt          LOOPDAT_step    +4      +4

#const  LOOPDAT_SIZE_       LOOPDAT_pt      +8


#const  HSPCTX_hsphed       0
#const  HSPCTX_mcs          HSPCTX_hsphed       +8
#const  HSPCTX_mem_mcs      HSPCTX_mcs          +8
#const  HSPCTX_mem_di       HSPCTX_mem_mcs      +8
#const  HSPCTX_mem_ot       HSPCTX_mem_di       +8
#const  HSPCTX_mem_irq      HSPCTX_mem_ot       +8
#const  HSPCTX_irqmax       HSPCTX_mem_irq      +8      +8
#const  HSPCTX_iparam       HSPCTX_irqmax       +4
#const  HSPCTX_wparam       HSPCTX_iparam       +4
#const  HSPCTX_lparam       HSPCTX_wparam       +4
#const  HSPCTX_mem_var      HSPCTX_lparam       +4
#const  HSPCTX_exinfo       HSPCTX_mem_var      +8
#const  HSPCTX_runmode      HSPCTX_exinfo       +HSPEXINFO_SIZE30_
#const  HSPCTX_waitcount    HSPCTX_runmode      +4
#const  HSPCTX_waitbase     HSPCTX_waitcount    +4
#const  HSPCTX_waittick     HSPCTX_waitbase     +4
#const  HSPCTX_lasttick     HSPCTX_waittick     +4
#const  HSPCTX_sublev       HSPCTX_lasttick     +4
#const  HSPCTX_mem_loop     HSPCTX_sublev       +4
#const  HSPCTX_looplev      HSPCTX_mem_loop     +LOOPDAT_SIZE_  * HSP3_REPEAT_MAX
#const  HSPCTX_err          HSPCTX_looplev      +4
#const  HSPCTX_hspstat      HSPCTX_err          +4
#const  HSPCTX_stat         HSPCTX_hspstat      +4
#const  HSPCTX_strsize      HSPCTX_stat         +4
#const  HSPCTX_refstr       HSPCTX_strsize      +4      +4
#const  HSPCTX_fnbuffer     HSPCTX_refstr       +8
#const  HSPCTX_instance     HSPCTX_fnbuffer     +8
#const  HSPCTX_intwnd_id    HSPCTX_instance     +8
#const  HSPCTX_note_pval    HSPCTX_intwnd_id    +4      +4
#const  HSPCTX_note_aptr    HSPCTX_note_pval    +8
#const  HSPCTX_notep_pval   HSPCTX_note_aptr    +4      +4
#const  HSPCTX_notep_aptr   HSPCTX_notep_pval   +8
#const  HSPCTX_stmp         HSPCTX_notep_aptr   +4      +4
#const  HSPCTX_prmstack     HSPCTX_stmp         +8
#const  HSPCTX_mem_linfo    HSPCTX_prmstack     +8
#const  HSPCTX_mem_minfo    HSPCTX_mem_linfo    +8
#const  HSPCTX_mem_finfo    HSPCTX_mem_minfo    +8
#const  HSPCTX_retval_level HSPCTX_mem_finfo    +8
#const  HSPCTX_endcode      HSPCTX_retval_level +4
#const  HSPCTX_msgfunc      HSPCTX_endcode      +4
#const  HSPCTX_wnd_parent   HSPCTX_msgfunc      +8
#const  HSPCTX_refdval      HSPCTX_wnd_parent   +8
#const  HSPCTX_cmdline      HSPCTX_refdval      +8

#const  HSPCTX_SIZE30_      HSPCTX_cmdline      +8
#const  HSPCTX_exinfo2      HSPCTX_cmdline      +8

#const  HSPCTX__SIZE31_     HSPCTX_exinfo2      +8
#const  HSPCTX_SIZE_        HSPCTX__SIZE31_


#const  HSPHED_h1           0
#const  HSPHED_h2           HSPHED_h1           +1
#const  HSPHED_h3           HSPHED_h2           +1
#const  HSPHED_h4           HSPHED_h3           +1
#const  HSPHED_version      HSPHED_h4           +1
#const  HSPHED_max_val      HSPHED_version      +4
#const  HSPHED_allsize      HSPHED_max_val      +4
#const  HSPHED_pt_cs        HSPHED_allsize      +4
#const  HSPHED_max_cs       HSPHED_pt_cs        +4
#const  HSPHED_pt_ds        HSPHED_max_cs       +4
#const  HSPHED_max_ds       HSPHED_pt_ds        +4
#const  HSPHED_pt_ot        HSPHED_max_ds       +4
#const  HSPHED_max_ot       HSPHED_pt_ot        +4
#const  HSPHED_pt_dinfo     HSPHED_max_ot       +4
#const  HSPHED_max_dinfo    HSPHED_pt_dinfo     +4
#const  HSPHED_pt_linfo     HSPHED_max_dinfo    +4
#const  HSPHED_max_linfo    HSPHED_pt_linfo     +4
#const  HSPHED_pt_finfo     HSPHED_max_linfo    +4
#const  HSPHED_max_finfo    HSPHED_pt_finfo     +4
#const  HSPHED_pt_mifno     HSPHED_max_finfo    +4
#const  HSPHED_max_minfo    HSPHED_pt_mifno     +4
#const  HSPHED_pt_finfo2    HSPHED_max_minfo    +4
#const  HSPHED_max_finfo2   HSPHED_pt_finfo2    +4
#const  HSPHED_pt_hpidat    HSPHED_max_finfo2   +4
#const  HSPHED_max_hpi      HSPHED_pt_hpidat    +4
#const  HSPHED_max_varhpi   HSPHED_max_hpi      +2
#const  HSPHED_bootoption   HSPHED_max_varhpi   +2
#const  HSPHED_runtime      HSPHED_bootoption   +4

#const  HSPHED_SIZE30_      HSPHED_runtime      +4
#const  HSPHED_pt_sr        HSPHED_runtime      +4
#const  HSPHED_max_sr       HSPHED_pt_sr        +4
#const  HSPHED_opt1         HSPHED_max_sr       +4
#const  HSPHED_opt2         HSPHED_opt1         +4
#const  HSPHED_SIZE35_      HSPHED_opt2         +4
#const  HSPHED_SIZE_        HSPHED_SIZE35_


#const  PVAL_flag       0
#const  PVAL_mode       PVAL_flag       +2
#const  PVAL_len        PVAL_mode       +2
#const  PVAL_size       PVAL_len        +4*5
#const  PVAL_pt         PVAL_size       +4      +4

#const  PVAL_SIZE25_    PVAL_pt         +8
#const  PVAL_master     PVAL_pt         +8
#const  PVAL_support    PVAL_master     +8
#const  PVAL_arraycnt   PVAL_support    +2
#const  PVAL_offset     PVAL_arraycnt   +2
#const  PVAL_arraymul   PVAL_offset     +4

#const  PVAL_SIZE30_    PVAL_arraymul   +4      +4
#const  PVAL_SIZE_      PVAL_SIZE30_


#const  HSPROUTINE_stacklev     0
#const  HSPROUTINE_mcsret       HSPROUTINE_stacklev     +4      +4
#const  HSPROUTINE_param        HSPROUTINE_mcsret       +8
#const  HSPROUTINE_oldtack      HSPROUTINE_param        +8

#const  HSPROUTINE_SIZE_        HSPROUTINE_oldtack      +8


#const  STRUCTPRM_mptype        0
#const  STRUCTPRM_subid         STRUCTPRM_mptype        +2
#const  STRUCTPRM_offset        STRUCTPRM_subid         +2

#const  STRUCTPRM_SIZE_         STRUCTPRM_offset        +4


#const  MPVARDATA_pval          0
#const  MPVARDATA_aptr          MPVARDATA_pval  +8

#const  MPVARDATA_SIZE_         MPVARDATA_aptr  +4      +4


#const  MPMODVARDATA_subid      0
#const  MPMODVARDATA_magic      MPMODVARDATA_subid      +2
#const  MPMODVARDATA_pval       MPMODVARDATA_magic      +2      +4
#const  MPMODVARDATA_aptr       MPMODVARDATA_pval       +8

#const  MPMODVARDATA_SIZE_      MPMODVARDATA_aptr       +4      +4


#const  HSP3DEBUG_flag          0
#const  HSP3DEBUG_line          HSP3DEBUG_flag          +4
#const  HSP3DEBUG_fname         HSP3DEBUG_line          +4
#const  HSP3DEBUG_dbgwin        HSP3DEBUG_fname         +8
#const  HSP3DEBUG_dbgval        HSP3DEBUG_dbgwin        +8
#const  HSP3DEBUG_hspctx        HSP3DEBUG_dbgval        +8
#const  HSP3DEBUG_get_value     HSP3DEBUG_hspctx        +8
#const  HSP3DEBUG_get_varinf    HSP3DEBUG_get_value     +8
#const  HSP3DEBUG_dbg_close     HSP3DEBUG_get_varinf    +8
#const  HSP3DEBUG_dbg_curinf    HSP3DEBUG_dbg_close     +8
#const  HSP3DEBUG_dbg_set       HSP3DEBUG_dbg_curinf    +8

#const  HSP3DEBUG_SIZE_         HSP3DEBUG_dbg_set       +8


#const  HSP3TYPEINFO_type       0
#const  HSP3TYPEINFO_option     HSP3TYPEINFO_type       +2
#const  HSP3TYPEINFO_hspctx     HSP3TYPEINFO_option     +2      +4
#const  HSP3TYPEINFO_hspexinfo  HSP3TYPEINFO_hspctx     +8
#const  HSP3TYPEINFO_cmdfunc    HSP3TYPEINFO_hspexinfo  +8
#const  HSP3TYPEINFO_reffunc    HSP3TYPEINFO_cmdfunc    +8
#const  HSP3TYPEINFO_termfunc   HSP3TYPEINFO_reffunc    +8
#const  HSP3TYPEINFO_msgfunc    HSP3TYPEINFO_termfunc   +8
#const  HSP3TYPEINFO_eventfunc  HSP3TYPEINFO_msgfunc    +8

#const  HSP3TYPEINFO_SIZE_      HSP3TYPEINFO_eventfunc  +8


#const  FLEXVALUE_type          0
#const  FLEXVALUE_myid          FLEXVALUE_type          +2
#const  FLEXVALUE_customid      FLEXVALUE_myid          +2
#const  FLEXVALUE_clonetype     FLEXVALUE_customid      +2
#const  FLEXVALUE_size          FLEXVALUE_clonetype     +2
#const  FLEXVALUE_ptr           FLEXVALUE_size          +4      +4

#const  FLEXVALUE_SIZE_         FLEXVALUE_ptr           +8


#const  HSPVARPROC_flag             0
#const  HSPVARPROC_aftertype        HSPVARPROC_flag             +2
#const  HSPVARPROC_version          HSPVARPROC_aftertype        +2
#const  HSPVARPROC_support          HSPVARPROC_version          +2
#const  HSPVARPROC_basesize         HSPVARPROC_support          +2
#const  HSPVARPROC_opt              HSPVARPROC_basesize         +2
#const  HSPVARPROC_vartype_name     HSPVARPROC_opt              +2      +4
#const  HSPVARPROC_user             HSPVARPROC_vartype_name     +8
#const  HSPVARPROC_Cnv              HSPVARPROC_user             +8
#const  HSPVARPROC_CnvCustom        HSPVARPROC_Cnv              +8
#const  HSPVARPROC_GetPtr           HSPVARPROC_CnvCustom        +8
#const  HSPVARPROC_ArrayObjectRead  HSPVARPROC_GetPtr           +8
#const  HSPVARPROC_ArrayObject      HSPVARPROC_ArrayObjectRead  +8
#const  HSPVARPROC_ObjectWrite      HSPVARPROC_ArrayObject      +8
#const  HSPVARPROC_ObjectMethod     HSPVARPROC_ObjectWrite      +8
#const  HSPVARPROC_Alloc            HSPVARPROC_ObjectMethod     +8
#const  HSPVARPROC_Free             HSPVARPROC_Alloc            +8
#const  HSPVARPROC_GetSize          HSPVARPROC_Free             +8
#const  HSPVARPROC_GetUsing         HSPVARPROC_GetSize          +8
#const  HSPVARPROC_GetBlockSize     HSPVARPROC_GetUsing         +8
#const  HSPVARPROC_AllocBlock       HSPVARPROC_GetBlockSize     +8
#const  HSPVARPROC_Set              HSPVARPROC_AllocBlock       +8
#const  HSPVARPROC_AddI             HSPVARPROC_Set              +8
#const  HSPVARPROC_SubI             HSPVARPROC_AddI             +8
#const  HSPVARPROC_MulI             HSPVARPROC_SubI             +8
#const  HSPVARPROC_DivI             HSPVARPROC_MulI             +8
#const  HSPVARPROC_ModI             HSPVARPROC_DivI             +8
#const  HSPVARPROC_AndI             HSPVARPROC_ModI             +8
#const  HSPVARPROC_OrI              HSPVARPROC_AndI             +8
#const  HSPVARPROC_XOrI             HSPVARPROC_OrI              +8
#const  HSPVARPROC_EqI              HSPVARPROC_XOrI             +8
#const  HSPVARPROC_NeI              HSPVARPROC_EqI              +8
#const  HSPVARPROC_GtI              HSPVARPROC_NeI              +8
#const  HSPVARPROC_LtI              HSPVARPROC_GtI              +8
#const  HSPVARPROC_GtEqI            HSPVARPROC_LtI              +8
#const  HSPVARPROC_LtEqI            HSPVARPROC_GtEqI            +8
#const  HSPVARPROC_RrI              HSPVARPROC_LtEqI            +8
#const  HSPVARPROC_LrI              HSPVARPROC_RrI              +8

#const  HSPVARPROC_SIZE_            HSPVARPROC_LrI              +8


#const  HED_STRUCTDAT_index     0
#const  HED_STRUCTDAT_subid     HED_STRUCTDAT_index     +2
#const  HED_STRUCTDAT_prmindex  HED_STRUCTDAT_subid     +2
#const  HED_STRUCTDAT_prmmax    HED_STRUCTDAT_prmindex  +4
#const  HED_STRUCTDAT_nameidx   HED_STRUCTDAT_prmmax    +4
#const  HED_STRUCTDAT_size      HED_STRUCTDAT_nameidx   +4
#const  HED_STRUCTDAT_otindex   HED_STRUCTDAT_size      +4
#const  HED_STRUCTDAT_funcflag  HED_STRUCTDAT_otindex   +4

#const  HED_STRUCTDAT_SIZE_     HED_STRUCTDAT_funcflag  +4


#const  STRUCTDAT_index     0
#const  STRUCTDAT_subid     STRUCTDAT_index     +2
#const  STRUCTDAT_prmindex  STRUCTDAT_subid     +2
#const  STRUCTDAT_prmmax    STRUCTDAT_prmindex  +4
#const  STRUCTDAT_nameidx   STRUCTDAT_prmmax    +4
#const  STRUCTDAT_size      STRUCTDAT_nameidx   +4
#const  STRUCTDAT_otindex   STRUCTDAT_size      +4
#const  STRUCTDAT_proc      STRUCTDAT_otindex   +4
#const  STRUCTDAT_funcflag  STRUCTDAT_proc      +8

#const  STRUCTDAT_SIZE_     STRUCTDAT_funcflag  +4      +4


#const  HED_LIBDAT_flag     0
#const  HED_LIBDAT_nameidx  HED_LIBDAT_flag         +4
#const  HED_LIBDAT_p_hlib   HED_LIBDAT_nameidx      +4
#const  HED_LIBDAT_clsid    HED_LIBDAT_p_hlib       +4

#const  HED_LIBDAT_SIZE_    HED_LIBDAT_clsid        +4


#const  LIBDAT_flag     0
#const  LIBDAT_nameidx  LIBDAT_flag         +4
#const  LIBDAT_hlib     LIBDAT_nameidx      +4
#const  LIBDAT_clsid    LIBDAT_hlib         +8

#const  LIBDAT_SIZE_    LIBDAT_clsid        +4      +4


#const  MEM_HPIDAT_flag         0
#const  MEM_HPIDAT_option       MEM_HPIDAT_flag         +2
#const  MEM_HPIDAT_libname      MEM_HPIDAT_option       +2
#const  MEM_HPIDAT_funcname     MEM_HPIDAT_libname      +4
#const  MEM_HPIDAT_libptr       MEM_HPIDAT_funcname     +4      +4

#const  MEM_HPIDAT_SIZE_        MEM_HPIDAT_libptr       +8


#const  HPIDAT_flag         0
#const  HPIDAT_option       HPIDAT_flag         +2
#const  HPIDAT_libname      HPIDAT_option       +2
#const  HPIDAT_funcname     HPIDAT_libname      +4
#const  HPIDAT_p_libptr     HPIDAT_funcname     +4

#const  HPIDAT_SIZE_        HPIDAT_p_libptr     +4


#endif