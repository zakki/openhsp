
	;
	;	hs�t�@�C�����������߂̃��W���[��
	;	HSP3�p( onion software/onitama 1999-2020 )
	;
	;   *���̃��W���[���͎��R�ɑg�ݍ���Œ����č\���܂���
	;
	;	ihelp_init
	;		�ϐ��̏��������s�Ȃ��܂��B
	;		�X�N���v�g�̍ŏ��Ɂu#include "mod_hs.as"�v������
	;		�K���n�߂�ihelp_init��ʂ�悤�ɂ��Ă��������B
	;
	;	ihelp_find "keyword"
	;		( keyword = �����L�[���[�h )
	;		�w�肳�ꂽ�L�[���[�h���������܂��B
	;		�����ɊY�����鍀�ڐ����V�X�e���ϐ�stat�ɁA
	;		�����ɊY�������L�[���[�h�ꗗ��ih_ansbuf�ɕԂ�܂��B
	;		�����̂��߂ɂ́A�C���f�b�N�X�t�@�C��(hsphelp.idx)��
	;		�J�����g�f�B���N�g���ɂ���K�v������܂��B
	;
	;	ihelp_open n
	;		( n=���No. )
	;		�L�[���[�h�����̒�����An�Ԗ�(0�`)�̍��ڂ��擾���܂��B
	;		�擾�������́Aih_info���n�߂Ƃ���e��ϐ��ɑ������܂��B
	;
	;	ihelp_info
	;		ihelp_open�����ł͎擾����Ȃ��A�g�����𓾂܂��B
	;		���ʂ́Aih_opt�ɑ������܂��B
	;

*ihelp_init
	;
	;	hs�t�@�C�����C�u����������
	;	(�Q�Ɨp�O���[�o���ϐ�)
	;
	sdim ih_ansbuf,$8000			; �������o�b�t�@
	sdim ih_info,$8000				; ���b�Z�[�W�\���o�b�t�@(32K)
	sdim ih_refinf,$4000			; �֘A���ڕ\���o�b�t�@(16K)
	sdim ih_refsel,$4000			; �֘A���ڕ\���o�b�t�@(16K)
	sdim ih_group,256
	sdim ih_ans_key,64
	sdim ih_ans_name,64
	sdim ih_ans_title,256
	sdim ih_ans_dll,64
	sdim ih_prgsmp,$4000			; �T���v�����(16K)
	sdim ih_prminf,$4000			; �p�����[�^���(16K)
	sdim ih_fncprm,$1000			; �p�����[�^���2(4K)
	sdim ih_opt,$4000				; �ڍ׏��\���o�b�t�@(16K)

	ih_htmopt = 0					; html�o�� ON/OFF flag


#module "ihelp"
#deffunc ihelp_open int _p1
*gethelp
	;	hs�t�@�C���ǂݍ���
	;		ihelp_find�̌��ʕϐ������Ƃ�help�f�[�^�擾
	;		ihelp_open n ( n=�T�[�`�e�[�u��index )
	;
	lnidx=ansln._p1
	gosub *getidx
	;
	ih_ans_key@ = ans_key
	ih_ans_name@ = ans_name
	ih_ans_title@ = ans_title
	ih_ans_dll@ = ans_dll
	;
	exist ans_name
	if strsize<0 : dialog "�t�@�C��["+ans_name+"]������܂���." : lnidx=-1 : return

	;	Help��note���ڂ��擾
	;
	ih_opt@=""
	sdim ln,256
	sdim buf,$8000				; hs�ǂݍ��݃o�b�t�@
	notesel buf
	noteload ans_name			; �擪���烍�[�h
	bufmax=strlen(buf)
	i=0:c=0
*getnopt
	if i>bufmax : goto *gnlp1
	getstr ln,buf,i,0:i+=strsize
	if ln="%note" : goto *gnlp0
	if ln="%index" : goto *gnlp1
	goto *getnopt
*gnlp0
	if i>bufmax : goto *gnlp1
	getstr ln,buf,i,0:i+=strsize
	c=peek(ln,0):if c='%' : goto *gnlp1
	ih_opt@+=ln
	goto *gnlp0
*gnlp1


	;	Help�{�����擾
	;
	sdim buf,$8000				; hs�ǂݍ��݃o�b�t�@
	bload ans_name,buf,$8000,lnidx		; �w��I�t�Z�b�g���烍�[�h
	notesel buf
	bufmax=notemax
	;
	sdim ln,256
	sdim cate,256
	sdim tmp,$8000				; text�ꎞ�o�b�t�@(32K)
	sdim refsel,$4000			; ���t�@�����X���2(16K)
	;
	noteget tmp,0
	if tmp!="%index" : dialog "Help�f�[�^���ُ�ł�\nindex���č\�z���Ă�������" : lnidx=-1 : return
	;
	c=0
	a=""
	ih_info@=""
	ih_group@=""
	ih_refinf@=""
	ih_prgsmp@=""
	ih_prminf@=""
	ih_fncprm@=""
	i=1
	tagmode=0

	;	hs�t�@�C��������擾
	;
*ghlp0
	tmp=""
*ghlp1
	noteget ln,i
*ghlp1x
	c=peek(ln,0)
	if c=0 : goto *ghlp2		; NULL check
	if c=';' : goto *ghlp2		; ';' comment check
	if c=$25 : goto *ghlp3		; '%' tag check
	if c=$5e : goto *ghlp4		; '^' html tag check
	;
	if tagmode : tmp+="    "
	tmp+=ln+"\n"
*ghlp2
	i++
	if i<bufmax : goto *ghlp1
	;
	if tmp="" : goto *helpov
	goto *ghlp3

*ghlp4
	;	html����tag
	;
	c=peek(ln,1)
	if c='p' : goto *ghlp6
	if c='P' : goto *ghlp6
	ln=strmid(ln,1,256)
*ghlp5
	if ih_htmopt@ : tmp+="<BR><BR>"
	tmp+="\n"
	goto *ghlp2
*ghlp6
	tagmode=tagmode^1
	if ih_htmopt@=0 : goto *ghlp5
	;
	if tagmode : tmp+="<UL><PRE>\n" : goto *ghlp2
	tmp+="</UL></PRE>\n"
	goto *ghlp2

*ghlp3
	;	�J�e�S���[����
	;
	if cate="prm" : ih_prminf@=tmp
	if cate="inst" : ih_info@=tmp
	if cate="href" : gosub *getref
	if cate="group" : ih_group@=tmp
	if cate="sample" : ih_prgsmp@=tmp
	if cate="index" : goto *helpov
	;
	tagmode=0
	cate=strmid(ln,1,64)
	i++
	if i<bufmax : goto *ghlp0
	;
*helpov
	fncprm=""
	getstr ih_fncprm@,ih_prminf@,0,0		; �֐��p�����[�^���擾	
	ih_prminf@=strmid(ih_prminf@,strsize,4096)	; �c����p�����[�^�����Ƃ���
	;
	notesel refsel : i=notemax
	ih_refsel@="�֘A"+i+"����\n"
	ih_refsel@+=refsel
	;
	return


*getref
	;	���t�@�����X�����擾
	;		tmp -> refinf & refsel
	;
	sdim rs,128
	sdim rs2,128
	ridx=0:ridx2=0:rchr=0
	ih_refinf@=""
	refsel=""
*gref1
	getstr rs,tmp,ridx,0
	ridx+=strsize
	if strsize=0 : return
	;
	rchr=peek(rs,0)
	if rchr!=$22 : goto *gref3
	;
	ridx2=instr(rs,1,"\"")
	if ridx2<1 : goto *gref1
	poke rs,ridx2+1,0
	rs2=peek(rs,1)
	refsel+=rs2+"\n"
	rs2=peek(rs,ridx2+2)
	ih_refinf@+=rs2+"\n"
	goto *gref1
*gref3
	ih_refinf@+=rs+"\n"
	refsel+=rs+"\n"
	goto *gref1

*getidx
	;
	;	idx���e�擾(lnidx=�sindex)
	;		ans_name : hs�t�@�C����
	;		ans_title : ���ڃ^�C�g��
	;
	if lnidx<0 : return
	;
	sdim ln2,256
	sdim ans_key,64
	sdim ans_name,64
	sdim ans_title,256
	sdim ans_dll,64
	;
	i=lnidx
	getstr ans_key,wrt,i			; index���擾
	i+=strsize
	getstr ln2,wrt,i			; index�̎��s���擾
	;
	i=0
	getstr a,ln2,i,','			; offset���擾
	i+=strsize:lnidx=0+a
	getstr ans_name,ln2,i,','		; ans_name���擾
	i+=strsize
	getstr ans_dll,ln2,i,','		; ans_dll���擾
	i+=strsize
	getstr ans_title,ln2,i			; ans_title���擾
	;
	return




#deffunc ihelp_info
*getprop
	;	hs�t�@�C���ǂݍ���
	;		lnidx�܂ł̏ڍ׃f�[�^�擾
	;
	ih_opt=""
	exist ans_name
	if strsize<0 : dialog "�t�@�C��["+ans_name+"]������܂���." : return
	;
	sdim buf,strsize+4			; hs�ǂݍ��݃o�b�t�@
	sdim a,256
	sdim ln,256
	sdim iopt,256,6				; �ڍ׃f�[�^�i�[�o�b�t�@

	;	 �ڍ׏��table
	;
	;
	bload ans_name,buf
	bufmax=strlen(buf)
	if lnidx>bufmax : return

	i=0
*prlp1
	if i>=lnidx : goto *prfin		; �I���`�F�b�N
	;
	getstr ln,buf,i,0:i+=strsize
	c=peek(ln,0)
	if c!=$25 : goto *prlp1			; '%' check
	;
	j=-1
	a=strmid(ln,1,64)
	if a="type"   : j=0
	if a="ver"    : j=1
	if a="date"   : j=2
	if a="author" : j=3
	if a="note"   : j=4
	if a="url"    : j=5
	;
	if j<0 : goto *prlp1
	;
	getstr ln,buf,i,0:i+=strsize
	iopt.j=ln
	goto *prlp1

*prfin
	ih_opt@="[���] "+iopt.0+"\n[�O���[�v]"+ih_group@+"[Version] "+iopt.1+"\n[�쐬��] "+iopt.2+"\n[�쐬��] "+iopt.3+"\n[URL]"+iopt.5+"\n[���l]\n"+iopt.4
	return



#deffunc ihelp_find str _p1
*chkidx
	;	idx�T�[�`(in:�����L�[������)
	;		 (stat��lnnum���Ԃ�)
	;		lnnum   : match�� ( 0 = not found )
	;		ansln.x : lnidx�l
	;		ansbuf  : ����index (note�`��)
	;
	mref _stat,64
	a=_p1					; �ϐ�a = �p�����[�^1
	;
	fname2="hsphelp.idx"			; idx�t�@�C����
	exist fname2
	if strsize<1 : dialog "idx�t�@�C��������܂���.\n�uindex�쐬�v�ŃC���f�b�N�X�t�@�C�����쐬���Ă��������B" : return
	;
	sdim wrt,strsize+4			; idx�o�b�t�@���m��
	bload fname2,wrt
	;
	dim ansln,$1000				; �T�[�`����line�o�b�t�@(4096)
	sdim ansbuf,$8000			; �T�[�`���ʃo�b�t�@
	;
	sdim ln,256
	sdim ln2,256
	i=0:c=0
	lnnum=0
	c=strlen(a)
*idsrc
	getstr ln,wrt,i				; lnidx���擾
	if strsize=0 : goto *chkfin
	ln2=ln
	poke ln2,c,0				; ln2��a�Ɠ��������ɍ��킹��

	if ln2=a : ansln.lnnum=i : ansbuf+=ln+"\n" : lnnum+
	i+=strsize
	getstr ln,wrt,i:i+=strsize		; 1�s��ǂݔ�΂�

	goto *idsrc

*chkfin
	_stat = lnnum
	ih_ansbuf@ = ansbuf
	return



#global

