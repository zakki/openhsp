/*===================================================================
CVSplitter
�����X�N���[���o�[�̊Ǘ��N���X�ł��B
===================================================================*/

#include "VSplitter.h"
#include "Cursor.h"

/*-------------------------------------------------------------------
CVSplitter::CVSplitter
�R���X�g���N�^
-------------------------------------------------------------------*/
CVSplitter::CVSplitter(){
}

/*-------------------------------------------------------------------
CVSplitter::MoveWin
�X�v���b�^�[���ړ�������
-------------------------------------------------------------------*/
bool CVSplitter::MoveWin(int x,int y,int nWidth,int nHeight){
	/*�G���[�`�F�b�N*/
	if (x <= 0 || m_nBaseWidth < x)return false;
	if (nHeight < y)return false;
	/*�A�^�b�`���ꂽ�r���[���ړ�������*/
	if (m_pViews){
		if (m_nMode == SPLIT_DUAL){
			m_pViews[0].MoveWin(m_nBaseX,m_nBaseY,x-m_nBaseX,nHeight);
			m_pViews[1].MoveWin(x+SPLIT_SIZE,m_nBaseY,nWidth-(x-m_nBaseX)-SPLIT_SIZE,nHeight);
		}
		else if (m_pOtherSplit){
			m_pViews[0].MoveWin(m_nBaseX,y,x-m_nBaseX,m_pOtherSplit->GetY()-y);
			m_pViews[1].MoveWin(x+SPLIT_SIZE,y,nWidth-x-SPLIT_SIZE,m_pOtherSplit->GetY()-y);
			m_pViews[2].MoveWin(m_nBaseX,m_pOtherSplit->GetY()+SPLIT_SIZE,
				x-m_nBaseX,nHeight-(m_pOtherSplit->GetY()-y)-SPLIT_SIZE);
			m_pViews[3].MoveWin(x+SPLIT_SIZE,m_pOtherSplit->GetY()+SPLIT_SIZE,
				nWidth-x-SPLIT_SIZE,nHeight-(m_pOtherSplit->GetY()-y)-SPLIT_SIZE);
		}
	}
	/*�X�v���b�g�o�[���ړ�������*/
	MoveWindow(GetWnd(),x,y,SPLIT_SIZE,nHeight,true);
	/*�����o�ϐ�����*/
	m_x = x;
	m_y = y;
	return true;
}


/*-------------------------------------------------------------------
CVSplitter::OnMouseMove
�}�E�X���������ꂽ�Ƃ��̏���
-------------------------------------------------------------------*/
void CVSplitter::OnMouseMove(int x,int y){
	if (m_bDrag)
		MoveWin(m_x+x,m_y,m_nBaseWidth,m_nBaseHeight);
	CCursor::UseRightLeft();
}

/*[EOF]*/
