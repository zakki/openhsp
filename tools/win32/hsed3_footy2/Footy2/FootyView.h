/**
 * @file FootyView.h
 * @brief Footy�̃r���[�Ǘ����s��CFootyView�N���X�̐錾
 * @author Shinji Watanabe
 * @version 1.0
 */

#pragma once

#include <windows.h>
#include "FontObjects.h"
#include "FootyStatus.h"
#include "DoubleBuffering.h"
#include "FootyDoc.h"
#include "Caret.h"
#if !defined(WM_MOUSEWHEEL) || !defined(MSH_MOUSEWHEEL)
#	include "zmouse.h"						/*�}�E�X�z�C�[�����b�Z�[�W*/
#endif	/*WM_MOUSEWHEEL*/

#define LINEWIDTH_DEFAULT	50
#define RULERHEIGHT_DEFAULT	10

class CFootyView{
//public�����o�֐�//////////////////////////////////////////////////////////
public:
	CFootyView();
	~CFootyView();

	/*�r���[�̐���*/
	bool Create(HWND hWnd,HINSTANCE hInstance,
				CFontObjects *pFonts,CFootyView *pView,
				CFootyDoc *pDocument,CFootyStatus *pStatus,
				int nFootyID,int nViewID);

	/*�r�b�g�}�b�v�̓ǂݍ���*/
	static void LoadLineIcons(HINSTANCE hInstance);
	static void ReleaseLineIcons();
	
	/*�擾*/
	inline HWND GetWnd(){return m_hWnd;}
	inline bool IsFocused(){return m_bIsFocused;}
	inline int GetRulerHeight(){return m_nRulerHeight;}
	inline int GetLineCountWidth(){return m_nLineCountWidth;}
	inline size_t GetVisibleLines(){return m_nVisibleLines;}
	inline size_t GetVisibleColumns(){return m_nVisibleColumns;}
	inline void SetShiftLock(bool bLocked){m_bShiftLocked = bLocked;}
	inline bool IsShiftLocked(){return m_bShiftLocked;}
	inline int GetMarkVisible(){return m_nMarkVisible;}
	inline int GetUnderlineVisible(){return m_bUnderlineVisible ? 1 : 0;}

	/*GUI�֌W�̏���*/
	void SetVisible(bool bVisible);
	inline bool SetVisibleCols(){
		return MoveWin(m_x,m_y,m_nWidth,m_nHeight,false);
	}
	void SetLineWidth(int nWidth);
	void SetRulerHeight(int nHeight);
	bool MoveWin(int x,int y,int nWidth,int nHeight,bool bRefresh = true);
	bool Refresh(bool bSendOther = true);
	void SetFocus(){::SetFocus(m_hWnd);}
	bool Refresh(HDC hDC,const RECT *rc);
	void CaretMove();
	void SetMarkVisible(int nMark){m_nMarkVisible = nMark;}
	void SetUnderlineVisible(int nUnderline){m_bUnderlineVisible = nUnderline ? true : false;}

	/*�L�����b�g�ʒu����\���ʒu�𒲐����鏈��*/
	inline void SetFirstColumn(int nFirstColumn){m_nFirstVisibleColumn = nFirstColumn;}
	bool AdjustVisiblePos();
	bool AdjustVisibleLine();

//private�����o�֐�/////////////////////////////////////////////////////////
private:
	//! �I��̈�`��̂��߂̏��������
	struct SelOldInfo{
		HPEN m_hPen,m_hPenOld;			//!< �y��
		HBRUSH m_hBrush,m_hBrushOld;	//!< �u���V
		int m_nRopOld;					//!< ROP���[�h
	};

	static LRESULT CALLBACK FootyWinProc(HWND hWnd,UINT msg,WPARAM wParam,LPARAM lParam);
	LRESULT MainProc(UINT msg,WPARAM wParam,LPARAM lParam);
#ifndef UNDER_CE
	static unsigned int GetWheelMsg();
#endif	/*not defined UNDER_CE*/
	
	/*�O���t�@�C�����J��*/
	void StartApplication(const wchar_t *szFileName);
	
	/*�o�[�̏�Ԃ�ݒ肷��*/
	void SetBars();

	/*�L�[�{�[�h�֘A�̃��b�Z�[�W*/
	void OnImeComposition(LPARAM lParam);
	LRESULT OnImeRequest(WPARAM wParam,LPARAM lParam);
	void OnChar(wchar_t wc);
	bool OnKeyDown(int nKeyCode);
	
	/*�t�H�[�J�X�֘A�̃��b�Z�[�W*/
	void OnGotFocus();
	void OnLostFocus();
	
	/*�}�E�X�֘A�̃��b�Z�[�W*/
	void OnMouseDown(int x, int y);
	void OnMouseMove(int x, int y, bool bFromScrollTimer = false);
	void OnMouseUp(int x, int y);
	void OnMouseWheel(bool bIsForward);
	void OnMouseDouble(int x,int y);

	/*�X�N���[���֌W�̏���*/
	void OnScrollTimer();
	void StopScrollTimer();
	void StartScrollTimer(bool bIsVertical,int nScrollNum);
	void OnVScroll(WPARAM wParam);
	void OnHScroll(WPARAM wParam);
	
	/*�v�Z�n�̃��[�`��*/
	bool CalcInfoFromMouse(int x,int y,CEditPosition *pPos);
	bool CalcLineCount(int y,CEditPosition *pStart,CEditPosition *pEnd);
	enum RetOnUrl{
		ONURL_NONE,				/*���ɂ��Ȃ�*/
		ONURL_URL,				/*URL��*/
		ONURL_MAIL,				/*���[����*/
	};
	RetOnUrl IsOnUrl(CEditPosition *pPos,CUrlInfo *pInfo);
	
	// �����_�����O�֘A�̏���
	bool CaretRefresh();
	bool ScrollRefresh();
	bool LineChangedRefresh(LinePt pLine1, LinePt pLine2);
	inline bool LineChangedRefresh(){
		return LineChangedRefresh(
			m_pDocuments->GetCaretPosition()->GetLinePointer(),
			m_pDocuments->GetCaretPosition()->GetLinePointer()
		);
	}

	// �����_�����O�p�������[�`��
	bool RenderLines(LinePt pStartLine,LinePt pEndLine);
	inline int GetTextPosX(int nColumn){return m_nLineCountWidth + 
		(nColumn - m_nFirstVisibleColumn) * (m_pFonts->GetWidth() + m_nWidthMargin);}
	static void DrawRectangle(HDC hDC,int x1,int y1,int x2,int y2,COLORREF color);
	static void DrawLine(HDC hDC,int x1,int y1,int x2,int y2,COLORREF color,int penType = PS_SOLID);
	bool RendLine(HDC hDC,LinePt pLine,int y,bool bEnd);
	bool InitDcForSelect(HDC hDC,SelOldInfo *pSelInfo);
	bool ReleaseDcForSelect(HDC hDC,SelOldInfo *pSelInfo);
	bool RendSelected(HDC hDC,CEthicLine *pLine,int y);
	bool RendLineCount(HDC hDC,const RECT *rc);
	bool RendBorderLine(HDC hDC,const RECT *rc);
	bool RendRuler(HDC hDC,const RECT *rc);
	bool RendUnderLine(HDC hDC,const RECT *rc);

//public�����o�ϐ�//////////////////////////////////////////////////////////
public:
	/*�}�[�W��*/
	int m_nWidthMargin;							//!< �����̕��̃}�[�W��
	int m_nHeightMargin;						//!< �����̍����}�[�W��
	
	/*�֐��|�C���^*/
	Footy2FuncFocus m_pFuncFocus;				//!< �t�H�[�J�X�擾�C�x���g
	void *m_pDataFocus;							//!< ����̃f�[�^

//private�����o�ϐ�/////////////////////////////////////////////////////////
private:
	enum enDragMode{							//!< �}�E�X�h���b�O���
		DRAGMODE_NONE,							//!< �h���b�O�Ȃ�
		DRAGMODE_MOUSE,							//!< �}�E�X�h���b�O���
		DRAGMODE_LINE,							//!< �s�ԍ��\���̈�
		DRAGMODE_OLE,							//!< OLE DnD
	};
	enum enTimer{
		TIMER_AUTO_SCROLL = 1,					//!< �I�[�g�X�N���[���^�C�}�[
	};
	enum enFixedNumber{
		WHEEL_MOUSE = 3,						//!< �z�C�[���}�E�X�ŃX�N���[������s��
		SCROLL_TIME = 150,						//!< �X�N���[���^�C�}�[�̊Ԋu(ms)
		PIXEL_PER_LINESPEED = 50,				//!< �����X�N���[���̎��́A��񓖂��艽��X�N���[�����邩�̃s�N�Z����
		PIXEL_PER_COLUMNSPEED = 20,				//!< �����X�N���[���̎��́A��񓖂��艽��X�N���[�����邩�̃s�N�Z����

		LINEICON_MARGIN = 1,					//!< �s�ԍ��A�C�R���̃}�[�W��
		ICON_HEIGHT = 16,						//!< �s�ԍ��A�C�R���̍���
		ICON_WIDTH = 16,						//!< �s�ԍ��A�C�R���̕�
	};

	/*�E�B���h�E���*/
	int m_x,m_y;								//!< �E�B���h�E�̈ʒu
	int m_nWidth,m_nHeight;						//!< �E�B���h�E�̑傫��
	HWND m_hWnd;								//!< �E�B���h�E�n���h��
	HWND m_hOwner;								//!< �I�[�i�[�n���h��
	int m_nRop2;								//!< ���X�^�I�y���[�V�����ԍ�
	bool m_bIsFocused;							//!< �t�H�[�J�X�������Ă���
	int m_nCaretWidth;							//!< �L�����b�g�̕�
	bool m_bVisible;							//!< �\�����Ă��邩�H
	CDoubleBuffering m_cDoubleBuffering;		//!< �_�u���o�b�t�@�����O
	static HBITMAP m_bmpIcons[sizeof(int) * 8];	//!< �s�A�C�R��

	/*�V�X�e�����*/
	int m_nFootyID;								//!< Footy��ID
	int m_nViewID;								//!< �r���[ID
	CFontObjects *m_pFonts;						//!< �t�H���g���
	CFootyDoc *m_pDocuments;					//!< �h�L�������g
	CFootyStatus *m_pStatus;					//!< �X�e�[�^�X�|�C���^
	CFootyView *m_pView;						//!< ���̃r���[

	/*�X�N���[���f�[�^*/
	size_t m_nVisibleLines;						//!< �\���\�ȍs��
	size_t m_nVisibleColumns;					//!< �\���\�Ȍ���
	SCROLLINFO m_vInfo;							//!< �����X�N���[���o�[�̏��
	SCROLLINFO m_hInfo;							//!< �����X�N���[���o�[�̏��
#ifndef UNDER_CE
	static unsigned int  m_uWheelMsg;			//!< �}�E�X�z�C�[���̃��b�Z�[�W
#endif	/*not defined UNDER_CE*/
	bool m_bIsAutoScrolling;					//!< �����X�N���[���̍Œ�
	bool m_bIsAutoScrollVertical;				//!< �����X�N���[�����㉺���H
	int m_nAutoScrollNum;						//!< �����X�N���[���̗�

	/*�e��傫���̏��*/
	int m_nRulerHeight;							//!< ���[���[����
	int m_nLineCountWidth;						//!< �s�ԍ��\���̈敝
	int m_nLineCountMargin;						//!< �s�ԍ��\���̈�̃}�[�W��
	
	/*�\���֘A�̏��*/
	CCaret m_cCaret;							//!< �L�����b�g���
	int m_nFirstVisibleColumn;					//!< �ŏ��ɕ\������Ă��錅
	int m_nNowMousePosX,m_nNowMousePosY;
	int m_nMarkVisible;							//!< �G�f�B�^�̕`����
	bool m_bUnderlineVisible;					//!< �s�����̕`����
	
	/*�ꎞ�I�ȕϐ�*/
	unsigned long m_nIgnoreKey;					//!< ��������L�[
	bool m_bShiftLocked;						//!< �V�t�g���b�N����Ă��邩�ǂ���
	enDragMode m_nDragMode;						//!< �h���b�O���
};

/*[EOF]*/
