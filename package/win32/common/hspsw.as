
;	hspsw.dll header(3.0)

#ifndef __hspsw__
#define __hspsw__

#uselib "hspsw.dll"
#func steaminit steaminit $0
#func steambye steambye $100
#func steamupdate steamupdate $202
#func steamset_max steamset_max $0
#func steamreq_status steamreq_status $0

#func steamset_achievement steamset_achievement $202
#func steamreg_achievement steamreg_achievement $202
#func steamget_achievement steamget_achievement $202
#func steamget_achievementstr steamget_achievementstr $202
#func steamunlock_achievement steamunlock_achievement $202
#func steamunlock_achievementkey steamunlock_achievementkey $202
#func steamclear_achievement steamclear_achievement $202
#func steamclear_achievementkey steamclear_achievementkey $202

#func steamset_status steamset_status $202
#func steamset_statusf steamset_statusf $202
#func steamget_status steamget_status $202
#func steamget_statusf steamget_statusf $202

#enum STEAM_NONE = 0
#enum STEAM_ERROR
#enum STEAM_READY
#enum STEAM_GETSTAT
#enum STEAM_MAX


#endif

