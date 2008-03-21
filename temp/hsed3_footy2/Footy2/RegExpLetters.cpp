/*===================================================================
CRegExpLettersクラス
正規表現の要素クラス。通常の文字を格納する最も基本的なクラス
===================================================================*/

#include "RegExpLetters.h"


/*----------------------------------------------------------------
CRegExpLetters::CRegExpLetters
コンストラクタ
----------------------------------------------------------------*/
CRegExpLetters::CRegExpLetters(const wchar_t *pString){
	m_strLetters = pString;
}

/*----------------------------------------------------------------
CRegExpLetters::CRegExpLetters
コンストラクタ
----------------------------------------------------------------*/
CRegExpLetters::CRegExpLetters(std::wstring &strLetters){
	m_strLetters = strLetters;
}

/*----------------------------------------------------------------
CRegExpLetters::~CRegExpLetters
デストラクタ
----------------------------------------------------------------*/
CRegExpLetters::~CRegExpLetters(){
}

/*----------------------------------------------------------------
CRegExpLetters::~CRegExpLetters
デストラクタ
----------------------------------------------------------------*/
bool CRegExpLetters::SearchInner(LinePt pLine,size_t nPosition,CEditPosition *pEnd,LinePt pEndLine){
	/*文字数によってチェックする*/
	if (m_strLetters.size() > pLine->GetLineLength() - nPosition)
		return false;

	/*ループ*/
	for (size_t i=0;
		 i != m_strLetters.size() && nPosition != pLine->GetLineLength();
		 nPosition++,i++){
		 if (pLine->GetLineData()[nPosition] != m_strLetters[i])return false;
	}
	
	/*成功した*/
	pEnd->SetPosition(pLine,nPosition);
	return true;
}



/*[EOF]*/
