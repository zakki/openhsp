/*===================================================================
FootyStatus�N���X
CFootyView�N���X�̌��������Ǘ�����N���X�ł��B
===================================================================*/

#pragma once

#include <windows.h>

class CFootyStatus{
public:
	CFootyStatus();

	void SetDefaultColor();
private:
public:
	/*�F���*/
	COLORREF m_clDefaultLetter;					/*�ʏ�̕����F*/
	COLORREF m_clBackGround;					/*�ʏ�̔w�i�F*/
	COLORREF m_clCrlf;							/*���s�}�[�N�̐F*/
	COLORREF m_clHalfSpace;						/*���p�X�y�[�X�̐F*/
	COLORREF m_clNormalSpace;					/*�S�p�X�y�[�X�̐F*/
	COLORREF m_clTab;							/*�^�u�}�[�N�̐F*/
	COLORREF m_clEOF;							/*[EOF]�}�[�N�̐F*/
	COLORREF m_clUnderLine;						/*�J�[�\�����̃A���_�[���C���F*/
	COLORREF m_clLineNumLine;					/*�s�ԍ��̋��E���̐F*/
	COLORREF m_clLineNum;						/*�s�ԍ��̕����̐F*/
	COLORREF m_clCaretLine;						/*�L�����b�g������s�̍s�ԍ��̔w�i�F*/
	COLORREF m_clRulerBk;						/*���[���[�̐F*/
	COLORREF m_clRulerText;						/*���[���[�̃e�L�X�g�̐F*/
	COLORREF m_clRulerLine;						/*���[���[�̐��̐F*/
	COLORREF m_clCaretPos;						/*�J�[�\���̂���ʒu�̃��[���[�w�i*/
	COLORREF m_clUrl;							/*URL�̐F*/
	COLORREF m_clUrlUnder;						/*URL�̐F*/
	COLORREF m_clMail;							/*���[���A�h���X�̐F*/
	COLORREF m_clMailUnder;						/*���[���A�h���X�̐F*/
	COLORREF m_clHighlightText;					/*�����e�L�X�g*/
	COLORREF m_clHighlightBk;					/*�����w�i*/

private:
};

/*[EOF]*/
