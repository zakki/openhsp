;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.6
%note
ver3.6�W������
%date
2020/06/04
%author
onitama
%url
http://hsp.tv/
%port
Win
%dll
HSP3Dish



%index
es_dist
2�_�ԋ����Z�o
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5
p1=���ʂ�������ϐ�
p2,p3=�_A�̍��W
p4,p5=�_B�̍��W

%inst
(p2,p3)����(p4,p5)�܂ł̋��������߁A�ϐ�p1�ɑ�����܂��B�v�Z���ʂ͏���
��8bit�̌Œ菬���ł��B




%index
es_set
�X�v���C�g�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5,p6
p1=�X�v���C�gNo.
p2=�X�v���C�gX���W
p3=�X�v���C�gY���W
p4=�L�����N�^No.
p5=�`�惂�[�h(0=DirectDraw�A1=Direct3D)
p6=�D�揇��(-32768�`32767)

%inst
�X�v���C�g��o�^���܂��B
p1�́A�X�v���C�gNo.(0�`511)�A(p2,p3)�͉�ʏ�ł̃X�v���C�g�̍��W�ɂȂ�
�܂��B
���̍��W������Ƃ��āAp4�Ŏw�肵���L�����N�^No.���\������܂��B
�X�v���C�g���W�́A-32767�`32767�܂ł͈̔͂��ݒ�\�ł��B
^
p5�ŕ`����@��I�����܂��Bes_effect�ł̃G�t�F�N�g���g�p���鎞��1�ɐݒ�
���܂��B
���̃p�����[�^�́A Direct3D���g���Ȃ��ꍇ�͋����I��0�ɂȂ�A�g����ꍇ
��1���f�t�H���g�ɂȂ�܂��B
^
p6�ŃX�v���C�g�̗D�揇�ʂ��w�肵�܂��B�D�揇�ʂ͒l���������قǎ�O�ɕ\
�������悤�ɂȂ�A����l�̏ꍇ�̓X�v���C�g�̏����������D�悳��܂��B
�܂��A �]���ʂ�X�v���C�gNo.�̏��������ɕ`�悷��悤�ɂ��邱�Ƃ��ł���
���B

%href
es_pat
es_draw



%index
es_blink
�X�v���C�g�_�Őݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=�X�v���C�gNo.
p2=�_�Ńt���O(1�`3)
p3=�_�ŃJ�E���g�����l(-1or1�`)

%inst
^p
�_�Ńt���O=1 : �_�Ŗ����A�J�E���g��0�ɂȂ�����X�v���C�g����
	      �ł�����
�_�Ńt���O=2 : �_�ł���A�J�E���g��0�ɂȂ�����_�ł���߂�
�_�Ńt���O=3 : �_�ł���A�J�E���g��0�ɂȂ�����X�v���C�g����
�@�@�@�@�@     �ł�����
^p
�X�v���C�g�̓_�ł�ݒ肵�܂��B ����܂�es_flag���߂Őݒ肵�Ă������̂�
�Ɨ��E�g���������߂ł��B�����ł̐ݒ�� es_flag���߂����s����ƃ��Z�b�g
����܂��B
p3��-1��ݒ肷��ƁA�J�E���g�͖����ɂȂ�܂��B




%index
es_bye
�V�X�e�����
%group
�g����ʐ��䖽��
%inst
HSPDXFIX.DLL�V�X�e���̐؂藣�������܂��B
��ʃ��[�h���E�C���h�D���[�h�ɖ߂��A�m�ۂ���Ă��������������ׂĉ����
�܂��B ����́A�N���[���A�b�v�֐��Ƃ���HSP�I�����Ɏ����I�ɌĂяo�����
���B




%index
es_put
�L�����N�^��ʕ\��
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=put���鍶��X���W
p2=put���鍶��Y���W
p3=put����L�����N�^No.

%inst
�X�v���C�g�p�̃L�����N�^�p�^�[���Ƃ��ēo�^����Ă���f�[�^���A�w�肵��
���W�ɕ\�����܂��B���̖��߂́A�X�v���C�g�Ƃ͊֌W�Ȃ���ʂɃL�����N�^��
�]�����閽�߂ł��B




%index
es_area
�X�v���C�g�L���G���A�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=�L���G���A�̍���X���W
p2=�L���G���A�̍���Y���W
p3=�L���G���A�̉E��X���W
p4=�L���G���A�̉E��Y���W

%inst
�X�v���C�g�̗L���G���A��ݒ肵�܂��B
�X�v���C�g���W��(p1,p2)-(p3,p4)�͈͓̔��ɂȂ����̂́A �����I�ɍ폜����
�܂��B
^
�X�v���C�g�̕\���͈͂��ݒ肳����(es_window����)�����I�ɁA �X�v���C�g
�L���G���A���Đݒ肳��܂��B
%href
es_window




%index
es_find
�X�v���C�g����
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5
p1=�X�v���C�gNo.����������ϐ���
p2=�����ΏۂƂȂ�type�l
p3=�������J�n����X�v���C�gNo.
p4=�������I������X�v���C�gNo.
p5=����

%inst
�o�^����Ă���X�v���C�g�̒��Ŏw�肵��type�l�����X�v���C�gNo. ������
���܂��B
p2��type�l�ɂ́A������type�𓯎��Ɏw�肷�邱�Ƃ��ł��܂��B
���Ƃ��΁Atype1��type4��Ώۂɂ���ꍇ�́A1+4��5���w�肵�܂��B
^
p2�̎w����ȗ����邩�A 0���w�肵���ꍇ�ɂ͂��ׂĂ�type�l�����X�v���C
�g�������̑ΏۂɂȂ�܂��B
^
�����́Ap3�Ŏw�肳�ꂽ�X�v���C�gNo.����p4�Ŏw�肳�ꂽNo.�܂ŏ��ԂɒT��
�Ă����܂��B
������ȗ�����ƁANo.0���炷�ׂẴX�v���C�g���������܂��B
�Y������X�v���C�g�������������_�ŁAp1�Ɍ��ʂ������ďI���܂��B
�����̌��ʁA�Y������X�v���C�g���Ȃ������ꍇ�ɂ́A-1���������܂��B
^
p5�͌�������X�v���C�gNo.�̑������w�肷����̂ŁA �ȗ������p3�Ap4����
�����I�ɐݒ肳��܂��̂Œʏ�͎w�肵�Ȃ��Ă��\���܂���B



%index
es_size
�L�����N�^�T�C�Y�w��
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=�L�����N�^��X�T�C�Y
p2=�L�����N�^��Y�T�C�Y
p3=�q�b�g�`�F�b�N�̈�(%)
p4=�s�����t���O( 0=���� / 1=�s���� )

%inst
�X�v���C�g�̃L�����N�^�p�^�[�����`����ۂ́A�T�C�Y���w�肵�܂��B
(p1,p2)���L�����N�^��X,Y�T�C�Y�ɂȂ�܂��B
^
p3�͓����蔻����s�Ȃ��ۂ̃q�b�g�`�F�b�N�̈悪�A ��%�ɂȂ邩���w�肵��
���B100���w�肷��ƁA(p1,p2)�Ŏw�肵���T�C�Y�����ς��Ƀq�b�g�`�F�b�N��
�s�Ȃ��܂��B 0���w�肷��ƁA���̃L�����N�^�͓����蔻��������Ȃ��Ȃ��
���B
p4�́A0�Ȃ�Γ����F�𓧉߂��A1�Ȃ�Εs�����̃L�����N�^�p�^�[���ɂȂ��
���B
^
�L�����N�^��X,Y�T�C�Y�ɂ͓��ɐ����͂���܂��񂪁A �I�t�X�N���[���o�b�t
�@����͂ݏo���悤�ȃL�����N�^�p�^�[���̎w��͖����ɂȂ�܂��B
es_size���߂̐ݒ�́A�ȍ~�̃L�����N�^��`�ł����ƗL���ɂȂ�܂��B
%href
es_pat




%index
es_link
�A�j���[�V�����ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�L�����N�^No.
p2=���[�v�A�j���[�V��������L�����N�^No.

%inst
�L�����N�^�̃��[�v�A�j���[�V������ݒ肷�邽�߂̖��߂ł��B
p1�Ŏw�肵���L�����N�^No.���A�w�肳�ꂽ�t���[�������\��������ɁA p2��
�w�肵���L�����N�^No.�ɖ߂�悤�ɐݒ���s�Ȃ��܂��B
%href
es_pat

%sample
es_size 32,32
es_pat 1,0,0,8
es_pat 2,32,0,8
es_pat 3,64,0,8
es_pat 4,96,0,8
es_link 4,1




%index
es_check
�Փ˔���擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5,p6
p1=���ʂ���������ϐ���
p2=�`�F�b�N�̑ΏۂƂȂ�X�v���C�gNo.
p3=�����ΏۂƂȂ�type�l
p4=����t���O(0=��]���l�����Ȃ��A1=��]���l������)
p5=�������J�n����X�v���C�gNo.
p6=�������I������X�v���C�gNo.

%inst
�X�v���C�g���m�̏Փ˔�����s�Ȃ��܂��B
^
p2�Ŏw�肳�ꂽ�X�v���C�gNo.�ƏՓ˂��Ă���(�d�Ȃ��Ă���) �X�v���C�g����
�����āAp1�Ŏw�肵���ϐ��Ɍ��ʂ������܂��B
^
p3�ŏՓ˔���̑ΏۂƂȂ�type�l���w�肷�邱�Ƃ��ł��܂��B
p3���ȗ�����邩�A 0�̏ꍇ�́A���ׂẴX�v���C�g�Ƃ̏Փ˂𔻒肵�܂��B
p3��type�l�ɂ́A������type�𓯎��Ɏw�肷�邱�Ƃ��ł��܂��B
���Ƃ��΁Atype1��type4��Ώۂɂ���ꍇ�́A1+4��5���w�肵�܂��B
^
�Փ˔���ɂ́A�L�����N�^�p�^�[����o�^�������Ɏw�肵���q�b�g�`�F�b�N��
��(%)���g�p����܂��B ���ۂɉ摜���d�Ȃ��Ă��Ă��A�q�b�g�`�F�b�N�̈��
�͈͂��d�Ȃ�Ȃ�����͏Փ˂Ƃ݂Ȃ���܂���B
^
���ʂ�p1�Ŏw�肵���ϐ��ɑ������܂��B�����A�Փ˂��Ă���X�v���C�g����
�������ꍇ�ɂ�-1���A �Փ˂��Ă���X�v���C�g������΁A���̃X�v���C�gNo.
���������܂��B�Փ˂��Ă���X�v���C�g�������������ꍇ�ɂ́A�X�v���C�g
No.�̏��������̂��D�悳��܂��B
^
es_effect���߂��g���ăX�v���C�g����]�\�������ꍇ�A ���̂܂܂��Ɖ�]��
�Ă��Ȃ���Ԃł̏Փ˔�����s���Ă��܂��܂��B�����ŁAes_check���ߎ��s��
��p4�� 1���w�肷�邱�ƂŃX�v���C�g�̉�]�𓖂��蔻��ɔ��f�����邱�Ƃ�
�ł���悤�ɂȂ�܂��B
^
p5,p6�ŏՓ˔������������X�v���C�g�̎n�_�E�I�_���w��ł��܂��B p5��p6
���傫�ȃX�v���C�gNo.���w�肵���ꍇ�A�ʏ�Ƃ͋t�ɏ������X�v���C�gNo.
�Ɍ������Č������s���܂��B
%href
es_type
es_size




%index
es_offset
�I�t�Z�b�g���W�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�I�t�Z�b�gX�l
p2=�I�t�Z�b�gY�l

%inst
���ׂẴX�v���C�g�̕\�����A�I�t�Z�b�g�l�Ŏw�肵�����������炵�ĕ\����
�܂��B���̖��߂Őݒ肵���I�t�Z�b�g�l�́A es_draw���߂ŕ`����s�Ȃ�����
�ɔ��f����܂��B
%href
es_draw




%index
es_flag
flag�l�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�X�v���C�gNo.
p2=flag�l

%inst
p1�Ŏw�肵���X�v���C�g��flag�l��ύX���܂��B
flag�l�́A�X�v���C�g���L���ɂȂ��Ă���ꍇ�́A $100(256)�������I�ɐݒ�
����Ă��܂��B�ʏ�͓��ɂ�����K�v�͂���܂���B
^p
flag�l=
  0    :  �X�v���C�g���o�^
  bit 0-6 : 1�`127 �J�E���g�_�E���^�C�}�[
  bit 7   : �J�E���g�_�E������SWITCH
  bit 8 :  $100 �X�v���C�g�\��ON
  bit 9 :  $200 �X�v���C�g�ړ�ON
  bit10 :  $400 ���R�����ړ�ON
  bit11 :  $800 BG�ƃ����N���Ĉړ�(������)
  bit12 : $1000 �{�[�_�[��������ON
  bit13 : $2000 �{�[�_�[X�Ŕ��]SWITCH
  bit14 : $4000 �{�[�_�[Y�Ŕ��]SWITCH
  bit15 : $8000 �J�E���g�_�E���^�C�}�[���_��SWITCH




%index
es_chr
chr�l�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�X�v���C�gNo.
p2=�L�����N�^No.

%inst
p1�Ŏw�肵���X�v���C�g�̃L�����N�^No.��ύX���܂��B




%index
es_type
type�l�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�X�v���C�gNo.
p2=type�l

%inst
p1�Ŏw�肵���X�v���C�g��type�l��ύX���܂��B
type�l�ɂ��Ă̏ڍׂ́A HSPDXFIX.DLL ���t�@�����X�}�j���A���́utype�l
�̐ݒ�ɂ��āv���Q�Ƃ��Ă��������B




%index
es_kill
�X�v���C�g�폜
%group
�g����ʐ��䖽��
%prm
p1
p1=�X�v���C�gNo.

%inst
p1�Ŏw�肵���X�v���C�gNo.���폜���܂��B

%href
es_clear




%index
es_clear
�����X�v���C�g�폜
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�X�v���C�gNo.
p2=�폜������

%inst
p1�Ŏw�肵���X�v���C�gNo. �ȍ~�̃X�v���C�g���폜���ꖢ�o�^�ɂȂ�܂��B
p2�ō폜�����X�v���C�g�̐����w�肷�邱�Ƃ��ł��܂��B
p1��p2�̎w����ȗ������ꍇ�́A���ׂẴX�v���C�g���폜����܂��B
%href
es_kill




%index
es_pos
�X�v���C�g���W�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=�X�v���C�gNo.
p2=�X�v���C�gX���W
p3=�X�v���C�gY���W

%inst
�X�v���C�g�̍��W��ύX���܂��B
p1�ŃX�v���C�gNo.���w�肵�āA(p2,p3)��X,Y���W��ݒ肵�܂��B
^
es_pos�́A�ݒ�ς݂̃X�v���C�g�̍��W������ύX���閽�߂ł��B




%index
es_apos
�X�v���C�g�ړ��ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=�X�v���C�gNo.
p2=1�t���[����X�����Ɉړ�����h�b�g��
p3=1�t���[����Y�����Ɉړ�����h�b�g��
p4=�ړ��X�s�[�h(%)

%inst
�X�v���C�g�������I�Ɉړ������邽�߂̐ݒ�����܂��B
p1�ŃX�v���C�gNo.�Ap2,p3��X,Y�����̑������w�肵�܂��B
^
p4�ňړ��X�s�[�h��%�Ŏw�肵�܂��Bp4���ȗ����邩�A100���w�肵���ꍇ�́A
100%�̃X�s�[�h�ƂȂ�A1�t���[����(p2,p3)�Ŏw�肵�����������ړ���������
���B�����A�ړ��X�s�[�h��50(%)�ɂ��āA������(+4,-2)�Ɏw�肳�ꂽ�ꍇ�́A
���ۂɂ́A(+2,-1)�̑����ɂȂ�܂��B�����̒P�ʂ́A1�h�b�g�ȉ��ɂȂ�����
���ł����m�Ɉړ����s�Ȃ��܂��B ���Ƃ��΁A1�t���[����(1,0)�̈ړ���10%��
�s�Ȃ����ꍇ�ł��A10�t���[�����1�h�b�g�ړ�����悤�Ɍv�Z����܂��B
%href
es_adir
es_aim




%index
es_aim
�X�v���C�g�Q�ƍ��W�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=�X�v���C�gNo.
p2=�ړ����X���W
p3=�ړ����Y���W
p4=�ړ��X�s�[�h(%)

%inst
es_aim���߂́A es_adir���߂Ɠ������w�肵�������ɃX�v���C�g���ړ�������
���߂̂��̂ł��B es_aim���߂ł́A�����̑ւ��Ɉړ�����ڕW�ƂȂ�X,Y��
�W���w�肵�܂��B�X�v���C�g�́A���݂̍��W����A�ڕW�ƂȂ���W�ւ̕�����
�v�Z���ړ����J�n���܂��B
^
���̖��߂́A���Ƃ��ΓG���甭�˂����~�T�C�����v���C���[��_���Ĉړ���
��悤�ɂ��������Ȃǂɖ𗧂��܂��B
^
p4�ňړ��X�s�[�h��%�Ŏw�肵�܂��B p3���ȗ����邩�A100(%)���w�肵���ꍇ
�ɂ́A�w�肵��������1�t���[���ɂ�1�h�b�g�̋������ړ����܂��B
^
���̖��߂����s����ƃV�X�e���ϐ�stat�Ɉړ��������Ԃ�܂��B
����𗘗p���Ď��@��_��3�����e�Ȃǂ��쐬���邱�Ƃ��ł��܂��B
%href
es_apos
es_adir




%index
es_ang
�p�x�擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=��_��X���W
p2=��_��Y���W
p3=�ړI�_��X���W
p4=�ړI�_��Y���W

%inst
�V�X�e���ϐ�stat��(p1,p2)���猩��(p3,p4)�̕������Ԃ�܂��B
es_aim���g���Ă������𓾂邱�Ƃ͂ł��܂����A���̖��߂��g���΃X�v���C�g
���g�킸�ɕ����𓾂邱�Ƃ��ł��܂��B



%index
es_get
�X�v���C�g���擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=��񂪑�������ϐ���
p2=�X�v���C�gNo.
p3=info number

%inst
p1�Ŏw�肵���ϐ����ɁAp2�̃X�v���C�gNo.�̏��������܂��B
���̎�ނ́Ap3��info number�Ŏw�肵�܂��B
[]���̓w�b�_�t�@�C���Œ�`����Ă���萔�ł��B
^p
info number :
	  0 = flag�l                                    [ESI_FLAG_LOW]
	  3 = �X�v���C�g��X���W                         [ESI_POSX_INT]
	  5 = �X�v���C�g��Y���W                         [ESI_POSY_INT]
	  7 = 1�t���[���Ɉړ����鋗��X                  [ESI_SPDX_INT]
	  9 = 1�t���[���Ɉړ����鋗��Y                  [ESI_SPDY_INT]
	 10 = �v���O���X�J�E���g�l(���g�p)              [ESI_PRGCOUNT]
	 11 = �A�j���[�V�����J�E���g�l                [ESI_ANIMECOUNT]
	 12 = �L�����N�^No.                                [ESI_CHRNO]
	 13 = type�l                                        [ESI_TYPE]
  14,15 = ���ꓮ����(���g�p)                   [ESI_EXECPTR_LOW,
                                                 ESI_EXECPTR_HIGH]
	 16 = ���R���������xX                             [ESI_ACCELX]
	 17 = ���R���������xY                             [ESI_ACCELY]
	 18 = �e�݂₷��                               [ESI_BOUNCEPOW]
	 19 = �o�E���h�t���O                          [ESI_BOUNCEFLAG]
	 20 = �_�Ńt���O                               [ESI_BLINKFLAG]
  22,23 = �_�ŃJ�E���g�l                      [ESI_BLINKCOUNT_LOW,
                                              ESI_BLINKCOUNT_HIGH]
	 24 = Direct3D�g�p�t���O                         [ESI_D3DFLAG]
	 25 = �\��X�T�C�Y                                  [ESI_DISPX]
	 26 = �\��Y�T�C�Y                                  [ESI_DISPY]
	 27 = X����]�p                                     [ESI_ROTX]
	 28 = Y����]�p                                     [ESI_ROTY]
	 29 = Z����]�p                                     [ESI_ROTZ]
	 30 = �u�����h�t�@�N�^�[                     [ESI_BLENDFACTOR]
	 31 = ���l                                         [ESI_ALPHA]
	 32 = �_�ŗp�X�v���C�g�\���t���O                [ESI_DISPFLAG]
  34,35 = ���C�g�l                                 [ESI_LIGHT_LOW,
                                                   ESI_LIGHT_HIGH]
	 36 = �D�揇��                                  [ESI_PRIORITY]



%index
es_ini
�V�X�e���̏�����
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�X�v���C�g�̍ő吔
p2=�L�����N�^��`�̍ő吔
p3=���̐��x(64�`4096)

%inst
HSPDXFIX.DLL�V�X�e���̏��������s�Ȃ��܂��B
�p�����[�^���ȗ�����ƁA�X�v���C�g��512�܂ŁA �L�����N�^��`����1024
�܂ł��ő�Ƃ��ăX�v���C�g�����������܂��Bes_ini���߂͉��x�ł����s��
�邱�Ƃ��ł���̂ŁA�X�v���C�g�����ׂăN���A���������Ȃǂɂ��g�p�\��
���B
^
p3��es_adir���߂ȂǂŎg�p����p�x���A������x�ɂ��邩���w�肵�܂��B �w
��ł��鐔�l�́A64��256�̔{���A������360�̔{���ł��B����ȊO�̐��l���w
�肵���ꍇ�́A�w�肵���l�����ŏ����ɍ�����ԋ߂����l���ݒ肳��܂��B
^
�󂫃��������s�����Ă���ȂǁA���炩�̗��R�Ń������m�ۂɎ��s�������́A
stat��1���Ԃ�܂��B



%index
es_gravity
���������x�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=�X�v���C�gNo.(-1�`)
p2=X�����̉����x(-32767�`32767)
p3=Y�����̉����x(-32767�`32767)

%inst
es_flag���߂Ŏ��R�����ړ���ON�ɂ����Ƃ��̉����x��ݒ肵�܂��B
^
p2�Ap3��1�t���[�����Ƃɉ��Z�����ړ��ʂŁA256��1�h�b�g�ƂȂ�܂��B
p1��-1���w�肷��ƁA�f�t�H���g�l��ݒ肷�邱�Ƃ��ł��܂��B�@���̒l�́A
es_set���߂����s�������ɐݒ肳���l�ŁA�����l��p2��0�Ap3��256�ƂȂ���
���܂��B



%index
es_exnew
�V�K�X�v���C�g�擾
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=�V�KNo.����������ϐ���
p2=�������J�n����X�v���C�gNo.
p3=�������I������X�v���C�gNo.
p4=����

%inst
���̖��߂́A�X�v���C�gNo.�̒��Ŏg���Ă��Ȃ�No.���������܂��B
p2�`p3�Ŏw�肵��No.�̊Ԃŋ󂫂̂���No.���Ap1�Ŏw�肵���ϐ��ɑ�����܂��B
�󂫂��Ȃ��ꍇ�́A-1���������܂��B
^
p4�ɂ͌�������X�v���C�gNo.�̑������w�肵�܂��B �ȗ������p2�Ap3���玩
���I�ɐݒ肷�邽�߁A�ʏ�͖�������K�v�͂���܂���B
^
��es_new���߂Ɠ��l�̏������s�������ꍇ�́Ap3��-1���w�肵�Ă��������B




%index
es_new
�V�K�X�v���C�g�擾
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�V�KNo.����������ϐ���
p2=�������J�n����X�v���C�gNo.

%inst
���̖��߂́A�X�v���C�gNo.�̒��Ŏg���Ă��Ȃ�No.���������܂��B
p2�Ŏw�肵��No.�ȍ~�ŋ󂫂̂���No.���Ap1�Ŏw�肵���ϐ��ɑ�����܂��B��
�����Ȃ��ꍇ�́A-1���������܂��B
^
���̖��߂́A�ȑO�̃o�[�W�����Ƃ̌݊����̂��߂Ɏc���ꂽ���߂ł��B
�ȑO�̃o�[�W�������g�p���č쐬���ꂽ�X�N���v�g�𓮂������ȊO��es_exnew
���߂��g�p����悤�ɂ��Ă��������B



%index
es_cos
�O�p�֐�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=���ʂ���������ϐ���
p2=�p�x(0�`�}n)
��n=es_ini��3�p�����[�^�Őݒ肵�����x

%inst
�ϐ�p1�ɁA�p�xp2�̃R�T�C���������܂��B
p2�͈̔͂�es_ini�Őݒ肵���l�܂łł��B
������l�́A������10�r�b�g�̌Œ菬���ł��B�܂�A�{��������ׂ��l
��1024�{�����������Ԃ��Ă��܂��B
^
���p�x�͐��̐��ł���΂�����x�͔͈͂��I�[�o�[���Ă����m�ɓ��삷��悤
�@�ɂ��Ă���܂����A���̐��ɂ��Ă͂����ۏ؂��Ă��܂���̂Œ��ӂ���
�@���������B



%index
es_sin
�O�p�֐�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=���ʂ���������ϐ���
p2=�p�x(0�`�}n)
��n=es_ini��3�p�����[�^�Őݒ肵�����x

%inst
�ϐ�p1�ɁA�p�xp2�̃T�C���������܂��B
p2�͈̔͂�es_ini�Őݒ肵���l�܂łł��B
������l�́A������10�r�b�g�̌Œ菬���ł��B�܂�A�{��������ׂ��l
��1024�{�����������Ԃ��Ă��܂��B
^
���p�x�͐��̐��ł���΂�����x�͔͈͂��I�[�o�[���Ă����m�ɓ��삷��悤
�@�ɂ��Ă���܂����A���̐��ɂ��Ă͂����ۏ؂��Ă��܂���̂Œ��ӂ���
�@���������B




%index
es_fmes
�t�H���g�w�蕶����\��
%group
�g����ʐ��䖽��
%prm
"str",p1
"str"=�\��������
p1=�`����s���o�b�t�@No.(�f�t�H���g=-2)

%inst
�J�����g�|�W�V����(pos���߂Ŏw�肳�ꂽX,Y���W)����A�w�肵���������\
�����܂��B �����̐F�́A���ݑI������Ă���F(color���߂Ŏw��)�ɂȂ�A�t
�H���g��font���߂őI������Ă�����̂��g�p����܂��B
^
p1�ɂ́A�`����s���o�b�t�@No.���w�肵�܂��B �\��������ʃC���[�W�ɑ�
���ĕ`����s���ꍇ�ɂ͏ȗ����č\���܂���B
%href
font
es_mes




%index
es_adir
�X�v���C�g�ړ������ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=�X�v���C�gNo.
p2=�ړ��������(0�`)
p3=�ړ��X�s�[�h(%)

%inst
�X�v���C�g�������I�Ɉړ������邽�߂̐ݒ�����܂��B
^
p1�ŃX�v���C�gNo.�Ap2�ŕ������w�肵�܂��B �����́Aes_ini�Ŏw�肵�����l
�܂łŎw�肵�܂��B0���^���ƂȂ�A�����v���ɑ������Ă����܂��B
^
p3�ňړ��X�s�[�h��%�Ŏw�肵�܂��B p3���ȗ����邩�A100(%)���w�肵���ꍇ
�ɂ́A�w�肵��������1�t���[���ɂ�1�h�b�g�̋������ړ����܂��B
^
p4�ňړ��X�s�[�h��%�Ŏw�肵�܂��Bp4���ȗ����邩�A100���w�肵���ꍇ�́A
100%�̃X�s�[�h�ƂȂ�A1�t���[����1�h�b�g�̑��x�ňړ��������܂��B



%index
es_move
�X�v���C�g�ړ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=�ړ����s���t���[����(1�`)
p2=�ړ��J�n�X�v���C�gNo.
p3=�ړ�����X�v���C�g�̌�
p4=�A�j���[�V��������t���O(0�`1)
%inst
^p
p4=0 : �A�j���[�V�������s��
p4=1 : �A�j���[�V�������s��Ȃ�
^p
�X�v���C�g�̈ړ����s���܂��B es_draw���߂���X�v���C�g�̕`��𔲂�����
�̂ŁA��ɏ����������̃t���[���X�L�b�v�ɗp���܂��B
�����t���[���̃X�L�b�v���s��ꂽ�ۂɓ_�ł��~�܂�̂�h�����߁A�X�v���C
�g�̓_�ł̓p�����[�^�̐ݒ�Ɋ֌W�Ȃ� es_draw���߂ōs���܂��B
%href
es_draw


%index
es_draw
�X�v���C�g�`��
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=�`��J�n�X�v���C�gNo.
p2=�`�悷��X�v���C�g�̌�
p3=�X�v���C�g�Œ�t���O(0�`)
p4=�`�揇��(0�`1)

%inst
^p
p3=0 : �ʏ�̓�����s��
bit1 : �X�v���C�g���ړ������Ȃ�
bit2 : �A�j���[�V�������s��Ȃ�
^
p4=0 : �X�v���C�gNo.���ɕ`�悷��
p4=1 : �D�揇�ʏ��ɕ`�悷��
^p
�o�^����Ă���X�v���C�g����ʂɕ`�悵�܂��B
�ʏ�́A p1,p2�̃p�����[�^���ȗ����Ďg�p����΁A���ׂẴX�v���C�g��`
�悷�邱�Ƃ��\�ł��B
^
�o�^����Ă���X�v���C�g�̈ꕔ������`�悵�����ꍇ�́Ap1�ɊJ�n�X�v���C
�gNo.�Ap2�ɕ`�悷������w�肵�Ă��������B
^
p4��1���w�肷��ƁAes_set���߂�es_setpri���߂Ŏw�肵���D�揇�ʂ̏��ɃX
�v���C�g��`�悵�܂��B�������D�揇�ʂ̃\�[�g�ɂ͑������Ԃ������邽�߁A
�K�v��������Ώ]���ʂ�X�v���C�gNo. ���ŕ`������邱�Ƃ��������߂��܂��B
^
���̖��߂����s����ƁA�`�悳�ꂽ�X�v���C�g�͈ړ����s���܂����A p3��1��
�w�肷�邱�ƕ`��݂̂��s���悤�ɂ��邱�Ƃ��ł��܂��B �܂��A2���w�肷��
���ƂŃA�j���[�V�������~�����邱�Ƃ��ł��܂��B
%sample
*gmain
	stick ky,$1f			; �L�[�̏����擾
	if ky&$80 : goto *owari	; [ESC]���f�`�F�b�N
	es_cls					; ��ʃN���A
	es_draw 				; �X�v���C�g�`��
	es_sync 				; ��ʂ̍X�V
	await 0 				; System�A�C�h��
	goto *gmain




%index
es_bound
�e�݂₷���ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=�X�v���C�gNo.(-1�`)
p2=�e�݂₷��(0�`256)
p3=�t���O(1=X���� 2=Y���� 3=���� �f�t�H���g=3)

%inst
es_flag���߂Ŏ��R�����ړ���ON�ɂ����Ƃ��ɁA ��ʉ���(�܂��͏㕔)�Œ���
�Ԃ�ۂ̒e�݂₷����ݒ肵�܂��B���̒l���傫���قǒ��˕Ԃ莞�ɐ�������
���Ȃ��Ȃ�܂��B
^
p3�͉�ʂ̏㉺�[�A���邢�͍��E�[�ɓ��������ۂɒ��˕Ԃ���s�����s��Ȃ�
����ݒ�ł��܂��B�������A���̃t���O�͎��R������������������ɂ̂ݓK�p
����܂��B
^
p1��-1���w�肷��ƁA�f�t�H���g�l��ݒ肷�邱�Ƃ��ł��܂��B�@���̒l�́A
es_set���߂����s�������ɐݒ肳���l�ŁA�����l��128�ƂȂ��Ă��܂��B




%index
es_effect
�X�v���C�g������ʐݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5,p6,p7,p8,p9
p1=�X�v���C�gNo.
p2,p3=�\���T�C�Y
p4,p5,p6=��]�p
p7=�u�����h�t�@�N�^�[(-1�ō���OFF)
p8=���l(0�`256)
p9=���C�g�F(0�`$ffffff)
%inst
�X�v���C�g��Direct3D�`�悷��ۂ̃G�t�F�N�g��ݒ肵�܂��B�ȗ����ꂽ�p��
���[�^�͑O����s���̐ݒ��ێ����܂��B
��]�p�̗L���͈͂�es_excopy���߂ƈ���� es_ini���߂ł̐ݒ�Ɉˑ����܂�
�̂Œ��ӂ��Ă��������B
^
���̖��߂����s����ɂ́A es_screen���߂�Direct3D���g�p����悤�Ɏw�肷
��K�v������܂��B
^
�Ȃ��A���o�[�W�����ł͉�]���s���Ă������蔻�肪�ς��܂���̂Œ��ӂ�
�Ă��������B




%index
es_pat
�L�����N�^�摜��`
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4
p1=�L�����N�^No.
p2=�L�����N�^�p�^�[���̍���X���W
p3=�L�����N�^�p�^�[���̍���Y���W
p4=�\���t���[����(0)
%inst
�X�v���C�g�̃L�����N�^�p�^�[�����`���܂��B
^
p1�Ŏw�肵���L�����N�^No.�ɁA (p2,p3)�̍��W����es_size�Őݒ肵���傫��
�̃L�����N�^���o�^����܂��B �����őΏۂƂȂ�摜�́A���O��es_buffer��
�߂�VRAM�ɓ]�����ꂽ�摜�f�[�^�ƂȂ�܂��B���̉摜�̒��̈ꕔ��؂�o��
�Ă��ăL�����N�^�p�^�[���Ƃ��ēo�^���Ă����܂��B
es_pat����1��ŁA�w�肵���L�����N�^No.�ɃL�����N�^�p�^�[�����o�^�����
���B��������̃L�����N�^�p�^�[�����K�v�ȏꍇ�́A���̂Ԃ�o�^�����Ă���
�K�v������܂��B
^
p4�̃p�����[�^�́A�L�����N�^�A�j���[�V���������邽�߂̐ݒ�ł��B
0�Ȃ�΁A�A�j���[�V�����Ȃ��B1�ȏ�Ȃ�΁A�w�肵���t���[�����������̃L
�����N�^��\��������A ���̃L�����N�^(�L�����N�^No.+1)��\������悤��
�ݒ肳��܂��B
%href
es_link


%index
es_setp
�X�v���C�g�p�����[�^�ݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2,p3
p1=�X�v���C�gNo.
p2=info number
p3=�ύX����l(-32768�`32767)
%inst
�X�v���C�g�̏��𒼐ڕύX���܂��Bp2�ɂ��Ă�es_get�̐������Q�Ƃ��Ă�
�������B
%href
es_get


%index
es_expat
�L�����N�^�摜��`(�}�N��)
%group
�g����ʐ��䖽��
%prm
p1,p2,p3,p4,p5
p1=�L�����N�^No.
p2=�o�b�t�@No.
p3=�L�����N�^�p�^�[���̍���X���W
p4=�L�����N�^�p�^�[���̍���Y���W
p5=�\���t���[����
%inst
�X�v���C�g�̃L�����N�^�p�^�[�����`���܂��Bes_pat���߂ɁA�o�^����摜
�̃o�b�t�@No.���w��ł���悤�ɂ������̂ł��B
^
�}�N���̂��߁Aes_pat���߂ƈႢ�p�����[�^���ȗ��ł��܂���̂Œ��ӂ��Ă�
�������B
%href
es_pat


%index
es_setpri
�X�v���C�g�D�揇�ʐݒ�
%group
�g����ʐ��䖽��
%prm
p1,p2
p1=�X�v���C�gNo.
p2=�D�揇��(-32768�`32767)
%inst
�X�v���C�g�̗D�揇�ʂ�ύX���܂��B
%href
es_set
es_draw

