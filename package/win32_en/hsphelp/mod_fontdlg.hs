%dll
mod_fontdlg

%author
onitama

%note
Include mod_fontdlg.as.

%type
User extension instructions

%group
Screen control instructions

%port
Win
Cli
%ver
3.3
%date
2009/08/01
%index
fontdlg
Open font selection dialog

%prm
p1, p2
p1: Numeric array variable that stores the return value
p2 = 0 to (0): Optional

%inst
Opens the font selection dialog.
The font name is assigned to refstr, and other information is assigned to the array variable specified by p1.

Specify options for p2. If you specify 0x100, you can specify strikethrough, underline, and text color.

If successful, stat will return a non-zero value. If it is canceled or an error occurs, 0 is returned in stat.

%sample
#include "mod_fontdlg.as"
	dim result, 8
	fontdlg result, 0

	if stat != 0 {
mes "font name:" + refstr
mes "Font size (logical size used by HSP):" + result (0)
mes "font typeface:" + result (1)
pos 40: mes "0 = normal \\ n1 = bold \\ n2 = italic \\ n3 = bold italic"
pos 0: mes "font size (pt):" + result (2)
mes "Font color (red):" + result (3)
mes "Font color (green):" + result (4)
mes "Font color (blue):" + result (5)
mes "Underlined:" + result (6)
mes "With or without strikethrough:" + result (7)
	}
	stop

%href
font
dialog
