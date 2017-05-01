/**
 * @file FootyDocUndo.cpp
 * @brief �h�L�������g�Ǘ��N���X�B���̃t�@�C���ŃA���h�D�̏������s���܂��B
 * @author Shinji Watanabe
 * @date 2009/01/11
 */

#include "FootyDoc.h"
#include "UndoBuffer.h"

//-----------------------------------------------------------------------------
/**
 * @brief �A���h�D���𖖔��ɑ}�����܂��B
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
 * @brief �A���h�D�������s���܂��B
 */
bool CFootyDoc::Undo()
{
	if ( IsReadOnly() ) return false;

	// ���݂̃A���h�D�[�ʒu���擾����
	if (m_pNowUndoPos == m_lsUndoBuffer.end())		// �܂����s���Ă��Ȃ�
	{
		if (!m_lsUndoBuffer.size())
			return false;
	}
	else if (m_pNowUndoPos == m_lsUndoBuffer.begin())
	{
		return false;
	}
	m_pNowUndoPos --;

	// �R�}���h�ɏ]���ăA���h�D�������s���܂��B
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
 * @brief ���h�D�������s���܂��B
 */
bool CFootyDoc::Redo()
{
	if ( IsReadOnly() ) return false;

	// ���݂̃��h�D�[�ʒu���擾����
	if (m_pNowUndoPos == m_lsUndoBuffer.end())
		return false;
	
	// �R�}���h�ɏ]���ăA���h�D�������s���܂��B
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
	
	// ���̃A���h�D�[����
	m_pNowUndoPos ++;
	SendMoveCaretCallBack();
	return true;
}

/*[EOF]*/
