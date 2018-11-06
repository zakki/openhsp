
//
//	hspsteam.cpp structures
//
#ifndef __hspsteam_h
#define __hspsteam_h

#include "stdafx.h"
#include "membuf.h"

#pragma warning( push )
//  warning C4355: 'this' : used in base member initializer list
//  This is OK because it's warning on setting up the Steam callbacks, they won't use this until after construction is done
#pragma warning( disable : 4355 ) 

/*------------------------------------------------------------*/

enum {
	STEAM_NONE = 0,
	STEAM_ERROR,
	STEAM_READY,
	STEAM_GETSTAT,
	STEAM_MAX
};

#define STEAM_NOTICE_ACHIVEMENT 1
#define STEAM_NOTICE_STATS 2

#define STEAM_BUFSIZE 1024

struct Achievement_t
{
	int m_eAchievementID;
	const char *m_pchAchievementID;
	char m_rgchName[128];
	char m_rgchDescription[256];
	bool m_bAchieved;
	int m_iIconImage;
};

//
//	hspsteam.cpp functions
//

int _PrepareSteam(void);
void _ShutdownSteam(void);

class hspsteam {
public:
	hspsteam();
	~hspsteam();

	int	flag;			// STEAM_*
	int notice;			// STEAM_NOTICE_*

	STEAM_CALLBACK(hspsteam, OnUserStatsReceived, UserStatsReceived_t, m_CallbackUserStatsReceived);
	STEAM_CALLBACK(hspsteam, OnUserStatsStored, UserStatsStored_t, m_CallbackUserStatsStored);
	STEAM_CALLBACK(hspsteam, OnAchievementStored, UserAchievementStored_t, m_CallbackAchievementStored);

	void setAchivementMax(int max);
	int setAchivementAuto(void);
	void requestAchivement(void);
	void setAchivementId(int index, char *name);
	void unlockAchievement(int index);
	void unlockAchievement(char *apikey);
	void clearAchievement(int index);
	void clearAchievement(char *apikey);
	void update(void);
	char *getAchivementString(int id, int type);
	int getAchivementFlag(int index);

	int getStatInt(char *apikey, int *result);
	int getStatDouble(char *apikey, double *result);
	void updateStatusInt(char *apikey, int value);
	void updateStatusDouble(char *apikey, double value);

private:
	//		Settings
	//

	// Steam User interface
	ISteamUser *m_pSteamUser;

	// Steam UserStats interface
	ISteamUserStats *m_pSteamUserStats;

	// our GameID
	CGameID m_GameID;

	// Achievement Data
	Achievement_t *g_rgAchievements;

	// Achievement Data Size
	int m_AchievementsSize;

	// Did we get the stats from Steam?
	bool m_bRequestedStats;
	bool m_bStatsValid;

	// Should we store stats this frame?
	bool m_bStoreStats;

	CMemBuf *namebuf;
};


#endif
