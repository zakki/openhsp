/*===================================================================
DllViewFunc.cpp
���h���Ɋւ���DLL�֐����L�q���܂��B
===================================================================*/

#include "DllDefnition.h"
#include "ConvFactory.h"

/*----------------------------------------------------------------
Footy2SetColor
�F�ݒ�
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetColor(int nID,int nPosition,COLORREF nColor,bool bRedraw){
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�F��ύX����*/
	switch(nPosition){
	case CP_TEXT:
		pFooty->m_cStatus.m_clDefaultLetter = nColor;
		break;
	case CP_BACKGROUND:
		pFooty->m_cStatus.m_clBackGround = nColor;
		break;
	case CP_CRLF:
		pFooty->m_cStatus.m_clCrlf = nColor;
		break;
	case CP_HALFSPACE:
		pFooty->m_cStatus.m_clHalfSpace = nColor;
		break;
	case CP_NORMALSPACE:
		pFooty->m_cStatus.m_clNormalSpace = nColor;
		break;
	case CP_TAB:
		pFooty->m_cStatus.m_clTab = nColor;
		break;
	case CP_EOF:
		pFooty->m_cStatus.m_clEOF = nColor;
		break;
	case CP_UNDERLINE:
		pFooty->m_cStatus.m_clUnderLine = nColor;
		break;
	case CP_LINENUMBORDER:
		pFooty->m_cStatus.m_clLineNumLine = nColor;
		break;
	case CP_LINENUMTEXT:
		pFooty->m_cStatus.m_clLineNum = nColor;
		break;
	case CP_CARETLINE:
		pFooty->m_cStatus.m_clCaretLine = nColor;
		break;
	case CP_RULERBACKGROUND:
		pFooty->m_cStatus.m_clRulerBk = nColor;
		break;
	case CP_RULERTEXT:
		pFooty->m_cStatus.m_clRulerText = nColor;
		break;
	case CP_RULERLINE:
		pFooty->m_cStatus.m_clRulerLine = nColor;
		break;
	case CP_CARETPOS:
		pFooty->m_cStatus.m_clCaretPos = nColor;
		break;
	case CP_URLTEXT:
		pFooty->m_cStatus.m_clUrl = nColor;
		break;
	case CP_URLUNDERLINE:
		pFooty->m_cStatus.m_clUrlUnder = nColor;
		break;
	case CP_MAILTEXT:
		pFooty->m_cStatus.m_clMail = nColor;
		break;
	case CP_MAILUNDERLINE:
		pFooty->m_cStatus.m_clMailUnder = nColor;
		break;
	case CP_HIGHLIGHTTEXT:
		pFooty->m_cStatus.m_clHighlightText = nColor;
		break;
	case CP_HIGHLIGHTBACKGROUND:
		pFooty->m_cStatus.m_clHighlightBk = nColor;
		break;
	default:
		return FOOTY2ERR_ARGUMENT;
	}
	/*�ĕ`�揈��*/
	if (bRedraw)
		pFooty->m_cView[0].Refresh();
	return FOOTY2ERR_NONE;
}


#ifndef UNDER_CE
/*----------------------------------------------------------------
Footy2AddEmphasisA
�����\���������ǉ����܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2AddEmphasisA(int nID,const char *pString1,const char *pString2,
	int nType,int nFlags,int nLevel,int nOnLevel,int nIndependence,COLORREF nColor){
	
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);

	/*�G���[�`�F�b�N*/
	if (!pFooty)return FOOTY2ERR_NOID;
	
	/*WIDE�ϊ�*/
	/*�ϊ����ēo�^*/
	CConvFactory cConv1;
	if (!cConv1.GetConv()->ToUnicode(pString1,(size_t)strlen(pString1)))
		return FOOTY2ERR_MEMORY;

	const wchar_t *pConvStr2 = NULL;
	CConvFactory cConv2;
	if (pString2){
		if (!cConv2.GetConv()->ToUnicode(pString2,(UINT)strlen(pString2)))
			return FOOTY2ERR_MEMORY;
		pConvStr2 = (const wchar_t*)cConv2.GetConv()->GetConvData();
	}

	/*�����\���������o�^����*/
	if (!pFooty->m_cDoc.AddEmphasis
		((const wchar_t*)cConv1.GetConv()->GetConvData(),
		 pConvStr2,nType,nFlags,nLevel,nOnLevel,nIndependence,nColor))
		return FOOTY2ERR_ARGUMENT;

	return FOOTY2ERR_NONE;
}
#endif	/*UNDER_CE*/


/*----------------------------------------------------------------
Footy2AddEmphasisW
�����\���������ǉ����܂��B
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2AddEmphasisW(int nID,const wchar_t *pString1,const wchar_t *pString2,
	int nType,int nFlags,int nLevel,int nOnLevel,int nIndependence,COLORREF nColor){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�����\���������o�^����*/
	if (pFooty->m_cDoc.AddEmphasis(pString1,pString2,
		nType,nFlags,nLevel,nOnLevel,nIndependence,nColor))
		return FOOTY2ERR_NONE;
	else
		return FOOTY2ERR_ARGUMENT;
}

/*----------------------------------------------------------------
Footy2FlushEmphasis
�����\����������t���b�V������
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2FlushEmphasis(int nID){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	/*�G���[�`�F�b�N*/
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�t���b�V��������*/
	pFooty->m_cDoc.FlushEmphasis();
	/*�S�čĕ`��*/
	pFooty->m_cView[0].Refresh();
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2ClearEmphasis
�����\�����������������
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2ClearEmphasis(int nID){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	/*�G���[�`�F�b�N*/
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�t���b�V��������*/
	pFooty->m_cDoc.ClearEmphasis();
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2SetFontSize
�t�H���g�̃T�C�Y��ݒ肷�鏈��
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetFontSize(int nID,int nPoint,bool bRefresh){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	/*�G���[�`�F�b�N*/
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�t���b�V��������*/
	if (!pFooty->SetFontSize(nPoint,bRefresh))
		return FOOTY2ERR_ARGUMENT;
	return FOOTY2ERR_NONE;
}

#ifndef UNDER_CE
/*----------------------------------------------------------------
Footy2SetFontFaceA
�����\�����������������
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetFontFaceA(int nID,int nFontMode,const char *pString,bool bRefresh){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	/*�G���[�`�F�b�N*/
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�t���b�V��������*/
	CConvFactory cConv;
	if (!cConv.GetConv()->ToUnicode(pString,strlen(pString)))
		return FOOTY2ERR_MEMORY;
	if (!pFooty->SetFontFace(nFontMode,(const wchar_t*)cConv.GetConv()->GetConvData(),bRefresh))
		return FOOTY2ERR_ARGUMENT;
	return FOOTY2ERR_NONE;
}
#endif	/*UNDER_CE*/

/*----------------------------------------------------------------
Footy2SetFontFaceW
�����\�����������������
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetFontFaceW(int nID,int nFontMode,const wchar_t *pString,bool bRefresh){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	/*�G���[�`�F�b�N*/
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�t���b�V��������*/
	if (!pFooty->SetFontFace(nFontMode,pString,bRefresh))
		return FOOTY2ERR_ARGUMENT;
	return FOOTY2ERR_NONE;
}


/*----------------------------------------------------------------
Footy2SetLineIcon
�s�A�C�R���̏�Ԃ�ݒ肷�鏈��
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetLineIcon(int nID,size_t nLine,int nIcons,bool bRefresh){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�s���擾����*/
	if (pFooty->m_cDoc.GetLineNum() <= nLine)
		return FOOTY2ERR_ARGUMENT;
	LinePt pLine = pFooty->m_cDoc.GetLine(nLine);
	/*�ݒ肷��*/
	pLine->SetLineIcons(nIcons);
	/*�ĕ`�悳����*/
	if (bRefresh)pFooty->m_cView[0].Refresh();
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2GetLineIcon
�s�A�C�R���̏�Ԃ��擾���鏈��
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetLineIcon(int nID,size_t nLine,int *pIcons){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	/*�s���擾����*/
	if (pFooty->m_cDoc.GetLineNum() <= nLine)
		return FOOTY2ERR_ARGUMENT;
	LinePt pLine = pFooty->m_cDoc.GetLine(nLine);
	/*�擾����*/
	if (pIcons)*pIcons = pLine->GetLineIcons();
	return FOOTY2ERR_NONE;
}

/*[EOF]*/
