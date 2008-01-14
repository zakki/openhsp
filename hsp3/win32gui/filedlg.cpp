/*------------------------------------------
	File Load/Save common dialog routines
  ------------------------------------------*/

#include <windows.h>
#include <commdlg.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

static HWND hwbak;
static OPENFILENAME ofn ;
static char szFileName[_MAX_PATH] ;
static char szTitleName[_MAX_FNAME + _MAX_EXT] ;
static char szFilter[128];


void PopFileInitialize (HWND hwnd)
     {
     ofn.lStructSize       = sizeof (OPENFILENAME) ;
     ofn.hwndOwner         = hwnd ;
     ofn.hInstance         = NULL ;
     ofn.lpstrFilter       = szFilter ;
     ofn.lpstrCustomFilter = NULL ;
     ofn.nMaxCustFilter    = 0 ;
     ofn.nFilterIndex      = 1 ;
     ofn.nMaxFile          = _MAX_PATH ;
     ofn.lpstrFile         = szFileName ;
     ofn.nMaxFileTitle     = _MAX_FNAME + _MAX_EXT ;
     ofn.lpstrFileTitle    = szTitleName ;
     ofn.lpstrInitialDir   = NULL ;
     ofn.lpstrTitle        = NULL ;
     ofn.Flags             = 0 ;             // Set in Open and Close functions
     ofn.nFileOffset       = 0 ;
     ofn.nFileExtension    = 0 ;
     ofn.lpstrDefExt       = NULL ;
     ofn.lCustData         = 0L ;
     ofn.lpfnHook          = NULL ;
     ofn.lpTemplateName    = NULL ;
     }


void fd_ini( HWND hwnd, char *extname, char *extinfo )
{
	int a,b;
	char a1;
	char fext[1024];
	char finf[1024];
	hwbak=hwnd;

	szFilter[0]=0;
	szFileName[0]=0;
	szTitleName[0]=0;
	strcpy( fext,extname );

	if (fext[0]==0) strcpy( fext,"*" );
	sprintf( szFileName, "*.%s",fext );

	if (fext[0]!=42) {
		if (extinfo[0]==0) sprintf( finf,"%sÌ§²Ù",fext );
					  else strcpy( finf,extinfo );
		sprintf( szFilter, "%s (*.%s)@*.%s@", finf, fext, fext );
	}
	strcat( szFilter,"‚·‚×‚Ä‚ÌÌ§²Ù (*.*)@*.*@@" );

	b=(int)strlen(szFilter);
	for(a=0;a<b;a++) {
		a1=szFilter[a];
		if (a1<0) a++;
		else if (a1=='@') szFilter[a]=0;
	}

	PopFileInitialize(hwnd);
}

char *fd_getfname( void )
{
	return szFileName;
}

BOOL fd_dialog( HWND hwnd, int mode, char *fext, char *finf )
{
	switch(mode) {
	case 0:
		fd_ini( hwnd, fext, finf );
		ofn.Flags = OFN_HIDEREADONLY | OFN_CREATEPROMPT ;
		return GetOpenFileName (&ofn) ;
	case 1:
		fd_ini( hwnd, fext, finf );
		ofn.Flags = OFN_OVERWRITEPROMPT | OFN_HIDEREADONLY;
		return GetSaveFileName (&ofn) ;
	}
	return 0;
}


DWORD fd_selcolor( HWND hwnd, int mode )
     {
	 BOOL res;
     static CHOOSECOLOR cc ;
     static COLORREF    crCustColors[16] ;

     cc.lStructSize    = sizeof (CHOOSECOLOR) ;
     cc.hwndOwner      = hwnd ;
     cc.hInstance      = NULL ;
     cc.rgbResult      = RGB (0x80, 0x80, 0x80) ;
     cc.lpCustColors   = crCustColors ;

	 if (mode)
	     cc.Flags          = CC_RGBINIT | CC_FULLOPEN ;
	 else
		 cc.Flags          = CC_RGBINIT;

     cc.lCustData      = 0L ;
     cc.lpfnHook       = NULL ;
     cc.lpTemplateName = NULL ;

     res=ChooseColor(&cc) ;
	 if (res) {
		return (DWORD)cc.rgbResult;
	 }
	 return -1;
     }
