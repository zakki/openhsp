;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.7
%note
hgimg3.as�܂���hspogg.as���C���N���[�h���邱�ƁB

%date
2022/10/23
%author
onitama
%dll
hspogg
%url
https://hsp.tv/
%port
Win
%portinfo
Windows XP�ȍ~(DirectX7)�����K�v�ł��B





%index
dmmini
�T�E���h�@�\������
%group
�g���}���`���f�B�A���䖽��
%prm
%inst
�T�E���h�@�\�̏��������s�Ȃ��܂��B
�v���O�������s���̍ŏ��ɂP�񂾂����������s�Ȃ��K�v������܂��B
����ȍ~�́Admm�`�Ŏn�܂閽�߂��g�p���āADirectSound�ɂ��T�E���h�Đ��@�\���g�p���邱�Ƃ��\�ɂȂ�܂��B
dmmini���߂ɂ��A���������s�Ȃ�ꂽ���ɂ̂݃T�E���h�@�\���g�p����܂��B
HGIMG3�g�p���ł��A�T�E���h�֘A�@�\�̏��������s�Ȃ��Ȃ��ꍇ�́ADirectSound�ȂǃT�E���h�Ɋւ���API���g�p����邱�Ƃ͂���܂���B
HGIMG3�Ƒ��̃T�E���h�֘A�v���O�C�����g�p����ꍇ�́A�ʏ�ʂ肨�g�������܂��B

%href
dmmreset
dmmbye


%index
dmmreset
�T�E���h�@�\�̐ݒ�����Z�b�g
%group
�g���}���`���f�B�A���䖽��
%prm
%inst
�T�E���h�@�\�̐ݒ�����Z�b�g���܂��B
�ǂݍ��܂�Ă����A���ׂẴT�E���h�f�[�^�͔j������܂��B

%href
dmmini
dmmbye


%index
dmmbye
�T�E���h�@�\�I������
%group
�g���}���`���f�B�A���䖽��
%prm
%inst
�T�E���h�@�\�̏I���������s�Ȃ��܂��B
�ʏ�́A�I�������������I�ɍs�Ȃ���̂ŁA���̖��߂�����K�v�͂���܂���B

%href
dmmreset
dmmini


%index
dmmdel
�T�E���h�f�[�^���폜
%group
�g���}���`���f�B�A���䖽��
%prm
p1
p1(0) : �T�E���hID
%inst
p1�Ŏw�肵���T�E���hID�̏���j�����܂��B
%href
dmmload


%index
dmmvol
�T�E���h�f�[�^�̉��ʐݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1(0) : �T�E���hID
p2(0) : ����(-10000�`0)
%inst
p1�Ŏw�肵���T�E���hID�̉���(�{�����[��)��ݒ肵�܂��B
p2�Őݒ肷�鉹�ʂ��w�肵�܂��B0���ő�̉���(0db)�ƂȂ�A-10000���ŏ��̉���(����)�ɂȂ�܂��B
�ݒ�l�̒P�ʂ́Adb(�f�V�x��)�ɂȂ��Ă��邽�߁A�l�Ԃ������鉹�ʂƈقȂ��Ă��܂��B�l���������ۂɎ��R�ȉ��ʂ�ݒ肷��T���v���Ƃ��āAvolsamp.hsp���p�ӂ���Ă��܂��̂ŎQ�l�ɂ��Ă݂Ă��������B
��mmvol���߂Ƃ͒l�̕���\�A�w�肳���l�̈Ӗ����قȂ�̂Œ��ӂ��Ă�������

%href
dmmpan
dmmload


%index
dmmpan
�T�E���h�f�[�^�̃p���ݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1(0) : �T�E���hID
p2(0) : �p���j���O�l(-10000�`10000)
%inst
p1�Ŏw�肵���T�E���hID�̃p��(�X�e���I�o�����X)��ݒ肵�܂��B
p2�Őݒ肷��p���j���O�l���w�肵�܂��B
-10000�ō���100%�ƂȂ�A10000�ŉE��100%�ɂȂ�܂��B
��mmpan���߂Ƃ͒l�̕���\���قȂ�̂Œ��ӂ��Ă�������

%href
dmmvol
dmmload


%index
dmmloop
�T�E���h�f�[�^�̃��[�v�ݒ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1(0) : �T�E���hID
p2(0) : ���[�v�|�C���g(-1=���[�v�Ȃ�)
%inst
p1�Ŏw�肵���T�E���hID�̃��[�v����ݒ肵�܂��B
p2��0�ȏ�̒l���w�肵���ꍇ�ɂ́A�Đ����J��Ԃ���܂��B
p2���}�C�i�X�l�̏ꍇ�́A���[�v���s�Ȃ��܂���B
ogg�t�@�C���Đ����́Ap2�Ń��[�v�|�C���g�̎w����s�Ȃ����Ƃ��\�ł��B���[�v�|�C���g�́A�T���v���P��(44.1kHz�̏ꍇ�́A44100����1�b)�Ő��l���w�肵�܂��B

%href
dmmload


%index
dmmload
�T�E���h�f�[�^�̓ǂݍ���
%group
�g���}���`���f�B�A���䖽��
%prm
"�t�@�C����",p1,p2
"�t�@�C����" : �ǂݍ��݂��s�Ȃ��t�@�C����
p1(-1) : �o�^����T�E���hID (-1=�������蓖��)
p2(0)  : �Đ����[�h(0=�ʏ�A1=���s�[�g)
%inst
"�t�@�C����"�Ŏw�肳�ꂽ�t�@�C�����T�E���h�f�[�^�Ƃ��ēo�^���܂��B
�T�E���h�f�[�^�́Awave�`��(�g���q.wav)�܂��́Aogg vorbis�`��(�g���q.ogg)�̃t�@�C�����w�肵�܂��B
p1�ɓo�^����T�E���hID�ԍ�(0����n�܂�C�ӂ̐��l)���w�肷�邱�ƂŁA����ȍ~�̓T�E���hID�ԍ������ƂɊe��@�\���g�p���邱�Ƃ��ł���悤�ɂȂ�܂��B
p1�̎w����ȗ��A�܂��̓}�C�i�X�l�ɂ����ꍇ�́A�o�^����Ă��Ȃ��T�E���hID�ԍ��������I�Ɋ��蓖�Ă܂��B
���蓖�Ă�ꂽ�T�E���hID�ԍ��́Admmload���ߎ��s��ɃV�X�e���ϐ�stat�ɑ������܂��B
p2�ōĐ����[�h���w�肷�邱�Ƃ��ł��܂��B
�Đ����[�h���A0�̏ꍇ�͂P��݂̂̍Đ��B1�̏ꍇ�́A�J��Ԃ�(���s�[�g)�Đ��ɂȂ�܂��B(ogg vorbis�`���̌J��Ԃ��Đ��ɂ��ẮAdmmloop���߂��g�p���Ă��������B)
wave�`��(�g���q.wav)�y�сAogg vorbis�`��(�g���q.ogg)�̃t�@�C���́Amemfile���߂Ŏw�肵�����������̃C���[�W���܂߁Adpm�t�@�C���Ȃ�HSP�Ŏg�p�\�ȃt�@�C�������ׂė��p���邱�Ƃ��ł��܂��B
���̍ۂɃt�@�C���T�C�Y���̃f�[�^��ڐ���ɓW�J����̂ŁA�傫�ȃt�@�C�����g�p����ۂɂ͒��ӂ��Ă��������B
�܂��Aogg vorbis�`���Ƃ��Ċg���q�u.s�v���g�p���邱�Ƃ��\�ł��B���̏ꍇ�́A�t�@�C�����������ɓW�J�����A�X�g���[�~���O�ɂ��Đ�����܂��B�傫���T�C�Y�̃t�@�C�����Đ�����ꍇ�́A�g���q���u.s�v�Ƃ��čĐ����邱�Ƃ��������������B
%href
dmmloop
dmmdel


%index
dmmplay
�T�E���h�f�[�^�̍Đ�
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2
p1(0) : �T�E���hID
p2(0) : �J�n�|�C���g
%inst
p1�Ŏw�肵���T�E���hID���Đ����܂��B
���łɎw�肳�ꂽ�T�E���hID���Đ����̏ꍇ�́A�ŏ�����Đ�����܂��B
p2�ŊJ�n�|�C���g���w�肷�邱�Ƃ��ł��܂��B
p2���ȗ�����邩0�̏ꍇ�́A�T�E���h�f�[�^�̍ŏ�����Đ�����A����ȊO�̏ꍇ�͍ŏ�����̃I�t�Z�b�g�ʒu�Ƃ��ēr������Đ�����܂��B
p2�Ŏw�肷��P�ʂ́A�T�E���h�f�[�^��wav�`���̏ꍇ�́A�o�C�g��(byte)�B
�X�g���[���f�[�^(ogg vorbis�`��)�̏ꍇ�́A�T���v����(samples)�ɂȂ�܂��B
���A�X�g���[���f�[�^�̓����Đ��ɂ͑Ή����Ă��܂���B

%href
dmmstop
dmmvol
dmmpan
dmmloop
dmmload


%index
dmmstop
�T�E���h�f�[�^�̍Đ���~
%group
�g���}���`���f�B�A���䖽��
%prm
p1
p1(0) : �T�E���hID (-1=���ׂẴT�E���h)
%inst
p1�Ŏw�肵���T�E���hID�̍Đ����~���܂��B
p1�Ƀ}�C�i�X�l���w�肵���ꍇ�ɂ́A�Đ����̂��ׂẴT�E���h���~���܂��B

%href
dmmplay
dmmload


%index
dmmstat
�T�E���h�f�[�^�̏�Ԏ擾
%group
�g���}���`���f�B�A���䖽��
%prm
p1,p2,p3
p1 : ��Ԃ��擾�����ϐ�
p2(0) : �T�E���hID
p3(0) : �擾���[�h
%inst
p2�Ŏw�肵���T�E���hID�̏�Ԃ��擾���āAp1�̕ϐ��ɑ�����܂��B
p3�Ŏ擾���郂�[�h���w�肷�邱�Ƃ��ł��܂��B
�擾���[�h�̒l�́A�ȉ��̒ʂ�ł��B
^p
	���[�h�l  ���e
	------------------------------------------------------
	    0     �ݒ�t���O�l
	    1     �{�����[���l
	    2     �p���j���O�l
	    3     �Đ����[�g(0=�I���W�i��)
	    4,5   ���[�v�|�C���g(���ʁA���16bit)
	    16    �Đ����t���O(0=��~��/1=�Đ���)
	   $100   ogg�T�E���h�̍Đ��ʒu(�����l)
	   $101   ogg�T�E���h�̑S�̃T�C�Y(�����l)
^p

%href
dmmplay
dmmload


