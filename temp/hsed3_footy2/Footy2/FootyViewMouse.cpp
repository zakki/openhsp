/**
 * @file FootyViewMouse.cpp
 * @brief Footy�̃r���[�Ǘ����s���܂��B���̃t�@�C���Ń}�E�X�̏������s���܂��B
 */

#include "FootyView.h"
#include "KeyboardState.h"
#include "Cursor.h"
#ifndef WM_MOUSEWHEEL
#	include "zmouse.h"						/*�}�E�X�z�C�[�����b�Z�[�W*/
#endif	/*WM_MOUSEWHEEL*/

/**
 * CFootyView::OnMouseWheel
 * @brief �z�C�[���}�E�X���������ꂽ�Ƃ��̏���
 * @param bIsForward �������։񂳂ꂽ���ǂ���
 */
void CFootyView::OnMouseWheel(bool bIsForward){
	if (bIsForward)
		m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),WHEEL_MOUSE);
	else
		m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack(WHEEL_MOUSE);
	Refresh();
}

/**
 * CFootyView::OnScrollTimer
 * @brief �����X�N���[���̂��߂̃^�C�}�[�����B�E�B���h�E���b�Z�[�W����Ă΂��B
*/
void CFootyView::OnScrollTimer(){
	/*�X�N���[������*/
	if (m_bIsAutoScrollVertical){
		if (0 < m_nAutoScrollNum)
			m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicNext(m_pDocuments->GetLineList(),(int)(m_nAutoScrollNum));
		else
			m_pDocuments->GetFirstVisible(m_nViewID)->MoveEthicBack((int)(-m_nAutoScrollNum));			
	}
	else{
		int nLapel = (int)m_pDocuments->GetLapelColumn();
		m_nFirstVisibleColumn += m_nAutoScrollNum;
		if (m_nFirstVisibleColumn < 0)m_nFirstVisibleColumn = 0;
		if (m_nFirstVisibleColumn > nLapel)m_nFirstVisibleColumn = nLapel;
	}

	/*�}�E�X���������ꂽ���Ƃɂ���*/
	OnMouseMove(m_nNowMousePosX,m_nNowMousePosY,true);
}

/**
 * CFootyView::OnMouseDown
 * @brief �}�E�X�������ꂽ�Ƃ��̏���
 * @param x �}�E�X���Wx
 * @param y �}�E�X���Wy
 */
void CFootyView::OnMouseDown(int x,int y){
	/*�錾*/
	CEditPosition cNowPosition;
	CEditPosition cSelStart,cSelEnd;
	CKeyBoardState cKeyStates(m_bShiftLocked);
	bool bSelected = m_pDocuments->IsSelecting();
	
	/*�t�H�[�J�X�����킹��*/
	::SetFocus(m_hWnd);

	if (y > m_nRulerHeight){
		/*�s�ԍ��\���̈�*/
		if (x < m_nLineCountWidth){
			CalcLineCount(y,&cSelStart,&cSelEnd);
			m_pDocuments->SetSelectStart(&cSelStart);
			m_pDocuments->SetSelectEndNormal(&cSelEnd);
			m_pDocuments->SetSelLineStart();
			*m_pDocuments->GetCaretPosition() = cSelEnd;
			m_pDocuments->SendMoveCaretCallBack();

			/*�h���b�O��������*/
			m_nDragMode = DRAGMODE_LINE;
			SetCapture(m_hWnd);				/*�}�E�X�L���v�`���J�n*/

			/*�ĕ`�揈��*/
			Refresh();
		}
		/*�ʏ�̃G�f�B�^�̈�*/
		else {
			/*�L�����b�g�ʒu���ړ�����*/
			CalcInfoFromMouse(x,y,&cNowPosition);
			if (cKeyStates.IsShiftPushed()){	/*Shift�L�[��������Ă���Ƃ��͑I������*/
				if (m_pDocuments->IsSelecting())
					m_pDocuments->SetSelectEndNormal(&cNowPosition);
				else{
					m_pDocuments->SetSelectStart();
					m_pDocuments->SetSelectEndNormal(&cNowPosition);
				}
				bSelected = true;
			}
			else m_pDocuments->SetSelectStart(&cNowPosition);
			*m_pDocuments->GetCaretPosition() = cNowPosition;
			m_pDocuments->SendMoveCaretCallBack();

			/*�h���b�O��������*/
			m_nDragMode = DRAGMODE_MOUSE;
			SetCapture(m_hWnd);				/*�}�E�X�L���v�`���J�n*/

			/*�ʒu���Đݒ肵�Ă���*/
			bool bAdLine = AdjustVisibleLine();
			bool bAdPos = AdjustVisiblePos();

			/*�ĕ`�揈��*/
			if (bSelected || bAdLine || bAdPos)Refresh();
			else CaretRefresh();
		}
	}
}

/**
 * CFootyView::OnMouseMove
 * @brief �}�E�X���������ꂽ�Ƃ��ɌĂяo����܂��B
 * @param x �}�E�X���Wx
 * @param y �}�E�X���Wy
 * @param bFromScrollTimer �X�N���[���^�C�}�[����Ă΂ꂽ��true�A�E�B���h�E���b�Z�[�W����Ă΂ꂽ��false
 */
void CFootyView::OnMouseMove(int x, int y, bool bFromScrollTimer){
	/*�錾*/
	CEditPosition cNowPosition;
	CEditPosition cSelStart,cSelEnd;
	bool bStopTimer = true;
	
	/*���݂̃}�E�X�ʒu��ݒ�*/
	m_nNowMousePosX = x;
	m_nNowMousePosY = y;
	
	/*�h���b�O���Ă�����ɉ����ĕ���*/
	switch(m_nDragMode){
//�h���b�O���Ă��Ȃ�
	case DRAGMODE_NONE:
		/*�}�E�X�J�[�\����ύX����*/
		if (m_nRulerHeight < y){
			if (m_nLineCountWidth < x){
				if (CalcInfoFromMouse(x,y,&cNowPosition) &&
					IsOnUrl(&cNowPosition,NULL) != ONURL_NONE)
					CCursor::UseUrlCursor();	/*URL��*/
				else CCursor::UseIBeam();		/*I�r�[��*/
			}
			else CCursor::UseLineCount();		/*�s�ԍ��\���̈�*/
		}
		else CCursor::UseArrow();
		break;

//�s�ԍ��\���̈���h���b�O��
	case DRAGMODE_LINE:
		if (y < m_nRulerHeight){
			StartScrollTimer(true,
				(int)((y - m_nRulerHeight) / PIXEL_PER_LINESPEED) - 1);
			bStopTimer = false;
		}
		if (y > m_nHeight){
			StartScrollTimer(true,
				(int)((y - m_nHeight) / PIXEL_PER_LINESPEED) + 1);
			bStopTimer = false;
		}
		
		if (CalcLineCount(y,&cSelStart,&cSelEnd)){		/*������Ǝ擾�ł����Ƃ��̂ݑI��*/
			if (cSelStart < *m_pDocuments->GetLineSelStartA()){
				m_pDocuments->SetSelectStart(&cSelStart);
				m_pDocuments->SetSelectEndNormal(m_pDocuments->GetLineSelStartB());
				*m_pDocuments->GetCaretPosition() = cSelStart;
			}
			else {
				m_pDocuments->SetSelectStart(m_pDocuments->GetLineSelStartA());
				m_pDocuments->SetSelectEndNormal(&cSelEnd);
				*m_pDocuments->GetCaretPosition() = cSelEnd;
			}
		}
		m_pDocuments->SendMoveCaretCallBack();

		/*�ĕ`�揈��*/
		Refresh();
		m_cCaret.Hide();
		if (bStopTimer)StopScrollTimer();
		break;

//�}�E�X�ŃG�f�B�^����h���b�O��
	case DRAGMODE_MOUSE:
		if (x < m_nLineCountWidth){			/*�s�ԍ��\���̈��荶*/
			StartScrollTimer(false,
				(int)((x - m_nLineCountWidth) / PIXEL_PER_COLUMNSPEED) - 1);
			x = m_nLineCountWidth;
			bStopTimer = false;
		}
		if (y < m_nRulerHeight){			/*���[���[����*/
			StartScrollTimer(true,
				(int)((y - m_nRulerHeight) / PIXEL_PER_LINESPEED) - 1);
			y = m_nRulerHeight;
			bStopTimer = false;
		}
		if (y > m_nHeight){					/*��ʂ�艺*/
			StartScrollTimer(true,
				(int)((y - m_nHeight) / PIXEL_PER_LINESPEED) + 1);
			y = m_nHeight;
			bStopTimer = false;
		}
		
		CalcInfoFromMouse(x,y,&cNowPosition);

		// �L�����b�g�ʒu���ړ������Ƃ��ɍĕ`�悷��
		if (cNowPosition != *m_pDocuments->GetCaretPosition()){	
			m_pDocuments->SetSelectEndNormal(&cNowPosition);
			
			// ���݂̈ʒu���L�����b�g��
			LinePt pRenderStart = m_pDocuments->GetCaretPosition()->GetLinePointer();
			*m_pDocuments->GetCaretPosition() = cNowPosition;

			// �ĕ`���������
			if (bFromScrollTimer)
				ScrollRefresh();
			else
				LineChangedRefresh(pRenderStart,cNowPosition.GetLinePointer());

			// �L�����b�g�͔�\����
			m_cCaret.Hide();
			m_pDocuments->SendMoveCaretCallBack();
		}

		// �����X�N���[���^�C�}�[���~�߂�
		if (bStopTimer)StopScrollTimer();
		break;
	}
}

/*----------------------------------------------------------------
CFootyView::OnMouseUp
�}�E�X�������ꂽ�Ƃ��ɌĂяo����܂��B
----------------------------------------------------------------*/
void CFootyView::OnMouseUp(int x,int y){
	switch(m_nDragMode){
//�}�E�X�ŃG�f�B�^����h���b�O��
	case DRAGMODE_MOUSE:
	case DRAGMODE_LINE:
		m_cCaret.Show();
		ReleaseCapture();

		/*�����X�N���[������߂�*/
		StopScrollTimer();
		break;
	}
	
	/*�h���b�O��Ԃ����ɖ߂�*/
	m_nDragMode = DRAGMODE_NONE;
}

/*----------------------------------------------------------------
CFootyView::StartScrollTimer
�^�C�}�[�𒲐����܂��B
----------------------------------------------------------------*/
void CFootyView::StartScrollTimer(bool bIsVertical,int nScrollNum){
	/*�^�C�}�[���X�^�[�g������*/
	if (!m_bIsAutoScrolling){
		m_bIsAutoScrolling = true;
		SetTimer(m_hWnd,TIMER_AUTO_SCROLL,SCROLL_TIME,NULL);
	}
	/*�ϐ�����*/
	m_bIsAutoScrollVertical = bIsVertical;
	m_nAutoScrollNum = nScrollNum;
}

/*----------------------------------------------------------------
CFootyView::StopScrollTimer
�X�N���[���^�C�}�[���~���܂��B
----------------------------------------------------------------*/
void CFootyView::StopScrollTimer(){
	if (m_bIsAutoScrolling){
		m_bIsAutoScrolling = false;
		KillTimer(m_hWnd,TIMER_AUTO_SCROLL);
	}
	m_nAutoScrollNum = 0;
}

/*----------------------------------------------------------------
CFootyView::OnMouseDouble
�_�u���N���b�N�����Ƃ��ɌĂяo����܂��B
----------------------------------------------------------------*/
void CFootyView::OnMouseDouble(int x,int y){
	/*�錾*/
	CEditPosition cNowPosition;
	CUrlInfo cUrlInfo;
	RetOnUrl nRetURL;
	std::wstring strShellCommand;

	/*�t�H�[�J�X�����킹��*/
	::SetFocus(m_hWnd);
	
	/*�ʏ�̃G�f�B�^�̈�*/
	if (y > m_nRulerHeight && x > m_nLineCountWidth){
		/*�L�����b�g�ʒu���ړ�����*/
		CalcInfoFromMouse(x,y,&cNowPosition);
		/*�N���b�J�u���H*/
		nRetURL = IsOnUrl(&cNowPosition,&cUrlInfo);
		if (nRetURL == ONURL_URL){				/*URL*/
			strShellCommand = cNowPosition.GetLinePointer()->
				m_strLineData.substr(cUrlInfo.m_nStartPos,cUrlInfo.GetLength());
			StartApplication(strShellCommand.c_str());
		}
		else if (nRetURL == ONURL_MAIL){		/*���[���A�h���X*/
			strShellCommand = L"mailto:";
			strShellCommand += cNowPosition.GetLinePointer()->
				m_strLineData.substr(cUrlInfo.m_nStartPos,cUrlInfo.GetLength());
			StartApplication(strShellCommand.c_str());
		}
		else{									/*�����Ȃ�(�P��̑I������)*/
			m_pDocuments->SelectWord();
			Refresh();
		}
	}
}

/*-------------------------------------------------------------------
CFootyView::StartApplication
�A�v���P�[�V������ShellExecuteEx�Ŏ��s���鏈��
-------------------------------------------------------------------*/
void CFootyView::StartApplication(const wchar_t *szFileName){
	SHELLEXECUTEINFO sei;
	memset(&sei,0,sizeof(SHELLEXECUTEINFO));
	sei.cbSize = sizeof(SHELLEXECUTEINFO);
	sei.nShow = SW_SHOWNORMAL;
	sei.lpVerb = L"open";
	sei.lpFile = szFileName;
	ShellExecuteEx(&sei);
}

/*-------------------------------------------------------------------
CFootyView::CalcInfoFromMouse
x,y���W����|�W�V����������o���֐��ł��B�͈͂𒴂��Ă���Ƃ���
false���Ԃ�܂����Ax���G�f�B�^���ɂ��肩��y���ŏI�s�𒴂��Ă���Ƃ���
false��Ԃ��|�W�V����������o����܂��B
-------------------------------------------------------------------*/
bool CFootyView::CalcInfoFromMouse(int x,int y,CEditPosition *pPos){
	/*�錾*/
	size_t nEthicColumn = 0;
	size_t nPosition;
	size_t nLineFromTop;
	CEthicLine cMouseLine;

	/*�K���͈͊O*/
	if (!pPos)return false;
	if (x < m_nLineCountWidth)return false;
	if (y < m_nRulerHeight)return false;

	/*�v�Z����*/
	nLineFromTop = (size_t)
		(y - m_nRulerHeight) / (m_pFonts->GetHeight() + m_nHeightMargin);
	nEthicColumn = (size_t)m_nFirstVisibleColumn + 
		(x - m_nLineCountWidth + (m_pFonts->GetWidth() + m_nWidthMargin) / 2)
		/ (m_pFonts->GetWidth() + m_nWidthMargin);

	/*��������|�W�V�����̊���o��*/
	cMouseLine = *m_pDocuments->GetFirstVisible(m_nViewID);
	if (cMouseLine.MoveEthicNext(m_pDocuments->GetLineList(),nLineFromTop)){
		nPosition = cMouseLine.GetLinePointer()->CalcRealPosition
			(cMouseLine.GetEthicNum(),nEthicColumn,
			 m_pDocuments->GetLapelColumn(),
			 m_pDocuments->GetTabLen(),
			 m_pDocuments->GetLapelMode());
		pPos->SetPosition(cMouseLine.GetLinePointer(),nPosition);
		return true;
	}
	else{		/*�ŏI�s�����Ă�*/
		LinePt pLast = m_pDocuments->GetLastLine();
		nPosition = pLast->CalcRealPosition
			(pLast->GetEthicLine() - 1,nEthicColumn,
			 m_pDocuments->GetLapelColumn(),
			 m_pDocuments->GetTabLen(),
			 m_pDocuments->GetLapelMode());
		pPos->SetPosition(pLast,nPosition);
		return false;
	}
}

/*-------------------------------------------------------------------
CFootyView::CalcLineCount
�s�ԍ��\���̈���N���b�N���ꂽ�Ɖ��肵��y���W����ʒu������o��
���[�`���ł��B
-------------------------------------------------------------------*/
bool CFootyView::CalcLineCount(int y,CEditPosition *pStart,CEditPosition *pEnd){
	/*�錾*/
	size_t nPosition;
	size_t nLineFromTop;
	CEthicLine cMouseLine;
	LinePt pLine;
	/*�K���͈͊O*/
	if (!pStart || !pEnd)return false;
	
	/*�s�ʒu�̌v�Z*/
	cMouseLine = *m_pDocuments->GetFirstVisible(m_nViewID);
	if (y < m_nRulerHeight){
		nLineFromTop = (size_t)
			(m_nRulerHeight - y) / (m_pFonts->GetHeight() + m_nHeightMargin);
		if (!cMouseLine.MoveEthicBack(nLineFromTop))
			return false;
	}
	else{
		nLineFromTop = (size_t)
			(y - m_nRulerHeight) / (m_pFonts->GetHeight() + m_nHeightMargin);
		cMouseLine.MoveEthicNext(m_pDocuments->GetLineList(),nLineFromTop);
	}
	pLine = cMouseLine.GetLinePointer();

	/*�J�n�ʒu����o��*/
	nPosition = pLine->CalcRealPosition
		(cMouseLine.GetEthicNum(),0,
			m_pDocuments->GetLapelColumn(),
			m_pDocuments->GetTabLen(),
			m_pDocuments->GetLapelMode());
	pStart->SetPosition(pLine,nPosition);
	/*�I���ʒu����o��*/
	nPosition = pLine->CalcRealPosition
		(cMouseLine.GetEthicNum() + 1,0,
			m_pDocuments->GetLapelColumn(),
			m_pDocuments->GetTabLen(),
			m_pDocuments->GetLapelMode());
	if (nPosition == pLine->GetLineLength()){
		if (cMouseLine.MoveRealNext(m_pDocuments->GetLineList(),1))
			nPosition = 0;
	}
	pEnd->SetPosition(cMouseLine.GetLinePointer(),nPosition);
	return true;
}


/*----------------------------------------------------------------
CFootyView::IsOnUrl
�|�W�V�����N���X��URL��ɂ��邩�ǂ����𔻒f���܂��BpInfo�ɂ͒l��
����܂��BpInfo�ɂ͂��̏�񂪓���܂�(NULL��)
----------------------------------------------------------------*/
CFootyView::RetOnUrl CFootyView::IsOnUrl(CEditPosition *pPos,CUrlInfo *pInfo){
	/*�錾*/
	UrlIterator pUrlIterator;
	UrlIterator pEndIterator;
	
	/*URL�̔��f*/
	pUrlIterator = pPos->GetLinePointer()->GetUrlInfo()->begin();
	pEndIterator = pPos->GetLinePointer()->GetUrlInfo()->end();
	
	for (;pUrlIterator!=pEndIterator;pUrlIterator++){
		if (pUrlIterator->IsInPosition(pPos->GetPosition())){
			if (pInfo)*pInfo = *pUrlIterator;
			return ONURL_URL;
		}
	}
	
	/*���[���̔��f*/
	pUrlIterator = pPos->GetLinePointer()->GetMailInfo()->begin();
	pEndIterator = pPos->GetLinePointer()->GetMailInfo()->end();
	
	for (;pUrlIterator!=pEndIterator;pUrlIterator++){
		if (pUrlIterator->IsInPosition(pPos->GetPosition())){
			if (pInfo)*pInfo = *pUrlIterator;
			return ONURL_MAIL;
		}
	}
	
	return ONURL_NONE;
}

