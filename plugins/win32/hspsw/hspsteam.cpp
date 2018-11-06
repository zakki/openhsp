
//
//		Steam API access
//			onion software/onitama 2018/9
//

#include "hspsteam.h"
#include <stdlib.h>
#include <string.h>

#pragma comment(lib, "steam_api.lib" )

static void Alertf(char *format, ...)
{
	char textbf[1024];
	va_list args;
	va_start(args, format);
	vsprintf(textbf, format, args);
	va_end(args);
	MessageBox(NULL, textbf, "error", MB_ICONINFORMATION | MB_OK);
}

/*------------------------------------------------------------*/
/*
API initalize
*/
/*------------------------------------------------------------*/

int _PrepareSteam(void)
{
	if (SteamAPI_RestartAppIfNecessary(k_uAppIdInvalid))
	{
		// if Steam is not running or the game wasn't started through Steam, SteamAPI_RestartAppIfNecessary starts the 
		// local Steam client and also launches this game again.

		// Once you get a public Steam AppID assigned for this game, you need to replace k_uAppIdInvalid with it and
		// removed steam_appid.txt from the game depot.

		return 1;
	}


	// Init Steam CEG
	if (!Steamworks_InitCEGLibrary())
	{
		Alertf("Steamworks_InitCEGLibrary() failed\n");
		//Alert("Fatal Error", "Steam must be running to play this game (InitDrmLibrary() failed).\n");
		return 1;
	}

	// Initialize SteamAPI, if this fails we bail out since we depend on Steam for lots of stuff.
	// You don't necessarily have to though if you write your code to check whether all the Steam
	// interfaces are NULL before using them and provide alternate paths when they are unavailable.
	//
	// This will also load the in-game steam overlay dll into your process.  That dll is normally
	// injected by steam when it launches games, but by calling this you cause it to always load,
	// even when not launched via steam.
	if (!SteamAPI_Init())
	{
		Alertf("SteamAPI_Init() failed\n");
		//Alert("Fatal Error", "Steam must be running to play this game (SteamAPI_Init() failed).\n");
		return 1;
	}

	// Ensure that the user has logged into Steam. This will always return true if the game is launched
	// from Steam, but if Steam is at the login prompt when you run your game from the debugger, it
	// will return false.
	if (!SteamUser()->BLoggedOn())
	{
		Alertf("Steam user is not logged in\n");
		//Alert("Fatal Error", "Steam user must be logged in to play this game (SteamUser()->BLoggedOn() returned false).\n");
		return 1;
	}

	// do a DRM self check
	Steamworks_SelfCheck();

	// exit
	return 0;
}

void _ShutdownSteam(void)
{
	// Shutdown the SteamAPI
	SteamAPI_Shutdown();

	// Shutdown Steam CEG
	Steamworks_TermCEGLibrary();

}

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

hspsteam::hspsteam( void ):
m_pSteamUser(NULL),
m_pSteamUserStats(NULL),
m_GameID(SteamUtils()->GetAppID()),
m_CallbackUserStatsReceived(this, &hspsteam::OnUserStatsReceived),
m_CallbackUserStatsStored(this, &hspsteam::OnUserStatsStored),
m_CallbackAchievementStored(this, &hspsteam::OnAchievementStored)
{
	flag = STEAM_READY;
	notice = 0;
	m_AchievementsSize = 0;

	m_pSteamUser = SteamUser();
	m_pSteamUserStats = SteamUserStats();

	m_bRequestedStats = false;
	m_bStatsValid = false;
	m_bStoreStats = false;

}


hspsteam::~hspsteam( void )
{
	if (m_AchievementsSize != 0) {
		free(g_rgAchievements);
		delete namebuf;
	}
	flag = STEAM_NONE;
}


void hspsteam::update(void)
{
	// Run Steam client callbacks
	SteamAPI_RunCallbacks();

	// set stats
	if (m_bStoreStats) {
		bool bSuccess = m_pSteamUserStats->StoreStats();
		// If this failed, we never sent anything to the server, try
		// again later.
		if (bSuccess) {
			m_bStoreStats = false;
		}
		else {
			flag = STEAM_ERROR;
		}
	}


}

void hspsteam::setAchivementMax(int max)
{
	if (max <= 0) return;
	if (m_AchievementsSize != 0) {
		free(g_rgAchievements);
		delete namebuf;
	}
	m_AchievementsSize = max;
	g_rgAchievements = (Achievement_t *)malloc(sizeof(Achievement_t) * max);
	namebuf = new CMemBuf;
}

//-----------------------------------------------------------------------------
// Purpose: We have stats data from Steam. It is authoritative, so update
//			our data with those results now.
//-----------------------------------------------------------------------------
void hspsteam::OnUserStatsReceived(UserStatsReceived_t *pCallback)
{
	if (!m_pSteamUserStats)
		return;

	// we may get callbacks for other games' stats arriving, ignore them
	if (m_GameID.ToUint64() == pCallback->m_nGameID)
	{
		if (k_EResultOK == pCallback->m_eResult)
		{
			//Alertf("Received stats and achievements from Steam\n");

			m_bStatsValid = true;

			// load achievements
			for (int iAch = 0; iAch <  m_AchievementsSize; ++iAch)
			{
				Achievement_t &ach = g_rgAchievements[iAch];
				m_pSteamUserStats->GetAchievement(ach.m_pchAchievementID, &ach.m_bAchieved);
				sprintf_safe(ach.m_rgchName, "%s",
					m_pSteamUserStats->GetAchievementDisplayAttribute(ach.m_pchAchievementID, "name"));
				sprintf_safe(ach.m_rgchDescription, "%s",
					m_pSteamUserStats->GetAchievementDisplayAttribute(ach.m_pchAchievementID, "desc"));
			}

			// load stats
			/*
			m_pSteamUserStats->GetStat("NumGames", &m_nTotalGamesPlayed);
			m_pSteamUserStats->GetStat("NumWins", &m_nTotalNumWins);
			m_pSteamUserStats->GetStat("NumLosses", &m_nTotalNumLosses);
			m_pSteamUserStats->GetStat("FeetTraveled", &m_flTotalFeetTraveled);
			m_pSteamUserStats->GetStat("MaxFeetTraveled", &m_flMaxFeetTraveled);
			m_pSteamUserStats->GetStat("AverageSpeed", &m_flAverageSpeed);
			*/

			flag = STEAM_READY;
		}
		else
		{
			Alertf( "RequestStats - failed, %d\n", pCallback->m_eResult);
		}
	}
}


//-----------------------------------------------------------------------------
// Purpose: Our stats data was stored!
//-----------------------------------------------------------------------------
void hspsteam::OnUserStatsStored(UserStatsStored_t *pCallback)
{
	// we may get callbacks for other games' stats arriving, ignore them
	if (m_GameID.ToUint64() == pCallback->m_nGameID)
	{
		if (k_EResultOK == pCallback->m_eResult)
		{
			flag = STEAM_READY;
			//Alertf("StoreStats - success\n");
		}
		else if (k_EResultInvalidParam == pCallback->m_eResult)
		{
			// One or more stats we set broke a constraint. They've been reverted,
			// and we should re-iterate the values now to keep in sync.
			Alertf("StoreStats - some failed to validate\n");
			// Fake up a callback here so that we re-load the values.
			UserStatsReceived_t callback;
			callback.m_eResult = k_EResultOK;
			callback.m_nGameID = m_GameID.ToUint64();
			OnUserStatsReceived(&callback);
		}
		else
		{
			char buffer[128];
			sprintf_safe(buffer, "StoreStats - failed, %d\n", pCallback->m_eResult);
			buffer[sizeof(buffer) - 1] = 0;
			Alertf(buffer);
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose: An achievement was stored
//-----------------------------------------------------------------------------
void hspsteam::OnAchievementStored(UserAchievementStored_t *pCallback)
{
	// we may get callbacks for other games' stats arriving, ignore them
	if (m_GameID.ToUint64() == pCallback->m_nGameID)
	{
		if (0 == pCallback->m_nMaxProgress)
		{
			//char buffer[128];
			//sprintf_safe(buffer, "Achievement '%s' unlocked!", pCallback->m_rgchAchievementName);
			//buffer[sizeof(buffer) - 1] = 0;
			//Alertf(buffer);
			//OutputDebugString(buffer);
			requestAchivement();
		}
/*
		else
		{
			char buffer[128];
			sprintf_safe(buffer, "Achievement '%s' progress callback, (%d,%d)\n",
				pCallback->m_rgchAchievementName, pCallback->m_nCurProgress, pCallback->m_nMaxProgress);
			buffer[sizeof(buffer) - 1] = 0;
			OutputDebugString(buffer);
		}
*/
	}
}


//-----------------------------------------------------------------------------
// Purpose: Unlock this achievement
//-----------------------------------------------------------------------------
void hspsteam::unlockAchievement(int id)
{
	if ((id < 0) || (id >= m_AchievementsSize)) return;

	Achievement_t *ach = &g_rgAchievements[id];

	// mark it down
	m_pSteamUserStats->SetAchievement(ach->m_pchAchievementID);

	// Store stats end of frame
	m_bStoreStats = true;
	flag = STEAM_GETSTAT;
}


void hspsteam::unlockAchievement(char *apikey)
{
	// mark it down
	m_pSteamUserStats->SetAchievement((const char *)apikey);

	// Store stats end of frame
	m_bStoreStats = true;
	flag = STEAM_GETSTAT;
}


//-----------------------------------------------------------------------------
// Purpose: Clear this achievement ( For Test )
//-----------------------------------------------------------------------------
void hspsteam::clearAchievement(int id)
{
	if ((id < 0) || (id >= m_AchievementsSize)) return;

	Achievement_t *ach = &g_rgAchievements[id];

	// mark it down
	m_pSteamUserStats->ClearAchievement(ach->m_pchAchievementID);

	// Store stats end of frame
	m_bStoreStats = true;
	flag = STEAM_GETSTAT;
}


void hspsteam::clearAchievement(char *apikey)
{
	// mark it down
	m_pSteamUserStats->ClearAchievement((const char *)apikey);

	// Store stats end of frame
	m_bStoreStats = true;
	flag = STEAM_GETSTAT;
}


//-----------------------------------------------------------------------------
// Purpose: Get Achievement Info (ID)
//-----------------------------------------------------------------------------
char *hspsteam::getAchivementString(int id, int type)
{
	if ((id < 0) || (id >= m_AchievementsSize)) return "";

	Achievement_t *ach = &g_rgAchievements[id];
	if (type == 1) {
		return (char *)ach->m_rgchName;
	}
	if (type == 2) {
		return (char *)ach->m_rgchDescription;
	}
	return (char *)ach->m_pchAchievementID;
}


//-----------------------------------------------------------------------------
// Purpose: Get Achievement Info (flag)
//-----------------------------------------------------------------------------
int hspsteam::getAchivementFlag(int id)
{
	if ((id < 0) || (id >= m_AchievementsSize)) return 0;

	Achievement_t *ach = &g_rgAchievements[id];
	if (ach->m_bAchieved) {
		return -1;
	}
	else{
		return 0;
	}
}


//-----------------------------------------------------------------------------
// Purpose: Update Server Status
//-----------------------------------------------------------------------------
void hspsteam::updateStatusInt(char *apikey, int value)
{
	// mark it down
	m_pSteamUserStats->SetStat((const char *)apikey, value);

	// Store stats end of frame
	m_bStoreStats = true;
	flag = STEAM_GETSTAT;
}


void hspsteam::updateStatusDouble(char *apikey, double value)
{
	// mark it down
	m_pSteamUserStats->SetStat((const char *)apikey, (float)value);

	// Store stats end of frame
	m_bStoreStats = true;
	flag = STEAM_GETSTAT;
}


void hspsteam::requestAchivement(void)
{
	// request our stats
	if (m_pSteamUserStats) {
		bool bSuccess = m_pSteamUserStats->RequestCurrentStats();
		if (bSuccess) {
			flag = STEAM_GETSTAT;
		}
		else {
			flag = STEAM_ERROR;
		}
	}
}


void hspsteam::setAchivementId(int id, char *name )
{
	if ((id < 0) || (id >= m_AchievementsSize)) return;
	Achievement_t *ach = &g_rgAchievements[id];
	ach->m_pchAchievementID = (const char *)(namebuf->GetBuffer() + namebuf->GetSize());
	namebuf->PutStr(name);
	namebuf->Put( (char)0 );
	//strncpy(ach->m_rgchName, (const char *)name2, 128);
	//Alertf("set[%s] [%s]",ach->m_pchAchievementID, ach->m_rgchName);
}


int hspsteam::setAchivementAuto(void)
{
	int max;
	int i;
	max = m_pSteamUserStats->GetNumAchievements();
	if (max <= 0) return 0;
	setAchivementMax(max);

	for (i = 0; i < max; i++) {
		setAchivementId(i, (char *)m_pSteamUserStats->GetAchievementName(i) );
	}
	return max;
}


int hspsteam::getStatInt(char *apikey, int *result)
{
	bool r;
	r = m_pSteamUserStats->GetStat( (const char *)apikey, result);
	if (!r) return -1;
	return 0;
}


int hspsteam::getStatDouble(char *apikey, double *result)
{
	float fl;
	bool r;
	r = m_pSteamUserStats->GetStat((const char *)apikey, &fl);
	if (!r) return -1;
	*result = (double)fl;
	return 0;
}




