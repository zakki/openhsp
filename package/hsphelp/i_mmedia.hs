;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
��������
%ver
3.2
%note
ver3.2�W������
%date
2004/10/12
%author
onitama
%url
http://www.onionsoft.net/
%port
Win
Let



%index
mci
MCI�ɃR�}���h�𑗂�
%group
�}���`���f�B�A���䖽��
%prm
"strings"
"strings" : MCI�R�}���h������

%inst
MCI�iMultimedia Control Interface�j�ɃR�}���h������𑗂�܂��BMCI�ɑΉ�����MIDI�Đ��A���[�r�[�Đ��Ȃǂ��s�Ȃ����Ƃ��ł��܂��B
^
MCI�R�}���h�̏ڍׂɂ��ẮAWindows MCI�̉���������ǂ݂��������B�����ł͊ȒP�Ȏg�p�@�������Љ�Ă����܂��B
^p
	mci "play filename"
^p
�ŁA"filename"�̃t�@�C�����Đ����܂��B���Ƃ��΁A"play aaaa.mid"�Ȃ�΁A"aaaa.mid" �Ƃ���MIDI�t�@�C�������t���܂��B�g���q��avi�Ȃ瓮��̍Đ��Awav�Ȃ�PCM�̍Đ��A���̑�MCI�ɓo�^����Ă���f�o�C�X���Đ����邱�Ƃ��ł��܂��B
^p
	mci "open filename alias abc"
^p
�ŁA"filename"�̃t�@�C�����I�[�v�����āA����ȍ~ "abc"�Ƃ������O���G�C���A�X�ɂ��邱�Ƃ��ł��܂��B���̌�ŁA
^p
	mci "play abc"    ; �f�o�C�X�̍Đ�
	mci "stop abc"    ; �f�o�C�X�̍Đ��X�g�b�v
	mci "close abc"   ; �f�o�C�X�̃N���[�Y
^p
�Ȃǂ̎w������邱�Ƃ��ł���悤�ɂȂ�܂��B
mci�ɖ��߂𑗂����ꍇ�̌��ʂ̓V�X�e���ϐ� stat�ɔ��f����܂��B
stat ��-1�̏ꍇ�́Amci���߂����߂��鎞�_�ŃG���[���o�Ă��邱�Ƃ������Ă��܂��B�܂��Amci�ŃX�e�[�^�X��ǂݏo���R�}���h�𑗂����ꍇ���Astat �Ɍ��ʂ����f����܂��B
%portinfo
HSPLet���́A�ȉ��̖��߂̂݃T�|�[�g����܂��B

open file alias name 
play name 
seek name to position 
status name position 
stop name 
close name 

WAV/AIFF/AU/MIDI/MP3 ���T�|�[�g���Ă��܂��B MP3�̍Đ��ɂ͕t���� jl1.0.jar ���K�v�ł��B


%index
mmplay
�T�E���h�Đ�
%group
�}���`���f�B�A���䖽��
%prm
p1
p1=0�`(0) : �Đ�����o�b�t�@�̔ԍ�

%inst
mmload���߂ɂ���ēǂݍ��܂ꂽ���f�B�A���Đ����܂��B
p1�Ńo�b�t�@�̔ԍ����w�肷�邱�ƂŁAmmload���߂ɂ���ēǂݍ��܂ꂽ�����̃��f�B�A����A�ǂ���Đ����邩��I�т܂��B
^
mmplay���߂́A �ʏ�T�E���h�̍Đ����X�^�[�g����ƂƂ���HSP�͎��̖��߂ւƐi�݂܂��B
�������Ammload���߂œǂݍ��݃��[�h�Q���w�肵�Ă���ꍇ�́A�T�E���h�̍Đ����I������܂Ŏ��̖��߂ւ͐i�܂Ȃ��Ȃ�܂��B
^
���łɃT�E���h���Đ�����Ă����ԂŁA�����mmplay���߂����s����ƁA�O�̃T�E���h�Đ����I�����Ă���A�V�����w�肵���T�E���h�̍Đ����n�߂܂��B
�������AMIDI�̍Đ�����PCM���Đ�����ȂǈقȂ�f�o�C�X�̏ꍇ�́A �Đ������~����邱�Ƃ͂���܂���B
^
AVI(����)�̍Đ��́A mmplay���߂����s���ꂽ���_�ő����ƂȂ��Ă���E�C���h�D�̃J�����g�|�W�V����������Ƃ��ĕ\������܂��B
�������A mmload���߂̃��[�h��+16(�E�B���h�E�S�̂ōĐ�)���w�肳��Ă���ꍇ�́A�E�B���h�E�̕\���ʂ����ς��ɍĐ�����܂��B
���̏ꍇ�A��ʃT�C�Y��c���̔䗦�ɂ͊֌W�Ȃ��E�B���h�E�̃T�C�Y�ɕϔ{�����̂ŁA���炩���ߓ���̉�ʃT�C�Y��c������l������ŗ��p���ĉ������B

%href
mmload
mmstop




%index
mmload
�T�E���h�t�@�C���ǂݍ���
%group
�}���`���f�B�A���䖽��
%prm
"filename",p1,p2
p1=0�`(0)  : ���蓖�Ă�o�b�t�@�̔ԍ�
p2=0�`2(0) : ���蓖�Ă郂�[�h

%inst
���f�B�A�f�[�^�̃t�@�C����o�^���܂��B
�ǂݍ��ނ��Ƃ��ł���`���͈ȉ��̒ʂ�ł��B
^p
WAV�`��  : �g���q WAV         : Windows�W����PCM�����f�[�^�B
AVI�`��  : �g���q AVI         : Windows�W���̓���f�[�^
MID�`��  : �g���q MID         : �W��MIDI�t�@�C���f�[�^�B
MP3�`��  : �g���q MP3         : MP3�`�������f�[�^
ASF�`��  : �g���q ASF,WMV,WMA : Windows Media�`�������f�[�^
MPEG�`�� : �g���q MPG         : MPEG�`������f�[�^
�I�[�f�B�ICD : �t�@�C���� "CD : �g���b�N�ԍ�" :
               (CD�̉����g���b�N�������ΏۂɂȂ�܂�)
^p
���Ƃ��΁A�I�[�f�B�ICD�̃g���b�N3���w�肷��ꍇ�́A
^p
	mmload "CD:3",1
^p
�̂悤�ɂ��܂��B
p1�́A���蓖�Ă�o�b�t�@�̔ԍ��ƂȂ�܂��B����́A�Đ����鎞�ɕK�v�ƂȂ�0�ȏ�̐����l�ł��B
�����̃��f�B�A�t�@�C������舵���ɂ́A�ʁX�̃o�b�t�@�ԍ��Ɋ��蓖�Ă����Ă����K�v������܂��B
mmload���߂́A�w�肳�ꂽ�t�@�C����2MB�ȉ��̉���(WAV)�t�@�C���̏ꍇ�́A�������ɓ��e��ǂݍ���ł������A���^�C���ɍĐ��\�ȏ�Ԃɂ��܂��B����ȊO�̏ꍇ�́A�t�@�C�����������o�^����A���ۂ̃t�@�C���̓ǂݏo���̓��f�B�A�Đ���(mmplay���s��)�ɍs�Ȃ��邱�ƂɂȂ�܂��B
^
p2�̓��[�h��ݒ肵�܂��B�ȉ��̒l���w�肷�邱�Ƃ��ł��܂��B
^p
���[�h0   : �w�肵���t�@�C���͒ʏ�̍Đ����s��
���[�h1   : �w�肵���t�@�C���͖������[�v�ōĐ����s��
���[�h2   : �w�肵���t�@�C���͍Đ��I���܂ő҂�
���[�h3   : (CD�̂�)�w�肳�ꂽ�g���b�N�ȍ~���Đ�����
���[�h+16 : (AVI�̂�)�ΏۃE�B���h�E�S�̂ōĐ�
^p
���[�h�Q���w�肷��ƁA�w�肵���t�@�C�����Đ����ꂽ�ꍇ�A HSP�͂��̍Đ����I������܂Ŏ��̖��߂����s���Ȃ��Ȃ�܂��B
mmload���߂̓f�[�^�̏�����������ɃX�g�b�N���Ă��������ŁA�����ɉ��t���n�܂�킯�ł͂���܂���B
^
���[�h+16�́AAVI(����)�t�@�C���ł̂ݎg�p�ł��郂�[�h�ł��B
���[�h0�`2��16�𑫂����l���w�肷�邱�ƂŁA�\���ΏۂɂȂ��Ă���E�C���h�D�̃T�C�Y�����ς��ɓ��悪�Đ�����܂��B
����t�@�C���̔��f�͊g���q�ɂ���čs�Ȃ��Ă��܂��B
^
MP3�`���A�����ASF�`����OS���T�|�[�g���Ă���ꍇ�ɂ̂ݍĐ����\�ł��B
(������Windows95�AWindows98�ł�Windows Media Player  5.2�ȍ~���C���X�g�[������Ă���K�v������܂��B)
^
���ۂ̍Đ��́Ammplay���߂ɂ���čs�Ȃ��܂��B

%href
mmplay
mmstop
%portinfo
HSPLet���AWAV/AIFF/AU/MIDI/MP3 ���T�|�[�g���Ă��܂��B MP3�̍Đ��ɂ͕t���� jl1.0.jar ���K�v�ł��B



%index
mmstop
�T�E���h��~
%group
�}���`���f�B�A���䖽��
%prm


%inst
mmplay���߂ɂ�郁�f�B�A�Đ����~���܂��B

%href
mmplay
mmload


