
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	HSP Docs Library
		version 1.43 update 2019/04/02
			s.programs http://spn.php.xdomain.jp/
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Operating environment │ Windows 2000 or later
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


 overview
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
HSP Docs Library (HDL) searches and browses HSP documents all at once
It is a browser for.

Summary of hs help files, txt / HTML documents, sample scripts
You can search for it or make mutual references.


 how to use
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Files and folders in this archive are the directories of HSP itself
Overwrite and copy to (hsed3.exe directory).

(Delete the old HSP Document Library document.)

Press F1 in the HSP editor to launch HDL (hdl.exe).

See hdl_usage.html for details on how to use it.

See HS_BIBLE.txt for the format of the hs file.


 About HDL 1.4 update (2018/06)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In HDL 1.4, the screen display contents have been organized and simplified.

In addition, the technically outdated specifications have been reviewed to support HTML5 output and UTF-8 reading.
Did.


 About attachment of encode.hs (2018/06)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The module "encode.as" that comes standard with HSP but does not come with a manual
The help file is attached to the hsphelp directory.

The original of this help file was created by GENKI.
Original distributor
http://mclab.uunyan.com/lab/hspneta/neta014.htm


 How to uninstall
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Erase configuration files and data files saved on your computer by HDL
If you do, run the included hdl_uninst.bat.

If you want to uninstall HDL, run hdl_uninst.bat and then install
Delete the file copied at the time of operation and restore the original file of HSP main body
please.


 Copyright free
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
HSP Docs Library is in the public domain.


 Release notes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1.43 2019/04/02
-Fixed the problem that an error occurs when the application is closed in some environments.
揃 Changed not to use GPU rendering for IE components

1.42 2018/09/04
-Improved compatibility in IE8 and below environments (Full compatibility is only in IE11 environment)
-Changed to clear the registry information in hdl_uninst.bat

1.41 2018/06/07
-Supports environments with high Windows display scale settings (DPIAware)
-Dust removal of output HTML
-(Built-in hs editor) Supports reading UTF-8 files (Save only in Shift_JIS)
-(Built-in hs editor) Abolished the symbol import function from hsp scripts
・ Other internal processing speedup
-Attach encode.hs to the archive

1.40 2018/06/01
-Changed the title from HSP Document Library to HSP Docs Library
・ Changed the index screen to one based on the search system
-Changed the section name "Reference" to "Command Help"
-Changed the output HTML version from HTML4 to HTML5
-Supports UTF-8 character code document reading
-Abolished the specification to group command help categories with a small number of instructions into others.
-Integrate version information screen and document status screen
-Changed the display method of reverse sample lookup
-Abolished the document thumbnail display function
-Abolished the search of the docs directory
・ Change the display font to Meiryo
-Fixed a bug that the search term is strange when trying to search for a non-existent command term with one key help.
-Abolished the character size selection function (to the enlargement function)
-Added 90% and 110% to the expansion options
-Always abolished the display option
-Improved error message
・ Change the icon
-Simplified HS_BIBLE.txt and updated to Version 2.0 R2
-Updated hdl_uninst.bat
-Update the bundled sqlite3.dll SQLite version 3.23.1
・ Notation change due to website relocation

1.34 2012/05/18
-Fixed the problem that an error occurs when creating a DB when the number of read files is very large.
-Limit the number of documents and sample scripts that can be displayed per category in the menu.
  (Prevents the home screen from becoming too heavy)
・ Other updates
 --Original source is compatible with HSP 3.3, SQLele 1.15
-Update of bundled sqlite3.dll (3.7.12)

1.33 2010/02/09
-Change the default menu state
-Changed to group modules with less than 5 instructions into the "Other" category.
・ Change the display contents of HDL home
-Update of bundled sqlite3.dll (3.6.22)

1.32 2009/05/09
-Change of the method of cutting out the catalog description
-Changed so that the file name (part) in the document is converted to an anchor.
-Integrate file list and library diagnostics into "library status"
-Abolished the anchoring of non-symbol words in the help page
-Added a link to the catalog page in the left menu
-Reducing the size of generated HTML
ツキ Change the HTML cache file path from% TEMP% to% TEMP% \\ HDL
-Change of document thumbnail function
 --Supports .gif files
 --Supports cache update when updating image files
繝サ Other general performance improvements
-Reduced size of helpman.exe for old help compatibility
-Update of bundled sqlite3.dll (3.6.14)

1.31 2008/10/01
-Fixed event-related processing of IE components
-Corrected the handling of files under the subdirectory of common \\
-Display the date of the file in the file catalog
-Change the data storage path to% APPDATA% \\ Hot Soup Processor
-Change the configuration of database file and configuration file

1.30 2008/07/23
-Changed the operation method of the side view
-Changed the display contents of the reference catalog
繝サ Change of cache control method

1.20 2008/06/28
ツキ Added support for hs doc comments in header files
-Added "Maybe" function to word search
-Addition of library diagnosis screen (File list-> Library diagnosis)
繝サ Speeding up file check

1.10 2008/06/10
-Added a navigation link at the top of the page
-Added a function to highlight search keywords
-Supports document thumbnail display
-Addition of file list
-Change the IE display to standard compliant mode
-Change of frame set control method
繝サ Change of cache control method
繝サ Database change
 --Add Dir field to Files table
 --Abolished Cache table
ツキBug fixes

1.0 2008/01/23
-Supports changes in display font size, etc.
繝サ Improvement of cache relations and efficiency of operation
ツキBug fixes

BETA 0.01 2007/10/01
繝サ First beta
