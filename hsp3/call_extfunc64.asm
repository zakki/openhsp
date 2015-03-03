;
; �yHSP64bit�p�֐��Ăяo���A�Z���u���z
;  by inovia (http://hsp.moe)
;
; fast-call �Ăяo���K��
; x64�ɂȂ��Ďg�p�ł��郌�W�X�^���������ׁA�����Ɏg�p���Ă��܂��B
; ���������Y��ɏ��������C���������ʂʂ��B
;  
; [�Q�l]
; 64 �r�b�g Windows �V�X�e���̃v���O���~���O���J�n����Ƃ��ɕK�v�Ȓm��
; https://msdn.microsoft.com/ja-jp/magazine/ee230241.aspx
; x64 �\�t�g�E�F�A�K��
; https://msdn.microsoft.com/ja-jp/library/7kcdt6fy.aspx
;

.code
align 16
PUBLIC call_extfunc64
call_extfunc64 PROC	
	
	; �ycall_extfunc64���g�̈����Ɩ߂�l�z
	; rcx = ��1����(���s����֐��̃|�C���^)
	; rdx = ��2����(���s����֐��̈�����������INT64�̔z��)
	; r8  = ��3����(���s����֐��̈����̌^���(int32(int64)=0,�@double(float)=1)��������INT64�̔z��)
	;       (�����_�n�̃p�����^��XMM���W�X�^���g�p����ׁA���̔��f�Ɏg�p���܂�)
	; r9  = ��4����(���s����֐��̈����̐�)
	; rax = �����^�߂�l or xmm0 = ���������_�߂�l
	
	; 
	; R12�`R15���W�X�^�͕s�������ȈׁA�X�^�b�N�ɑޔ����܂�
	; 
		push r12
		push r13
		push r14
		push r15

	; R10�`R11�̓e���|�����p
	; R12 �͊֐��̃A�h���X�ێ��Ɏg�p���̈�
	; R13 �̓T�C�Y�ێ��p���W�X�^
	; R14 ��rdx�ޔ��g�p

	; ��2�������� R14 �ɑ�����܂�
		mov r14, rdx

	; �����̐��ɍ��������Ă��A
	; �X�^�b�N�̃T�C�Y�͍Œ�40byte�K�v�ȈׁA R13�ɕێ����܂��B
		mov r13, 40

	; R9
	; �����̐���0�`4�̏ꍇ�́AARG0TO4 �ɔ�т܂��B
	; ����ȊO�̏ꍇ�̓X�^�b�N�T�C�Y�������s���܂��B
	; if R9 <= 4
		cmp r9, 4
		jbe ARG0TO4

	; ������5�ȏ�̏���
	; (R13 += 8 * ( R9 - 4 ))
	
		; ��4����(�����̐�) R9 ���� R10 �ɑ�����܂��B
		; R10 �̓X�^�b�N�œn���K�v�̂�������̐���\���܂��B
			mov r10, r9
	
		; �����̐���4�܂ł̓��W�X�^�œn�����߁A
		; 4�������ăX�^�b�N�œn���K�v�̂�������̐������߂܂��B
			sub r10, 4

		; R10��8�{���܂��B���ւ̘_���V�t�g���s���܂��B
		; 8(=2��3��j�Ȃ̂ŁA�p�����^��3���w�肵�܂��B
			shl r10, 3
			add r13, r10

	; �����̐���0�`4�̎��̓X�^�b�N�T�C�Y 40byte
	; 5�ȍ~�� 16byte�������܂�(�A���C�����g)

	; �y��z        �K�v�o�C�g�� ���o�C�g��
	;------------------------------------
	; �����̐� 0-4  40byte       40byte(����1�`4�Ɩ߂�A�h���X�p��40byte����)
	;------------------------------------
	; �����̐�   5  48byte       56byte
	; �����̐�   6  56byte       56byte
	; �����̐�   7  64byte       72byte
	; �����̐�   8  72byte       72byte
	; �����̐�   9  80byte       88byte
	; �����̐�  10  88byte       88byte

	; �����_�̃X�^�b�N�̃T�C�Y(R13)��16�Ŋ���؂��ꍇ�́A8byte �����܂��B
	; if r13\16 == 0 : r13 += 8

		; R13 ���� RAX �ɑ�����܂��B
			mov rax, r13

			cdq
			and	rdx, 15
			add	rax, rdx
			and	rax, 15
			sub	rax, rdx

		; RAX��0�Ŋ���؂�Ȃ��Ƃ��́AARG0TO4�ɔ�т܂��B
		; �X�^�b�N�T�C�Y�̒������I�����܂��B
			cmp rax, 0
			jne ARG0TO4

		; ����؂�邽�߁A�X�^�b�N�̃T�C�Y(R13)�� 8byte ���Z���܂�
		; �X�^�b�N�T�C�Y�̒������I�����܂��B
			add r13, 8

; ���W�X�^�n����������̐ݒ���s���܂��B 
ARG0TO4:

	; R14����RDX�ɑ�����܂�
	; �X�^�b�N�̃T�C�YR13����R11�ɑ�����܂�
		mov rdx, r14
		mov r11, r13

	; �X�^�b�N�̃T�C�Y(R11)��
	; �X�^�b�N�|�C���^�����炵�āA�X�^�b�N���m�ۂ��܂�
		sub rsp, r11

	; �֐��Ăяo���ׁ̈ARCX, RDX, R8, R9 �� R12, R13, R14, R15 ���W�X�^�ɑ�����܂��B
	; r12  = ��1����(���s����֐��̃|�C���^)
	; r13  = ��2����(���s����֐��̈�����������INT64�̔z��)
	; r14  = ��3����(���s����֐��̈����̌^���(int32(int64)=0,�@double(float)=1)��������INT64�̔z��)
	;       (�����_�n�̃p�����^��XMM���W�X�^���g�p����ׁA���̔��f�Ɏg�p���܂�)
	; r15  = ��4����(���s����֐��̈����̐�)

		mov r12, rcx
		mov r13, rdx
		mov r14, r8
		mov r15, r9

	;  
	; ����1�`4�̎��̓��W�X�^�Ɋi�[�A5�ȍ~�̓X�^�b�N�Ɋi�[���鏈���ł��B
	;

	; ------------------------------------------------------------------
	; ���s����֐��̑�1����
	; ------------------------------------------------------------------
	; if �����̐� > 0
		cmp r15, 0
		jg FLAG1
		jmp FLAG1END
FLAG1:
	; R14 �̃|�C���^���� R10���W�X�^ �ɃR�s�[���܂��B
	; R10 �� ���������������_���ǂ����̏�񂪓����Ă��܂��B
		mov r10, qword ptr [r14 + 0]
	; ���������������_���ǂ����𔻒f���܂��B
		cmp r10, 0
		je FLAG1INT
	; ���������_�Ȃ̂�XMM0���W�X�^�֑�����܂�
		movq xmm0, qword ptr [r13 + 0]
		jmp FLAG1END
FLAG1INT:
	; �����Ȃ̂�RCX���W�X�^�֑�����܂�
		mov rcx, qword ptr [r13 + 0]
FLAG1END:

	; ------------------------------------------------------------------
	; ���s����֐��̑�2����
	; ------------------------------------------------------------------
	; if �����̐� > 1
		cmp r15, 1
		jg FLAG2
		jmp FLAG2END
FLAG2:
	; R14 �̃|�C���^���� R10���W�X�^ �ɃR�s�[���܂��B
		mov r10, qword ptr [r14 + 8]
	; ���������������_���ǂ����𔻒f���܂��B
		cmp r10, 0
		je FLAG2INT
	; ���������_�Ȃ̂�XMM1���W�X�^�֑�����܂�
		movq xmm1, qword ptr [r13 + 8]
		jmp FLAG2END
FLAG2INT:
	; �����Ȃ̂�RDX���W�X�^�֑�����܂�
		mov rdx, qword ptr [r13 + 8]
FLAG2END:

	; ------------------------------------------------------------------
	; ���s����֐��̑�3����
	; ------------------------------------------------------------------
	; if �����̐� > 2
		cmp r15, 2
		jg FLAG3
		jmp FLAG3END
FLAG3:
	; R14 �̃|�C���^���� R10���W�X�^ �ɃR�s�[���܂��B
		mov r10, qword ptr [r14 + 16]
	; ���������������_���ǂ����𔻒f���܂��B
		cmp r10, 0
		je FLAG3INT
		; ���������_�Ȃ̂�XMM2���W�X�^�֑�����܂�
		movq xmm2, qword ptr [r13 + 16]
		jmp FLAG3END
FLAG3INT:
	; �����Ȃ̂�R8���W�X�^�֑�����܂�
		mov r8, qword ptr [r13 + 16]
FLAG3END:

	; ------------------------------------------------------------------
	; ���s����֐��̑�4����
	; ------------------------------------------------------------------
	; if �����̐� > 3
		cmp r15, 3
		jg FLAG4
		jmp FLAG4END
FLAG4:
	; R14 �̃|�C���^���� R10���W�X�^ �ɃR�s�[���܂��B
		mov r10, qword ptr [r14 + 24]
	; ���������������_���ǂ����𔻒f���܂��B
		cmp r10, 0
		je FLAG4INT
	; ���������_�Ȃ̂�XMM3���W�X�^�֑�����܂�
		movq xmm3, qword ptr [r13 + 24]
		jmp FLAG4END
FLAG4INT:
	; �����Ȃ̂�R9���W�X�^�֑�����܂�
		mov r9, qword ptr [r13 + 24]
FLAG4END:

	; ------------------------------------------------------------------
	; ���s����֐��̑�5���� �ȍ~�`
	; ------------------------------------------------------------------
	; if �����̐� < 5 : �����̐���0�`4�̏ꍇ�� CALLFUNC �ɔ�т܂��B
		cmp r15, 5
		jl CALLFUNC
	; �����̐���5�ȏ�̓X�^�b�N�ɐς�(�����̈�ԍŌォ��ς�)
	; �����̐�(R15)��(R10)�ɑ�����܂��B
		mov r10, r15
		jmp PUSHCHECK

	; �����̏����X�^�b�N�ɐς݂܂��B
PUSHSTACK:
		mov	rax, qword ptr [r13 + r10 * 8]
		mov	qword ptr [rsp + r10 * 8], rax
PUSHCHECK:
	; �����̐���1�����炵�܂��B
		dec	r10
	; �����̐���0�`3�ɂȂ������͒ǉ�����߂܂��B
		cmp r10, 3
		jg PUSHSTACK

CALLFUNC:

	; �֐����Ăяo���܂�
		mov r13, r11
		call r12
		mov r11, r13

	; �X�^�b�N�|�C���^�����ɖ߂��܂��B
		add	rsp, r11
	
	; �ޔ�����R12�`R15���W�X�^���X�^�b�N����߂��܂�
		pop r15
		pop r14
		pop r13
		pop r12
	
	; �I��
		ret

call_extfunc64 ENDP

; �߂�l��double�^�p
PUBLIC call_extfunc64d
call_extfunc64d PROC	
	jmp call_extfunc64
call_extfunc64d ENDP

; �߂�l��float�^�p
PUBLIC call_extfunc64f
call_extfunc64f PROC	
	jmp call_extfunc64
call_extfunc64f ENDP

;
End