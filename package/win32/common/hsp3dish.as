;
; HSP3DISH Default define and macros
;
#ifndef __hsp3dish__
#define __hsp3dish__

#runtime "hsp3dish"

#const global FILTER_NONE 0
#const global FILTER_LINEAR 1
#const global FILTER_LINEAR2 2

;
;	system request
;
#define global SYSREQ_NONE 0
#define global SYSREQ_MAXTEX 1
#define global SYSREQ_RESULT 2
#define global SYSREQ_RESVMODE 3
#define global SYSREQ_DXVSYNC 4
#define global SYSREQ_DEFTIMER 5
#define global SYSREQ_NOMIPMAP 6
#define global SYSREQ_DEVLOST 7
#define global SYSREQ_OBAQMATBUF 8
#define global SYSREQ_DEBUG $10000

#regcmd 9
#cmd gfilter $3f
#cmd setreq $40
#cmd getreq $41

#endif

