/**
 * @file FootyDocUndo.cpp
 * @brief ドキュメント管理クラス。このファイルでアンドゥの処理を行います。
 * @author Shinji Watanabe
 * @date 2009/01/11
 */

#include "FootyDoc.h"
#include "UndoBuffer.h"

//-----------------------------------------------------------------------------
/**
 * @brief アンドゥ情報を末尾に挿入します。
 */

bool CFootyDoc::PushBackUndo(CUndoBuffer *pUndo)
{

	FOOTY2_ASSERT(!IsReadOnly());

	if (!pUndo) return false;

	bool current_position_equal_to_saved = false;

	if (!m_bCannotReachSavedPos)
	{

		current_position_equal_to_saved = (m_pNowUndoPos == m_pSavedPos);

		std::list<CUndoBuffer>::iterator i = m_pNowUndoPos;

		while (i != m_lsUndoBuffer.end())
		{

			++i;

			if (i == m_pSavedPos)
			{

				m_bCannotReachSavedPos = true;

				break;

			}

		}

	}

	m_lsUndoBuffer.erase(m_pNowUndoPos, m_lsUndoBuffer.end());

	m_lsUndoBuffer.push_back(*pUndo);

	m_pNowUndoPos = m_lsUndoBuffer.end();

	if (current_position_equal_to_saved)
	{

		m_pSavedPos = m_pNowUndoPos;
		--m_pSavedPos;

	}

	return true;

}


//-----------------------------------------------------------------------------
/**
 * @brief アンドゥ処理を行います。
 */
bool CFootyDoc::Undo()
{
	if ( IsReadOnly() ) return false;

	// 現在のアンドゥー位置を取得する
	if (m_pNowUndoPos == m_lsUndoBuffer.end())		// まだ実行していない
	{
		if (!m_lsUndoBuffer.size())
			return false;
	}
	else if (m_pNowUndoPos == m_lsUndoBuffer.begin())
	{
		return false;
	}
	m_pNowUndoPos --;

	// コマンドに従ってアンドゥ処理を行います。
	switch(m_pNowUndoPos->m_nUndoType)
	{
	case CUndoBuffer::UNDOTYPE_DELETE:
		m_pNowUndoPos->m_cBeforeStart.SetPosition(&m_cCaretPos,&m_lsLines);
		InsertString(m_pNowUndoPos->m_strBefore.c_str(),false);
		break;
	case CUndoBuffer::UNDOTYPE_INSERT:
		SetSelectStart(&m_pNowUndoPos->m_cAfterStart);
		SetSelectEndNormal(&m_pNowUndoPos->m_cAfterEnd);
		m_cCaretPos = *GetSelStart();
		DeleteSelected(NULL);
		break;
	case CUndoBuffer::UNDOTYPE_REPLACE:
		SetSelectStart(&m_pNowUndoPos->m_cAfterStart);
		SetSelectEndNormal(&m_pNowUndoPos->m_cAfterEnd);
		m_cCaretPos = *GetSelStart();
		InsertString(m_pNowUndoPos->m_strBefore.c_str(),false);
		break;
	}
	SendMoveCaretCallBack();
	return true;
}

//-----------------------------------------------------------------------------
/**
 * @brief リドゥ処理を行います。
 */
bool CFootyDoc::Redo()
{
	if ( IsReadOnly() ) return false;

	// 現在のリドゥー位置を取得する
	if (m_pNowUndoPos == m_lsUndoBuffer.end())
		return false;
	
	// コマンドに従ってアンドゥ処理を行います。
	switch(m_pNowUndoPos->m_nUndoType)
	{
	case CUndoBuffer::UNDOTYPE_DELETE:
		SetSelectStart(&m_pNowUndoPos->m_cBeforeStart);
		SetSelectEndNormal(&m_pNowUndoPos->m_cBeforeEnd);
		m_cCaretPos = *GetSelStart();
		DeleteSelected(NULL);
		break;
	case CUndoBuffer::UNDOTYPE_INSERT:
		m_pNowUndoPos->m_cAfterStart.SetPosition(&m_cCaretPos,&m_lsLines);
		InsertString(m_pNowUndoPos->m_strAfter.c_str(),false);
		break;
	case CUndoBuffer::UNDOTYPE_REPLACE:
		SetSelectStart(&m_pNowUndoPos->m_cBeforeStart);
		SetSelectEndNormal(&m_pNowUndoPos->m_cBeforeEnd);
		m_cCaretPos = *GetSelStart();
		InsertString(m_pNowUndoPos->m_strAfter.c_str(),false);
		break;
	}
	
	// 次のアンドゥー情報へ
	m_pNowUndoPos ++;
	SendMoveCaretCallBack();
	return true;
}

/*[EOF]*/
