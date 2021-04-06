%dll
hsedsdk

%ver
3.6

%date
2020/12/17

%author
onitama

%url
;Enter the relevant URL

%note
Include hsedsdk.as.

%type
User extension instructions

%port
Win

%group
HSP script editor for creating external tools

%index
hsed_exist
Get the startup status of HSP script editor

%inst
Check if the HSP Script Editor is running.
1 is assigned to the system variable stat if it is started, and 0 is assigned to the system variable stat if it is not started.

%sample
#include "hsedsdk.as"
	hsed_exist
	if ( stat ) {
mes "HSP Script Editor is running."
	} else {
mes "HSP Script Editor is not running."
	}
	stop

%group
Information acquisition command

%index
hsed_capture
Capture API window of HSP script editor

%inst
Assign the handle of the HSP Script Editor API window to the variable hIF in the hsedsdk module.
^
If the acquisition is successful, 0 is assigned to the system variable stat.
^
This instruction is used in hsedsdk.as and usually does not need to be used.

%group
Handle acquisition command

%href
hsed_getwnd
%index
hsed_gettext
Get the text being edited

%prm
p1, p2
p1: Variable to assign text
p2: ID of the Football you want to get

%inst
Get the text you are editing with the HSP script editor and assign it to p1.
^
If the acquisition is successful, 0 is assigned to the system variable stat.

%sample
#include "hsedsdk.as"
	nTabID = 0
	hsed_getfootyid nFootyID, nTabID
	if ( stat == 0 ) : hsed_gettext buf, nFootyID
	mesbox buf, ginfo_winx, ginfo_winy
	stop

%href
hsed_settext

%group
Text acquisition command
%index
hsed_sendstr
Paste the string

%prm
p1
p1: String type variable that stores the character string to be inserted into the script

%inst
Paste the string stored in p1 into the text you are editing.

%sample
#include "hsedsdk.as"
sIns = "String to send to script editor"
	hsed_sendstr sIns

%href
hsed_settext

%group
Text editing instructions
%index
hsed_cancopy
Get copy availability

%prm
p1, p2
p1: Variable to store the result
p2: Footy ID

%inst
Acquires whether copying is possible.
If it is possible to copy from the specified Football to the clipboard, 1 is returned in p1.
^
Use hsed_copy or hsed_cut to actually copy or cut.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_cancopy ret, idFooty
		if ( ret ) {
You can copy the tabs of mes "ID" + str (cnt) + "."
		} else {
mes "ID" + str (cnt) + "tabs cannot be copied."
		}
	loop
	stop

%group
Information acquisition command

%href
hsed_copy
hsed_cut
hsed_canpaste
%index
hsed_cut
Cuts a string from the specified Footy

%prm
p1
p1: ID of Footy to cut the character string

%inst
Requests the specified Football to cut the string to the clipboard.
Check hsed_cancopy to see if it can be cut.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_cancopy ret, idFooty
		if ( ret ) {
			hsed_cut idFooty
mes "ID" + str (cnt) + "cut from the tab."
		}
	loop
	stop

%href
hsed_cancopy
hsed_copy

%group
Clipboard operation command
%index
hsed_redo
Do a redo

%prm
p1
p1: ID of Football to redo

%inst
Requests a redo for the specified Football.
Check hsed_canredo to see if you can redo.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_canredo ret, idFooty
		if ( ret ) {
			hsed_redo idFooty
mes "ID" + idFooty + "Footy has been redone."
		} else {
mes "ID" + idFooty + "Footy could not be redone."
		}
	loop
	stop

%href
hsed_undo
hsed_canredo

%group
Text editing instructions
%index
hsed_undo
Do undo

%prm
p1
p1: ID of Football to undo

%inst
Requests undo for the specified Football.
Check hsed_canundo to see if you can undo.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_canundo ret, idFooty
		if ( ret ) {
			hsed_undo idFooty
mes "ID" + idFooty + "Footy has been undone."
		} else {
mes "ID" + idFooty + "Footy could not be undone."
		}
	loop
	stop

%href
hsed_redo
hsed_canundo

%group
Text editing instructions
%index
hsed_indent
Indent

%prm
p1
p1: ID of Football to indent

%inst
Ask Footy to indent.
Indentation is done on the selection.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_selectall idFooty
		hsed_indent idFooty
	loop
	stop

%href
hsed_unindent

%group
Text editing instructions
%index
hsed_unindent
Unindent

%prm
p1
p1: ID of Football to unindent

%inst
Ask Footy to unindent.
Unindentation is done on the selection.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_selectall idFooty
		hsed_unindent idFooty
	loop
	stop

%href
hsed_indent

%group
Text editing instructions
%index
hsed_uninitduppipe
Release of pipe handle

%inst
; Fill in the commentary

%href
hsed_initduppipe

%group
Pipe operation command
%index
hsed_initduppipe
Creating a pipe handle

%prm
p1
p1: String length

%inst
; Fill in the commentary

%href
hsed_uninitduppipe

%group
Pipe operation command
%index
hsed_getmajorver
Extract major version

%prm
(p1)
p1: Integer value representing the version

%inst
Extracts only the major version from the version specified by p1.
The value that can be specified here is only the version obtained by specifying HGV_PUBLICVER or HGV_PRIVATEVER for hsed_getver.

%href
hsed_getver
hsed_getminorver
hsed_getbetaver


%group
Version extraction function
%index
hsed_getminorver
Extract minor version

%prm
(p1)
p1: Integer value representing the version

%inst
Extracts only minor versions from the version specified by p1.
The value that can be specified here is only the version obtained by specifying HGV_PUBLICVER or HGV_PRIVATEVER for hsed_getver.

%href
hsed_getver
hsed_getmajorver
hsed_getbetaver


%group
Version extraction function
%index
hsed_getbetaver
Extract beta version

%prm
(p1)
p1: Integer value representing the version

%inst
Extracts only the beta version from the version specified by p1.
The value that can be specified here is only the version obtained by specifying HGV_PUBLICVER or HGV_PRIVATEVER for hsed_getver.

%href
hsed_getmajorver
hsed_getminorver
hsed_getver


%group
Version extraction function
%index
hsed_getver
Get the version of the script editor

%prm
p1, p2
p1: Variable to store the result
p2: Integer value to specify the version type

%inst
Gets the version of the editor of the type specified in p2 and assigns it to p1.
If acquisition fails, substitute -1 for p1 in principle. However, if HGV_HSPCMPVER is specified in p2, "Error" is assigned.
^
The values assigned to stat are as follows.
0: Successful acquisition
1: Editor not found
2: I couldn't make a pipe
3: The editor did not return the correct value (including if p2 is incorrect)
^
The values specified for p2 are as follows. You can use constants that start with HGV_ or the numbers in parentheses.
html{
<table border="1"><tr><th>HGV_PUBLICVER(0)</th>
<td> Public version (next version at the time of editor release).
In hexadecimal, it represents <ul> <li> 4 digits from the bottom major version </ li> <li> 3rd digit from the bottom minor version </ li> </ ul>. (Example: Ver3.6beta3-> $ 0003603) <br />
You can get each value with hsed_getmajorver (), hsed_getminorver (), hsed_getbetaver (). <br />
You can also convert it to a string with hsed_cnvverstr. </ td> </ tr>
<tr><th>HGV_PRIVATEVER(1)</th>
<td> Private version. It has the same format as HGV_PUBLICBER. </ td> </ tr>
<tr><th>HGV_HSPCMPVER(2)</th>
The version (character string) obtained by hsc_ver from <td> hspcmp.dll is assigned. </ td> </ tr>
<tr><th>HGV_FOOTYVER(3)</th>
<td> The version obtained by GetFootyVer from Footy is substituted.
The value obtained by multiplying the version by 100 is returned. (Example: Ver3.6-> 0x3600) </ td> </ tr>
<tr><th nowrap>HGV_FOOTYBETAVER(4)</th>
<td> The version obtained by GetFootyBetaVer from Footy is substituted.
The beta version will be substituted as is.
If it is not a beta version, 0 is assigned. </ td> </ tr>
</table>
}html


%href
hsed_getmajorver
hsed_getminorver
hsed_getbetaver

%group
Information acquisition command
%index
hsed_getwnd
Get various handles of the script editor

%prm
p1, p2, p3

%inst
Gets the window handle of the type of editor specified by p2 and assigns it to p1.
If you specify HGW_EDIT in p2, you need to specify the Football ID in p3.
If acquisition fails, substitute 0 for p1.

The values assigned to stat are as follows.
0: Successful acquisition
1: Editor not found
2: The editor did not return the correct value (including if p2 is incorrect)

The values specified for p2 are as follows. You can use constants starting with HGW_ or numbers in parentheses.
HGW_MAIN (0): Main window
HGW_CLIENT (1): Client window
HGW_TAB (2): Tab window
HGW_EDIT (3): Footy window
HGW_TOOLBAR (4): Toolbar
HGW_STATUSBAR (5): Status bar

%href
hsed_capture

%group
Handle acquisition command
%index
hsed_cnvverstr
Convert version number to string

%prm
p1
p1: Integer value representing the version

%inst
Converts the version specified by p1 to a string and assigns it to refstr. It is in the format of "(major version). (Minor version)". However, in the case of beta version, "b (beta version)" is added at the end.
The value that can be specified here is only the version obtained by specifying HGV_PUBLICVER or HGV_PRIVATEVER for hsed_getver.

%group
Version conversion instruction

%index
hsed_selectall
Select all text

%prm
p1
p1: ID of Football to select text

%inst
Asks Footy to select all the text.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_selectall idFooty
	loop
	stop

%group
Text editing instructions
%index
hsed_gettextlength
Get the string length of the text

%prm
p1, p2
p1: Variable to assign the string length
p2: ID of Footy to get the string length

%inst
Gets the string length of the text and assigns it to p1.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_gettextlength lText, idFooty
The string length of Football in mes "ID" + idFooty + "is" + lText + "."
	loop
	stop

%href
hsed_getlinelength

%group
Information acquisition command
%index
hsed_getlines
Get the number of lines of text

%prm
p1, p2
p1: Variable to assign the number of lines
p2: ID of Football to get the number of rows

%inst
Substitute the number of lines of text for p1. Comment lines and blank lines are also counted as one line.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	lText = ""
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_getlines nLines, idFooty
The number of lines in Football for mes "ID" + idFooty + "is" + nLines + "."
	loop
	stop


%href
hsed_getlinelength

%group
Information acquisition command
%index
hsed_getlinelength
Get the string length of a line

%prm
p1, p2, p3
p1: Variable to assign the string length
p2: ID of Footy to get the string length
p3: Line number to get the string length (1 ~)

%inst
Gets the string length of the p3 line of the text and assigns it to p1.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_getlinelength lLine, idFooty, 1
The string length of the first line of Football of mes "ID" + idFooty + "is" + lLine + "."
	loop
	stop

%href
hsed_getlines
hsed_gettextlength

%group
Information acquisition command
%index
hsed_getlinecode
Get line feed code

%prm
p1, p2

%inst
; Fill in the commentary

%href
;Fill in related items

%group
Information acquisition command
%index
hsed_copy
Copy a string from the specified Football

%prm
p1
p1: ID of Footy to copy the string

%inst
Requests the specified Football to copy the string to the clipboard.
Check hsed_cancopy to see if you can copy.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		if ( stat == 0 ) {
			hsed_cancopy ret, idFooty
			if ( ret ) {
				hsed_copy idFooty
Copied from the tab of mes "ID" + str (cnt) + "."
			}
		}
	loop
	stop

%href
hsed_cancopy
hsed_cut

%group
Clipboard operation command
%index
hsed_paste
Paste the string to the specified Football

%prm
p1
p1: ID of Footy to paste the string

%inst
Requests to paste the character string from the clipboard to the specified Football.
Check hsed_canpaste to see if you can paste.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	hsed_canpaste ret
	if ( ret ) {
		repeat nTabs
			hsed_getfootyid idFooty, cnt
			if ( stat == 0 ) {
				hsed_paste idFooty
I pasted it into the tab of mes "ID" + str (cnt) + "."
			}
		loop
	} else {
mes "Cannot paste."
	}
	stop
%href
hsed_canpaste


%group
Clipboard operation command
%index
hsed_canpaste
Get the possibility of pasting

%prm
p1
p1: Variable to store the result

%inst
Acquires whether or not to paste.
If it can be pasted from the clipboard, 1 is returned in p1.
^
Please use hsed_paste when actually pasting.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	hsed_canpaste ret
	if ( ret ) {
mes "You can paste it."
	} else {
mes "Cannot paste."
	}
	stop

%href
hsed_paste
hsed_cancopy

%group
Information acquisition command
%index
hsed_canundo
Get undo approval or disapproval

%prm
p1, p2
p1: Variable to store the result
p2: Footy ID

%inst
Gets the availability of undo for the specified Football.
If undo is possible, 1 is returned in p1.
^
Please use hsed_undo to actually undo.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_canundo ret, idFooty
		if ( ret ) {
			hsed_undo idFooty
mes "ID" + idFooty + "Footy has been undone."
		} else {
mes "ID" + idFooty + "Footy could not be undone."
		}
	loop
	stop

%href
hsed_undo
hsed_canredo

%group
Information acquisition command
%index
hsed_canredo
Get the availability of redo

%prm
p1, p2
p1: Variable to store the result
p2: Footy ID

%inst
Acquires whether or not to redo the specified Football.
If redo is possible, 1 is returned in p1.
^
Please use hsed_redo when actually performing redo.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_canredo ret, idFooty
		if ( ret ) {
			hsed_redo idFooty
mes "ID" + idFooty + "Footy has been redone."
		} else {
mes "ID" + idFooty + "Footy could not be redone."
		}
	loop
	stop

%href
hsed_redo
hsed_canundo

%group
Information acquisition command
%index
hsed_getmodify
Get change flag

%prm
p1, p2
p1: Variable to store the result
p2: Footy ID

%inst
Gets the change flag for the specified Football.
If it has been changed, 1 is returned in p1.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getfootyid idFooty, cnt
		hsed_getmodify ret, idFooty
		if ( ret ) {
mes "ID" + idFooty + "Footy has changed."
		} else {
mes "ID" + idFooty + "Footy has not changed."
		}
	loop
	stop

%group
Information acquisition command
%index
hsed_settext
Change text

%prm
p1, p2
p1: ID of the Football you want to change
p2: Text to change

%inst
Change the text you are editing in the HSP Script Editor to p2.
^
If the change is successful, 0 is assigned to the system variable stat.

%sample
#include "hsedsdk.as"
	nTabID = 0
	hsed_getfootyid nFootyID, nTabID
if (stat == 0): hsed_settext nFootyID, "modified text"
	stop

%href
hsed_gettext
hsed_sendstr

%group
Text editing instructions
%index
hsed_getfootyid
Get Football ID from Tab ID

%prm
p1, p2
p1: Variable to assign the ID of Footy
p2: tab ID

%inst
; Fill in the commentary

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTab
	repeat nTab
		hsed_getfootyid idFooty, cnt
mes str (cnt) + "The ID of the third Football is" + idFooty + "."
	loop
	stop

%href
hsed_getactfootyid
hsed_gettabid
hsed_getacttabid

%group
Information acquisition command
%index
hsed_gettabid
Get tab ID from Footy ID

%prm
p1, p2
p1: Variable to assign the tab ID
p2: Footy ID

%inst
; Fill in the commentary

%href
hsed_getacttabid
hsed_getfootyid
hsed_getactfootyid

%group
Information acquisition command
%index
hsed_gettabcount
Get the number of tabs

%prm
p1
p1: Variable to assign the number of tabs

%inst
Get the number of tabs displayed at the top of the editor section of the HSP script editor and assign it to p1.
^
If the acquisition is successful, 0 is assigned to the system variable stat.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTab
if (stat == 0): mes "The number of tabs in the HSP script editor is" + nTab + "."

%group
Information acquisition command
%index
hsed_getactfootyid
Get the ID of the active Football

%prm
p1
p1: Variable to assign the ID of Footy

%inst
Get the Football ID displayed in the active tab of the HSP Script Editor and assign it to p1.
^
If the acquisition is successful, 0 is assigned to the system variable stat.
^
If acquisition fails, 1 is assigned to the system variable stat and -1 is assigned to p1.

%sample
#include "hsedsdk.as"
	hsed_getactfootyid idFooty
if (stat == 0): mes "The ID of the active Football is" + idFooty + "."

%href
hsed_getacttabid
hsed_gettabid
hsed_getfootyid

%group
Information acquisition command

%index
hsed_getacttabid
Get the ID of the active tab

%prm
p1
p1: Variable to assign the tab ID

%inst
Get the ID of the active tab in the HSP Script Editor and assign it to p1.
^
If the acquisition is successful, 0 is assigned to the system variable stat.
^
If acquisition fails, 1 is assigned to the system variable stat and -1 is assigned to p1.

%sample
#include "hsedsdk.as"
	hsed_getactfootyid idTab
if (stat == 0): mes "The ID of the active tab is" + idTab + "."

%href
hsed_getactfootyid
hsed_getfootyid
hsed_gettabid

%group
Information acquisition command

%index
hsed_getpath
Get the file path from the tab ID

%prm
p1, p2
p1: Variable to assign the file path
p2: tab ID

%inst
Get the pathname of the file opened in the HSP script editor and assign it to p1.
^
If the acquisition is successful, 0 is assigned to the system variable stat.

%sample
#include "hsedsdk.as"
	hsed_gettabcount nTabs
	if ( stat ) {
dialog "HSP editor not found", 1
		end
	}
	repeat nTabs
		hsed_getpath path, cnt
		if stat == 0 {
The file path for the mes "ID" + cnt + "tab is \\" "+ path +" \\ "."
		}
	loop
	stop

%group
Information acquisition command
