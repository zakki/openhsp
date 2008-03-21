/*===================================================================
CRegExpLetters�N���X
���K�\���̗v�f�N���X�B�ʏ�̕������i�[����ł���{�I�ȃN���X
===================================================================*/

#include "RegExpLetters.h"


/*----------------------------------------------------------------
CRegExpLetters::CRegExpLetters
�R���X�g���N�^
----------------------------------------------------------------*/
CRegExpLetters::CRegExpLetters(const wchar_t *pString){
	m_strLetters = pString;
}

/*----------------------------------------------------------------
CRegExpLetters::CRegExpLetters
�R���X�g���N�^
----------------------------------------------------------------*/
CRegExpLetters::CRegExpLetters(std::wstring &strLetters){
	m_strLetters = strLetters;
}

/*----------------------------------------------------------------
CRegExpLetters::~CRegExpLetters
�f�X�g���N�^
----------------------------------------------------------------*/
CRegExpLetters::~CRegExpLetters(){
}

/*----------------------------------------------------------------
CRegExpLetters::~CRegExpLetters
�f�X�g���N�^
----------------------------------------------------------------*/
bool CRegExpLetters::SearchInner(LinePt pLine,size_t nPosition,CEditPosition *pEnd,LinePt pEndLine){
	/*�������ɂ���ă`�F�b�N����*/
	if (m_strLetters.size() > pLine->GetLineLength() - nPosition)
		return false;

	/*���[�v*/
	for (size_t i=0;
		 i != m_strLetters.size() && nPosition != pLine->GetLineLength();
		 nPosition++,i++){
		 if (pLine->GetLineData()[nPosition] != m_strLetters[i])return false;
	}
	
	/*��������*/
	pEnd->SetPosition(pLine,nPosition);
	return true;
}



/*[EOF]*/
