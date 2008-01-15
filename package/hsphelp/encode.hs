%dll
encode

%author
onitama

%note
encode.as���C���N���[�h���邱�ƁB
InternetExplorer 4.0�ȍ~���C���X�g�[������Ă���K�v������܂��B

%port
Win
Cli

%group
�����񑀍얽��

%type
���[�U�[�g������

%date
2007/12/03
%index
sjis2eucjp
�V�t�gJIS��EUC-JP�֕ϊ�

%prm
p1, p2
p1 : �ϊ������������������ϐ�
p2 : �ϊ����镶����

%sample
#include "encode.as"
	before = "�ϊ��Ώە�����"
	sjis2eucjp after, before
	mes after // �ϊ�����Ă��邽�ߕ�����������
	stop

%url
http://ja.wikipedia.org/wiki/EUC-JP

%href
sjis2jis
sjis2utf7n
sjis2utf8n
eucjp2sjis
%index
sjis2jis
�V�t�gJIS��JIS�֕ϊ�

%prm
p1, p2
p1 : �ϊ������������������ϐ�
p2 : �ϊ����镶����

%sample
#include "encode.as"
	before = "�ϊ��Ώە�����"
	sjis2jis after, before
	mes after // �ϊ�����Ă��邽�ߕ�����������
	stop

%href
sjis2eucjp
sjis2utf7n
sjis2utf8n
jis2sjis

%index
sjis2utf7n
�V�t�gJIS��UTF-7�֕ϊ�

%prm
p1, p2
p1 : �ϊ������������������ϐ�
p2 : �ϊ����镶����

%sample
#include "encode.as"
	before = "�ϊ��Ώە�����"
	sjis2utf7n after, before
	mes after // �ϊ�����Ă��邽�ߕ�����������
	stop

%href
sjis2eucjp
sjis2jis
sjis2utf8n
utf7n2sjis
%index
sjis2utf8n
�V�t�gJIS��UTF-8�֕ϊ�

%prm
p1, p2
p1 : �ϊ������������������ϐ�
p2 : �ϊ����镶����

%sample
#include "encode.as"
	before = "�ϊ��Ώە�����"
	sjis2utf8n after, before
	mes after // �ϊ�����Ă��邽�ߕ�����������
	stop

%url
http://ja.wikipedia.org/wiki/UTF-8

%href
utf8n2sjis
sjis2eucjp
sjis2jis
sjis2utf7n
%index
eucjp2sjis
EUC-JP���V�t�gJIS�֕ϊ�

%prm
(p1)
p1 : �ϊ�����EUC-JP�̕�����

%sample
#include "encode.as"
	before = "�ϊ��Ώە�����"
	sjis2eucjp after, before
	mes after             // �ϊ�����Ă��邽�ߕ�����������
	mes eucjp2sjis(after) // �����������Ȃ�
	stop

%url
http://ja.wikipedia.org/wiki/EUC-JP

%href
sjis2eucjp
jis2sjis
utf7n2sjis
utf8n2sjis
%index
jis2sjis
JIS���V�t�gJIS�֕ϊ�

%prm
(p1)
p1 : �ϊ�����JIS�̕�����

%sample
#include "encode.as"
	before = "�ϊ��Ώە�����"
	sjis2jis after, before
	mes after             // �ϊ�����Ă��邽�ߕ�����������
	mes jis2sjis(after) // �����������Ȃ�
	stop

%href
sjis2jis
eucjp2sjis
utf7n2sjis
utf8n2sjis
%index
utf7n2sjis
UTF-7���V�t�gJIS�֕ϊ�

%prm
(p1)
p1 : �ϊ�����UTF-7�̕�����

%sample
#include "encode.as"
	before = "�ϊ��Ώە�����"
	sjis2utf7n after, before
	mes after             // �ϊ�����Ă��邽�ߕ�����������
	mes utf7n2sjis(after) // �����������Ȃ�
	stop

%href
sjis2utf7n
eucjp2sjis
jis2sjis
utf8n2sjis
%index
utf8n2sjis
UTF-8�̕�������V�t�gJIS�֕ϊ�

%prm
(p1)
p1 : �ϊ�����UTF-8�̕�����

%sample
#include "encode.as"
	before = "�ϊ��Ώە�����"
	sjis2utf8n after, before
	mes after             // �ϊ�����Ă��邽�ߕ�����������
	mes utf8n2sjis(after) // �����������Ȃ�
	stop

%url
http://ja.wikipedia.org/wiki/UTF-8

%href
sjis2utf8n
eucjp2sjis
jis2sjis
utf7n2sjis
