/*------------------------------------------------------------------------------
	Suport routines for HSP Script Editor
------------------------------------------------------------------------------*/

#include <windows.h>
#include <tchar.h>
#include <stdarg.h>
#include <stdlib.h>

#include "support.h"

#define BUF_BLOCK_SIZE (_MAX_PATH + 1) * 16
#define IDX_BLOCK_SIZE 16

int __cdecl msgboxf(HWND hWnd, LPCTSTR lpFormat, LPCTSTR lpCaption, UINT uType, ...)
{
	va_list al;
	char szBuf[1280];

	va_start(al, uType);
	wvsprintf(szBuf, lpFormat, al);
	va_end(al);

	return MessageBox(hWnd, szBuf, lpCaption, uType);
}

LPSTR *CommandLineToArgvA(LPSTR CmdLine, int *_argc)
{
	LPSTR *argv, _argv;
	unsigned long len, argc, i, j;
	char tmp;
	BOOL in_QM, in_TEXT, in_SPACE;

	len = lstrlen(CmdLine);
	i = (((len+2)/2)*sizeof(LPSTR) + sizeof(LPSTR));

	argv = (LPSTR *)GlobalAlloc(GMEM_FIXED, i + (len+2)*sizeof(char));
	_argv = (LPSTR)(((PUCHAR)argv)+i);

	argc = 0;
	argv[argc] = _argv;
	in_QM = FALSE;
	in_TEXT = FALSE;
	in_SPACE = TRUE;
	i = 0;
	j = 0;

	while( tmp = CmdLine[i] ) {
		if(in_QM) {
			if(tmp == '\"') in_QM = FALSE;
			else {
				_argv[j] = tmp;
				j++;
			}
		} else {
			switch(tmp) {
				case '\"':
					in_QM = TRUE;
					in_TEXT = TRUE;
					if(in_SPACE) {
						argv[argc] = _argv+j;
						argc++;
					}
					in_SPACE = FALSE;
					break;
				case ' ':
				case '\t':
				case '\n':
				case '\r':
					if(in_TEXT) {
						_argv[j] = '\0';
						j++;
					}
					in_TEXT = FALSE;
					in_SPACE = TRUE;
					break;
				default:
					in_TEXT = TRUE;
					if(in_SPACE) {
						argv[argc] = _argv+j;
						argc++;
					}
					_argv[j] = tmp;
					j++;
					in_SPACE = FALSE;
					break;
			}
		}
		i++;
	}
	_argv[j] = '\0';
	argv[argc] = NULL;

	*_argc = argc;
	return argv;
}

size_t strlcpy(char *dest, char *source, size_t size)
{
	size_t i;

	if(size <= 0) return 0;
	size--;
	for(i = 0; source[i] != '\0' && i < size; i++)
		dest[i] = source[i];
	dest[i] = '\0';
	return i;
}

FileList::FileList()
{
	bufsize = BUF_BLOCK_SIZE;
	idxsize = IDX_BLOCK_SIZE;
	buf = (char *)malloc(bufsize);
	buf2 = NULL;
	index = (char **)malloc(idxsize * sizeof(char **));
	offset = idxoffset = 0;
}

FileList::~FileList()
{
	free(buf);
	free(buf2);
	free(index);
}

void FileList::add(const char *filename)
{
	int length = lstrlen(filename) + 1;
	if(offset + length >= bufsize)
		buf = (char *)realloc(buf, (bufsize += BUF_BLOCK_SIZE));
	if(idxoffset >= idxsize)
		index = (char **)realloc(index, ((idxsize += IDX_BLOCK_SIZE) * sizeof(char **)));

	index[idxoffset] = buf + offset;
	lstrcpy(index[idxoffset], filename);

	offset += length;
	idxoffset++;
	return;
}

void FileList::reset()
{
	offset = idxoffset = 0;
}

const char *FileList::get(int offset)
{
	return index[offset];
}

size_t FileList::num()
{
	return idxoffset;
}

void FileList::setlist(const char *filelist)
{
	int length = lstrlen(filelist), num = 1;
	const char *pfilelist;
	offset = idxoffset = 0;

	if(bufsize < length)
		buf = (char *)realloc(buf, (bufsize = length));
	lstrcpy(buf, filelist);


	for(pfilelist = filelist; *pfilelist != '\0'; pfilelist++)
		if(*pfilelist == '*')
			num++;

	if(num > idxsize)
		index = (char **)realloc(index, (idxsize = num));

	pfilelist = strtok(buf, "*");
	if(lstrlen(pfilelist) > 0)
		index[idxoffset++] = (char *)pfilelist;
	
	while((pfilelist = strtok(NULL, "*")) != NULL)
		if(lstrlen(pfilelist) > 0)
            index[idxoffset++] = (char *)pfilelist;

	return;
}

const char *FileList::getlist()
{
	char *pbuf, *pbuf2;

	pbuf2 = buf2 = (char *)realloc(buf2, bufsize);
	for(int i = 0; i < (int)num(); i++){
		pbuf = index[i];
		while(*pbuf != '\0')
			*pbuf2++ = *pbuf++;
		*pbuf2++ = '*';
	}
	if(num() > 0)
		pbuf2[-1] = '\0';
	else
		pbuf2[0] = '\0';
	return buf2;
}

void ShowLastError()
{
	char s[1024];
	FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, NULL, GetLastError(), NULL, s, sizeof(s), NULL);
	MessageBox(0, s, "Error", MB_OK);
	return;
}

ULONGLONG GetFileIndex(const char *szFileName)
{
	BY_HANDLE_FILE_INFORMATION FileInformation;
	ULARGE_INTEGER uliFileIndex;
	HANDLE hFile;

	hFile = CreateFile(szFileName, 0, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING,
		FILE_ATTRIBUTE_NORMAL, NULL);
	if(hFile != NULL){
		GetFileInformationByHandle(hFile, &FileInformation);
		CloseHandle(hFile);

		uliFileIndex.HighPart = FileInformation.nFileIndexHigh;
		uliFileIndex.LowPart  = FileInformation.nFileIndexLow;
		return uliFileIndex.QuadPart;
	} else {
		return 0;
	}
}

int getStrLinesSize(const char *s)
{
	int result = 0;
	while (*s != '\0') {
		while (*s != '\0') {
			char c = *s++;
			if(c == '\n') break;
		}
		result ++;
	}
	return result;
}

int check_if_two_paths_map_to_same(LPCTSTR first_file_path, LPCTSTR second_file_path)
{

	// Checks if two pathnames refer to the same file.

	// On ReFS, the return value may be non-zero even if the pathnames map to different files.

	HANDLE first_file_handle = CreateFile(first_file_path, 0, FILE_SHARE_DELETE | FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (first_file_handle == INVALID_HANDLE_VALUE) return 0;

	int ret = 0;

	HANDLE second_file_handle = CreateFile(second_file_path, 0, FILE_SHARE_DELETE | FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);

	if (second_file_handle != INVALID_HANDLE_VALUE) {

		BY_HANDLE_FILE_INFORMATION first_file_info;
		GetFileInformationByHandle(first_file_handle, &first_file_info);

		BY_HANDLE_FILE_INFORMATION second_file_info;
		GetFileInformationByHandle(second_file_handle, &second_file_info);

		ret = (first_file_info.dwVolumeSerialNumber == second_file_info.dwVolumeSerialNumber) && (first_file_info.nFileIndexHigh == second_file_info.nFileIndexHigh) && (first_file_info.nFileIndexLow == second_file_info.nFileIndexLow);

		CloseHandle(second_file_handle);

	}

	CloseHandle(first_file_handle);

	return ret;

}

/*
 *
 * [win_cmdline_parser]
 *
 * The 'win_cmdline_parser' extracts the first argument from a command line string.
 *
 * [Syntax]
 *
 * size_t win_cmdline_parser(LPCTSTR source, LPTSTR destination, LPCTSTR *nextarg);
 *
 * [Parameters]
 *
 * LPCTSTR source [in]
 *     Points to the command line string.
 *
 * LPTSTR destination [out, optional]
 *     Points to the buffer to receive the first argument. The parameter is optional and can be specified as NULL.
 *
 * LPTSTR *nextarg [out, optional]
 *     Points to the buffer to receive a pointer to the next argument or to the NULL terminator. The parameter is optional and can be specified as NULL.
 *
 * [Return value]
 *
 * The function returns the number of TCHARs required to receive the argument, including the NULL terminator, no matter whether 'destination' is specified as NULL or not.
 *
 * [Remarks]
 *
 * If the string of 'source' is empty or starts with any amount of spaces or tabs, the first argument is considered as empty and the function sets '\0' to the first TCHAR.
 *
 * Parsing rules
 *
 *     Double quotation marks are removed from both ends of a quoted string or a string between a pair of non-escaped double quotation marks. A quoted string can be placed in an argument.
 *
 *     Spaces or tabs separate arguments unless placed in a quoted string.
 *
 *     Backslashes are not modified unless followed by a double quotation mark.
 *
 *     The function escapes a double quotation mark next to a backslash, and they are interpreted as a literal quotation mark.
 *
 *     If a double quotation mark follows a block of an even number of backslashes, one backslash replaces every pair of backslashes in the block.
 *
 *     If a double quotation mark follows a block of an odd number of backslashes, one backslash replaces every pair of backslashes in the block, and the remaining escapes the double quotation mark.
 *
 */

size_t win_cmdline_parser(LPCTSTR source, LPTSTR destination, LPCTSTR *nextarg)
{

#ifdef _MBCS

	int trailed = 0;

#endif

	int ignorespaces = 0;
	size_t len = 0;

	while (1) {

		int escaped = 0;

#ifdef _MBCS

		if (trailed) {

			trailed = 0;
			goto copy;

		}

		trailed = IsDBCSLeadByte(*source);

#endif

		if (*source == '\\') {

			size_t n = 0;
			while (source[n] == '\\') n++;
			source += n;

			escaped = n % 2;

			if (*source == '\"') n /= 2;

			if (destination) memset(&destination[len], '\\', n * sizeof(TCHAR));

			len += n;

		}

		if (*source == '\"' && !escaped) {

			ignorespaces = ~ignorespaces;
			source++;
			continue;

		}

		if (!ignorespaces && isspace((unsigned char)*source)) break;

		copy:

		if (!*source) break;

		if (destination) destination[len] = *source;

		len++;
		source++;

	}

	if (nextarg) {

		while (isspace((unsigned char)*source)) source++;
		*nextarg = source;

	}

	if (destination) destination[len] = '\0';

	return len + 1;

}

/*
 * [hsp_getpath]
 *
 * The function breaks a pathname into components.
 *
 * [Syntax]
 *
 * size_t hsp_getpath(LPCTSTR source, LPTSTR result, int flags);
 *
 * [Parameters]
 *
 * LPCTSTR source [in]
 *     Points to the pathname to break into components.
 *
 * LPTSTR result [out, optional]
 *     Points to the buffer to receive the result. The parameter is optional and can be specified as NULL.
 *
 * int flags [in]
 *     Specifies how to make changes to the pathname. The default is 'GETPATH_ENTIRE' if zero is specified. The value can be a combination of one or more of these values:
 *
 *     Value | Meaning
 *
 *     GETPATH_ENTIRE (0x0) | The buffer receives the entire. The value can be combined just with 'GETPATH_LOWER'.
 *     GETPATH_WITHOUTEXT (0x1) | Removes the extension component.
 *     GETPATH_EXT (0x2) | Extracts the extension component. The value can be combined just with 'GETPATH_LOWER'.
 *     GETPATH_WITHOUTDIR (0x8) | Removes the directory component. The value cannot be combined with 'GETPATH_DIR'.
 *     GETPATH_LOWER (0x10) | Converts the result to lower case.
 *     GETPATH_DIR (0x20) | Extracts the directory component.
 *
 * [Return value]
 *
 * The function returns the number of TCHARs required to receive the result, including the NULL terminator, no matter whether 'result' is specified as NULL or not.
 *
 * [Remarks]
 *
 * The behavior is undefined if the buffer of 'source' and that of 'result' lap over each other.
 *
 * Parsing rules
 *
 *     The backslash and the forward slash are used as directory delimiter characters; they separate elements of a pathname.
 *     The extension component consists of all characters after and including the last period in the base name. If the base name has no period, the component is empty and the function sets '\0' to the first byte.
 *     The base name component consists of all characters after, but not including, the last directory delimiter. If there is no directory delimiter in the pathname, the component is equivalent to the entire.
 *     The directory component consists of all characters up to and including the last directory delimiter. If the pathname does not contain a directory delimiter, the component is empty and the function sets '\0' to the first byte.
 *
 */

size_t hsp_getpath(LPCTSTR source, LPTSTR result, int flags)
{

	size_t len = lstrlen(source);

	LPCTSTR filename = _tcsrchr(source, '/');

	{

		LPCTSTR p = _tcsrchr(source, '\\');
		if (p > filename) filename = p;

	}

	if (filename) filename++; else filename = source;

	LPCTSTR extension = _tcsrchr(filename, '.');
	if (!extension) extension = source + len;

	if (flags & GETPATH_EXT) {

		len -= extension - source;
		source = extension;
		goto assignment;

	}

	if (flags & GETPATH_DIR) {

		len = filename - source;
		goto assignment;

	}

	if (flags & GETPATH_WITHOUTDIR) {

		len -= filename - source;
		source = filename;

	}

	if (flags & GETPATH_WITHOUTEXT) len = extension - source;

	assignment:

	len++;

	if (result) {

		lstrcpyn(result, source, len);
		if (flags & GETPATH_LOWER) CharLower(result);

	}

	return len;

}
