/*===================================================================
CFontObjects�N���X
�t�H���g�̃I�u�W�F�N�g�Ǘ��N���X�ł��B
===================================================================*/

#include <math.h>
#include "Footy2.h"
#include "FontObjects.h"
#pragma warning (disable : 4996)

const int CFontObjects::m_nCharSets[FFM_NUM_FONTS] = 
{
	ANSI_CHARSET,
	BALTIC_CHARSET,
	CHINESEBIG5_CHARSET,
	EASTEUROPE_CHARSET,
	GB2312_CHARSET,
	GREEK_CHARSET,
	HANGUL_CHARSET,
	RUSSIAN_CHARSET,
	SHIFTJIS_CHARSET,
	TURKISH_CHARSET,
	VIETNAMESE_CHARSET,
	ARABIC_CHARSET,
	HEBREW_CHARSET,
	THAI_CHARSET
};

/*-------------------------------------------------------------------------
CFontObjects::GetFontHandle
�R���X�g���N�^�ł��B
-------------------------------------------------------------------------*/
CFontObjects::CFontObjects(){
	/*�S��NULL��*/
	for (int i=0;i<FFM_NUM_FONTS;i++)
		m_hFont[i] = NULL;
	m_hRulerFont = NULL;
	m_fnWeight = FW_BOLD;
	m_nFontHeight = 0;
	m_nFontWidth = 0;
	m_nRulerHeight = 0;
	/*�f�t�H���g�t�H���g�������Ă���*/
	m_strFace[FFM_ANSI_CHARSET]			= L"Courier New";
	m_strFace[FFM_BALTIC_CHARSET]		= L"Courier New";
	m_strFace[FFM_BIG5_CHARSET]			= L"MingLiU";
	m_strFace[FFM_EASTEUROPE_CHARSET]	= L"Courier New";
	m_strFace[FFM_GB2312_CHARSET]		= L"SimSun";
	m_strFace[FFM_GREEK_CHARSET]		= L"Courier New";
	m_strFace[FFM_HANGUL_CHARSET]		= L"GulimChe";
	m_strFace[FFM_RUSSIAN_CHARSET]		= L"Courier New";
	m_strFace[FFM_SHIFTJIS_CHARSET]		= L"MS Gothic";
	m_strFace[FFM_TURKISH_CHARSET]		= L"Courier New";
	m_strFace[FFM_VIETNAMESE_CHARSET]	= L"Courier New";
	m_strFace[FFM_ARABIC_CHARSET]		= L"GulimChe";
	m_strFace[FFM_HEBREW_CHARSET]		= L"Courier New";
	m_strFace[FFM_THAI_CHARSET]			= L"Tahoma";
	m_nFontPoint	=	FONTNORMAL_DEFAULT;
}

/*-------------------------------------------------------------------------
CFontObjects::~CFontObjects
�f�X�g���N�^�ł��B
-------------------------------------------------------------------------*/
CFontObjects::~CFontObjects(){
	for (int i=0;i<FFM_NUM_FONTS;i++){
		if (m_hFont[i]){
			DeleteObject(m_hFont[i]);
			m_hFont[i] = NULL;
		}
	}
}

/*-------------------------------------------------------------------------
CFontObjects::CreateFontObject
����̃t�H���g����蒼������
-------------------------------------------------------------------------*/
bool CFontObjects::CreateFontObject(int nType,HDC hDC){
	m_hFont[nType] = GetFontHandle(m_strFace[nType].c_str(),
			HeightFromPoint(hDC,m_nFontPoint),
			false,m_nCharSets[nType]);
	if (!m_hFont[nType])return false;
	return true;
}

/*-------------------------------------------------------------------------
CFontObjects::RecreateAll
�S�Ẵt�H���g����蒼������
-------------------------------------------------------------------------*/
bool CFontObjects::RecreateAll(HDC hDC){
	for (int i=0;i<FFM_NUM_FONTS;i++){
		if (!CreateFontObject(i,hDC))return false;
	}
	SetFontPixels(hDC);
	return true;
}

/*-------------------------------------------------------------------------
CFontObjects::SetFontFace
�t�H���g���Z�b�g���鏈��
-------------------------------------------------------------------------*/
bool CFontObjects::SetFontFace(int nType,const wchar_t *pFontFace,HDC hDC){
	m_strFace[nType] = pFontFace;
	if (!CreateFontObject(nType,hDC))return false;
	SetFontPixels(hDC);
	return true;
}

/*-------------------------------------------------------------------------
CFontObjects::SetFontPixels

-------------------------------------------------------------------------*/
void CFontObjects::SetFontPixels(HDC hDC){
	HFONT hFontOld;					/*�t�H���g�n���h��*/
	SIZE wSize;						/*w�̑傫��*/
	hFontOld = (HFONT)SelectObject(hDC,GetKanjiFont());
	GetTextExtentPoint32W(hDC,L"abcdefghijklmnopqrstuvwxyz",26,&wSize);
	SelectObject(hDC,hFontOld);
	m_nFontWidth = wSize.cx / 26;
	m_nFontHeight = wSize.cy;
}

/*-------------------------------------------------------------------------
CFontObjects::SetRuler
���[���[�p�t�H���g�̍쐬
-------------------------------------------------------------------------*/
bool CFontObjects::SetRuler(HDC hDC,int nRulerHeight){
	/*�錾*/
	HFONT hTemp;
	/*�t�H���g���쐬*/
	hTemp = GetFontHandle(m_strFace[FFM_ANSI_CHARSET].c_str(),nRulerHeight,false,ANSI_CHARSET);
	if (!hTemp)return false;
	m_hRulerFont = hTemp;
	m_nRulerHeight = nRulerHeight;
	return true;
}

/*-------------------------------------------------------------------------
CFontObjects::GetFontHandle
<����>
szFontName	�t�H���g�̖��O
nPoint		�t�H���g�̑傫��
hDC			�f�o�C�X�R���e�L�X�g�n���h��
<���>
�t�H���g���쐬���āA�����Ԃ��܂��B
-------------------------------------------------------------------------*/
HFONT CFontObjects::GetFontHandle(const wchar_t *szFontName,int nHeight,bool bBold,int nCharSets){
	/*�t�H���g���쐬(CreateFont��CE�Ŏg���Ȃ�)*/
	LOGFONTW fontStruct;
	memset(&fontStruct,0,sizeof(LOGFONTW));
	fontStruct.lfHeight = nHeight;
	fontStruct.lfWeight = (bBold ? m_fnWeight : FW_NORMAL);
	fontStruct.lfCharSet = nCharSets;
	fontStruct.lfOutPrecision = OUT_DEFAULT_PRECIS;
	fontStruct.lfClipPrecision = CLIP_DEFAULT_PRECIS;
	fontStruct.lfQuality = DEFAULT_QUALITY;
	fontStruct.lfPitchAndFamily = FF_MODERN | FIXED_PITCH;
	wcsncpy(fontStruct.lfFaceName,szFontName,LF_FACESIZE);
	return CreateFontIndirectW(&fontStruct);
}

/*-------------------------------------------------------------------------
CFontObjects::GetMulDiv
nNumber * nNumerator / nDenominator ���l�̌ܓ����ĕԂ�
-------------------------------------------------------------------------*/
int CFontObjects::GetMulDiv(int nNumber,int nNumerator,int nDenominator){
	long long nTemp = nNumber * nNumerator;
	double fReturn = ((double)nTemp / nDenominator);
	fReturn += 0.5f;
	return (int)floor(fReturn);
}

/*[EOF]*/
