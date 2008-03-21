/**
 * @file DllEditFunc.cpp
 * @brief 編集系の関数を実装するファイル
 * @author Shinji Watanabe
 * @verison 1.0
 * @date Jan.20.2008
 */

#include "DllDefnition.h"
#include "ConvFactory.h"

/**
 * Footy2Copy
 * @brief コピー処理を行います。
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(int) Footy2Copy(int nID)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (!pFooty->m_cDoc.IsSelecting())return FOOTY2ERR_NOTSELECTED;
	return pFooty->Copy() ? FOOTY2ERR_NONE : FOOTY2ERR_MEMORY;
}

/**
 * Footy2Cut
 * @brief 切り取り処理を行います。
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(int) Footy2Cut(int nID)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (!pFooty->m_cDoc.IsSelecting())return FOOTY2ERR_NOTSELECTED;
	return pFooty->Cut() ? FOOTY2ERR_NONE : FOOTY2ERR_MEMORY;
}

/**
 * Footy2Paste
 * @brief ペースト処理を行います。
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(int) Footy2Paste(int nID)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	return pFooty->Paste() ? FOOTY2ERR_NONE : FOOTY2ERR_MEMORY;
}

/**
 * Footy2IsEdited
 * @brief 編集されているかどうかを取得します。
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(bool) Footy2IsEdited(int nID)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return false;
	return pFooty->m_cDoc.IsEdited();
}

/**
 * Footy2SelectAll
 * @brief 全て選択処理を行います
 * @param nID 処理を実行するFootyのID
 * @param bRedraw 再描画処理を行うかどうか
 */
FOOTYEXPORT(int) Footy2SelectAll(int nID,bool bRedraw)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;

	// 全て選択する
	pFooty->m_cDoc.SelectAll();

	// 再描画処理
	if (bRedraw)
	{
		pFooty->m_cView[0].Refresh();
	}
	return FOOTY2ERR_NONE;
}


/**
 * Footy2Undo
 * @brief アンドゥを行います。
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(int) Footy2Undo(int id)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(id);
	if (!pFooty)return FOOTY2ERR_NOID;

	// アンドゥ処理
	if (!pFooty->Undo())
		return FOOTY2ERR_NOUNDO;

	// キャレットから位置を再設定
	for (int i=0;i<4;i++)
	{
		pFooty->m_cView[i].AdjustVisibleLine();
		pFooty->m_cView[i].AdjustVisiblePos();
	}

	// 成功
	return FOOTY2ERR_NONE;
}

/**
 * Footy2Redo
 * @brief リドゥを行います。
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(int) Footy2Redo(int id)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(id);
	if (!pFooty)return FOOTY2ERR_NOID;
	// リドゥ処理
	if (!pFooty->Redo())
		return FOOTY2ERR_NOUNDO;
	// 成功
	return FOOTY2ERR_NONE;
}


#ifndef UNDER_CE
/**
 * Footy2SearchA
 * @brief 検索処理を行います
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(int) Footy2SearchA(int nID,const char *szText,int nFlags)
{
	// 変換
	CConvFactory cConv;
	if (!cConv.GetConv()->ToUnicode(szText,(size_t)strlen(szText)))
		return FOOTY2ERR_MEMORY;

	// 成功
	return Footy2SearchW(nID,reinterpret_cast<const wchar_t*>(cConv.GetConv()->GetConvData()),nFlags);
}
#endif	/*not defined UNDER_CE*/


/**
 * Footy2SearchW
 * @brioef 検索処理を行います
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(int) Footy2SearchW(int nID,const wchar_t *szText,int nFlags)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	
	// 検索文字が空のとき
	if (szText[0] == L'\0')
		return FOOTY2ERR_ARGUMENT;
	
	// 検索処理を実行する
	if (pFooty->m_cDoc.Search(szText,nFlags))			// 見つかったとき
	{
		if ((nFlags & SEARCH_NOT_ADJUST_VIEW) == 0)		// スクロールさせる
		{
			pFooty->m_cView[0].AdjustVisiblePos();
			pFooty->m_cView[0].AdjustVisibleLine();
		}
		if ((nFlags & SEARCH_NOT_REFRESH) == 0)			// 再描画させる
		{
			pFooty->m_cView[0].Refresh();
		}
		return FOOTY2ERR_NONE;
	}
	else
	{
		// 見つからなかったとき
		if ((nFlags & SEARCH_BEEP_ON_404) != 0)
			MessageBeep(MB_ICONEXCLAMATION);
		return FOOTY2ERR_404;
	}
}

/**
 * Footy2ShiftLock
 * @brief シフトロックを行う
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(int) Footy2ShiftLock(int nID,bool bLocked)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;

	// シフトロック状態をセットする
	for (int i=0;i<4;i++)
	{
		pFooty->m_cView[i].SetShiftLock(bLocked);
	}
	
	return FOOTY2ERR_NONE;
}

/**
 * Footy2IsShiftLocked
 * @brief シフトロックされているかどうか取得する
 * @param nID 処理を実行するFootyのID
 */
FOOTYEXPORT(bool) Footy2IsShiftLocked(int nID)
{
	// Footyを取得する
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return false;
	// シフトロック状態を取得する
	return pFooty->m_cView[0].IsShiftLocked();
}

/*[EOF]*/
