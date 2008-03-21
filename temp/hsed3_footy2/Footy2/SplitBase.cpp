/*===================================================================
CSplitBase
�X�v���b�g�o�[�̃x�[�X�N���X�ł��B
===================================================================*/

#include "SplitBase.h"

/*-------------------------------------------------------------------
CSplitBase::CSplitBase
�R���X�g���N�^
-------------------------------------------------------------------*/
CSplitBase::CSplitBase(){
	m_hWnd = NULL;
	m_nMode = SPLIT_DUAL;
	m_pViews = NULL;
	m_bDrag = false;
	m_bVisible = false;
}


/*-------------------------------------------------------------------
CSplitBase::CSplitBase
�f�X�g���N�^
-------------------------------------------------------------------*/
CSplitBase::~CSplitBase(){
	if (m_hWnd){
		RemoveProp(m_hWnd,SPLIT_PROPNAME);
		DestroyWindow(m_hWnd);
		m_hWnd = NULL;
	}
}

/*-------------------------------------------------------------------
CSplitBase::Create
�\�z����
-------------------------------------------------------------------*/
bool CSplitBase::Create(HWND hWnd,HINSTANCE hInstance){
	if (!hWnd || !hInstance)return false;
	
	/*�N���X��o�^����*/
	WNDCLASS wc;												/*�E�B���h�E�N���X*/
	wc.style			= 
#ifdef UNDER_CE
		0;
#else	/*UNDER_CE*/
		CS_BYTEALIGNCLIENT | CS_BYTEALIGNWINDOW;
#endif	/*UNDER_CE*/
	wc.lpfnWndProc		= SplitWinProc;
	wc.hInstance		= hInstance;
	wc.hIcon			= NULL;
	wc.hCursor			= NULL;									/*��Ԃɂ���ēK�X�ύX����*/
	wc.hbrBackground	= (HBRUSH)GetSysColorBrush(COLOR_BTNFACE);
	wc.lpszMenuName		= NULL;
	wc.lpszClassName	= SPLIT_WNDCLASSNAME;
	wc.cbClsExtra		= 0;									/*�g�p���Ȃ��B0���w��*/
	wc.cbWndExtra		= 0;									/*�g�p���Ȃ��B0���w��*/
	RegisterClass(&wc);											/*�E�B���h�E�N���X�̓o�^*/

	/*�E�B���h�E�̍쐬*/
	m_hWnd = CreateWindowEx(0,SPLIT_WNDCLASSNAME,SPLIT_WNDCLASSNAME,
							WS_CHILD,0,0,0,0,hWnd,NULL,hInstance,NULL);
	if (!m_hWnd)return false;
	
	/*�v���p�e�B�̐ݒ�*/
	SetProp(m_hWnd,SPLIT_PROPNAME,(HANDLE)this);
	return true;
}

/*-------------------------------------------------------------------
CSplitBase::SplitWinProc
�E�B���h�E�v���V�[�W���ł��B
-------------------------------------------------------------------*/
LRESULT CALLBACK CSplitBase::SplitWinProc(HWND hWnd,UINT msg,WPARAM wParam,LPARAM lParam){
	CSplitBase *pSplitClass=NULL;	/*���̃N���X�ւ̃|�C���^*/
	pSplitClass=(CSplitBase*)GetProp(hWnd,SPLIT_PROPNAME);
	if (pSplitClass)
		return pSplitClass->MainProc(msg,wParam,lParam);
	else
		return DefWindowProc(hWnd,msg,wParam,lParam);
}


/*-------------------------------------------------------------------
CSplitBase::MainProc
�E�B���h�E�v���V�[�W���ł��B
-------------------------------------------------------------------*/
LRESULT CSplitBase::MainProc(UINT msg,WPARAM wParam,LPARAM lParam){
	switch(msg){
	case WM_LBUTTONDOWN:
		OnMouseDown((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	case WM_MOUSEMOVE:
		OnMouseMove((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	case WM_LBUTTONUP:
		OnMouseUp((int)(short)LOWORD(lParam),(int)(short)HIWORD(lParam));
		break;
	default:
		return DefWindowProc(m_hWnd,msg,wParam,lParam);
	}
	return false;
}

/*-------------------------------------------------------------------
CSplitBase::OnMouseDown
�}�E�X���������ꂽ�Ƃ��̏���
-------------------------------------------------------------------*/
void CSplitBase::OnMouseDown(int x,int y){
	SetCapture(m_hWnd);
	m_bDrag = true;
}

/*-------------------------------------------------------------------
CSplitBase::OnMouseUp
�}�E�X���������ꂽ�Ƃ��̏���
-------------------------------------------------------------------*/
void CSplitBase::OnMouseUp(int x,int y){
	ReleaseCapture();
	m_bDrag = false;
}

/*-------------------------------------------------------------------
CSplitBase::SetVisible
�\���^��\����Ԃ�ؑւ��܂��B
-------------------------------------------------------------------*/
void CSplitBase::SetVisible(bool bVisible){
	ShowWindow(m_hWnd,bVisible ? SW_SHOWNORMAL : SW_HIDE);
}

/*-------------------------------------------------------------------
CSplitBase::OnBaseWindowMove
�x�[�X�E�B���h�E���������Ƃ�
-------------------------------------------------------------------*/
void CSplitBase::OnBaseWindowMove(int x,int y,int nWidth,int nHeight){
	m_nBaseX = x;
	m_nBaseY = y;
	m_nBaseWidth = nWidth;
	m_nBaseHeight = nHeight;
}

/*[EOF]*/
