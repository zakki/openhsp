/**
 * @file FootyLine.cpp
 * @brief CFootyLine�̎������s���܂��B
 * @author Shinji Watanabe
 * @date Oct.30.2008
 */

#include "FootyLine.h"

//-----------------------------------------------------------------------------
/**
 * @brief �R���X�g���N�^�ł��B�ŏ��̍s���\�z���܂��B
 */
CFootyLine::CFootyLine()
{
	m_nEthicLine = 1;
	m_nLineOffset = 0;
	m_nRealLineNum = 0;
	m_bEmphasisChached = false;
	m_nLineIcons = 0;
}

//-----------------------------------------------------------------------------
/**
 * @brief �O�̍s�̃I�t�Z�b�g�l�Ɨϗ��s�������ɂ��̃I�t�Z�b�g�l��ݒ肵�܂��B
 * @param pPrevLine �O�̍s�ւ̃C�e���[�^
 * @return �������O��ƕς���Ă����true���Ԃ�
 */
bool CFootyLine::SetPrevLineInfo(LinePt pPrevLine)
{
	// �o�b�N�A�b�v
	size_t nOffsetBefore = m_nLineOffset;
	size_t nRealBefore = m_nRealLineNum;

	// �s�ԍ��f�[�^���v�Z
	m_nLineOffset = pPrevLine->m_nLineOffset + pPrevLine->m_nEthicLine;
	m_nRealLineNum = pPrevLine->m_nRealLineNum + 1;

	// �O�̂ƈꏏ���ǂ����`�F�b�N����
	return  m_nLineOffset != nOffsetBefore || m_nRealLineNum != nRealBefore;
}

//-----------------------------------------------------------------------------
/**
 * @brief �s�̃f�[�^���t���b�V�����Ċe��v�Z���s���܂��B
 * @param nTabLen �^�u��
 * @param nColumn �܂�Ԃ���
 * @param nMode �܂�Ԃ����[�h
 * @return �_���s�����ύX���ꂽ�ꍇtrue���Ԃ�
 * @note �f�[�^��ύX������Ō�ɂ��̏������Ăяo���K�v������܂��B
 */
bool CFootyLine::FlushString(size_t nTabLen,size_t nColumn,int nMode)
{
	// �錾
	CUrlInfo stInsert;

	// �_���s���̏����X�V����
	size_t nBeforeEthicLine = m_nEthicLine;
	m_nEthicLine = CalcEthicLine(GetLineLength(),nColumn,nTabLen,nMode).m_nEthicLine + 1;

	// �N���b�J�u��URL�̌���
	stInsert.m_nEndPos = -1;
	m_vecUrlInfo.clear();
	forever{
		if (!FindURL(stInsert.m_nEndPos + 1,
			&stInsert.m_nStartPos,&stInsert.m_nEndPos))break;
		m_vecUrlInfo.push_back(stInsert);
	}

	// �N���b�J�u�����[���A�h���X�̌���
	stInsert.m_nEndPos = -1;
	m_vecMailInfo.clear();
	forever{
		if (!FindMail(stInsert.m_nEndPos + 1,
			&stInsert.m_nStartPos,&stInsert.m_nEndPos))break;
		m_vecMailInfo.push_back(stInsert);
	}
	return m_nEthicLine != nBeforeEthicLine;
}


//-----------------------------------------------------------------------------
/**
 * @brief nPos�̈ʒu���ǂ���ӂɂ��邩�v�Z���郋�[�`���ł��B
 */
CFootyLine::EthicInfo CFootyLine::CalcEthicLine(size_t nPos,size_t nColumn,size_t nTab,int nMode) const
{
	// �錾
	const wchar_t *pWork = GetLineData();
	EthicInfo stRet;
	// ������
	stRet.m_nEthicLine = 0;
	stRet.m_nEthicColumn = 0;
	// �����񑖍�
	for (size_t i=0;i<nPos;i++,pWork++)
	{
		// �^�u
		if (*pWork == L'\t')
		{
			for (stRet.m_nEthicColumn++;;stRet.m_nEthicColumn++)
			{
				if (stRet.m_nEthicColumn % nTab == 0)break;
			}
		}
		else
		{
			// ����{���ǂ������肷��
			bool bIsDualWidth = false;
			if (IsSurrogateLead(*pWork))	// �T���Q�[�g�y�A�̂P�o�C�g��
			{
				bIsDualWidth = IsDualChar(*pWork,*(pWork+1));
				pWork++;i++;
			}
			else							// �T���Q�[�g�y�A�ł͂Ȃ��Ƃ�
			{
				bIsDualWidth = IsDualChar(*pWork);
			}
			// �ʒu�����炷
			if (bIsDualWidth)stRet.m_nEthicColumn += 2;
			else stRet.m_nEthicColumn ++;
		}
		// ���̕����֍s���܂��H
		if (IsGoNext(pWork,i,stRet.m_nEthicColumn,nColumn,nMode))
		{
			stRet.m_nEthicColumn = 0;
			stRet.m_nEthicLine ++ ;
		}
	}
	// �l��Ԃ�
	return stRet;
}

//-----------------------------------------------------------------------------
/**
 * @brief �ϗ��s������ۂ̌������v�Z���郋�[�`���ł��B
 * @note nEthicLine��nEthicPos��0�x�[�X�œn���܂��B
 */
size_t CFootyLine::CalcRealPosition(size_t nEthicLine,size_t nEthicPos, size_t nColumn,size_t nTab,int nMode) const
{
	// �錾
	const wchar_t *pWork = GetLineData();
	size_t nLineLength = GetLineLength();
	size_t nVisPosition = 0;
	size_t nNowEthic = 0;
	size_t i;
	// �����񑖍�
	for (i=0;i<nLineLength;i++,pWork++)
	{
		// �K�����邩(�I���H)
		if (nNowEthic == nEthicLine)
		{
			if (nVisPosition >= nEthicPos)break;
		}
		// �^�u
		if (*pWork == L'\t')
		{
			for (nVisPosition++;;nVisPosition++)
			{
				if (nVisPosition % nTab == 0)break;
			}
		}
		else
		{
			// ����{���ǂ������肷��
			bool bIsDualWidth = false;
			if (IsSurrogateLead(*pWork))	// �T���Q�[�g�y�A�̂P�o�C�g��
			{
				bIsDualWidth = IsDualChar(*pWork,*(pWork+1));
				pWork++;i++;
			}
			else							// �T���Q�[�g�y�A�ł͂Ȃ��Ƃ�
			{
				bIsDualWidth = IsDualChar(*pWork);
			}
			// �ʒu�����炷
			if (bIsDualWidth)nVisPosition += 2;
			else nVisPosition ++;
		}
		// ���̍s�֍s���܂��H
		if (IsGoNext(pWork,i,nVisPosition,nColumn,nMode))
		{
			nVisPosition = 0;
			nNowEthic ++ ;
		}
	}
	// �l��Ԃ�
	return i;
}

//-----------------------------------------------------------------------------
/**
 * @brief �s�̍ŏ�����w�肳�ꂽ�ʒu�܂ł̋󔒐����v�Z����
 * @param	nPos	[in] �v�Z�ʒu
 * @return ������
 */
size_t CFootyLine::CalcAutoIndentPos( size_t nPos ) const
{
	size_t i = 0;
	for ( i = 0; i < nPos; i++ )
	{
		wchar_t c = m_strLineData[ i ];
		if ( c != '\t' && c != ' ' )
		{
			break;
		}
	}
	return i;
}

/*[EOF]*/
