/*===================================================================
CRegExpLettersクラス
正規表現の要素クラス。通常の文字を格納する最も基本的なクラス
===================================================================*/

#pragma once

#include "RegExpElement.h"
#include <string>

class CRegExpLetters : public CRegExpElement{
public:
	CRegExpLetters(const wchar_t *pString);
	CRegExpLetters(std::wstring &strLetters);
	~CRegExpLetters();

protected:
virtual bool SearchInner(LinePt pStartLine,size_t nStartPos,CEditPosition *pEnd,LinePt pEndLine);
private:
public:
private:
	std::wstring m_strLetters;
};

/*[EOF]*/
