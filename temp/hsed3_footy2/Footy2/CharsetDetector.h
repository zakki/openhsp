/*===================================================================
CCharsetDetectorクラス
文字コードの判別処理を行うクラス
===================================================================*/

#ifndef _CHARSET_DETECTOR_CLASS_H_
#define _CHARSET_DETECTOR_CLASS_H_

#include "CharsetDetective.h"

class  CCharsetDetector{
public:
	CCharsetDetector();
	~CCharsetDetector();

	void Detect(const char *pRawStr,unsigned int nSize);
	inline CharSetMode GetCodepage(){return m_nCodePage;}
	inline int GetStartIndex(){return m_nStartIndex;}

private:
	typedef enum _tFixedNum{
		MAX_DETECTIVE = 7,				//!< 探偵さんの数
		SEPARATE_NUM = 2048,			//!< 判定処理を行うバイト数
	} tFixedNum;
	typedef enum _tGuessRet{
		GUESS_DETERMINE,				//!< 決定した
		GUESS_MULTIPLE,					//!< 複数の候補が存在する
		GUESS_NOBODY,					//!< どれも候補としては不十分
	} tGuessRet;

	int Examine(CCharsetDetective** ppArray,const char* pRawStr,
		unsigned int nStartPos,unsigned int nTextSize);
	tGuessRet Guess(CCharsetDetective** ppArray,CCharsetDetective **ppTop);

public:
private:
	CharSetMode m_nCodePage;
	int m_nStartIndex;
};

#endif	/*_CHARSET_DETECTOR_CLASS_H_*/
