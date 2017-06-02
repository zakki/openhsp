/*------------------------------------------------------------------------------
	Tab management routines for HSP Script Editor
------------------------------------------------------------------------------*/
#include <windows.h>
#include <commctrl.h>
#include <stdlib.h>
#include <string.h>
#include "tabmanager.h"
#include "footy2.h"
#include "classify.h"
#include "hsed_config.h"
#include "support.h"
#include "poppad.h"
#include "popfile.h"
#include "resource.h"

#define tabinfo_is_assigned_to_file(tab_data, file_path) (check_if_two_paths_map_to_same((tab_data)->FileName, file_path))

// poppad.cpp
LRESULT CALLBACK MyEditProc( HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam );
void poppad_setedit( int );

void __stdcall OnFooty2TextModified(int id, void *pParam, int nStatus);
void __stdcall OnFootyContextMenu(void *pParam, int id);


// main.cpp
//void ConfigEditColor( COLORREF fore, COLORREF back );

// popfont.cpp
void PopFontSetEditFont();

extern HWND     hwndClient;
extern HWND     hwndTab;
extern HWND     hwbak;
extern int      activeID;
extern int      activeFootyID;
extern WNDPROC	Org_EditProc;
extern BOOL     bNeedSave ;
extern char     szDirName[_MAX_PATH] ;
extern char     szFileName[_MAX_PATH] ;
extern char     szTitleName[_MAX_FNAME + _MAX_EXT] ;
extern char     szStartDir[_MAX_PATH];
static HMENU    hMenu = NULL;

// タブを作成
// Create a tab
//
// 引数(Parameters)
// nTabNumber:  挿入先のタブ番号
// szTitleName: キャプション
// szFileName:  管理するファイルのファイル名
// szDirName:   管理するファイルのディレクトリ名
//
// 戻り値
// ありません(Nothing)
int CreateTab(int nTabNumber, const char *szNewTitleName, const char *szNewFileName, const char *szNewDirName)
{
	int FootyID;
	int j/*, ret*/;
	HWND hWnd;
	TABINFO *lpTabInfo, *lpTopTabInfo;
	TCITEM tc_item;
	RECT rect;
	MENUITEMINFO mii;
	LONG dx, dy;

	// Footyのウィンドウを作成
	// Create a Footy window
	GetClientRect(hwndTab, &rect);
	TabCtrl_AdjustRect(hwndTab, FALSE, &rect);
	dx = max(rect.right-rect.left, 1);
	dy = max(rect.bottom-rect.top, 1);
	FootyID = Footy2Create(hwndTab, rect.left, rect.top, dx, dy, VIEWMODE_INVISIBLE);
	if( FootyID < 0 ) {
		DebugBreak();	// 2008-02-17 Shark++ 取り敢えずここで落とす
		return -1;
	}

//	FootySetMetrics(FootyID, F_SM_CLICKABLE_MODE, 0);	// 2008-02-17 Shark++ 代替手段不明
//	FootySetMetrics(FootyID, F_SM_UNDONUM, -1);	// 2008-02-17 Shark++ 代替手段不明
//	FootySetMetrics(FootyID, F_SM_OLEMODE, F_OLE_CTRL);	// 2008-02-17 Shark++ 代替手段不明
	Footy2SetFuncTextModified(FootyID, (Footy2FuncTextModified)OnFooty2TextModified, NULL);
//	FootyEventContextMenu(FootyID, (pFuncContext)OnFootyContextMenu, NULL);	// 2008-02-17 Shark++ 代替手段未実装(取り敢えずサブクラス化で対応できないか？)

	SetEditColor(FootyID);
	poppad_setedit(FootyID);		// 起動直後の設定反映(onitama:050218)
	SetClassify(FootyID);

	hWnd = Footy2GetWnd(FootyID, 0);
	Org_EditProc = (WNDPROC)GetWindowLong(hWnd, GWL_WNDPROC);
    SetWindowLong(hWnd, GWL_WNDPROC, (LONG)MyEditProc);
	DragAcceptFiles(hWnd, TRUE);
	PopFontSetEditFont();

	// タブ情報の構造体を作成する
	lpTabInfo = (TABINFO *)malloc(sizeof(TABINFO));
	lstrcpy(lpTabInfo->TitleName, szNewTitleName);
	lstrcpy(lpTabInfo->FileName, szNewFileName);
	lstrcpy(lpTabInfo->DirName, szNewDirName);
	lpTabInfo->LatestUndoNum = 0;
	lpTabInfo->NeedSave      = FALSE ;
 	lpTabInfo->FootyID       = FootyID;
	lpTabInfo->FileIndex     = 0;

	// Z オーダーのリストに加える
	// Include tab in Z-order list
	lpTopTabInfo = GetTabInfo(activeID);
	if(lpTopTabInfo != NULL){
		lpTabInfo->ZOrder.prev = lpTopTabInfo;
		lpTabInfo->ZOrder.next = lpTopTabInfo->ZOrder.next;
		(lpTopTabInfo->ZOrder.next)->ZOrder.prev = lpTabInfo;
		lpTopTabInfo->ZOrder.next = lpTabInfo;
	}
	else lpTabInfo->ZOrder.next = lpTabInfo->ZOrder.prev = lpTabInfo;

	TCHAR caption_name[MAX_PATH];
	lstrcpyn(caption_name, szNewTitleName[0] == '\0' ? TABUNTITLED : szNewTitleName, MAX_PATH);

	int num_of_tabs = TabCtrl_GetItemCount(hwndTab);

	if (nTabNumber < 0 || nTabNumber > num_of_tabs) nTabNumber = num_of_tabs;

	// 新しいタブを挿入
	tc_item.mask = TCIF_TEXT | TCIF_PARAM;
	tc_item.pszText = caption_name;
	tc_item.lParam = (LPARAM)lpTabInfo;
	TabCtrl_InsertItem(hwndTab, nTabNumber, &tc_item);

	if(lpTopTabInfo != NULL)
		activeID = GetTabID(lpTopTabInfo->FootyID);
	else
		activeID = -1;

	//
	// メニューに項目を追加
	if(hMenu == NULL)
		hMenu =  GetSubMenu(GetMenu(hwbak), POS_WINDOW);

	mii.cbSize = sizeof(MENUITEMINFO);
	mii.fMask = MIIM_ID | MIIM_TYPE;
	mii.fType = MFT_RADIOCHECK | MFT_STRING;
#ifdef ASSIGN_TAB_LIST_TO_FOOTY_IDS
	mii.wID = IDM_ACTIVATETAB + FootyID;
#else
	mii.wID = IDM_ACTIVATETAB + nTabNumber;
#endif
	mii.dwTypeData = caption_name;
	InsertMenuItem(hMenu, POS_TABBASE + nTabNumber, TRUE, &mii);

#ifndef ASSIGN_TAB_LIST_TO_FOOTY_IDS

	// Reassign the tab list items to the tabs

	mii.fMask = MIIM_ID;

	while (nTabNumber < num_of_tabs) {

		nTabNumber++;

		mii.wID = IDM_ACTIVATETAB + num_of_tabs;
		SetMenuItemInfo(hMenu, POS_TABBASE + num_of_tabs, TRUE, &mii);

	}

#endif

	DrawMenuBar(hwbak);

	ActivateTab(activeID, nTabNumber);

	return nTabNumber;
}

// タブを削除する
// Remove a tab from the menu
//
// 引数(Parameters)
// tab_id:  タブ番号
//     Specifies the number of the tab to remove.
//
// 戻り値(Return value)
// ありません
// The function does not return a return value.

void DeleteTab(int tab_id)
{

	TABINFO *tab_data = GetTabInfo(tab_id);
	if (tab_data == NULL) return;

	DeleteMenu(hMenu, IDM_ACTIVATETAB + tab_id, MF_BYCOMMAND);

	//int active_tab = TabCtrl_GetCurSel(hwndTab);

	TabCtrl_DeleteItem(hwndTab, tab_id);

	int num_of_tabs = TabCtrl_GetItemCount(hwndTab);

	if (num_of_tabs <= 0) {

		CreateTab(0, "", "", "");

	} else {

		//ActivateTab(-1, active_tab < num_of_tabs ? active_tab : num_of_tabs - 1);
		ActivateTab(-1, get_currently_selected_tab_id());

#ifndef ASSIGN_TAB_LIST_TO_FOOTY_IDS

		// Reassign the tab list items to the tabs

		MENUITEMINFO item_data;
		item_data.cbSize = sizeof(MENUITEMINFO);
		item_data.fMask = MIIM_ID;

		while (tab_id < num_of_tabs) {

			item_data.wID = IDM_ACTIVATETAB + tab_id;

			SetMenuItemInfo(hMenu, POS_TABBASE + tab_id, TRUE, &item_data);

			tab_id++;

		}

#endif

	}

	delete_tabinfo(tab_data);

	return;

}

// タブ情報を取得
// Get the data of a tab
//
// 引数(Parameters)
// nTabNumber:  タブ番号
//     Specifies the number of the tab.
//
// 戻り値(Result)
// タブ情報の構造体へのポインタを返します。
// The function returns a pointer to the tab data on success, or NULL if not found.
TABINFO *GetTabInfo(int nTabNumber)
{
	TCITEM tc_item;

	tc_item.mask = TCIF_PARAM;
	if(!TabCtrl_GetItem(hwndTab, nTabNumber, &tc_item))
		return NULL;
    return (TABINFO *)tc_item.lParam;
}

// タブ情報を設定
//
// 引数(Parameters)
// nTabNumber:  タブ番号
// szTitleName: キャプション
// szFileName:  管理するファイルのファイル名
// szDirName:   管理するファイルのディレクトリ名
// bNeedSave:   保存が必要ならTRUE、それ以外ならFALSE
//
// 戻り値(Result)
// ありません(Nothing)
//
// 備考(Remarks)
// szTitleName, szFileName, szDirNameにNULLを指定すると、そのパラメータは無視されます。
void SetTabInfo(int nTabNumber, const char *szTitleName, const char *szFileName, const char *szDirName, BOOL bNeedSave)
{
	MENUITEMINFO mii;
	char *szMenuText;
	TABINFO *lpTabInfo = GetTabInfo(nTabNumber);
	if(lpTabInfo){
		if(szTitleName != NULL) lstrcpy(lpTabInfo->TitleName, szTitleName);
		if(szFileName  != NULL) lstrcpy(lpTabInfo->FileName,  szFileName);
		if(szDirName   != NULL) lstrcpy(lpTabInfo->DirName,   szDirName);
		if(bNeedSave >= 0) lpTabInfo->NeedSave = bNeedSave;

		szMenuText = (char *)malloc(max(lstrlen(lpTabInfo->TitleName), lstrlen(TABUNTITLED)) + 3);
		lstrcpy(szMenuText, lpTabInfo->TitleName[0] == '\0' ? TABUNTITLED : lpTabInfo->TitleName);
		if(lpTabInfo->NeedSave) lstrcat(szMenuText, " *");
		mii.cbSize = sizeof(MENUITEMINFO);
		mii.fMask  = MIIM_TYPE;
		mii.fType  = MFT_STRING | MFT_RADIOCHECK;
		mii.dwTypeData = szMenuText;
		SetMenuItemInfo(hMenu, POS_TABBASE + nTabNumber, TRUE, &mii);
		DrawMenuBar(hwbak);
		free(szMenuText);
	}

	return;
}

// 条件を満たすタブを検索
//
// 引数(Parameters)
// szTitleName: キャプション
// szFileName:  管理するファイルのファイル名
// szDirName:   管理するファイルのディレクトリ名
// ullFileIndex: ファイル インデックス
//
// 戻り値(Result)
// 見つかった場合は対象のタブ番号、見つからなければ-1を返します。
int SearchTab(const char *szTitleName, const char *szFileName, const char *szDirName, ULONGLONG ullFileIndex)
{
	TABINFO *lpTabInfo;
	int num = TabCtrl_GetItemCount(hwndTab);

	for(int i = 0; i < num; i++){
		lpTabInfo = GetTabInfo(i);

		if((szTitleName  && !strcmp(szTitleName, lpTabInfo->TitleName))
		|| (szFileName   && !strcmp(szFileName,  lpTabInfo->FileName))
		|| (szDirName    && !strcmp(szDirName,   lpTabInfo->DirName))
		|| (ullFileIndex && ullFileIndex == lpTabInfo->FileIndex))
			return i;
	}
	return -1;
}

int retrieve_tab_holding_file(LPCTSTR file_path)
{

	int num = TabCtrl_GetItemCount(hwndTab);

	for (int i = 0; i < num; i++) {

		TABINFO *tab_data = GetTabInfo(i);
		if (!tab_data) break;

		if (tabinfo_is_assigned_to_file(tab_data, file_path)) return i;

	}

	return -1;

}

// タブをアクティブにする
// Activate a tab
//
// 引数(Parameters)
// nTabNumber: タブ番号(Number of target tab)
//
// 戻り値(Result)
// ありません(Nothing)
#include "support.h"
void ActivateTab(int nTabNumber1, int nTabNumber2)
{
	TABINFO *lpTabInfo1, *lpTabInfo2;
	RECT rect;

	if(nTabNumber1 == nTabNumber2) return;

	lpTabInfo1 = GetTabInfo(nTabNumber1);
	lpTabInfo2 = GetTabInfo(nTabNumber2);
	if(lpTabInfo2 == NULL) return;
	{
		activeID = nTabNumber2;
		activeFootyID = lpTabInfo2->FootyID;

		bNeedSave = lpTabInfo2->NeedSave;
		strcpy(szTitleName, lpTabInfo2->TitleName);
		strcpy(szFileName, lpTabInfo2->FileName);
		strcpy(szDirName, lpTabInfo2->DirName);
		DoCaption (szTitleName, activeID);

		SetCurrentDirectory(lpTabInfo2->DirName);
		TabCtrl_SetCurSel(hwndTab, nTabNumber2);
		TabCtrl_SetCurFocus(hwndTab, nTabNumber2);

		GetClientRect(hwndTab, &rect);
		TabCtrl_AdjustRect(hwndTab, FALSE, &rect);

		Footy2Move(activeFootyID, rect.left, rect.top, rect.right-rect.left, rect.bottom-rect.top);
		Footy2ChangeView(activeFootyID, VIEWMODE_NORMAL);
		Footy2SetFocus(activeFootyID, 0);
		poppad_setsb_current(activeFootyID);
		Footy2Refresh(activeFootyID);

		CheckMenuRadioItem(hMenu, POS_TABBASE, GetMenuItemCount(hMenu) - 1, POS_TABBASE + nTabNumber2, MF_BYPOSITION);
	}

	if(lpTabInfo1 != NULL)
		Footy2ChangeView(lpTabInfo1->FootyID, VIEWMODE_INVISIBLE);

	return;
}

// Zオーダーの順序を変更する
//
// 引数(Parameters)
// nTabNumber1: トップだったタブ番号
// nTabNumber2: トップにするタブ番号
//
// 戻り値
// ありません
void ChangeZOrder(int nTabNumber1, int nTabNumber2)
{

	TABINFO *lpTabInfo1, *lpTabInfo2;
	lpTabInfo1 = GetTabInfo(nTabNumber1);
	lpTabInfo2 = GetTabInfo(nTabNumber2);

	if(lpTabInfo1 != NULL && lpTabInfo2 != NULL){
		(lpTabInfo2->ZOrder.prev)->ZOrder.next = lpTabInfo2->ZOrder.next;
		(lpTabInfo2->ZOrder.next)->ZOrder.prev = lpTabInfo2->ZOrder.prev;
		(lpTabInfo1->ZOrder.next)->ZOrder.prev = lpTabInfo2;
		lpTabInfo2->ZOrder.prev = lpTabInfo1;
		lpTabInfo2->ZOrder.next = lpTabInfo1->ZOrder.next;
		lpTabInfo1->ZOrder.next = lpTabInfo2;
	}

}

// FootyのIDからIDを取得する
// Retrieve the ID of the tab assigned to a Footy ID.
//
// 引数(Parameters)
// lpTabInfo: FootyのID
//     Specifies the Footy ID to retrieve a tab ID from.
//
// 戻り値(Return value)
// 渡されたFootyIDを持つタブのID
// The function returns -1 on failure, or the tab ID if found.

int GetTabID(int FootyID)
{
	TABINFO *lpTabInfo;
	int num = TabCtrl_GetItemCount(hwndTab);

    for(int i = 0; i < num; i++){
		lpTabInfo = GetTabInfo(i);
		if(lpTabInfo != NULL){
			if(lpTabInfo->FootyID == FootyID)
				return i;
		}
	}
	return -1;
}

// Get the handle of the menu assigned to the tab manager.
HMENU get_assigned_tab_menu_handle(void)
{

	return hMenu;

}

// Get the index of the tab selected currently.
int get_currently_selected_tab_id(void)
{

	return TabCtrl_GetCurSel(hwndTab);

}

void delete_tabinfo(TABINFO *tab_data)
{

	TABINFO *next_data = tab_data->ZOrder.next;
	TABINFO *previous_data = tab_data->ZOrder.prev;

	if (previous_data) previous_data->ZOrder.next = next_data;
	if (next_data) next_data->ZOrder.prev = previous_data;

	SetWindowLongPtr(Footy2GetWnd(tab_data->FootyID, 0), GWL_WNDPROC, (LONG_PTR)Org_EditProc);

	Footy2Delete(tab_data->FootyID);

	free(tab_data);

}

int tabinfo_load_file(TABINFO *tab_data, LPCTSTR file_path)
{

	if (lstrlen(file_path) >= MAX_PATH) return -1;
	if (!PopFileRead(tab_data->FootyID, file_path)) return -1;

	tab_data->NeedSave = 0;

	lstrcpyn(tab_data->FileName, file_path, MAX_PATH);

	hsp_getpath(file_path, tab_data->TitleName, GETPATH_WITHOUTDIR);
	hsp_getpath(file_path, tab_data->DirName, GETPATH_DIR);

	return 0;

}
