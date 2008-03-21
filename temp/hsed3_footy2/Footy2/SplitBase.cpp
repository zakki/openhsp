/*===================================================================
CSplitBase
スプリットバーのベースクラスです。
===================================================================*/

#include "SplitBase.h"

/*-------------------------------------------------------------------
CSplitBase::CSplitBase
コンストラクタ
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
デストラクタ
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
構築する
-------------------------------------------------------------------*/
bool CSplitBase::Create(HWND hWnd,HINSTANCE hInstance){
	if (!hWnd || !hInstance)return false;
	
	/*クラスを登録する*/
	WNDCLASS wc;												/*ウィンドウクラス*/
	wc.style			= 
#ifdef UNDER_CE
		0;
#else	/*UNDER_CE*/
		CS_BYTEALIGNCLIENT | CS_BYTEALIGNWINDOW;
#endif	/*UNDER_CE*/
	wc.lpfnWndProc		= SplitWinProc;
	wc.hInstance		= hInstance;
	wc.hIcon			= NULL;
	wc.hCursor			= NULL;									/*状態によって適宜変更する*/
	wc.hbrBackground	= (HBRUSH)GetSysColorBrush(COLOR_BTNFACE);
	wc.lpszMenuName		= NULL;
	wc.lpszClassName	= SPLIT_WNDCLASSNAME;
	wc.cbClsExtra		= 0;									/*使用しない。0を指定*/
	wc.cbWndExtra		= 0;									/*使用しない。0を指定*/
	RegisterClass(&wc);											/*ウィンドウクラスの登録*/

	/*ウィンドウの作成*/
	m_hWnd = CreateWindowEx(0,SPLIT_WNDCLASSNAME,SPLIT_WNDCLASSNAME,
							WS_CHILD,0,0,0,0,hWnd,NULL,hInstance,NULL);
	if (!m_hWnd)return false;
	
	/*プロパティの設定*/
	SetProp(m_hWnd,SPLIT_PROPNAME,(HANDLE)this);
	return true;
}

/*-------------------------------------------------------------------
CSplitBase::SplitWinProc
ウィンドウプロシージャです。
-------------------------------------------------------------------*/
LRESULT CALLBACK CSplitBase::SplitWinProc(HWND hWnd,UINT msg,WPARAM wParam,LPARAM lParam){
	CSplitBase *pSplitClass=NULL;	/*そのクラスへのポインタ*/
	pSplitClass=(CSplitBase*)GetProp(hWnd,SPLIT_PROPNAME);
	if (pSplitClass)
		return pSplitClass->MainProc(msg,wParam,lParam);
	else
		return DefWindowProc(hWnd,msg,wParam,lParam);
}


/*-------------------------------------------------------------------
CSplitBase::MainProc
ウィンドウプロシージャです。
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
マウスが動かされたときの処理
-------------------------------------------------------------------*/
void CSplitBase::OnMouseDown(int x,int y){
	SetCapture(m_hWnd);
	m_bDrag = true;
}

/*-------------------------------------------------------------------
CSplitBase::OnMouseUp
マウスが動かされたときの処理
-------------------------------------------------------------------*/
void CSplitBase::OnMouseUp(int x,int y){
	ReleaseCapture();
	m_bDrag = false;
}

/*-------------------------------------------------------------------
CSplitBase::SetVisible
表示／非表示状態を切替えます。
-------------------------------------------------------------------*/
void CSplitBase::SetVisible(bool bVisible){
	ShowWindow(m_hWnd,bVisible ? SW_SHOWNORMAL : SW_HIDE);
}

/*-------------------------------------------------------------------
CSplitBase::OnBaseWindowMove
ベースウィンドウが動いたとき
-------------------------------------------------------------------*/
void CSplitBase::OnBaseWindowMove(int x,int y,int nWidth,int nHeight){
	m_nBaseX = x;
	m_nBaseY = y;
	m_nBaseWidth = nWidth;
	m_nBaseHeight = nHeight;
}

/*[EOF]*/
