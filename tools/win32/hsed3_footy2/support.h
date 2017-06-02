/*------------------------------------------------------------------------------
	Header of HSED support routines
------------------------------------------------------------------------------*/

#ifndef SUPPORT_H
#define SUPPORT_H

int __cdecl msgboxf(HWND, LPCTSTR, LPCTSTR, UINT, ...);
void ShowLastError();
LPSTR *CommandLineToArgvA(LPSTR, int *);
size_t strlcpy(char *, char *, size_t);
ULONGLONG GetFileIndex(const char *);
int getStrLinesSize(const char *);
void GetDirName(char *dirName, const char *path);

class FileList{
private:
	char *buf, *buf2;
	char **index;
	int bufsize, idxsize, offset, idxoffset;

public:
	FileList();
	~FileList();
	void reset();
	void add(const char *);
	const char *get(int);
	void setlist(const char *);
	const char *getlist();
	size_t num();
};

int check_if_two_paths_map_to_same(LPCTSTR, LPCTSTR);

size_t win_cmdline_parser(LPCTSTR source, LPTSTR, LPCTSTR*);

#define GETPATH_ENTIRE 0x0
#define GETPATH_WITHOUTEXT 0x1
#define GETPATH_EXT 0x2
#define GETPATH_WITHOUTDIR 0x8
#define GETPATH_LOWER 0x10
#define GETPATH_DIR 0x20

size_t hsp_getpath(LPCTSTR, LPTSTR, int);

#define GetDirName(destination, source) hsp_getpath(source, destination, GETPATH_DIR)

#endif
