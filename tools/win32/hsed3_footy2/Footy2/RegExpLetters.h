/*===================================================================
CRegExpLetters�N���X
���K�\���̗v�f�N���X�B�ʏ�̕������i�[����ł���{�I�ȃN���X
===================================================================*/

#pragma once

#include "RegExpElement.h"
#include <string>

class CRegExpLetters : public CRegExpElement{
public:
	CRegExpLetters(const wchar_t *pString, bool bIgnoreCase = false);
	CRegExpLetters(std::wstring &strLetters, bool bIgnoreCase = false);
	~CRegExpLetters();

protected:
virtual bool SearchInner(LinePt pStartLine,size_t nStartPos,CEditPosition *pEnd,LinePt pEndLine);
private:
public:
private:
	std::wstring m_strLetters;
	bool         m_bIgnoreCase;
};

/*[EOF]*/
