/*------------------------------------------------------------------------------
	Header of tab management routines
------------------------------------------------------------------------------*/

#ifndef TABMANAGER_H
#define TABMANAGER_H

// Tab Information structure
typedef struct tagTabInfo {
	char FileName[_MAX_PATH];
	char TitleName[_MAX_FNAME + _MAX_EXT];
    char DirName[_MAX_PATH];
	ULONGLONG FileIndex;
	int LatestUndoNum;
	BOOL NeedSave;
	int FootyID;
	struct {
		struct tagTabInfo *prev;
		struct tagTabInfo *next;
	} ZOrder;
} TABINFO;

// Functions
int CreateTab(int, const char *, const char *, const char *);
void DeleteTab(int);
TABINFO *GetTabInfo(int);
int SearchTab(const char *, const char *, const char *, ULONGLONG);
int retrieve_tab_holding_file(LPCTSTR);
void SetTabInfo(int, const char *, const char *, const char *, BOOL);
void ActivateTab(int, int);
void ChangeZOrder(int, int);
int GetTabID(int);

HMENU get_assigned_tab_menu_handle(void);
int get_currently_selected_tab_id(void);

void delete_tabinfo(TABINFO*);

int tabinfo_load_file(TABINFO*, LPCTSTR);

#define tabinfo_changes_not_saved(tab_data) ((tab_data)->NeedSave)
#define tabinfo_is_assigned_to_file(tab_data) ((tab_data)->FileName[0])

static inline int tabinfo_is_empty(const TABINFO *tab_data)
{

	return (!tabinfo_is_assigned_to_file(tab_data) && !tabinfo_changes_not_saved(tab_data));

}

#endif
