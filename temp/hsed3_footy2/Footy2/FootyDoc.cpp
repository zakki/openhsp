/**
 * @file FootyDoc.cpp
 * @brief �h�L�������g�Ǘ��N���X�̎���
 * @author ShinjiWatanabe
 * @version 1.0
 */

#include "FootyDoc.h"

/*-------------------------------------------------------------------
CFootyDoc::CFootyDoc
�R���X�g���N�^�ł��B
-------------------------------------------------------------------*/
CFootyDoc::CFootyDoc(){
	m_nTabLen = 4;
	m_nLapelMode = 0;
	m_nLapelColumns = 1024;
	m_nSelectType = SELECT_NONE;
	m_nLineMode = LM_CRLF;
	m_bEnabled = true;
	m_bInsertMode = true;
	
	/*�C�x���g�֌W*/
	m_pFuncMoveCaret = NULL;
	m_pDataMoveCaret = NULL;
	m_pFuncTextModified = NULL;
	m_pDataTextModified = NULL;
	m_pFuncInsertMode = NULL;
	m_pDataInsertModeChanged = NULL;
}

/*-------------------------------------------------------------------
CFootyDoc::~CFootyDoc
�f�X�g���N�^�ł��B
-------------------------------------------------------------------*/
CFootyDoc::~CFootyDoc(){
}

/*-------------------------------------------------------------------
CFootyDoc::CreateNew
�V�K�쐬
-------------------------------------------------------------------*/
void CFootyDoc::CreateNew(int nGlobalID){
	/*���܂ł̏���S�Ĕj������*/
	m_lsLines.clear();
	m_lsUndoBuffer.clear();
	m_lsEmphasisWord.clear();
	m_pNowUndoPos = m_lsUndoBuffer.end();
	SetSavePoint();
	/*�ŏ��̂P�s��}������*/
	CFootyLine cFirstLine;
	cFirstLine.m_strLineData = L"";
	m_lsLines.push_back(cFirstLine);
	/*�G�f�B�^��̈ʒu��ݒ肷��*/
	m_cCaretPos.SetPosition(&m_lsLines,0,0);
	SendMoveCaretCallBack();
	for (int i=0;i<4;i++)
		m_cFirstVisibleLine[i].SetPosition(m_lsLines.begin());
	/*�ϐ�������*/
	m_nSelectType = SELECT_NONE;
	m_nLineMode = LM_CRLF;
	m_nGlobalID = nGlobalID;
}

/*-------------------------------------------------------------------
CFootyDoc::SetSavePoint
�ҏW����Ă��邩�ǂ����̃Z�[�u�|�C���g�Ƃ��ēo�^���鏈��
-------------------------------------------------------------------*/
void CFootyDoc::SetSavePoint(){
	m_pSavedPos = m_pNowUndoPos;
	m_bCannotReachSavedPos = false;
}


/*-------------------------------------------------------------------
CFootyDoc::IsEdited
�ҏW����Ă��邩�擾���鏈��
-------------------------------------------------------------------*/
bool CFootyDoc::IsEdited(){
	if (m_bCannotReachSavedPos)		/*�Z�[�u�|�C���g�ɂ��ǂ蒅���Ȃ��Ƃ���*/
		return true;				/*�ҏW����Ă�����*/
	else							/*���ǂ����Ƃ���*/
		return m_pNowUndoPos != m_pSavedPos;
}

int CFootyDoc::GetRedoRem()
{
	std::list<CUndoBuffer>::iterator p = m_pNowUndoPos;
	int nRedoNum;
	for(nRedoNum = 0; p != m_lsUndoBuffer.end() ; p++, nRedoNum++);
	return nRedoNum;
}

int CFootyDoc::GetUndoRem()
{
	std::list<CUndoBuffer>::iterator p = m_pNowUndoPos;
	int nUndoNum = 0;
	if( p != m_lsUndoBuffer.end() || !m_lsUndoBuffer.empty() ) {
		for(; p != m_lsUndoBuffer.begin() ; p--, nUndoNum++);
	}
	return nUndoNum;
}

/*-------------------------------------------------------------------
CFootyDoc::SetText
�S�Ẵe�L�X�g���Z�b�g���܂�
-------------------------------------------------------------------*/
void CFootyDoc::SetText(const wchar_t *pString){
	/*�f�[�^���Z�b�g����*/
	CreateNew(m_nGlobalID);
	InsertString(pString,false,false,true);
	/*�ϐ��̏�����*/
	m_cCaretPos.SetPosition(&m_lsLines,0,0);
	SendMoveCaretCallBack();
}

/*-------------------------------------------------------------------
CFootyDoc::GetLine
�w�肳�ꂽ�s�ԍ��̍s�N���X�ւ̃C�e���[�^���擾���܂�(0�x�[�X)�B
-------------------------------------------------------------------*/
LinePt CFootyDoc::GetLine(size_t nLine){
	/*�錾*/
	size_t i;				/*�ԍ������p*/
	LinePt iterNowLine;		/*��Ɨp�̃C�e���[�^*/
	/*�G���[�`�F�b�N*/
	if (GetLineNum() <= nLine)return m_lsLines.end();
	/*�����J�n*/
	iterNowLine=m_lsLines.begin();
	for (i=0;i<nLine;i++)iterNowLine++;
	/*�l��ԋp����*/
	return iterNowLine;
}

/*-------------------------------------------------------------------
CFootyDoc::GetLastLine
�{���̍ŏI�s���擾���郋�[�`���ł��B
-------------------------------------------------------------------*/
LinePt CFootyDoc::GetLastLine(){
	LinePt pLast = m_lsLines.end();
	pLast -- ;
	return pLast;
}

/*-------------------------------------------------------------------
CFootyDoc::AddEmphasis
�����\���������ݒ肵�܂��B
-------------------------------------------------------------------*/
bool CFootyDoc::AddEmphasis(const wchar_t *pString1,const wchar_t *pString2,
	int nType,int nFlags,int nLevel,int nOnLevel,int nIndependence,COLORREF nColor){
	/*�G���[�`�F�b�N*/
	if (!pString1)return false;
	if (nLevel < 1 || sizeof(int)*8 - 1 < nLevel)return false;
	/*�ݒ肷��*/
	CEmphasisWord cEmpWord;
	cEmpWord.SetValues(pString1,pString2,
		nType,nFlags,nLevel,nOnLevel,nIndependence,nColor);
	/*�R���e�i�Ɋi�[����*/
	m_lsEmphasisWord.push_back(cEmpWord);
	return true;
}

/*-------------------------------------------------------------------
CFootyDoc::FlushEmphasis
�����\�����m�肵�܂��B
-------------------------------------------------------------------*/
void CFootyDoc::FlushEmphasis(){
	for (LinePt pLine = m_lsLines.begin();pLine != m_lsLines.end();pLine++){
		pLine->SetEmphasisChached(false);
	}
}

/*-------------------------------------------------------------------
CFootyDoc::ClearEmphasis
�����\���������o�^����Ă���̂�S�č폜����
-------------------------------------------------------------------*/
void CFootyDoc::ClearEmphasis(){
	m_lsEmphasisWord.clear();
}

/*-------------------------------------------------------------------
CFootyDoc::SetInsertMode
�}����Ԃ�ω������鏈���ł�
-------------------------------------------------------------------*/
void CFootyDoc::SetInsertMode(bool bInsertMode){
	m_bInsertMode = bInsertMode;
	if (m_pFuncInsertMode)
		m_pFuncInsertMode(m_nGlobalID,m_pDataInsertModeChanged,bInsertMode);
}

/*-------------------------------------------------------------------
CFootyDoc::SetTabLen
TAB�����̕���ݒ肵�܂�
-------------------------------------------------------------------*/
void CFootyDoc::SetTabLen(size_t nTabLen){
	if (0 < nTabLen){
		m_nTabLen = nTabLen;
	}
}


/**
 * CFootyDoc::InsertString
 * @brief ���݂̃L�����b�g�ʒu�ɕ�����}�����܂��B
 * @param pString �}�����镶����(NULL�I�[)
 * @param bRecUndo true�̂Ƃ��A���h�D���L�^����
 * @param bOverwritable INSERT�L�[�ɂ��㏑���`�F�b�N��L���ɂ���
 * @param bMemLineMode ���s�R�[�h�����̕��͂̃R�[�h�Ƃ��ĕۑ�����
 */
CFootyDoc::RedrawType CFootyDoc::InsertString
		(const wchar_t *pString,bool bRecUndo,bool bOverwritable,bool bMemLineMode){
	// �錾
	const wchar_t *pWork;			//!< ���s�ʒu�����p
	std::wstring strRestLine;		//!< �}���ʒu�ȍ~�̃f�[�^
	LinePt pLine,pBeginLine;
	size_t nNumLines = 0;
	size_t nPos;
	CUndoBuffer cUndo;

	// �G���[�`�F�b�N
	if (!pString)return REDRAW_FAILED;
	
	// �㏑���̏ꍇ��
	if (bOverwritable && !m_bInsertMode && !IsSelecting()){
		// �������v������
		size_t nStrLen = wcslen(pString);
		size_t nLineLeft = m_cCaretPos.GetLinePointer()->GetLineLength()
							- m_cCaretPos.GetPosition();
		// �I������
		SetSelectStart();
		m_cCaretPos.MoveColumnForward(&m_lsLines,min(nLineLeft,nStrLen));
		SetSelectEndNormal();
		// �����āA�ċA
		return InsertString(pString);
	}

	// �I���ʒu�����폜���ăA���h�D������
	if (bRecUndo){
		if (IsSelecting()){
			DeleteSelected(&cUndo);
			cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_REPLACE;
		}
		else cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_INSERT;
		cUndo.m_cAfterStart = m_cCaretPos;
		cUndo.m_strAfter = pString;
	}
	else DeleteSelected(NULL);
	
	// �L�����b�g�̈ʒu���擾����
	pLine = m_cCaretPos.GetLinePointer();
	pBeginLine = pLine;
	nPos = m_cCaretPos.GetPosition();

	// �����𑖍����Ă���
	for (pWork=pString;;pWork++){
		if (*pWork == L'\r'){
			if (*(pWork+1) == L'\n'){	// CRLF
				ReturnLine(&pLine,&pString,pWork,
							nPos,&strRestLine,2,nNumLines==0);
				nNumLines++;
				pWork++;
				if (bMemLineMode)m_nLineMode = LM_CRLF;
			}
			else{						// �L�����b�W���^�[���̂�
				ReturnLine(&pLine,&pString,pWork,
							nPos,&strRestLine,1,nNumLines==0);
				nNumLines++;
				if (bMemLineMode)m_nLineMode = LM_CR;
			}
		}
		else if (*pWork == L'\n'){		// ���C���t�B�[�h
			ReturnLine(&pLine,&pString,pWork,
						nPos,&strRestLine,1,nNumLines==0);
			nNumLines++;
			if (bMemLineMode)m_nLineMode = LM_LF;
		}
		else if (*pWork == L'\0'){		// �I�[����
			if (!nNumLines){			// ���܂łɉ��s�����������Ƃ�
				// ���̈ʒu�ɑS�Ă̕������}������
				pLine->m_strLineData.insert(nPos,pString);
				SetLineInfo(pBeginLine);
				// �L�����b�g�ʒu���ړ�������
				m_cCaretPos.MoveColumnForward(&m_lsLines,(size_t)(pWork-pString));
			}
			else{						// ���s���������Ƃ�
				// �o�b�N�A�b�v�������������
				pLine->m_strLineData = pString + strRestLine;
				// �ύX���m�肷��
				SetLineInfo(pBeginLine,pLine);
				// �L�����b�g�ʒu���ړ�������
				m_cCaretPos.MoveRealNext(&m_lsLines,nNumLines);
				m_cCaretPos.MoveColumnForward(&m_lsLines,(size_t)(pWork-pString));
			}
			// �A���h�D����}������
			if (bRecUndo){
				cUndo.m_cAfterEnd = m_cCaretPos;
				PushBackUndo(&cUndo);
			}
			break;
		}
	}
	SendMoveCaretCallBack();
	return REDRAW_ALL;
}

/**
 * CFootyDoc::ReturnLine
 * @brief InsertString�̃T�u���[�`���ŁA���s�������s���܂��B
 */
void CFootyDoc::ReturnLine(LinePt *pNowLine,const wchar_t **pString,const wchar_t *pWork,
						   size_t nPos,std::wstring *pRestStr,int n,bool bFirst){
	/*�錾*/
	LinePt pLine = *pNowLine;
	CFootyLine cInsertLine;
	/*�f�[�^�}��*/
	if (!bFirst)	/*�ŏ��łȂ��Ƃ��̓R�s�[����*/
		pLine->m_strLineData = std::wstring(*pString,(size_t)(pWork - *pString));
	else{			/*�ŏ��̈ʒu�̎��̓o�b�N�A�b�v*/
		if (nPos == pLine->GetLineLength())
			*pRestStr = L"";
		else{
			*pRestStr = pLine->m_strLineData.substr(nPos);
			pLine->m_strLineData.erase(nPos,pLine->GetLineLength()-nPos);
		}
		pLine->m_strLineData += std::wstring(*pString,(size_t)(pWork - *pString));
	}
	/*���̍s�𐶐�����*/
	pLine++;
	m_lsLines.insert(pLine,cInsertLine);
	/*�|�C���^����*/
	*pString = pWork + n;
	(*pNowLine)++;
}

/**
 * CFootyDoc::InsertChar
 * @brief ���C�h�������}�����܂�
 * @param wChar �}�����镶��
 * @return �`��͈�
 */
CFootyDoc::RedrawType CFootyDoc::InsertChar(wchar_t wChar){
	/*�錾*/
	LinePt pLine;
	size_t nPos;
	CUndoBuffer cUndo;
	CEditPosition cEditPosition = m_cCaretPos;
	RedrawType nRetRedraw = REDRAW_LINE;
	
	/*�I�𕶎�����폜�A�A���h�D�����i�[*/
	if (IsSelecting()){
		DeleteSelected(&cUndo);
		cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_REPLACE;
		nRetRedraw = REDRAW_ALL;
	}
	else if (m_bInsertMode || m_cCaretPos.GetPosition() == m_cCaretPos.GetLinePointer()->GetLineLength())
		cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_INSERT;
	else{
		// �㏑�������Ƃ��́A�A���h�D��������������K�v������
		cUndo.m_cBeforeStart = cEditPosition;
		cEditPosition.MoveColumnForward(&m_lsLines,1);
		cUndo.m_cBeforeEnd = cEditPosition;
		cUndo.m_strBefore += m_cCaretPos.GetLinePointer()->GetLineData()
			[m_cCaretPos.GetPosition()];
		cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_REPLACE;
	}
	cUndo.m_strAfter += wChar;
	
	/*����������*/
	pLine = m_cCaretPos.GetLinePointer();
	nPos = m_cCaretPos.GetPosition();
	if (m_bInsertMode || nPos == pLine->GetLineLength())
		pLine->m_strLineData.insert(nPos,1,wChar);
	else
		pLine->m_strLineData[nPos] = wChar;
	
	// �ϗ��s���s�ɂȂ邩�`�F�b�N
	size_t nBeforeEthic = pLine->GetEthicLine();
	if (SetLineInfo(pLine))
		nRetRedraw = REDRAW_ALL;
	if (nBeforeEthic != pLine->GetEthicLine())
		nRetRedraw = REDRAW_ALL;

	// ���𑝉�������
	cUndo.m_cAfterStart = m_cCaretPos;
	m_cCaretPos.MoveColumnForward(&m_lsLines,1);
	cUndo.m_cAfterEnd = m_cCaretPos;

	// �A���h�D����}��
	PushBackUndo(&cUndo);
	SendMoveCaretCallBack();
	return nRetRedraw;
}

/**
 * CFootyDoc::InsertReturn
 * @brief ���݂̃L�����b�g�ʒu�ŉ��s�������s���܂��B
 */
CFootyDoc::RedrawType CFootyDoc::InsertReturn(){
	// �錾
	CUndoBuffer cUndo;
	CFootyLine cNewLine;
	LinePt pLine,pInsertPos;
	size_t nPos;

	// �I���ʒu���폜���܂�
	if (IsSelecting()){
		DeleteSelected(&cUndo);
		cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_REPLACE;
	}
	else cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_INSERT;
	cUndo.m_cAfterStart = m_cCaretPos;
	cUndo.m_strAfter = L"\r\n";

	// ���s��}������
	pLine = m_cCaretPos.GetLinePointer();
	nPos = m_cCaretPos.GetPosition();

	// �s���ŉ��s���ĂȂ��Ƃ��͎��̍s�ɉ�
	if (pLine->GetLineLength() != nPos){
		cNewLine.m_strLineData = &pLine->GetLineData()[nPos];
		pLine->m_strLineData.erase(nPos);
	}

	// ���̍s�����X�g�ɒǉ�
	pInsertPos = pLine;
	pInsertPos++;
	pInsertPos = m_lsLines.insert(pInsertPos,cNewLine);
	SetLineInfo(pLine,pInsertPos);

	// �L�����b�g�ʒu���ړ�������
	m_cCaretPos.MoveRealNext(&m_lsLines,1);
	// �A���h�D�[�����i�[
	cUndo.m_cAfterEnd = m_cCaretPos;
	PushBackUndo(&cUndo);
	SendMoveCaretCallBack();
	return REDRAW_ALL;
}

/**
 * CFootyDoc::InsertReturnUp
 * @brief ���݂̃L�����b�g�ʒu�̈�s��ɋ�s��}�����܂��B
 */
CFootyDoc::RedrawType CFootyDoc::InsertReturnUp(){
	// �I����Ԃ̉���
	m_nSelectType = SELECT_NONE;
	// �󋵂ɂ���ď����𕪂���
	if (m_cCaretPos.GetLineNum() == 0){
		// ��ԏ�̍s�̎��́A���̈ʒu�̐擪�ŉ��s�������Ƃɂ���
		m_cCaretPos.SetPosition(m_cCaretPos.GetLinePointer(),0);
		InsertReturn();
		m_cCaretPos.SetPosition(m_lsLines.begin(),0);
	}
	else{
		// ����ȊO�̎��́A���̈ʒu�̈��ŉ��s�������Ƃɂ���
		LinePt pLine = m_cCaretPos.GetLinePointer();
		pLine--;
		m_cCaretPos.SetPosition(pLine,pLine->GetLineLength());
		InsertReturn();
	}
	return REDRAW_ALL;
}

/**
 * CFootyDoc::InsertReturnDown
 * @brief ���݂̃L�����b�g�ʒu�̈�s���ɋ�s��}�����܂��B
 */
CFootyDoc::RedrawType CFootyDoc::InsertReturnDown(){
	// �I����Ԃ̉���
	m_nSelectType = SELECT_NONE;
	// ����ȊO�̎��́A���̈ʒu�̈��ŉ��s�������Ƃɂ���
	m_cCaretPos.SetPosition(m_cCaretPos.GetLinePointer(),
		m_cCaretPos.GetLinePointer()->GetLineLength());
	InsertReturn();
	return REDRAW_ALL;
}

/**
 * CFootyDoc::OnBackSpace
 * @brief BackSpace�L�[�������ꂽ�Ƃ��̏������s���܂��B
 * @return �ǂ̂悤�ɍĕ`�悷��̂�
 * @note �K�؂Ȉʒu�փL�����b�g���ړ����܂��B
 */
CFootyDoc::RedrawType CFootyDoc::OnBackSpace()
{
	// �錾
	LinePt pLine = m_cCaretPos.GetLinePointer();
	size_t nPos = m_cCaretPos.GetPosition();
	CUndoBuffer cUndo;
	RedrawType nType;
	// �ꍇ����
	if (IsSelecting())
	{
		nType = DeleteSelected(&cUndo);
		PushBackUndo(&cUndo);
		return nType;
	}
	else	// �I�����Ă��Ȃ��Ƃ�
	{
		if (nPos != 0)			// �������폜
		{
			bool bIsSurrogatePair = CFootyLine::IsSurrogateTail(pLine->GetLineData()[nPos-1]);
			RedrawType nNeedRedraw = REDRAW_LINE;
			
			// �A���h�D����������
			cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_DELETE;
			if (bIsSurrogatePair)
				cUndo.m_strBefore = pLine->m_strLineData.substr(nPos-2,2);
			else	
				cUndo.m_strBefore = pLine->m_strLineData.substr(nPos-1,1);
			cUndo.m_cBeforeEnd = m_cCaretPos;
			
			// ��������폜����
			if (bIsSurrogatePair)
				pLine->m_strLineData.erase(nPos-2,2);
			else
				pLine->m_strLineData.erase(nPos-1,1);
			size_t nBeforeEthic = pLine->GetEthicLine();
			if (SetLineInfo(pLine))
				nNeedRedraw = REDRAW_ALL;
			if (nBeforeEthic != pLine->GetEthicLine())
				nNeedRedraw = REDRAW_ALL;
			
			// �|�W�V�������ړ�����
			if (bIsSurrogatePair)
				m_cCaretPos.MoveColumnBackward(&m_lsLines,2);
			else
				m_cCaretPos.MoveColumnBackward(&m_lsLines,1);
			
			// �A���h�D�����i�[����
			cUndo.m_cBeforeStart = m_cCaretPos;
			PushBackUndo(&cUndo);
			SendMoveCaretCallBack();
			return nNeedRedraw;
		}
		else					// ���s���폜
		{
			if (pLine != m_lsLines.begin())
			{
				// ���̍s�|�C���^�擾
				LinePt pPrevLine = pLine;
				pPrevLine--;

				// �A���h�D���������L�����b�g�ʒu���ړ�����
				cUndo.m_nUndoType = CUndoBuffer::UNDOTYPE_DELETE;
				cUndo.m_strBefore = L"\r\n";
				cUndo.m_cBeforeEnd = m_cCaretPos;
				m_cCaretPos.MoveColumnBackward(&m_lsLines,1);
				cUndo.m_cBeforeStart = m_cCaretPos;
				PushBackUndo(&cUndo);

				// �s�̌���
				pPrevLine->m_strLineData += pLine->GetLineData();

				// ���݂̈ʒu���폜����
				DeleteLine(pLine);

				// �����X�V����
				LinePt pNextLine = pPrevLine;
				pNextLine++;      
				SetLineInfo(pPrevLine,pNextLine);  

				SendMoveCaretCallBack();
				return REDRAW_ALL;
			}
			else return REDRAW_NONE;
		}
	}
}

/**
 * CFootyDoc::OnDelete
 * @brief Delete�L�[�������ꂽ�Ƃ��̏������s���܂��B
 * @return �ǂ̂悤�ɍĕ`�悷��̂�
 */
CFootyDoc::RedrawType CFootyDoc::OnDelete(){
	// �錾
	CUndoBuffer cUndo;
	RedrawType nType;

	// �I�����Ă��邩�ǂ����ŏꍇ����
	if (IsSelecting()){
		nType = DeleteSelected(&cUndo);
		PushBackUndo(&cUndo);
		return nType;
	}
	else{
		// �O�Ɉ�ړ����Ă���BackSpace�Ƃ����`�ɂ���
		CEditPosition cBackUp = m_cCaretPos;
		m_cCaretPos.MoveColumnForward(&m_lsLines,1);
		if (cBackUp != m_cCaretPos)	// �Ⴄ
			return OnBackSpace();
		else						// ����
			return REDRAW_NONE;
	}
}

/**
 * CFootyDoc::SetLineInfo
 * @brief �w�肵���s�ȍ~�̃I�t�Z�b�g�l�Ǝ��ۂ̍s�ԍ���ݒ肷�郋�[�`��
 * @param pBegin �ݒ肷�邽�߂̊J�n�ʒu
 * @return �S�Ă̍ĕ`���v������Ƃ�true
 * @note pBegin�͕����񂪕ύX����Ă���̂�URL�ƃ��[���A�h���X���Č����B
 *       �ȍ~�̍s�͋����\���������S�Č������܂��B
 */
bool CFootyDoc::SetLineInfo(LinePt pBegin){
	bool bAllRedraw = false;
	bool bPrevLineInfoChanged = false;
	bool bEmphasisChanged = false;

	// �ŏ��̍s�������m�肳����
	bPrevLineInfoChanged = pBegin->FlushString(m_nTabLen,m_nLapelColumns,m_nLapelMode);
	if (pBegin == m_lsLines.begin())
		bEmphasisChanged = pBegin->SearchEmphasis(NULL,&m_lsEmphasisWord);
	else
	{
		LinePt pPrevLine = pBegin;
		pPrevLine--;
		bEmphasisChanged = pBegin->SearchEmphasis(pPrevLine->GetBetweenNext(),&m_lsEmphasisWord);
	}
	bAllRedraw = bEmphasisChanged || bPrevLineInfoChanged;

	// ���[�v�����Ď��W(pBegin�̎��̍s����Ō�܂Ń��[�v)
	pBegin++;
	for (LinePt pLine = pBegin; pLine != m_lsLines.end(); pLine++)
	{
		// �O�̏������Ă���
		if (bPrevLineInfoChanged && pLine != m_lsLines.begin())
		{
			LinePt pPrevLine = pLine;
			pPrevLine--;
			bPrevLineInfoChanged = pLine->SetPrevLineInfo(pPrevLine);
			bAllRedraw = bAllRedraw || bPrevLineInfoChanged;
		}

		// �������ς�����Ƃ��͑S�ăt���O�����낵�Ă���
		if (bEmphasisChanged)
			pLine->SetEmphasisChached(false);
	}

	return bAllRedraw;
}

/**
 * CFootyDoc::SetLineInfo
 * @brief �s�̓��e���ύX���ꂽ�Ƃ��A���̏������W���Ă��������ł��B
 * @param pBegin �ύX�̈�ŏ��̍s
 * @param pEnd �ύX�̈�̍Ō�̍s
 * @return �S�Ă̍ĕ`���v������Ƃ�true
 */
bool CFootyDoc::SetLineInfo(LinePt pBegin, LinePt pEnd)
{
	LinePt pLine;
	bool bAllRedraw = false;
	bool bPrevLineInfoChanged = false;
	bool bEmphasisChanged = false;

	// �ύX���ꂽ�̈�͏�Ɍ��Ă���
	for (pLine = pBegin; ;pLine++)
	{
		// ���ꂪ���łɕ����̍Ō�̍s�̂Ƃ��͊֐����I��
		if (pLine == m_lsLines.end())return bAllRedraw;

		// ���݂̍s�𒲍�����
		bPrevLineInfoChanged = pLine->FlushString(m_nTabLen,m_nLapelColumns,m_nLapelMode);

		if (pLine == m_lsLines.begin())
			bEmphasisChanged = pLine->SearchEmphasis(NULL,&m_lsEmphasisWord);
		else
		{
			LinePt pPrevLine = pLine;
			pPrevLine--;
			bEmphasisChanged = pLine->SearchEmphasis(pPrevLine->GetBetweenNext(),&m_lsEmphasisWord);
			bPrevLineInfoChanged = pLine->SetPrevLineInfo(pPrevLine);
		}
		bAllRedraw = bAllRedraw || bEmphasisChanged || bPrevLineInfoChanged;

		// ��Ɍ���̈�𔲂��邩�ǂ����̔���
		if (pLine == pEnd)break;
	}

	// ���[�v�����čŌ�܂Ŏ���Ă���
	for (pLine++ ; pLine != m_lsLines.end(); pLine++)
	{
		// �O�̏������Ă���
		if (bPrevLineInfoChanged && pLine != m_lsLines.begin())
		{
			LinePt pPrevLine = pLine;
			pPrevLine--;
			bPrevLineInfoChanged = pLine->SetPrevLineInfo(pPrevLine);
			bAllRedraw = bAllRedraw || bPrevLineInfoChanged;
		}

		// �������ς�����Ƃ��͑S�ăt���O�����낵�Ă���
		if (bEmphasisChanged)
			pLine->SetEmphasisChached(false);
	}

	return bAllRedraw;
}

/**
 * CFootyDoc::ChacheLine
 * @brief �����\���̃L���b�V�����쐬���鏈��
 * @param pLine �L���b�V���v�Z���J�n����ʒu
 */
void CFootyDoc::SetChacheCommand(LinePt pLine){
	if (pLine == m_lsLines.begin()){
		pLine->SearchEmphasis(NULL,&m_lsEmphasisWord);
	}
	else{
		// �L���b�V������Ă���s���擾����
		LinePt pStartLine;
		for (pStartLine = pLine;pStartLine != m_lsLines.begin();pStartLine--){
			if (pStartLine->EmphasisChached())break;
		}

		// ��s���L���b�V������Ă��Ȃ��Ƃ�
		if (pStartLine == m_lsLines.begin() && !pStartLine->EmphasisChached()){
			pStartLine->SearchEmphasis(NULL,&m_lsEmphasisWord);
		}

		// �J�n�s�����_�܂ŃL���b�V������
		LinePt pPrevLine = pStartLine;
		LinePt pNowLine = pStartLine;
		for (pNowLine++;;pNowLine++,pPrevLine++){
			pNowLine->SearchEmphasis(pPrevLine->GetBetweenNext(),&m_lsEmphasisWord);
			if (pNowLine == pLine)break;
		}
	}
}

/**
 * CFootyDoc::DeleteLine
 * @brief ��s�����폜���鏈���ł��B 
 * @param pLine �폜����s
 */
void CFootyDoc::DeleteLine(LinePt pLine)
{
	for (int i=0;i<4;i++)
	{
		if (m_cFirstVisibleLine[i].GetLineNum() == pLine->GetRealLineNum()){
			m_cFirstVisibleLine[i].MoveRealBack(1);
		}
	}
	m_lsLines.erase(pLine);
}

/**
 * CFootyDoc::DeleteLine
 * @brief �w�肳�ꂽ�Ԃ̍s����C�ɍ폜���鏈��
 * @param pStart �J�n�s(������폜�����)
 * @param pEnd �I���s(����͍폜����Ȃ�)
 */
void CFootyDoc::DeleteLine(LinePt pStart,LinePt pEnd)
{
	// �폜����f�[�^�̍s�ԍ����擾����
	size_t nRealStart = pStart->GetRealLineNum();
	LinePt pDelEnd = pEnd;
	pDelEnd--;
	size_t nRealEnd = pDelEnd->GetRealLineNum();

	// �ŏ��ɕ\������Ă���s�Ɣ���Ă����璲�����Ă��
	for (int i=0;i<4;i++)
	{
		if (nRealStart <= m_cFirstVisibleLine[i].GetLineNum() &&
			m_cFirstVisibleLine[i].GetLineNum() <= nRealEnd)
		{
			m_cFirstVisibleLine[i].SetPosition(pStart);
			m_cFirstVisibleLine[i].MoveRealBack(1);
		}
	}

	// ���ۂɍ폜���鏈��
	m_lsLines.erase(pStart,pEnd);
}


/**
 * CFootyDoc::MoveWordForward
 * @brief �L�����b�g�ʒu��P�ꂷ����΂��đO��
 */
void CFootyDoc::MoveWordForward(){
	LinePt pLine = m_cCaretPos.GetLinePointer();
	size_t nPos = m_cCaretPos.GetPosition();
	
	if (m_cCaretPos.GetPosition() != pLine->GetLineLength()){
		CFootyLine::WordInfo wiWord = pLine->GetWordInfo(nPos,false);
		m_cCaretPos.MoveColumnForward(&m_lsLines,wiWord.m_nEndPos - nPos);
	}
	else m_cCaretPos.MoveColumnForward(&m_lsLines,1);
	SendMoveCaretCallBack();
}

/**
 * CFootyDoc::MoveWordBack
 * @brief �L�����b�g�ʒu��P�ꂷ����΂��Č��
 */
void CFootyDoc::MoveWordBack(){
	LinePt pLine = m_cCaretPos.GetLinePointer();
	size_t nPos = m_cCaretPos.GetPosition();
	
	if (m_cCaretPos.GetPosition() != 0){
		CFootyLine::WordInfo wiWord = pLine->GetWordInfo(nPos);
		m_cCaretPos.MoveColumnBackward(&m_lsLines,nPos - wiWord.m_nBeginPos);
	}
	else m_cCaretPos.MoveColumnBackward(&m_lsLines,1);
	SendMoveCaretCallBack();
}


/**
 * CFootyDoc::SetLapel
 * @brief �܂�Ԃ��ݒ�
 * @param nColumn ����
 * @param nMode �܂�Ԃ����[�h
 */
void CFootyDoc::SetLapel(size_t nColumn,int nMode){
	/*��Ԃ�ݒ肷��*/
	m_nLapelColumns = nColumn;
	m_nLapelMode = nMode;

	/*���[�v�����Ď��W*/
	LinePt pLine = m_lsLines.begin();
	LinePt pPrevLine = m_lsLines.begin();
	pLine->FlushString(m_nTabLen,m_nLapelColumns,m_nLapelMode);
	
	for (pLine++;pLine != m_lsLines.end();pLine++,pPrevLine++){
		pLine->FlushString(m_nTabLen,m_nLapelColumns,m_nLapelMode);
		pLine->SetPrevLineInfo(pPrevLine);
	}	
}


/*[EOF]*/
