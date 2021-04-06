;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;

%type
Extension instructions
%ver
3.4
%note
Include hspprint.as.

%date
2014/01/11
%author
onitama
%dll
hspprint
%url
http://hsp.tv/
%port
Win
%portinfo
A Windows printer environment is required.


%index
prnflags
Set the linter enumeration flag
%group
Extended I / O control instructions
%prm
flag
flag (0): Printer enumeration flag

%inst
Sets the acquisition flag for the list of printers listed by the hspprint plugin.
The value specified in flag becomes the acquisition flag. The following flags can be specified. (Multiple can be combined)
^p
Definition name Contents
----------------------------------------------
PRINTER_ENUM_LOCAL Local printer
PRINTER_ENUM_CONNECTIONS Printers with established connections
PRINTER_ENUM_SHARED Printer with shared attribute enabled
^p
If the flag value is 0 or omitted, the default setting (PRINTER_ENUM_LOCAL + PRINTER_ENUM_CONNECTIONS) is used.

%href
enumprn


%index
enumprn
List printers
%group
Extended I / O control instructions
%prm
Variable: Variable name to which the resulting string is assigned

%inst
Gets a list of connected printer names as a character string.
If multiple printers are recognized, a multi-line string will be assigned. The number of printers assigned after the instruction is executed is assigned to the system variable stat.
The printer ID0, printer ID1 ... and the ID number correspond in order from the first line of the list acquired by the enumprn instruction.

%href
prnflags



%index
propprn
Get printer information
%group
Extended I / O control instructions
%prm
Variable 1, variable 2, id, type
Variable 1: Variable name to which the value of result X is assigned
Variable 2: Variable name to which the value of result Y is assigned
id (0): Printer ID (0 ~)
type (0): Information type to be retrieved

%inst
Get information about the printer and assign it to variable 1 and variable 2.
Specify the printer ID with id. The printer ID is indicated by the numerical value of 0, 1, 2 ... in order from the list acquired by the enumprn instruction.
The information to be assigned will be the content specified by type (information type). Select the information type from the following.
^p
Information type Content
----------------------------------------------
   0 Page resolution in Bixel units X, Y
   Physical size of one page X, Y (device unit)
   2 Distance to printable area X, Y (device unit)
   3 Physical page size X, Y (in mm)
^p
When X, Y values are assigned, the variable is set to an integer type.

%href
enumprn


%index
execprn
Start printer printing
%group
Extended I / O control instructions
%prm
id,x,y,sx,sy,bx,by,bsx,bsy,"name"
id (0): Printer ID (0 ~)
x, y: Image position on the printed page X, Y coordinates
sx, sy: Image size in printed page X, Y
bx, by: Upper left X, Y coordinates of the printed image
bsx, bsy: Printed image size X, Y
"name": document name

%inst
The image of the current operation window is printed by the printer.
Specify the printer ID with id. The printer ID is indicated by the numerical value of 0, 1, 2 ... in order from the list acquired by the enumprn instruction.

The size specified by (bsx, bsy) from the coordinates (bx, by) in the HSP image buffer will be printed. If bx and by are omitted, 0 is used respectively. If bsx and bsy are omitted, the maximum screen size will be used.
You can specify the position in the printed page with (x, y). This can be specified on a pixel-by-pixel basis within the page resolution range. In that case, the size can be specified by (sx, sy).
"name" is the document name displayed in the print queue. If you omit "name", "hspdoc" is used.

%href
enumprn



%index
getdefprn
Get the default printer
%group
Extended I / O control instructions
%prm
variable
Variable: Variable name to which the resulting string is assigned

%inst
Gets the default printer name and assigns it to a variable.

%href
enumprn


%index
prndialog
Open the printer settings dialog
%group
Extended I / O control instructions
%prm
id
id (0): Printer ID (0 ~)

%inst
Opens the printer settings dialog.
Specify the printer ID with id. The printer ID is indicated by the numerical value of 0, 1, 2 ... in order from the list acquired by the enumprn instruction.

%href
enumprn

