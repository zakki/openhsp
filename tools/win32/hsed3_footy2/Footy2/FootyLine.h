/**
 * @brief FootyLine.h
 * @brief Footy�̍s������s�P�ʂŊǗ�����N���X�ł��B
 * @author Shinji Watanabe
 * @date Nov.09.2008
 */

#pragma once

#include "StaticVector.h"
#include "EmphasisWord.h"

// URL���Ƃ̏��
class CUrlInfo
{
public:
	CUrlInfo()
	{
		m_nStartPos = 0;
		m_nEndPos = 0;
	}
	
	// �|�W�V�������܂܂�邩�`�F�b�N����
	inline bool IsInPosition(size_t nPosition)
	{
		return m_nStartPos <= nPosition &&
			nPosition < m_nEndPos;
	}
	inline size_t GetLength() const
	{
		return m_nEndPos - m_nStartPos;
	}

public:
	size_t m_nStartPos;					//!< URL�̊J�n�ʒu0�x�[�X
	size_t m_nEndPos;					//!< URL�̏I���ʒu0�x�[�X
};

typedef std::vector<CUrlInfo>::iterator UrlIterator;

class CFootyLine
{
public:
	//! GUI�����ɑ���R�}���h�\����
	struct EmpPos
	{
		size_t m_nPosition;				//!< �R�}���h�̈ʒu
		bool m_bIsStart;				//!< true�̂Ƃ��A�������F��ς���|�C���g
		COLORREF m_Color;				//!< �ݒ肷��F
	};
	
	//! �_���v�����[�`���̖߂�
	struct EthicInfo
	{
		size_t m_nEthicLine;			//!< �_���s
		size_t m_nEthicColumn;			//!< �_�����ʒu
	};
	
	//! �P��̏��
	struct WordInfo
	{
		size_t m_nBeginPos;				//!< �J�n�ʒu(0�x�[�X)
		size_t m_nEndPos;				//!< �I���ʒu(0�x�[�X)
	};
	
	// �R���X�g���N�^
	CFootyLine();
	
	// �����񑀍�I����ɌĂяo��
	typedef CStaticVector<WordPt,sizeof(int)*8> TakeOver;
	bool SearchEmphasis(TakeOver *pBeforeBetween,LsWords *plsWords);
	bool FlushString(size_t nTabLen,size_t nColumn,int nMode);
	bool SetPrevLineInfo(std::list<CFootyLine>::iterator pPrevLine);
	inline void SetEmphasisChached(bool bChached){m_bEmphasisChached = bChached;}

	// �擾���[�`��
	const wchar_t *GetLineData() const {return m_strLineData.c_str();}
	size_t GetLineLength() const {return m_strLineData.size();}
	inline size_t GetEthicLine() const { return m_nEthicLine; }
	inline size_t GetOffset() const {return m_nLineOffset;}
	inline size_t GetRealLineNum() const {return m_nRealLineNum;}
	inline CStaticVector<WordPt,sizeof(int)*8> *GetBetweenNext()
		{return &m_vecLineBetweenAfter;}
	inline std::vector<EmpPos> *GetColorInfo(){return &m_vecColorInfo;}
	inline std::vector<CUrlInfo> *GetUrlInfo(){return &m_vecUrlInfo;}
	inline std::vector<CUrlInfo> *GetMailInfo(){return &m_vecMailInfo;}
	inline bool EmphasisChached() const {return m_bEmphasisChached;}
	inline int GetLineIcons() const {return m_nLineIcons;}
	inline void SetLineIcons(int nLineIcons){m_nLineIcons = nLineIcons;}

	// �����������Ɍv�Z���s�����[�`��
	EthicInfo CalcEthicLine(size_t nPos,size_t nColumn,size_t nTab,int nMode) const;
	size_t CalcRealPosition(size_t nEthicLine,size_t nEthicPos,size_t nColumn,size_t nTab,int nMode) const;
	bool IsGoNext(const wchar_t *pChar,size_t nPos,size_t nNowCol,size_t nColumns,int nMode) const;
	WordInfo GetWordInfo( size_t nPos, bool bIsBackMode = true ) const;
	size_t CalcAutoIndentPos( size_t nPos ) const;

	// �����֘A
	enum CharSets
	{
		CHARSETS_ANSI_ALPHABET,				//!< ANSI(�A���t�@�x�b�g)
		CHARSETS_ANSI_NUMBER,				//!< ANSI(����)
		CHARSETS_ANSI_SYMBOL,				//!< ANSI(�A���_�[�o�[�������L��)
		CHARSETS_ANSI_UNDER,				//!< ANSI�A���_�[�o�[)
		CHARSETS_HIRAGANA,					//!< ���{��(�Ђ炪��)
		CHARSETS_KATAKANA,					//!< ���{��(�J�^�J�i)
		CHARSETS_KATAKANA_HALF,				//!< ���{��(���p�J�^�J�i)
		CHARSETS_KANJI,						//!< ���{��(����)
		CHARSETS_FULL_ALPHABET,				//!< �S�p�A���t�@�x�b�g
		CHARSETS_FULL_NUMBER,				//!< �S�p����
		CHARSETS_AINU_EXTENSION,			//!< �A�C�k��p�g��
		CHARSETS_IPA_EXTENSION,				//!< IPA�g��
		CHARSETS_SYMBOLS,					//!< �L��
		CHARSETS_JP_NOBASHI,				//!< ���{��̂΂���
		CHARSETS_KOREA,						//!< �؍���
		CHARSETS_LATIN,						//!< ���e��
		CHARSETS_BALTIC,					//!< �o���g����
		CHARSETS_ARABIC,					//!< �A���r�A
		CHARSETS_HEBREW,					//!< �w�u���C
		CHARSETS_GREEK,						//!< �M���V��
		CHARSETS_CYRILLIC,					//!< �L��������
		CHARSETS_VIETTNAMESE,				//!< �x�g�i����
		CHARSETS_THAI,						//!< �^�C��
		
		CHARSETS_UNKNOWN,					//!< �s��
	};

	static CharSets GetCharSets(wchar_t w);
	static CharSets GetCharSets(wchar_t w1,wchar_t w2);
	static bool IsDualChar(CharSets c);		/*��{�̉����̕������擾����*/
	static inline bool IsDualChar(wchar_t w){return IsDualChar(GetCharSets(w));}
	static inline bool IsDualChar(wchar_t w1,wchar_t w2){return IsDualChar(GetCharSets(w1,w2));}
	static inline bool IsSurrogateLead(wchar_t w){return 0xD800 <= w && w <= 0xDBFF;}
	static inline bool IsSurrogateTail(wchar_t w){return 0xDC00 <= w && w <= 0xDFFF;}

private:
	// �������[�`��
	bool IsMatched(const wchar_t *pStr1,const wchar_t *pStr2,size_t nLen);
	
	// �N���b�J�u���֘A�̏���
	bool FindMail(size_t start,size_t *pBegin,size_t *pEnd);
	bool FindURL(size_t start,size_t *pBegin,size_t *pEnd);
	bool IsMailChar(wchar_t wc);
	bool IsURLChar(wchar_t wc);

public:
	std::wstring m_strLineData;				//!< ��s�̃f�[�^

private:
	std::vector<EmpPos> m_vecColorInfo;		//!< �F�������
	TakeOver m_vecLineBetweenAfter;			//!< ���̌�Ɉ����p�������s�����\��������
	std::vector<CUrlInfo> m_vecUrlInfo;		//!< URL���
	std::vector<CUrlInfo> m_vecMailInfo;	//!< ���[�����
	size_t m_nEthicLine;					//!< �_�����s���H
	size_t m_nLineOffset;					//!< �_���s�I�t�Z�b�g�ʒu
	size_t m_nRealLineNum;					//!< �{���̍s�ԍ�
	bool m_bEmphasisChached;				//!< ���������񂪃L���b�V������Ă���
	int m_nLineIcons;						//!< �s���Ƃ̃A�C�R��
};

// �����^�C�v�̐錾
typedef std::list<CFootyLine>::iterator LinePt;
typedef std::list<CFootyLine>::size_type LineSize;
typedef std::list<CFootyLine> LsLines;

/*[EOF]*/
