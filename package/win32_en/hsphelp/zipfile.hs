%type
Extension instructions
%ver
3.6

%dll
ZLibWrap
%url
http://hsp.tv/
%port
Win

%date
2019/07/16
%author
onitama

%url
http://hsp.tv/

%note
Include zipfile.as.

%type
User-defined instructions

%group
File I / O control instructions

%port
Win
Cli

%index
zipcompress
Compress to zip file

%prm
"srcfile","zipfile"
srcfile: Specify compressed file name (wildcard allowed)
zipfile: zip file name of the save destination

%inst
Compresses the specified file in zip format and saves it.
In srcfile, specify the name of the file to be compressed. You can use wildcards to specify this.
If "* .jpg" is specified, all files with the extension .jpg will be targeted, and if "*. *" Is specified, all files will be targeted.
If a folder is included, everything under the folder will also be compressed.
Specify the save destination zip file name in zipfile.
If the process is successful, the system variable stat is assigned 0. If an error occurs, a non-zero is assigned.

%sample
#include "zipfile.as"
(Compress the common folder and below in the hsp installation folder and save it as common.zip)
	fname = "common.zip"
	s1=dir_exe+"\\common\\*.*"
	ZipCompress s1, fname
if stat: dialog "zip compression failed"

mes "compression source path:" + s1
mes fname + "saved."
	stop


%index
zipextract
Unzip the zip file

%prm
"zipfile","path"
zipfile: zip file name to unzip
path (""): Decompression destination folder path (current if "")

%inst
Unzip the specified zip file. All files contained in the compressed file will be decompressed.
In zipfile, specify the compressed zip file name.
For path, specify the decompression destination path. If "" "is specified, the current folder will be the target.
Passwordd zip files are not supported.
If the process is successful, the system variable stat is assigned 0. If an error occurs, a non-zero is assigned.

%sample
#include "zipfile.as"
Unzip onibtn.zip (onibtn.gif will be extracted)
	fname = "onibtn.zip"
	s1 = dir_cur
mes "Unzip source file:" + fname
mes "Unzip destination folder:" + s1
	;
	ZipExtract fname, s1
if stat: dialog "zip unzip failed"
mes "Unzipped."
	stop


