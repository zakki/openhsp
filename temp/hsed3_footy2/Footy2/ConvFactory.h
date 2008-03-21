/*===================================================================
CConvFactory�N���X
�R���o�[�^�̃t�@�N�g���N���X
===================================================================*/

#ifndef _CONVERTER_FACTORY_CLASS_H_
#define _CONVERTER_FACTORY_CLASS_H_

#include "Footy2.h"
#include "TextConverter.h"					/*�e�L�X�g�R���o�[�^�[*/

class  CConvFactory{
public:
#ifndef UNDER_CE
	CConvFactory();
#endif	/*not defined UNDER_CE*/
	CConvFactory(CharSetMode nCharSet);
	~CConvFactory();
	
	inline CTextConverter *GetConv(){return m_pConverter;}
	CharSetMode GetCharset();

private:
	void CreateConverter(CharSetMode nCharSet);

private:
	CTextConverter *m_pConverter;
	CharSetMode m_nCharSet;
};

#endif	/*_CONVERTER_FACTORY_CLASS_H_*/
