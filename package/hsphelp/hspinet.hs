;
;	HSP help manager�p HELP�\�[�X�t�@�C��
;	(�擪���u;�v�̍s�̓R�����g�Ƃ��ď�������܂�)
;

%type
�g������
%ver
3.1
%note
hspinet.as���C���N���[�h���邱�ƁB

%date
2005/06/28
%author
onitama
%dll
hspinet
%url
http://www.onionsoft.net/hsp/
%port
Win


%index
netinit
�l�b�g�ڑ��̏�����
%group
�g�����o�͐��䖽��
%inst
Wininet.dll�̏��������s�Ȃ��܂��B
net�`�Ŏn�܂閽�߂��g�p����ۂɂ́A�ŏ��ɂP�񂾂��K�����s����K�v������܂��B
���s��Ɍ��ʂ��V�X�e���ϐ�stat�Ɋi�[����܂��B
0�Ȃ�ΐ���I���A����ȊO�̓G���[�������������Ƃ������Ă��܂��B
%href
netterm



%index
netterm
�l�b�g�ڑ��̏I��
%group
�g�����o�͐��䖽��
%inst
Wininet.dll�̏I���������s�Ȃ��܂��B
�ʏ�A���̖��߂̓v���O�����I�����Ɏ����I�ɌĂяo����邽�߁A���ɃX�N���v�g�ɋL�q����K�v�͂���܂���B
%href
netinit



%index
netexec
�ŏ��P�ʂ̏��������s
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �����̌��ʂ���������ϐ�

%inst
�ŏ��P�ʂ̏��������s���܂��B
�T�[�o�[����̉����҂���A�_�E�����[�h���Ȃǎ��Ԃ̂����鏈�����ׂ����P�ʂŎ��s���܂��B
���C���v���O�����ł́Aawait���߂Ȃǂōׂ����҂�����(�E�F�C�g)�����Ȃ���netexec���߂��Ăяo���K�v������܂��B
^p
��:
	;	���ʑ҂��̂��߂̃��[�v
	repeat
	netexec res
	if res : break
	await 50
	loop
^p
���s��A���ʂ�p1�Ŏw�肳�ꂽ�ϐ��ɑ������܂��B
���e��0�̏ꍇ�́A�������p�����ł��邱�Ƃ��Ӗ����܂��B
���e��1�̏ꍇ�́A����������ɏI�����Ă��邱�Ƃ��Ӗ����܂��B
���e���}�C�i�X�l�̏ꍇ�́A���炩�̃G���[�������������Ƃ������Ă��܂��B
stat��0�ȊO�̒l�ɂȂ����ꍇ�́A����ɉ�����������K�X�X�N���v�g���ŏ�������悤�ɂ��Ă��������B

%href
netmode
netsize



%index
netmode
���[�h�̎擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : ���[�h�l����������ϐ�

%inst
���݂̏������[�h���擾���܂��B
p1�Ŏw�肳�ꂽ�ϐ��Ƀ��[�h�l���������܂��B
���[�h�l�̓��e�͈ȉ��̒ʂ�ł��B
http���N�G�X�g�́AINET_MODE_READY�̏�ԂŔ��s����悤�ɂ��Ă��������B
ftp���N�G�X�g�́AINET_MODE_FTPREADY�̏�ԂŔ��s����悤�ɂ��Ă��������B
^p
���x��             | �l    ���
------------------------------------------------------
INET_MODE_NONE     |  0    ���������̏��
INET_MODE_READY    |  1    �ҋ@���
INET_MODE_REQUEST  |  2    http���N�G�X�g��t
INET_MODE_REQSEND  |  3    http���N�G�X�g���M��
INET_MODE_DATAWAIT |  4    http�f�[�^��M��
INET_MODE_DATAEND  |  5    http�f�[�^��M�I��������
INET_MODE_INFOREQ  |  6    http��񃊃N�G�X�g���M��
INET_MODE_INFORECV |  7    http���f�[�^��M��
INET_MODE_FTPREADY |  8    ftp�ҋ@���
INET_MODE_FTPDIR   |  9    ftp�f�B���N�g�����擾��
INET_MODE_FTPREAD  |  10   ftp�t�@�C����M��
INET_MODE_FTPWRITE |  11   ftp�t�@�C�����M��
INET_MODE_FTPCMD   |  12   ftp�R�}���h���M�I��������
INET_MODE_FTPRESULT|  13   ftp�T�[�o�[�ԐM�f�[�^��M��
INET_MODE_ERROR    |  14   �G���[���
^p

%href
netexec



%index
neterror
�l�b�g�G���[������̎擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �G���[�����񂪑�������ϐ�

%inst
�G���[�������̏ڍׂ�������������擾���܂��B
p1�Ŏw�肵���ϐ��ɁA������Ƃ��đ������܂��B



%index
neturl
URL�̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"URL"
"URL" : URL������������

%inst
http���N�G�X�g���s�Ȃ�URL��ݒ肵�܂��B
URL�́A�t�@�C�������������`�ŃX�L�[�������܂߂Đݒ肷��K�v������܂��B
�uhttp://www.onionsoft.net/hsp/index.html�v�̏ꍇ�́A�uhttp://www.onionsoft.net/hsp/�v�܂ł�ݒ肵�Ă��������B
http���N�G�X�g�͕K���Aneturl���߂ɂ��URL�ݒ���ɍs�Ȃ��Ă����Ă��������Bneturl���ߎ��s�̎��_�ł́A�܂�http���N�G�X�g�͔��s����܂���B
http���N�G�X�g�̔��s�́Anetrequest���߂܂���netload���߂ɂ���čs�Ȃ��܂��B
%href
netrequest
netload
netfileinfo



%index
netrequest
http���N�G�X�g���s
%group
�g�����o�͐��䖽��
%prm
"FileName"
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����

%inst
http���N�G�X�g���s�Ȃ��܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
netrequest���߂�http���N�G�X�g�𔭍s������́Anetexec���߂ɂ���M�������X�N���v�g���ōs�Ȃ��K�v������܂��B
��M�����������ōs�Ȃ����߂�netload���߂��ʓr�p�ӂ���Ă��܂��B
%href
neturl
netload
netfileinfo



%index
netload
http�t�@�C���擾
%group
�g�����o�͐��䖽��
%prm
"FileName"
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����

%inst
http���N�G�X�g���s�Ȃ��܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
netload���߂́A�t�@�C���̎擾���I������܂ŁA�����𒆒f���܂��B
��y�Ƀt�@�C���̎擾���s�Ȃ����Ƃ��\�ł����A�傫�ȃt�@�C�����M��Ԃ̈����ꍇ�Ȃǂ́A���̂܂܉�ʂ���~�����܂܂ɂȂ�\��������̂Œ��ӂ��Ă��������B
�t�@�C���̎�M���ɁA���s���ĕʂȏ������s�Ȃ������ꍇ�ɂ́Anetrequest���߂��g�p����http���N�G�X�g���s�Ȃ��Ă��������B
%href
neturl
netrequest
netfileinfo



%index
netfileinfo
http�t�@�C�����擾
%group
�g�����o�͐��䖽��
%prm
p1,"FileName"
p1         : �t�@�C����񂪑�������ϐ���
"FileName" : ���N�G�X�g���s�Ȃ��t�@�C����

%inst
http�T�[�o�[��ɂ���t�@�C�������擾���܂��B
��ɁAneturl���߂ɂ��t�@�C������������URL���w�肵�Ă����K�v������܂��B
�擾�ɐ�������ƁA�V�X�e���ϐ�stat�̒l��0�ƂȂ�Ap1�Ŏw�肵���ϐ��ɕ�����^�ŃT�[�o�[���Ԃ�����񕶎��񂪑������܂��B
�擾�Ɏ��s�����ꍇ�́A�V�X�e���ϐ�stat��0�ȊO���������܂��B
�T�[�o�[���Ԃ����̎�ނ́Ahttp�T�[�o�[�ɂ���ĈقȂ�܂��B
�ڂ����́ARFC�Ȃ�http�v���g�R���̉�����Q�Ƃ��Ă��������B
netfileinfo���߂́A�t�@�C���̎擾���I������܂ŁA�����𒆒f���܂��B
%href
neturl
netload



%index
netdlname
�_�E�����[�h���̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"FileName"
"FileName" : �_�E�����[�h���ꂽ���̃t�@�C����

%inst
�t�@�C�����擾����ۂ̃t�@�C������ݒ肵�܂��B
netdlname���߂ɂ���ăt�@�C������ݒ肵�Ă��Ȃ��ꍇ�́Ahttp���N�G�X�g���s�Ȃ����t�@�C�������g�p����܂��B
netdlname���߂ɁA��̕�����("")���w�肵���ꍇ���Ahttp���N�G�X�g���s�Ȃ����t�@�C�������g�p����܂��B
%href
netrequest
netload



%index
netproxy
�v���L�V�̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"ServerName",p1,p2
"ServerName" : ���N�G�X�g���s�Ȃ��t�@�C����
p1 (0)       : �|�[�g�ԍ�
p2 (0)       : ���[�J���ڑ��t���O

%inst
http�ڑ��̍ۂɎg�p�����v���L�V(�㗝)�T�[�o�[��ݒ肵�܂��B
"ServerName"�ŁA�v���L�V�T�[�o�[����ݒ肵�܂��B
��̕�����("")���w�肵���ꍇ�ɂ́A�v���L�V�͐ݒ肳��܂���B
p1��http���g�p����v���L�V�T�[�o�[�̃|�[�g�ԍ����w�肵�܂��B
p2�ŁA���[�J���A�h���X���v���L�V�o�R�̃A�N�Z�X���珜�O���邩�ǂ�����ݒ肵�܂��B1�̏ꍇ�́A���[�J���A�h���X�̂݃v���L�V���珜�O����܂��B0�̏ꍇ�́A���[�J���A�h���X���܂߂ăv���L�V���g�p���܂��B
netproxy���߂����s�����ƁA����܂ł̃Z�b�V��������������Aneturl���߂�Anetheader���߂ɂ��ݒ�̓��Z�b�g����܂��B
^p
	��:
	netinit
	if stat : dialog "�l�b�g�ڑ��ł��܂���B" : end
	netproxy "proxy_server",8080,1
	neturl "http://www.onionsoft.net/hsp/"
	netload "index.html"
^p
%href
netagent
netheader



%index
netagent
�G�[�W�F���g�̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"AgentName"
"AgentName" : �ݒ肷��G�[�W�F���g��

%inst
http�ڑ��̍ۂɃT�[�o�[�ɓn�����G�[�W�F���g���̕������ݒ肵�܂��B"AgentName"�Ŏw�肵���G�[�W�F���g�����ݒ肳��܂��B
��̕�����("")���w�肵���ꍇ�ɂ́A�f�t�H���g�̐ݒ�ɂȂ�܂��B
netagent���߂����s�����ƁA����܂ł̃Z�b�V��������������Aneturl���߂�Anetheader���߂ɂ��ݒ�̓��Z�b�g����܂��B
%href
netproxy
netheader



%index
netheader
�w�b�_������̐ݒ�
%group
�g�����o�͐��䖽��
%prm
"HeaderString"
"HeaderString" : �w�b�_�ɒǉ�����镶����

%inst
http�ڑ��̍ۂɃT�[�o�[�ɓn�����w�b�_�������ݒ肵�܂��B
��̕�����("")���w�肵���ꍇ�ɂ́A���ݒ�ɂȂ�܂��B
�w�b�_������́A�ʏ�ݒ肷��K�v����܂��񂪁A������̕t�����⓮��ݒ���s�Ȃ��ꍇ�Ɏg�p���邱�Ƃ��ł��܂��B
netheader���߂Őݒ肵���w�b�_������́A����ȍ~�̃��N�G�X�g���ׂĂɓK�p����܂��B
^p
	��:
	; ���t�@���[��ǉ�����
	netheader "Referer:http://www.onionsoft.net/\n\n"
^p
%href
netagent



%index
netsize
�t�@�C����M�T�C�Y�̎擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �t�@�C����M�T�C�Y����������ϐ�

%inst
netrequest���߂Ŕ��s���ꂽhttp���N�G�X�g�ɑ΂���t�@�C�����ǂꂾ���̃T�C�Y����M���������擾���܂��B
p1�Ŏw�肳�ꂽ�ϐ��Ƀt�@�C����M�T�C�Y���������܂��B
�t�@�C����M�T�C�Y�́Anetexec���߂Ŏ�M���s�Ȃ�ꂽ���e�𒲂ׂ邽�߂̂��̂ł��B���炩���߁A�t�@�C�����擾�Ńt�@�C���T�C�Y�𒲂ׂĂ����΁A�i�s�̊������v�邱�Ƃ��\�ł��B
%href
netexec



%index
filecrc
�t�@�C����CRC32���擾
%group
�g�����o�͐��䖽��
%prm
p1,"FileName"
p1         : CRC�l����������ϐ���
"FileName" : CRC�`�F�b�N���s�Ȃ��t�@�C����

%inst
�w�肳�ꂽ�t�@�C����CRC32�����߂�p1�̕ϐ��ɑ�����܂��B
CRC32�́A�t�@�C���̓��e�����ƂɎZ�o���ꂽ32bit�̐��l�ł��B
�t�@�C�����e�̃`�F�b�N�ȂǂɎg�p���邱�Ƃ��ł��܂��B
%href
filemd5



%index
filemd5
�t�@�C����MD5���擾
%group
�g�����o�͐��䖽��
%prm
p1,"FileName"
p1         : MD5�l����������ϐ���
"FileName" : MD5�`�F�b�N���s�Ȃ��t�@�C����

%inst
�w�肳�ꂽ�t�@�C����MD5�����߂�p1�̕ϐ��ɑ�����܂��B
MD5�l�́A������^�Łuf96b697d7cb7938d525a2f31aaf161d0�v�̂悤��32������16�i���Ƃ��ĕ\������܂��B
MD5�l�́A�t�@�C���̓��e����ӂɕ\�킷�n�b�V���l�Ƃ��Ďg�p���邱�Ƃ��ł��܂��B�ڂ����́AMD5�ɂ��Ă̎����Ȃǂ��Q�Ƃ��Ă��������B
�t�@�C�����e�̃`�F�b�N�ȂǂɎg�p���邱�Ƃ��ł��܂��B
%href
filecrc



%index
ftpopen
FTP�Z�b�V�����̊J�n
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3,p4
p1 : ftp�T�[�o�[�A�h���X(������)
p2 : ftp���O�C�����[�U�[��(������)
p3 : ftp���O�C�����[�U�[�p�X���[�h(������)
p4 : �|�[�g�ԍ�(�ȗ��\)

%inst
ftp�T�[�o�[�ɐڑ����ăZ�b�V�������J�n���܂��B
p1�ɃT�[�o�[�̃A�h���X�Ap2�Ƀ��[�U�[���Ap3�Ƀp�X���[�h���w�肵��ftp�ɐڑ����܂��B
p4�p�����[�^�[�Ń|�[�g�ԍ����w�肷�邱�Ƃ��ł��܂��B
p4�̎w����ȗ������ꍇ�́A�W���̃|�[�g�ԍ����g�p����܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���炩���߁Anetinit���߂ɂ���ď��������s�Ȃ��K�v������܂��B
ftp�Z�b�V�������J�n������́Aftp�֘A���߂̂ݎg�p���邱�Ƃ��ł��܂��Bhttp�ȂǑ��̃l�b�g������s�Ȃ��ꍇ�ɂ́A�K��ftpclose���߂ɂ��ftp�Z�b�V�������I��������悤�ɂ��Ă��������B

%href
ftpclose


%index
ftpclose
FTP�Z�b�V�����̏I��
%group
�g�����o�͐��䖽��

%inst
ftpopen���߂ŊJ�n���ꂽ�Z�b�V�������I�������܂��B

%href
ftpopen


%index
ftpresult
FTP�������ʕ�����̎擾
%group
�g�����o�͐��䖽��
%prm
p1
p1 : FTP�������ʕ����񂪑�������ϐ�

%inst
ftp�֘A���߂ɂ�鏈���ɑ΂���T�[�o�[�̕ԐM���b�Z�[�W��
�擾���āAp1�Ɏw�肳�ꂽ�ϐ��ɑ�����܂��B
p1�̕ϐ��ɂ́A������f�[�^�Ƃ��đ������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen


%index
ftpdir
FTP�f�B���N�g���ړ�
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1 : ���݂̃f�B���N�g���ʒu����������ϐ�
p2 : �ړ���̃f�B���N�g����(������)

%inst
p1�Ŏw�肵���ϐ��ɁAftp�T�[�o�[��̃J�����g�f�B���N�g�����𕶎���f�[�^�Ƃ��đ�����܂��B
p2�Ƀf�B���N�g�������w�肵���ꍇ�ɂ́A���̏ꏊ�ֈړ����s�Ȃ��܂��B
p2�̎w����ȗ������ꍇ�ɂ́A�f�B���N�g���ړ��͍s�Ȃ��܂���B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen


%index
ftpdirlist
FTP�f�B���N�g�����X�g�擾1
%group
�g�����o�͐��䖽��

%inst
ftp�T�[�o�[��̃J�����g�f�B���N�g���ɂ���t�@�C�����X�g���擾���邽�߂̃��N�G�X�g���s�Ȃ��܂��B
���ۂ̃t�@�C�����X�g�́Aftpdirlist2���߂ōs�Ȃ��܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpdirlist2


%index
ftpdirlist2
FTP�f�B���N�g�����X�g�擾2
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �t�@�C�����X�g����������ϐ�

%inst
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Aftpdirlist���߂ɂ��t�@�C�����X�g�擾���I��������Ŏg�p���Ă��������B
�ȉ��́A�t�@�C�����X�g�擾����܂ł̗�ł��B
^p
��:
	;	���ʑ҂��̂��߂̃��[�v
	ftpdirlist
	repeat
	netexec mode
	if res : break
	await 50
	loop
	ftpdirlist2 res
^p
�t�@�C�����X�g�擾�́Aftpdirlist���߂ɂ�郊�N�G�X�g�Anetexec���߂ɂ���M�҂��Aftpdirlist2���߂ɂ�錋�ʂ̎擾�Ƃ����R�̎菇�ɕ����čs�Ȃ��K�v������܂��B
p1�ɑ�������t�@�C�����X�g�́A�P�s������P�G���g�����Ƃɋ�؂��Ă��镡���s������f�[�^�ɂȂ�܂��B
�P�s�́A�u"�t�@�C����"�v�A�t�@�C���T�C�Y�A�X�V�����̏��ԂɁu,�v�ŋ�؂�ꂽ�`�ɂȂ�܂��B

%href
ftpopen
ftpdirlist
netexec


%index
ftpcmd
FTP�R�}���h�̎��s
%group
�g�����o�͐��䖽��
%prm
p1
p1 : ���s����FTP�R�}���h������

%inst
p1�Ŏw�肳�ꂽFTP�R�}���h�����s���܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen


%index
ftprmdir
FTP�f�B���N�g���̍폜
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �폜����f�B���N�g��������������

%inst
p1�Ŏw�肳�ꂽ�f�B���N�g�����폜���܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A
���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpmkdir


%index
ftpmkdir
FTP�f�B���N�g���̍쐬
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �쐬����f�B���N�g��������������

%inst
p1�Ŏw�肳�ꂽ�f�B���N�g�����쐬���܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftprmdir


%index
ftpget
FTP�t�@�C���擾
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1     : �T�[�o�[�ォ��擾����t�@�C����(������)
p2("") : ���[�J���ɍ쐬�����t�@�C����(������)
p3(0)  : �]�����[�h(0=�o�C�i��/1=�A�X�L�[)

%inst
ftp�T�[�o�[��̃t�@�C�����擾���܂��B
p1�ŃT�[�o�[��̃t�@�C�������w�肵�܂��B
p2�Ń_�E�����[�h���č쐬�����t�@�C�������w�肵�܂��B
p2�̎w����ȗ��܂���""�ɂ����ꍇ�́Ap1�Ɠ������O���g�p����܂��B
p3�œ]�����[�h���w�肵�܂��B�]�����[�h���ȗ��܂���0�Ɏw�肵���ꍇ�̓o�C�i���f�[�^�Ƃ��āA1�Ɏw�肵���ꍇ�́A�A�X�L�[�f�[�^�Ƃ��ē]�����s�Ȃ��܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpput


%index
ftpput
FTP�t�@�C�����M
%group
�g�����o�͐��䖽��
%prm
p1,p2,p3
p1     : �T�[�o�[��ɍ쐬����t�@�C����(������)
p2("") : ���[�J�����瑗�M�����t�@�C����(������)
p3(0)  : �]�����[�h(0=�o�C�i��/1=�A�X�L�[)

%inst
ftp�T�[�o�[��Ƀt�@�C���𑗐M���܂��B
p1�ŃT�[�o�[��ɍ쐬����t�@�C�������w�肵�܂��B
p2�Ń��[�J�����瑗�M�����t�@�C�������w�肵�܂��B
p2�̎w����ȗ��܂���""�ɂ����ꍇ�́Ap1�Ɠ������O���g�p����܂��B
p3�œ]�����[�h���w�肵�܂��B�]�����[�h���ȗ��܂���0�Ɏw�肵���ꍇ�̓o�C�i���f�[�^�Ƃ��āA1�Ɏw�肵���ꍇ�́A�A�X�L�[�f�[�^�Ƃ��ē]�����s�Ȃ��܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpget


%index
ftprename
FTP�t�@�C�����O�ύX
%group
�g�����o�͐��䖽��
%prm
p1,p2
p1 : �ύX���̃t�@�C����(������)
p2 : �V�����t�@�C����(������)

%inst
ftp�T�[�o�[��̃t�@�C������ύX���܂��B
p1�ŕύX���̃t�@�C�������Ap2�ŐV�����t�@�C�������w�肵�܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftpdelete


%index
ftpdelete
FTP�t�@�C���폜
%group
�g�����o�͐��䖽��
%prm
p1
p1 : �폜����t�@�C����(������)

%inst
ftp�T�[�o�[��̃t�@�C�����폜���܂��B
���s�ɐ��������ꍇ�́A�V�X�e���ϐ�stat��0���������A���s�����ꍇ�͂���ȊO�̒l���������܂��B
���̖��߂́A�K��ftpopen���߂ɂ��ftp�Z�b�V�������J�n���Ă���g�p���Ă��������B

%href
ftpopen
ftprename


