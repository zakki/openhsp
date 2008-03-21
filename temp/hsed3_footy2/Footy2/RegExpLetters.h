/*===================================================================
CRegExpLetters�N���X
���K�\���̗v�f�N���X�B�ʏ�̕������i�[����ł���{�I�ȃN���X
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
