
//
//	File Pack manager 2 (Write lib)
//	Copyright 2022- ONION software/onitama
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cctype>
#include <direct.h>

#ifdef HSPWIN
#include "windows.h"
#endif

#include "filepack.h"
#include "strnote.h"
#include "hsp3crypt.h"
#include "../hspcmp/membuf.h"

#define _MALLOC malloc
#define _FREE free

#define WELCOMEMSG "DPM2 Manager 1.0"
#define DPMFILEEXT ".dpm"
#define DPMENCODE_DEFVAL 0

/*------------------------------------------------------------*/
/*
		interface (write)
*/
/*------------------------------------------------------------*/

void FilePack::PrepareWrite( int slot, int encode )
{
	//	HFP作成準備
	//
	wrtbuf = new CMemBuf;
	wrtstr = new CMemBuf;
	wrtstr->AddIndexBuffer(1024);
	wrtnum = 0;
	wrtpos = 0;
	curnum = slot;
	Print(WELCOMEMSG);
	seedbase = encode;
}


int FilePack::RegisterFile( char *name, char *folder, int pcrypt )
{
	//	HFPにファイルを追加
	//
	int length;
	int index;
	int enc_crypt;
	bool crypt_flag;
	FILE *ff;
	HFPOBJ obj;
	char fname[HFP_NAME_MAX + 1];
	char foldername[HFP_NAME_MAX + 1];
	char pathname[HFP_NAME_MAX + HFP_NAME_MAX + 1];

	strcpy(fname, name);
	fname[HFP_NAME_MAX] = 0;
	UTF8StrCase(fname);

	strcpy(foldername, folder);
	foldername[HFP_NAME_MAX] = 0;
	UTF8StrCase(foldername);

	strcpy(pathname, foldername);
	strcat(pathname, fname);

	HSP3Crypt* cm = GetCurrentCryptManager();
	enc_crypt = 0;
	crypt_flag = false;
	if (pcrypt != 0) {
		enc_crypt = pcrypt;
		if (pcrypt < 0) {
			enc_crypt = cm->GetCRC32(pathname,strlen(pathname));			// ファイルパスを暗号キーにする
			enc_crypt = cm->GetSalt(enc_crypt);
			if (enc_crypt == 0) enc_crypt = 1;
		}
		crypt_flag = true;
	}

	ff=fopen(pathname,"rb" );
	if (ff == NULL) {
		char msg[1024];
		sprintf(msg, "#File not found [%s]", pathname);
		Print(msg);
		return -1;
	}
	fseek( ff,0,SEEK_END );
	length=(int)ftell( ff );			// normal file size
	fclose(ff);

	obj.flag = HFPOBJ_FLAG_ENTRY;
	if (crypt_flag) {
		obj.flag |= HFPOBJ_FLAG_ENCRYPT;
	}

	index = wrtstr->SearchIndexedData(fname, -1);
	if (index < 0) {
		index = wrtstr->GetSize();
		wrtstr->RegistIndex(index);
		wrtstr->PutStrBlock(fname);
	}
	obj.name = index;

	if (folder != NULL) {
		index = wrtstr->SearchIndexedData(foldername, -1);
		if (index < 0) {
			index = wrtstr->GetSize();
			wrtstr->RegistIndex(index);
			wrtstr->PutStrBlock(foldername);
		}
		obj.folder = index;
	}
	else {
		obj.folder = 0;
	}
	obj.size = length;
	obj.offset = wrtpos;
	obj.slot = curnum;
	obj.crypt = enc_crypt;

	wrtpos += length;
	wrtnum++;
	wrtbuf->PutData( &obj, sizeof(HFPOBJ) );

	return length;
}


int FilePack::RegisterFromPacklist( char *name, int def_crypt)
{
	//	regist from file list
	//
	int total = 0;
	int max,index,crypt;
	char s1[1024];
	char fname[HFP_NAME_MAX + 1];
	char foldername[HFP_NAME_MAX + 1];

	CMemBuf packlist;
	if (packlist.PutFile(name) < 1) {
		Print("#No fie.");
		return -1;
	}

	PrepareRead(0, seedbase+def_crypt);

	crypt = -1;
	CStrNote note;
	note.Select( packlist.GetBuffer() );
	max = note.GetMaxLine();
	index = 0;
	while (1) {
		char a1;
		char* fn;
		int enc;
		if (index >= max) break;
		enc = 0;
		note.GetLine(s1, index, 1023);
		index++;
		fn = s1;
		a1 = s1[0];
		switch (a1) {
		case ';':					// comment
			break;
		case '#':					// crypt value
			crypt = atoi(s1+1);
			break;
		case '+':					// encode flag
			fn++; enc = crypt;
			//	through
		default:
			UTF8Split(fn, foldername, fname);		// Split Path and File Name
			UTF8StrCase(fname);
			UTF8StrCase(foldername);
			int length = RegisterFile(fname, foldername, enc);

			char msg[1024];
			sprintf(msg,"#%d %s (%d)(%d)", total, fn, length, enc);
			Print(msg);
			total++;
			break;
		}
	}

	return total;
}


int FilePack::CopyFileToDPM( void *file, char *filename, HFPSIZE psize, int encode )
{
	//	copy file to pack
	//
	int a;
	FILE *ff;
	FILE *ff2;
	unsigned char ch;
	int count = 0;
	int size = (int)psize;

	ff = (FILE *)file;
	ff2 = fopen( filename,"rb" );
	if (ff2==NULL) return -1;

	HSP3Crypt *cm = GetCurrentCryptManager();
	cm->DataSet(NULL, size, encode );

	if ( encode==0 ) {								// 暗号化なし
		while(1) {
			if (count >= size) break;
			a=fgetc(ff2);if (a<0) break;
			fputc(a,ff);
			count++;
		}
	}
	else {											// 暗号化
		while (1) {
			if (count >= size) break;
			a = fgetc(ff2); if (a < 0) break;
			ch = (unsigned char)a;
			ch = cm->Encrypt(ch);
			fputc((int)ch, ff);
			count++;
		}
	}
	fclose(ff2);
	return count;
}


int FilePack::SavePackFile( char *name, char *packname, int encode, int opt_encode )
{
	//	HFPファイルを作成
	//
	int res, i;
	int bufsize, strsize, pt_file, myname;
	int checksize;
	FILE *fp;
	HFPHED hed;
	HFPOBJ *obj;
	char *strbase;
	char *p;
	char fname[HFP_NAME_MAX+1];
	char refname[(HFP_NAME_MAX + HFP_NAME_MAX + 1)];

	PrepareWrite( 0, encode );
	if (RegisterFromPacklist(packname, opt_encode) <= 0) {
		return -1;
	}

	strcpy( fname, name );
	strcat( fname, DPMFILEEXT);
	fname[HFP_NAME_MAX] = 0;
	UTF8StrCase( fname );

	HSP3Crypt *cm = GetCurrentCryptManager();

	res = 0;
	checksize = 0;
	fp=fopen( fname, "wb" );
	if (fp != NULL) {

		myname = wrtstr->GetSize();			// HFPファイル名を保存
		wrtstr->PutStrBlock( fname );

		strsize = wrtstr->GetSize() & 15;
		if ( strsize > 0 ) {				// strbufを切りのいいサイズにする
			for(i=0;i<(16-strsize);i++) { wrtstr->Put( (char)0 ); }
		}

		bufsize = wrtbuf->GetSize();
		strsize = wrtstr->GetSize();
		pt_file = sizeof(HFPHED) + bufsize + strsize;
		obj = (HFPOBJ *)wrtbuf->GetBuffer();
		strbase = wrtstr->GetBuffer();

		hed.h1 = HFP_MAGIC1;
		hed.h2 = HFP_MAGIC2;
		hed.h3 = HFP_MAGIC3;
		hed.h4 = HFP_MAGIC4;
		hed.max_file = wrtnum;
		hed.strtable = sizeof(HFPHED) + bufsize;
		hed.filetable = pt_file;
		hed.myname = myname;
		hed.crc32 = 0;
		hed.seed = encode;
		hed.salt = cm->GetSalt(encode+ opt_encode);

		checksize = bufsize + strsize;

		fwrite( &hed, sizeof(HFPHED), 1, fp );
		fwrite( obj, bufsize, 1, fp );
		fwrite( strbase, strsize, 1, fp );

		for(i=0;i<wrtnum;i++) {
			p = strbase + obj->name;
			if (obj->folder == 0) {
				refname[0] = 0;
			}
			else {
				strcpy(refname, strbase + obj->folder);
			}
			strcat(refname, p);
			//printf( "#%d : %x : %s ( %d bytes ) %s packing...\n", i, obj->offset, p, obj->size, refname );
			int sz = CopyFileToDPM( fp, refname, obj->size, obj->crypt );
			if (sz < 0) res = -1;
			checksize += sz;
			obj++;
		}
		fclose(fp);

	} else {
		res = -1;
	}

	delete wrtbuf;
	delete wrtstr;
	return res;
}


int FilePack::ExtractFile( HFPHED *hed, char *fname, char *savename, int encode )
{
	HFPOBJ *obj;
	FILE *ff;
	FILE *fp;
	int pt_file;
	int bufsize;
	int i;
	int a2;
	char* sname = savename;

	obj = SearchFileObject( hed, fname );
	if ( obj == NULL ) return -1;

	pt_file = hed->filetable;
	bufsize = (int)obj->size;

	HSP3Crypt* cm = GetCurrentCryptManager();
	if (obj->crypt) {
		int enc_crypt = cm->GetSalt(hed->seed+encode);
		if (enc_crypt == 0) enc_crypt = 1;
		if (enc_crypt != obj->crypt) {
			Print("#Locked file.");
			return -4;
		}
		cm->DataSet(NULL, bufsize, obj->crypt);
	}

	if (sname == NULL) {
		sname = GetFileName(obj);
	}
	fp = fopen( sname, "wb" );
	if ( fp == NULL ) return -2;

	ff = fopen( GetPackName(hed), "rb" );
	if ( ff == NULL ) return -3;

	fseek( ff, pt_file + (int)obj->offset, SEEK_SET );

	for(i=0;i<bufsize;i++) {
		a2 = fgetc( ff );if ( a2 < 0 ) break;
		if (obj->crypt) {
			a2 = (int)cm->Decrypt((unsigned char)a2);
		}
		fputc( a2, fp );
	}

	fclose(fp);

	char msg[1024];
	sprintf(msg, "#%s extracted.(%d)", sname, bufsize);
	Print(msg);

	return 0;
}


int FilePack::ExtractFile( char *fname, char *savename, int encode )
{
	HFPOBJ *obj = SearchFileObject(fname);
	if (obj == NULL) return -1;
	return ExtractFile(GetCurrentHeader(), fname, savename, encode);
}


void FilePack::PrintFiles(void)
{
	HFPHED* hed = GetCurrentHeader();
	if (hed == NULL) {
		Print("#No files.");
		return;
	}
	int i;
	HFPOBJ* obj;
	obj = GetCurrentObjectHeader();
	for (i = 0; i < hed->max_file; i++) {
		char msg[1024];
		sprintf(msg, "#%d [%s%s] %d", i, GetFolderName(obj), GetFileName(obj), (int)obj->size);
		Print(msg);
		obj++;
	}
}


void FilePack::SetErrorBuffer(CMemBuf* err)
{
	errbuf = err;
}


void FilePack::Print(char* mes)
{
	if (errbuf) {
		errbuf->PutStr(mes);
		errbuf->PutStr("\r\n");
	}
}

