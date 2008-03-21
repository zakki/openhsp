/*===================================================================
CFootyViewクラス
Footyのビュー管理を行います。
===================================================================*/

#include "FootyView.h"
#include "resource.h"

#define FOOTY_WNDCLASSNAME	L"Footy2View"
#define FOOTY_PROPNAME		L"Footy2Class"

#ifndef UNDER_CE
	unsigned int CFootyView::m_uWheelMsg = GetWheelMsg();
#endif	/*not defined UNDER_CE*/

HBITMAP CFootyView::m_bmpIcons[sizeof(int) * 8];

/*-------------------------------------------------------------------
CFootyView::CFootyView
コンストラクタです。
-------------------------------------------------------------------*/
CFootyView::CFootyView(){
	/*変数の初期化*/
	m_hWnd = NULL;
	m_hOwner = NULL;
	m_nIgnoreKey = 0;
	m_x = m_y = 0;
	m_nWidth = m_nHeight = 0;
	m_nRop2 = R2_XORPEN;
	m_bIsFocused = false;
	m_bVisible = false;
	m_pFonts = NULL;
	m_pDocuments = NULL;
	m_nWidthMargin = 0;
	m_nHeightMargin = 0;
	m_nVisibleLines = 0;
	m_nVisibleColumns = 0;
	m_nDragMode = DRAGMODE_NONE;
	m_nAutoScrollNum = 0;
	m_bIsAutoScrolling = false;
	m_nFootyID = -1;
	m_nViewID = -1;
	m_pFuncFocus = NULL;
	m_pDataFocus = NULL;
	m_bShiftLocked = false;
	m_nMarkVisible = EDM_SHOW_ALL;
	/*デフォルト数値を代入*/
	m_nLineCountWidth = LINEWIDTH_DEFAULT;
	m_nRulerHeight = 10;
	m_nLineCountMargin = 2;
	m_nCaretWidth = 2;
}

/*-------------------------------------------------------------------
CFootyView::~CFootyView
デストラクタです。
-------------------------------------------------------------------*/
CFootyView::~CFootyView(){
	/*ウィンドウを削除する*/
	RemoveProp(m_hWnd,FOOTY_PROPNAME);
	DestroyWindow(m_hWnd);
}

/*-------------------------------------------------------------------
CFootyView::Create
FootyViewを構築します。bVisibleがtrueのときにのみ表示します。
-------------------------------------------------------------------*/
bool CFootyView::Create(HWND hWnd,HINSTANCE hInstance,CFontObjects *pFonts,
	CFootyView *pView,CFootyDoc *pDocuments,CFootyStatus *pStatus,int nFootyID,int nViewID){
	
	if (!hWnd || !pFonts || !pDocuments || !pStatus || !pView)
		return false;
	
	/*メンバ変数を設定*/
	m_pDocuments = pDocuments;
	m_pView = pView;
	m_pFonts = pFonts;
	m_pStatus = pStatus;
	m_nViewID = nViewID;
	m_nFootyID = nFootyID;
	m_hOwner = hWnd;
	
	/*Footyメインウィンドウの形成*/
	WNDCLASSW wc;												/*ウィンドウクラス*/
	wc.style			= CS_DBLCLKS
#ifndef UNDER_CE
		 | CS_BYTEALIGNCLIENT | CS_BYTEALIGNWINDOW
#endif	/*not defined UNDER_CE*/
		 ;
	wc.lpfnWndProc		= FootyWinProc;
	wc.hInstance		= hInstance;
	wc.hIcon			= NULL;
	wc.hCursor			= NULL;									/*状態によって適宜変更する*/
	wc.hbrBackground	= (HBRUSH)NULL;
	wc.lpszMenuName		= NULL;
	wc.lpszClassName	= FOOTY_WNDCLASSNAME;
	wc.cbClsExtra		= 0;									/*使用しない。0を指定*/
	wc.cbWndExtra		= 0;									/*使用しない。0を指定*/
	RegisterClass(&wc);											/*ウィンドウクラスの登録*/

	m_hWnd=CreateWindowEx(WS_EX_CLIENTEDGE,FOOTY_WNDCLASSNAME,FOOTY_WNDCLASSNAME,
						 WS_CHILD | WS_VSCROLL | WS_HSCROLL,
						 0,0,0,0,hWnd,NULL,hInstance,NULL);
	if (!m_hWnd)return false;									/*ウィンドウが作成できなかった*/
	SetProp(m_hWnd,FOOTY_PROPNAME,(HANDLE)this);				/*クラスを登録*/
	
	/*メンバ変数の初期化*/
	m_nFirstVisibleColumn = 0;
	m_pDocuments->GetFirstVisible(m_nViewID)->SetPosition(pDocuments->GetLineList(),0,0);
	m_cCaret.SetParam(m_hWnd);
	return true;
}

/*-------------------------------------------------------------------
CFootyView::LoadLineIcons
行アイコンの読み込み処理
-------------------------------------------------------------------*/
void CFootyView::LoadLineIcons(HINSTANCE hInstance){
	m_bmpIcons[ 0] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_ATTACH));
	m_bmpIcons[ 1] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_BACK));
	m_bmpIcons[ 2] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_CHECKED));
	m_bmpIcons[ 3] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_UNCHECKED));
	m_bmpIcons[ 4] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_CANCEL));
	m_bmpIcons[ 5] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_CLOCK));
	m_bmpIcons[ 6] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_CONTENTS));
	m_bmpIcons[ 7] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_CANCEL));
	m_bmpIcons[ 8] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_DELETE));
	m_bmpIcons[ 9] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_FIRST));
	m_bmpIcons[10] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_EDIT));
	m_bmpIcons[11] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_INSERT));
	m_bmpIcons[12] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_LAST));
	m_bmpIcons[13] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_NEXT));
	m_bmpIcons[14] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_POST));
	m_bmpIcons[15] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_PREVIOUS));
	m_bmpIcons[16] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DB_REFRESH));
	m_bmpIcons[17] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_DELETE));
	m_bmpIcons[18] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_EXECUTE));
	m_bmpIcons[19] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_FAVORITE));
	m_bmpIcons[20] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_BLUE));
	m_bmpIcons[21] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_GREEN));
	m_bmpIcons[22] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_RED));
	m_bmpIcons[23] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_FORWARD));
	m_bmpIcons[24] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_HELP));
	m_bmpIcons[25] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_INFORMATION));
	m_bmpIcons[26] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_KEY));
	m_bmpIcons[27] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_LOCK));
	m_bmpIcons[28] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_RECORD));
	m_bmpIcons[29] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_TICK));
	m_bmpIcons[30] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_TIPS));
	m_bmpIcons[31] = LoadBitmap(hInstance,MAKEINTRESOURCE(IDB_LI_WARNING));
}

/*-------------------------------------------------------------------
CFootyView::ReleaseLineIcons
行アイコンの解放処理
-------------------------------------------------------------------*/
void CFootyView::ReleaseLineIcons(){
	for (int i=0;i<sizeof(int)*8;i++){
		if (m_bmpIcons[i]){
			DeleteObject(m_bmpIcons[i]);
			m_bmpIcons[i] = NULL;
		}
	}
}


/*-------------------------------------------------------------------
CFootyView::AdjustVisiblePos
見える位置をキャレット位置から調整する処理
<戻り値>位置が変更されたときtrue
-------------------------------------------------------------------*/
bool CFootyView::AdjustVisiblePos(){
	/*宣言*/
	CFootyLine::EthicInfo stEthicInfo;
	const LinePt pLine = m_pDocuments->GetCaretPosition()->GetLinePointer();
	const size_t nPosition = m_pDocuments->GetCaretPosition()->GetPosition();
	/*倫理桁情報を取得する*/
	stEthicInfo = pLine->CalcEthicLine
		(nPosition,m_pDocuments->GetLapelColumn(),
		m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
	/*移動する必要がある*/
	if ((size_t)m_nFirstVisibleColumn + m_nVisibleColumns < stEthicInfo.m_nEthicColumn ||
		stEthicInfo.m_nEthicColumn < (size_t)m_nFirstVisibleColumn){
		if (stEthicInfo.m_nEthicColumn > m_nVisibleColumns / 2) 
			m_nFirstVisibleColumn = (int)(stEthicInfo.m_nEthicColumn - m_nVisibleColumns / 2);
		else
			m_nFirstVisibleColumn = 0;
		return true;
	}
	return false;
}

/**
 * CFootyView::AdjustVisibleLine
 * @brief 見える位置をキャレット位置から調整する処理
 * @return 位置が変更されたときtrue
 */
bool CFootyView::AdjustVisibleLine(){
	const LinePt pLine = m_pDocuments->GetCaretPosition()->GetLinePointer();
	CEthicLine *pFirstVisible = m_pDocuments->GetFirstVisible(m_nViewID);
	
	// 倫理行オフセット位置を取得する
	size_t nFirstOffset =
		pFirstVisible->GetLinePointer()->GetOffset() + 
		pFirstVisible->GetEthicNum();
	CFootyLine::EthicInfo stEthicInfo = m_pDocuments->GetCaretPosition()->GetLinePointer()->CalcEthicLine
		(m_pDocuments->GetCaretPosition()->GetPosition(),m_pDocuments->GetLapelColumn(),
		m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
	size_t nEthicOffset = pLine->GetOffset() + stEthicInfo.m_nEthicLine;
	
	//現在の位置の中に入っていないとき、調整
	if (nEthicOffset < nFirstOffset){						// 現在位置より前に存在する
		pFirstVisible->MoveEthicBack
			(nFirstOffset - nEthicOffset + m_nVisibleLines / 2);
		return true;
	}
	if (nFirstOffset + m_nVisibleLines <= nEthicOffset){	// 現在位置より後ろに存在する
		pFirstVisible->MoveEthicNext(m_pDocuments->GetLineList(),
			nEthicOffset - nFirstOffset - m_nVisibleLines / 2);
		return true;
	}
	return false;
}


/**
 * CFootyView::CaretMove
 * @brief キャレットの位置とIMEポジションの位置を設定する
 */
void CFootyView::CaretMove(){
	/*宣言*/
	const LinePt pLine = m_pDocuments->GetCaretPosition()->GetLinePointer();
	const size_t nPosition = m_pDocuments->GetCaretPosition()->GetPosition();
	CEthicLine cFirstVisible = *m_pDocuments->GetFirstVisible(m_nViewID);
	CFootyLine::EthicInfo stEthicInfo;
	int nCaretX,nCaretY;
	
	/*キャレット位置を計算する*/
	int nOffset = (int)pLine->GetOffset();
	stEthicInfo = pLine->CalcEthicLine
		(nPosition,m_pDocuments->GetLapelColumn(),
		m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
	nCaretX = GetTextPosX((int)stEthicInfo.m_nEthicColumn);
	nCaretY = m_nRulerHeight +
		(int)(nOffset - cFirstVisible.GetLinePointer()->GetOffset() -
		cFirstVisible.GetEthicNum() + stEthicInfo.m_nEthicLine) *
		(m_pFonts->GetHeight() + m_nHeightMargin);

	/*キャレットの太さを決定する*/
	if (!m_pDocuments->IsInsertMode()){
		if (nPosition == pLine->GetLineLength())
			m_nCaretWidth = 2;
		else{
			stEthicInfo = pLine->CalcEthicLine
				(nPosition + 1,m_pDocuments->GetLapelColumn(),
				m_pDocuments->GetTabLen(),m_pDocuments->GetLapelMode());
			m_nCaretWidth = GetTextPosX((int)stEthicInfo.m_nEthicColumn) - nCaretX;
		}
	}
	else m_nCaretWidth = 2;

	/*キャレットを再構築*/
	if (m_bIsFocused){
		m_cCaret.ReCreate(m_nCaretWidth,m_pFonts->GetHeight());
		m_cCaret.Move(nCaretX,nCaretY);
	}

	int nHeightScroll = GetSystemMetrics(SM_CYHSCROLL);
	int nWidthScroll = GetSystemMetrics(SM_CXVSCROLL);
	if (nCaretX < m_nLineCountWidth || m_nWidth - nWidthScroll < nCaretX ||
		nCaretY < m_nRulerHeight || m_nHeight -  nHeightScroll < nCaretY){
		nCaretX = 0;
		nCaretY = 0;
		m_cCaret.Hide();
	}
	else{
		if (m_bIsFocused)m_cCaret.Show();
	}

	/*IMEを設定する*/
	if (m_bIsFocused){
		LOGFONT lFont;
		COMPOSITIONFORM cf;
		HIMC hImc=ImmGetContext(m_hWnd);
		if (hImc){
			/*フォントを設定する*/
			GetObject(m_pFonts->GetKanjiFont(),sizeof(LOGFONT),&lFont);
			ImmSetCompositionFont(hImc,&lFont);
			/*IME表示領域を設定する*/
			cf.dwStyle = CFS_POINT;
			cf.ptCurrentPos.x = (long)nCaretX;
			cf.ptCurrentPos.y = (long)nCaretY;
			cf.rcArea.left = cf.ptCurrentPos.x;
			cf.rcArea.top = cf.ptCurrentPos.y;
			cf.rcArea.right = m_nWidth;
			cf.rcArea.bottom = m_nHeight;
			ImmSetCompositionWindow(hImc, &cf);
			/*ハンドルの解放*/
			ImmReleaseContext(m_hWnd,hImc);
		}
	}
}

#ifndef UNDER_CE
/*-------------------------------------------------------------------
CFootyView::GetWheelMsg
ホイールメッセージを返します。
-------------------------------------------------------------------*/
unsigned int CFootyView::GetWheelMsg(){
	if (((GetVersion() & 0x80000000) &&
		LOBYTE(LOWORD(GetVersion()) == 4)) ||
		(!(GetVersion() & 0x80000000) && LOBYTE(LOWORD(GetVersion()) == 3)))
		return RegisterWindowMessage(MSH_MOUSEWHEEL);
	else
		return 0;
}
#endif	/*not defined UNDER_CE*/

/*-------------------------------------------------------------------
CFootyView::FootyWinProc
ウィンドウプロシージャです。
-------------------------------------------------------------------*/
LRESULT CALLBACK CFootyView::FootyWinProc(HWND hWnd,UINT msg,WPARAM wParam,LPARAM lParam){
	CFootyView *pFootyView=NULL;	/*そのクラスへのポインタ*/
	pFootyView=(CFootyView*)GetProp(hWnd,FOOTY_PROPNAME);
	if (pFootyView)
		return pFootyView->MainProc(msg,wParam,lParam);
	else
		return DefWindowProc(hWnd,msg,wParam,lParam);
}

/*[EOF]*/
