/*===================================================================
CVSplitter
�����X�N���[���o�[�̊Ǘ��N���X�ł��B
===================================================================*/

#pragma once

#include "SplitBase.h"						/*�X�v���b�g�o�[�x�[�X�N���X*/

class CVSplitter : public CSplitBase{
public:
	CVSplitter();

	bool MoveWin(int x,int y,int nWidth,int nHeight);

private:
	void OnMouseMove(int x,int y);

public:
private:
};

/*[EOF]*/
