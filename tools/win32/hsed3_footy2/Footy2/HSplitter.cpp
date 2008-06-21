/*===================================================================
CHSplitter
�����X�N���[���o�[�̊Ǘ��N���X�ł��B
===================================================================*/

#include "HSplitter.h"
#include "Cursor.h"

/*-------------------------------------------------------------------
CHSplitter::CHSplitter
�R���X�g���N�^
-------------------------------------------------------------------*/
CHSplitter::CHSplitter(){
}


/*-------------------------------------------------------------------
CHSplitter::MoveWin
�X�v���b�^�[���ړ�������
-------------------------------------------------------------------*/
bool CHSplitter::MoveWin(int x,int y,int nWidth,int nHeight){
	/*�G���[�`�F�b�N*/
	if (y <= 0 || m_nBaseHeight < y)return false;
	/*�A�^�b�`���ꂽ�E�B���h�E���ړ�������*/
	if (m_pViews){
		if (m_nMode == SPLIT_DUAL){
			m_pViews[0].MoveWin(x,m_nBaseY,nWidth,y-m_nBaseY);
			m_pViews[1].MoveWin(x,y+SPLIT_SIZE,nWidth,nHeight-(y-m_nBaseY)-SPLIT_SIZE);
		}
		else if (m_pOtherSplit){
			m_pViews[0].MoveWin(x,m_nBaseY,m_pOtherSplit->GetX(),y-m_nBaseY);
			m_pViews[1].MoveWin(m_pOtherSplit->GetX()+SPLIT_SIZE,m_nBaseY,
				nWidth-m_pOtherSplit->GetX()-SPLIT_SIZE,y-m_nBaseY);
			m_pViews[2].MoveWin(x,y+SPLIT_SIZE,m_pOtherSplit->GetX(),m_nBaseHeight-(y-m_nBaseY)-SPLIT_SIZE);
			m_pViews[3].MoveWin(m_pOtherSplit->GetX()+SPLIT_SIZE,y+SPLIT_SIZE,
				nWidth-m_pOtherSplit->GetX()-SPLIT_SIZE,m_nBaseHeight-(y-m_nBaseY)-SPLIT_SIZE);
		}
	}
	/*�X�v���b�g�o�[���ړ�������*/
	MoveWindow(GetWnd(),x,y,nWidth,SPLIT_SIZE,true);
	/*�����o�ϐ�����*/
	m_x = x;
	m_y = y;
	return true;
}


/*-------------------------------------------------------------------
CHSplitter::OnMouseMove
�}�E�X���������ꂽ�Ƃ��̏���
-------------------------------------------------------------------*/
void CHSplitter::OnMouseMove(int x,int y){
	if (m_bDrag)
		MoveWin(m_x,m_y+y,m_nBaseWidth,m_nBaseHeight);
	CCursor::UseUpDown();
}

