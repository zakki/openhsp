%ver
3.3
%date
2009/08/01
%author
onitama (thanks Chokuto-san)

%dll
mod_menu

%note
Include mod_menu.as.

%port
Win
Let

%url
http://yokohama.cool.ne.jp/chokuto/urawaza/api/AppendMenu.html

%type
User extension instructions

%group
Menu bar creation


%index
addmenu
Add a menu item

%prm
p1, p2, p3, p4
p1: Menu handle
p2: Menu string
p3: Menu item ID value
p4: Menu item attributes

%inst
Add an item to the menu created by newmenu.
If the menu creation fails, 0 is returned in stat.
^
For p1, specify the handle of the menu to which you want to add the item.
^
For p2, specify the character string to be displayed in the menu item. If you write a half-width alphabet after the half-width &, you can assign it as a shortcut key.
^
For p3, specify the ID of the menu item. If you specify 0x0010 for p4, specify the handle of the drop-down menu or submenu.
^
Specify menu item options for p4. Options can be used in combination with addition or OR operations.
html{
<table border="1">
<caption> 4th parameter of addmenu instruction (part) </ caption>
<tr> <td> 0x0000 </ td> <td> Default display </ td> </ tr>
<tr> <td> 0x0003 </ td> <td> Gray display / Not selectable </ td> </ tr>
<tr> <td> 0x0008 </ td> <td> Check items </ td> </ tr>
<tr> <td> 0x0010 </ td> <td> Added items to open drop-down menus or submenus </ td> </ tr>
<tr> <td> 0x0800 </ td> <td> Display separator (separator line) </ td> </ tr>
</table>
}html

%sample
#include "mod_menu.as"
#define CMD_A		1
#define CMD_B		2
#define CMD_D		3
#define CMD_QUIT	4

oncmd gosub * OnCommand, WM_COMMAND // Message interrupt
// Create a submenu directly under menu C
	newmenu hsubmenu2, 1
addmenu hsubmenu2, "Menu D (& D)", CMD_D
// Create submenu
	newmenu hsubmenu, 1
addmenu hsubmenu, "Menu A (& A)", CMD_A, 0x0003 // Gray display / not selectable
addmenu hsubmenu, "Menu B (& B)", CMD_B, 0x0008 // with checkmark
addmenu hsubmenu, "Menu C (& C)", hsubmenu2, 0x0010 // With submenu
addmenu hsubmenu, "", 0, 0x0800 // Separator
addmenu hsubmenu, "Exit (& Q)", CMD_QUIT
// Create top menu
	newmenu hmenu, 0
addmenu hmenu, "menu (& M)", hsubmenu, 0x10

	applymenu hmenu
	stop

// Message processing
*OnCommand
	cmd = wparam & 0xFFFF
	switch cmd
case CMD_A // Menu A is not available
		case CMD_QUIT
dialog "Exit selected"
			end
		case CMD_B
dialog "Menu B selected"
			swbreak
		case CMD_D
dialog "Menu D selected"
			swbreak
	swend
	return

%href
newmenu
applymenu
%index
applymenu
Assign menu to window

%prm
p1
p1: Menu handle

%inst
Assigns the menu created by newmenu to the currently selected window. Be sure to execute it after completing the menu creation.

%sample
// See the sample script in newmenu

%href
addmenu
newmenu
%index
newmenu
Get a new menu handle

%prm
p1, p2
p1: Variable name to store the result
p2: Type specification

%inst
Create a new menu and assign its handle to p1.
Specifies the type of menu created by p2. A menu is created for menu items if it is 0, and a menu for pop-up items is created if it is 1.

%sample
#include "mod_menu.as"
#define CMD_QUIT 1
oncmd gosub * OnCommand, WM_COMMAND // Message interrupt
// Create submenu
	newmenu hsubmenu, 1
addmenu hsubmenu, "Exit (& Q)", CMD_QUIT
// Create top menu
	newmenu hmenu, 0
addmenu hmenu, "menu (& M)", hsubmenu, 0x10

	applymenu hmenu
	stop

// Message processing
*OnCommand
	cmd = wparam & 0xFFFF
	if cmd == CMD_QUIT : end
	return

%href
addmenu
applymenu
