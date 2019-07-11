
#ifndef __zipfile__
#define __zipfile__

#uselib "ZLibWrap.dll"
#module "__ZLibWrap"

//    "ZLibWrap.dll"
//    Copyright (C) Streamlet. All rights reserved.
//    File Name:   ZLibWrapLib.h
//    Author:      Streamlet
//    URL:         https://github.com/StreamletStudio/ZLibWrap
//    StreamletStudio/ZLibWrap is licensed under the MIT License
//
//------------------------------------------------------------------------------
// Description: Compress files to a ZIP file.
// Parameter: lpszSourceFiles Source files, supporting wildcards.
// Parameter: lpszDestFile The ZIP file path.
// Parameter: bUtf8 If using UTF-8 to encode the file name.
// Return Value: TRUE/FALSE.
//------------------------------------------------------------------------------
//BOOL ZipCompress(LPCTSTR lpszSourceFiles, LPCTSTR lpszDestFile, bool bUtf8 = false);
#func _ZipCompress "ZWZipCompress" wstr,wstr,int

//------------------------------------------------------------------------------
// Description: Extract files from a ZIP file.
// Parameter: lpszSourceFile Source ZIP file.
// Parameter: lpszDestFolder The folder to output files. The parent of the
//                           specified folder MUST exist.
// Return Value: TRUE/FALSE.
//------------------------------------------------------------------------------
//BOOL ZipExtract(LPCTSTR lpszSourceFile, LPCTSTR lpszDestFolder);
#func _ZipExtract "ZWZipExtract" wstr,wstr

#deffunc ZipCompress str _p1, str _p2

	;	zip圧縮
	;
	;	ZipCompress "圧縮ファイル名の指定", "保存先のzipファイル名"
	;	(圧縮ファイル名は、「*.*」のようなワイルドカードを指定できます)
	;	statの値が0ならば成功、-1ならばエラーが返ります
	;
	_ZipCompress _p1, _p2, 0
	if stat=0 : return -1
	return 0

#deffunc ZipExtract str _p1, str _p2

	;	zip解凍
	;
	;	ZipExtract "解凍するzipファイル名", "解凍先のフォルダパス"
	;	(圧縮ファイル名は、「*.*」のようなワイルドカードを指定できます)
	;	statの値が0ならば成功、-1ならばエラーが返ります
	;
	_ZipExtract _p1, _p2
	if stat=0 : return -1
	return 0


#global

#endif

