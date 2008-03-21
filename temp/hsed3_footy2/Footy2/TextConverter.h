/*===================================================================
CTextConverter�N���X
UNICODE����_�ɂ����e�L�X�g�̕ϊ��������\�ȃx�[�X�N���X�ł��B
===================================================================*/

#ifndef _TEXT_CONVERTER_CLASS_H_
#define _TEXT_CONVERTER_CLASS_H_

class  CTextConverter{
public:
	CTextConverter();
	~CTextConverter();
	
	/*�R���o�[�g���\�b�h*/
	virtual bool ToUnicode(const char*,size_t nSize) = 0;
	virtual bool ToMulti(const wchar_t*,size_t nSize) = 0;
	inline const char *GetConvData(){return m_pOutputText;}
	inline size_t GetConvTextSize(){return m_nTextSize;}
	
protected:
	bool Alloc(size_t nSize);				//!< ���������蓖��
	void Free();							//!< ���������

protected:
	inline bool IsSurrogateLead(wchar_t w){return 0xD800 <= w && w <= 0xDBFF;}
	inline bool IsSurrogateTail(wchar_t w){return 0xDC00 <= w && w <= 0xDFFF;}

	char *m_pOutputText;					//!< �o�̓e�L�X�g
	size_t m_nTextSize;						//!< �ێ����Ă���e�L�X�g�̃T�C�Y(NULL�܂�)
};

#endif	/*_TEXT_CONVERTER_CLASS_H_*/

/*[EOF]*/
