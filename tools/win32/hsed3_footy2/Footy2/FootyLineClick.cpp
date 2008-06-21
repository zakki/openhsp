/**
 * @file FootyLineClick.cpp
 * @brief �N���b�J�u���n�̏������s���܂��B
 * @author Shinji Watanabe
 * @version 1.0
 * @date Jan.08.2008
 */

#include "FootyLine.h"

/**
 * CFootyLine::FindURL
 * @brief URL��������������܂��B
 * @param start [in] �J�n�ʒu
 * @param pBegin [out] ���������J�n�ʒu
 * @param pEnd [out] ���������I���ʒu
 */
bool CFootyLine::FindURL(size_t start,size_t *pBegin,size_t *pEnd)
{
	// �錾
	const wchar_t *pLineData = GetLineData() + start;
	size_t nTextLen = GetLineLength();
	size_t len = -1;
	// �����J�n
	for (size_t i=start;i<nTextLen;i++,pLineData++)
	{
		// ��r
		if (5 <= nTextLen-i && IsMatched(pLineData,L"http:",5))len=5;
		if (6 <= nTextLen-i && IsMatched(pLineData,L"https:",6))len=6;
		if (4 <= nTextLen-i && IsMatched(pLineData,L"ftp:",4))len=4;
		
		// ��v�����Ƃ�
		if (len!=-1)
		{
			*pBegin = i;
			for (pLineData+=len,i+=len;i<nTextLen;i++,pLineData++)
			{
				if (!IsURLChar(*pLineData))	// URL�̕����̓K�������`�F�b�N
				{
					*pEnd = i;
					return true;
				}
			}
			*pEnd = nTextLen;
			return true;
		}
	}
	*pBegin = *pEnd = -1;
	return false;
}

/**
 * CFootyLine::FindMail
 * @brief ���[���A�h���X��������������܂��B
 * @param start [in] �J�n�ʒu
 * @param pBegin [out] ���������J�n�ʒu
 * @param pEnd [out] ���������I���ʒu
 */
bool CFootyLine::FindMail(size_t start,size_t *pBegin,size_t *pEnd)
{
	// �錾
	int work=-1;										//!< ���o�p
	bool bDotFound;										//!< �h�b�g������������
	size_t i,j;
	const wchar_t *pLineData = GetLineData() + start;	//!< �������p
	const wchar_t *pWork;
	size_t nTextLen = GetLineLength();

	// ����
	for (i = start;i<nTextLen;i++,pLineData++)			// �Ōォ���O�܂�
	{
		bDotFound = false;
		if (*pLineData == L'@')							// ���}�[�N������
		{
			if (i == 0)continue;						// ����ȑO�������ꍇ�͎���
			for (j=i-1,pWork=pLineData-1;;pWork--,j--)	// ����ȑO���������Ă���
			{
				if (j == -1)
				{
					*pBegin=0;
					break;
				}
				if (!IsMailChar(*pWork))				// ���[��������Ƃ��ĕs�K�؂ȏꍇ
				{
					if (j == i - 1)goto NextI;			// ���}�[�N�ȑO�ɂȂ������玟��
					*pBegin = j + 1;
					break;
				}
			}
			for (j=i+1,pWork=pLineData+1;;pWork++,j++)	// ���}�[�N�ȍ~������
			{
				if (j == nTextLen)
				{
					*pEnd = nTextLen;
					if (bDotFound)
						return true;
					goto NextI;
				}
				if (!IsMailChar(*pWork))
				{
					if (i == j+1)goto NextI;			// ����ȍ~�̕����񂪌�����Ȃ�
					*pEnd = j;
					if (bDotFound)
						return true;
					goto NextI;
				}
				if (*pWork == L'.')						// @�ȍ~��.����������
					bDotFound = true;
			}
		}
NextI:;
	}
	*pBegin = *pEnd = -1;
	return false;
}

/**
 * CFootyLine::IsMailChar
 * @brief ���[���A�h���X�̕����Ƃ��ēK��������
 * @param c ���ׂ镶��
 * @return �K�؂ȏꍇtrue��Ԃ��܂��B
 */
bool CFootyLine::IsMailChar(wchar_t c)
{
	if (c==L'~'  || (97 <=c && c <= 122) || // a�`z
		c==L'_'  || (65 <=c && c <= 90)  || // ?,A�`Z
		c==L'\\' || (45 <=c && c <= 58)  || // �����A�s���I�h�A�n�C�t���A�X���b�V���A�R����
		c==L'='  || (36 <=c && c <= 38)  ||
		c==L'&'  || c==L'%' || c==L'#' || c==L'+')
		return true;
	else
		return false;
}

/**
 * CFootyLine::IsURLChar
 * @brief URL�̕����Ƃ��ēK���̂�����̂����ׂ܂��B
 * @param c ���ׂ镶��
 * @return �K�؂ȏꍇtrue��Ԃ��܂��B
 */
bool CFootyLine::IsURLChar(wchar_t c)
{
	if (c==L'~'  || (97 <=c && c <= 122) ||
		c==L'_'  || (65 <=c && c <= 90)  ||
		c==L'!'  || (44 <=c && c <= 59)  ||
		c==L'='  || (36 <=c && c <= 38)  ||
		c==L'*'  || c==L'?' || c==L'#')
		return true;
	else
		return false;
}

/*[EOF]*/
