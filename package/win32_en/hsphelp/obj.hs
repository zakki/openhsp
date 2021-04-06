%group
Object control instructions

%type
User extension instructions

%note
Include obj.as.

%author
onitama

%dll
obj

%port
Win
%ver
3.3
%date
2009/08/01
%index
getobjsize
Get object size and position

%prm
p1, p2
p1: Numeric array variable to get the size and position of the object
p2: Object ID

%inst
Gets the size and position of the object.
For p2, specify the ID of the object to be acquired, such as button or listview.

The size and position of the object are assigned to p1 as follows.
p1 (0) width
p1 (1) height
p1 (2) Upper left x coordinate
p1 (3) Upper left y coordinate
p1 (4) Lower right x coordinate
p1 (5) Lower right y coordinate
Each coordinate is a window coordinate system.

%sample
#include "obj.as"
button "sample", * dummy
	getobjsize size, stat
mes "Button width:" + size (0)
mes "Button height:" + size (1)
*dummy
	stop

%href
resizeobj

%index
resizeobj
Resize object

%prm
p1, p2, p3
p1: Object ID
p2: Numeric array variable containing size and position
p3: Flag for not changing the position / size

%inst
Resize the object with IDp1.
Substitute in the order of width, height, x coordinate, y coordinate for p2.

When p3 is set to 1, only the size is changed without changing the position.
When p3 is set to 2, only the position is changed without changing the size.

%sample
#include "obj.as"
	button "width*2", *wx2
	button "height*2", *hx2
	input s, 100, 20
ipt_id = stat // Assign object ID to variable
// Move to (0, 80) with width 40 and height 30
	s = 40, 30, 0, 80
	resizeobj ipt_id, s
	stop
*wx2
Double the width
	getobjsize s, ipt_id
	s(0) *= 2
	resizeobj ipt_id, s
	stop
*hx2
Double the height
	getobjsize s, ipt_id
	s(1) *= 2
	resizeobj ipt_id, s
	stop

%href
getobjsize
%index
objgray
Object enable / disable setting

%prm
p1, p2
p1: Object ID
p2: Flag to enable or disable

%inst
Enables or disables objects such as buttons.
Assign an ID such as button or listview to p1.

A setting of p2 makes the object unusable, and a setting of 1 makes the object usable.
Setting p2 to -1 checks whether the object is available or not.

%sample
#include "obj.as"
button "Cannot press button", * dummy
	objgray stat, 0
*dummy
	stop
%index
p_scrwnd
Convert screen coordinate system to window coordinate system

%prm
p1
p1: Numeric array variable containing screen coordinate system

%inst
Converts the screen coordinate system to the window coordinate system.
Substitute the x coordinate for p1 (0) and the y coordinate for p1 (1).
It is based on the window to be drawn.

%sample
#include "obj.as"
	scr_pos = ginfo_mx, ginfo_my
	p_scrwnd scr_pos
message = "The screen coordinates of the mouse pointer are" + ginfo_mx + "," + ginfo_my + ". \\ N"
message + = "The window coordinates of the mouse pointer are" + scr_pos (0) + "," + scr_pos (1) + ". \\ N"
message + = "The system variables mousex, mousey are" + mousex + "," + mousey + "."
	dialog message
	stop

