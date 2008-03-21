/*===================================================================
CCharsetDetector�N���X
�����R�[�h�̔��ʏ������s���N���X
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
		MAX_DETECTIVE = 7,				//!< �T�コ��̐�
		SEPARATE_NUM = 2048,			//!< ���菈�����s���o�C�g��
	} tFixedNum;
	typedef enum _tGuessRet{
		GUESS_DETERMINE,				//!< ���肵��
		GUESS_MULTIPLE,					//!< �����̌�₪���݂���
		GUESS_NOBODY,					//!< �ǂ�����Ƃ��Ă͕s�\��
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
