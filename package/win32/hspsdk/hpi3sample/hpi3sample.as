
#regcmd 9
#cmd hyoji $0f		; mes�Ɠ����R�[�h��W�J

#regcmd "_hsp3cmdinit@4","hpi3sample.dll"
#cmd newcmd $000
#cmd newcmd2 $001
#cmd newcmd3 $002
#cmd newcmd4 $003

hyoji "mes���߂̑����hyoji���g���Ă��܂��B"

a=0

newcmd 1000		; �ȗ�����123�ƂȂ�܂�
mes "�V�X�e���ϐ�stat�̒l�́A"+stat+"�ł��B"

a=12
mes "�֐�newcmd("+a+")�̒l="+newcmd(a)+"�ł��B"

repeat 12
newcmd2 a,10		; 0�`9�܂ł̗�����ϐ�a�ɑ��
mes "����="+a
loop

newcmd3 "test.txt",10.0
mes "test.txt���쐬���܂����B"

newcmd4 300,50,500,250,0	; ����`��
newcmd4 300,50,100,250,0	; ����`��
newcmd4 100,250,500,250,0	; ����`��

stop

