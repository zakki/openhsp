/*===================================================================
CFooty�N���X
Footy�̑匳�ƂȂ�N���X�ł��B
===================================================================*/

#include "DllDefnition.h"

/*-------------------------------------------------------------------
CFooty::CFooty
�R���X�g���N�^�ł��B
-------------------------------------------------------------------*/
CFooty::CFooty(){
	m_nID = -1;
	m_nViewMode = VIEWMODE_NORMAL;
	m_nCharSet = CSM_DEFAULT;
	m_hWndParent = NULL;
}

/*-------------------------------------------------------------------
CFooty::CFooty
�R���X�g���N�^�ł��B
-------------------------------------------------------------------*/
CFooty::CFooty(int nID){
	m_nID = nID;
	m_nViewMode = VIEWMODE_NORMAL;
	m_nCharSet = CSM_DEFAULT;
}

/*-------------------------------------------------------------------
CFooty::Create
Footy���쐬����
-------------------------------------------------------------------*/
bool CFooty::Create(HWND hWnd,HINSTANCE hInstance,int x,int y,int nWidth,
					int nHeight,int nViewMode){
	/*�錾*/
	int i;
	
	/*�G���[�`�F�b�N*/
	if (!hWnd || nWidth < 0 || nHeight < 0)return false;
	m_hWndParent = hWnd;

	/*�t�H���g���쐬����*/
	HDC hDC = GetDC(hWnd);
	if (!m_cFonts.RecreateAll(hDC))return false;
	if (!m_cFonts.SetRuler(hDC,m_cView[0].GetRulerHeight()))return false;
	ReleaseDC(hWnd,hDC);
	
	/*�����o�ϐ��ɃR�s�[*/
	m_nWidth = nWidth;
	m_nHeight = nHeight;
	m_x = x;
	m_y = y;
	
	/*�h�L�������g�V�K�쐬*/
	m_cDoc.CreateNew(m_nID);
	
	/*�r���[�쐬*/
	for (i=0;i<4;i++){
		if (!m_cView[i].Create(hWnd,hInstance,&m_cFonts,
			m_cView,&m_cDoc,&m_cStatus,m_nID,i))
			return false;
	}
	if (!m_cVSplitter.Create(hWnd,hInstance))
		return false;
	if (!m_cHSplitter.Create(hWnd,hInstance))
		return false;

	/*�r���[���[�h��ύX����*/
	ChangeView(nViewMode);
	return true;
}


/*-------------------------------------------------------------------
CFooty::ChangeView
�r���[���[�h�̕ύX����
-------------------------------------------------------------------*/
void CFooty::ChangeView(int nViewMode,bool bRedraw){
	m_nViewMode = nViewMode;
	
	/*�X�v���b�^��ύX����*/
	m_cVSplitter.OnBaseWindowMove(m_x,m_y,m_nWidth,m_nHeight);
	m_cHSplitter.OnBaseWindowMove(m_x,m_y,m_nWidth,m_nHeight);

	/*���[�h�ɍ��킹�ăr���[�𒲐߂���*/
	switch(nViewMode){
	case VIEWMODE_NORMAL:
		m_cView[0].MoveWin(m_x,m_y,m_nWidth,m_nHeight);
		m_cHSplitter.SetVisible(false);
		m_cVSplitter.SetVisible(false);
		m_cView[0].SetVisible(true);
		m_cView[1].SetVisible(false);
		m_cView[2].SetVisible(false);
		m_cView[3].SetVisible(false);
		break;
	case VIEWMODE_VERTICAL:
		m_cVSplitter.SetViews(m_cView);
		m_cVSplitter.MoveWin(m_x+m_nWidth / 2 - CSplitBase::SPLIT_SIZE / 2,m_y,m_nWidth,m_nHeight);
		m_cVSplitter.SetVisible(true);
		m_cHSplitter.SetVisible(false);
		m_cView[0].SetVisible(true);
		m_cView[1].SetVisible(true);
		m_cView[2].SetVisible(false);
		m_cView[3].SetVisible(false);
		break;
	case VIEWMODE_HORIZONTAL:
		m_cHSplitter.SetViews(m_cView);
		m_cHSplitter.MoveWin(m_x,m_y+m_nHeight / 2 - CSplitBase::SPLIT_SIZE / 2,m_nWidth,m_nHeight);
		m_cHSplitter.SetVisible(true);
		m_cVSplitter.SetVisible(false);
		m_cView[0].SetVisible(true);
		m_cView[1].SetVisible(true);
		m_cView[2].SetVisible(false);
		m_cView[3].SetVisible(false);
		break;
	case VIEWMODE_QUAD:
		m_cHSplitter.SetViews(m_cView,&m_cVSplitter);
		m_cVSplitter.SetViews(m_cView,&m_cHSplitter);
		m_cHSplitter.MoveWin(m_x,m_y+m_nHeight / 2 - CSplitBase::SPLIT_SIZE / 2,m_nWidth,m_nHeight);
		m_cVSplitter.MoveWin(m_x+m_nWidth / 2 - CSplitBase::SPLIT_SIZE / 2,m_y,m_nWidth,m_nHeight);
		m_cHSplitter.SetVisible(true);
		m_cVSplitter.SetVisible(true);
		m_cView[0].SetVisible(true);
		m_cView[1].SetVisible(true);
		m_cView[2].SetVisible(true);
		m_cView[3].SetVisible(true);
		break;
	case VIEWMODE_INVISIBLE:
		m_cHSplitter.SetVisible(false);
		m_cVSplitter.SetVisible(false);
		m_cView[0].SetVisible(false);
		m_cView[1].SetVisible(false);
		m_cView[2].SetVisible(false);
		m_cView[3].SetVisible(false);
		break;
	}

	/*�t�H�[�J�X�𓖂Ă�(�����ꂩ���t�H�[�J�X�������Ă���Ƃ��̂�)*/
	if (IsFocused())m_cView[0].SetFocus();
	
	/*�ĕ`��*/
	if (bRedraw)m_cView[0].Refresh();
}

/*-------------------------------------------------------------------
CFooty::IsFocused
�����ꂩ�̃r���[���t�H�[�J�X�������Ă��邩�������鏈��
-------------------------------------------------------------------*/
bool CFooty::IsFocused(){
	for (int i=0;i<3;i++){
		if (m_cView[i].IsFocused())return true;
	}
	return false;
}

/*-------------------------------------------------------------------
CFooty::Move
�ړ������邽�߂̊֐��ł��B
-------------------------------------------------------------------*/
bool CFooty::Move(int x,int y,int nWidth,int nHeight){
	if (nWidth < 0 || nHeight < 0)return false;
	
	/*�����o�ϐ��փR�s�[*/
	m_nWidth = nWidth;
	m_nHeight = nHeight;
	m_x = x;
	m_y = y;
	
	/*�X�v���b�g�o�[�𒲐�*/
	m_cVSplitter.OnBaseWindowMove(m_x,m_y,m_nWidth,m_nHeight);
	m_cHSplitter.OnBaseWindowMove(m_x,m_y,m_nWidth,m_nHeight);
	
	/*���[�h�ɉ����ăr���[��ݒ肷��*/
	switch(m_nViewMode){
	case VIEWMODE_NORMAL:
		m_cView[0].MoveWin(x,y,nWidth,nHeight);
		break;
	case VIEWMODE_VERTICAL:
		m_cVSplitter.MoveWin(m_cVSplitter.GetX(),y,nWidth,nHeight);
		break;
	case VIEWMODE_HORIZONTAL:
		m_cHSplitter.MoveWin(x,m_cHSplitter.GetY(),nWidth,nHeight);
		break;
	case VIEWMODE_QUAD:
		m_cVSplitter.MoveWin(m_cVSplitter.GetX(),y,nWidth,nHeight);
		m_cHSplitter.MoveWin(x,m_cHSplitter.GetY(),nWidth,nHeight);
		break;
	}
	
	/*�S�Ẵr���[�ŃL�����b�g���쐬����*/
	for (int i=0;i<4;i++){
		m_cView[i].CaretMove();
	}
	return true;
}

/*-------------------------------------------------------------------
CFooty::Undo
�A���h�D�������s���܂��B
-------------------------------------------------------------------*/
bool CFooty::Undo(){
	if (!m_cDoc.Undo())
		return false;
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++){
		if (m_cView[i].IsFocused()){
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_UNDO);
	return true;
}

/*-------------------------------------------------------------------
CFooty::Redo
���h�D�������s���܂�
-------------------------------------------------------------------*/
bool CFooty::Redo(){
	if (!m_cDoc.Redo())
		return false;
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++){
		if (m_cView[i].IsFocused()){
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	/*�ĕ`��*/
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_REDO);
	return true;
}

/*-------------------------------------------------------------------
CFooty::Copy
�R�s�[�������s���܂��B
-------------------------------------------------------------------*/
bool CFooty::Copy(){
	if (!m_cDoc.ClipCopy(m_cView[0].GetWnd()))
		return false;
	return true;
}

/*-------------------------------------------------------------------
CFooty::Cut
�؂��菈�����s���܂��B
-------------------------------------------------------------------*/
bool CFooty::Cut(){
	if (!m_cDoc.ClipCopy(m_cView[0].GetWnd()))
		return false;
	m_cDoc.OnBackSpace();
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++){
		if (m_cView[i].IsFocused()){
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	/*�ĕ`��*/
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_CUT);
	return true;
}


/*-------------------------------------------------------------------
CFooty::Paste
�y�[�X�g�������s���܂��B
-------------------------------------------------------------------*/
bool CFooty::Paste(){
	if (!m_cDoc.ClipPaste(m_cView[0].GetWnd()))
		return false;
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++){
		if (m_cView[i].IsFocused()){
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	/*�ĕ`��*/
	m_cView[0].Refresh();
	/*�C�x���g��ʒm����*/
	m_cDoc.SendTextModified(MODIFIED_CAUSE_PASTE);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetSelText
�I�𕶎�����Z�b�g���܂��B
-------------------------------------------------------------------*/
bool CFooty::SetSelText(const wchar_t *pString){
	if (!m_cDoc.InsertString(pString))return false;
	/*�L�����b�g����ʒu���Đݒ�*/
	for (int i=0;i<4;i++){
		if (m_cView[i].IsFocused()){
			m_cView[i].AdjustVisibleLine();
			m_cView[i].AdjustVisiblePos();
		}
	}
	/*�ĕ`��*/
	m_cView[0].Refresh();
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetText
��������Z�b�g���܂��B
-------------------------------------------------------------------*/
void CFooty::SetText(const wchar_t *pString){
	m_cDoc.SetText(pString);
	m_cView[0].Refresh();
}


/*-------------------------------------------------------------------
CFooty::SetLapel
�܂�Ԃ��ʒu��ݒ肵�܂��B
-------------------------------------------------------------------*/
bool CFooty::SetLapel(int nColumns,int nMode,bool bRedraw){
	/*�J�����������������ׂ�*/
	if (nColumns < 2)return false;

	/*�Z�b�g����*/
	m_cDoc.SetLapel(nColumns,nMode);
	for (int i=0;i<4;i++){
		m_cView[i].SetVisibleCols();
		m_cView[i].SetFirstColumn(0);
	}
	if (bRedraw)m_cView[0].Refresh(true);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetFontSize
�t�H���g�̃T�C�Y��ݒ肵�܂�
-------------------------------------------------------------------*/
bool CFooty::SetFontSize(int nPoint,bool bRedraw){
	/*�|�C���g�T�C�Y�����������`�F�b�N����*/
	if (nPoint < 2)return false;
	
	/*�Z�b�g����*/
	HDC hDC = GetDC(m_hWndParent);
	m_cFonts.SetFontSize(nPoint,hDC);
	ReleaseDC(m_hWndParent,hDC);
	
	for (int i=0;i<4;i++){
		m_cView[i].SetVisibleCols();
		m_cView[i].SetFirstColumn(0);
	}
	if (bRedraw)m_cView[0].Refresh(true);
	return true;
}

/*-------------------------------------------------------------------
CFooty::SetFontSize
�t�H���g�̃T�C�Y��ݒ肵�܂�
-------------------------------------------------------------------*/
bool CFooty::SetFontFace(int nType,const wchar_t *pFaceName,bool bRedraw){
	/*�Z�b�g����*/
	HDC hDC = GetDC(m_hWndParent);
	m_cFonts.SetFontFace(nType,pFaceName,hDC);
	ReleaseDC(m_hWndParent,hDC);
	
	for (int i=0;i<4;i++){
		m_cView[i].SetVisibleCols();
		m_cView[i].SetFirstColumn(0);
	}
	if (bRedraw)m_cView[0].Refresh(true);
	return true;
}


/*[EOF]*/
