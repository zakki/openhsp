;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;

%type
Extension instructions
%ver
3.5
%note
Include hspext.as.
%dll
hspext
%date
2009/08/01
%author
onitama
%url
http://hsp.tv/
%port
Win



%index
aplsel
Any window capture
%group
OS system control instructions
%prm
"window name",p1
"window name": The title name of the window to get
p1 = 0 to (0): Start ID

%inst
Captures the specified window and prepares to send a message.
^
Search for a window by specifying the string displayed in the window title for "window name".
"window name" can omit the ending string.
For example, a window named "HSP Script Editor" will match either "HSP" alone or the string "HSP Screen".
However, if there is a title with the same name, it is unclear which window will match.
^
You can determine the search ID to start the search by specifying the start ID with p1.
This search ID is the ID number of all windows (and tasks), numbered starting from 0.
You can capture a window with a search ID of p1 by writing "aplsel" ", p1".
^
If the aplsel instruction is executed and the window is successfully retrieved, the system variable stat is assigned 0 and the system variable refstr is assigned the exact window title name.
If the window search fails, the system variable stat is assigned 1 and the message cannot be sent.

%href
aplobj
aplact
aplfocus
aplstr
aplkey
aplkeyd
aplkeyu
aplget
apledit


%index
aplobj
Capture any object
%group
OS system control instructions
%prm
"object name",p1
"object name": Class name of the object to get
p1 = 0 to (0): Start object ID

%inst
Captures the objects (controls) that belong to the window captured by the aplsel instruction and prepares to send a message.
^
Search for an object by specifying the class name of the object (control) in "object name".
^
In p1, you can determine the search object ID to start the search by specifying the start ID. This ID is priced starting from 0.
You can capture the object ID by writing "aplsel" ", p1".
^
If the aplobj instruction is executed and the object is successfully retrieved, the system variable stat is assigned 0 and the system variable refstr is assigned the exact object class name.
If the window search fails, the system variable stat is assigned 1 and the message cannot be sent.

%href
aplsel
aplact
aplfocus
aplstr
aplkey
aplkeyd
aplkeyu
aplget
apledit


%index
aplact
Activate the window
%group
OS system control instructions

%inst
Activates the window captured by the aplsel and aplobj instructions to enable keyboard input.
^
If you want to send a key to a window other than HSP with the aplkey instruction, you need to keep the window active with the aplact instruction.

%href
aplsel
aplobj
aplfocus
aplstr
aplkey
aplkeyd
aplkeyu
aplget
apledit


%index
aplfocus
Make key destination the default
%group
OS system control instructions

%inst
Resets the window to which the key is sent to the default.
^
The default setting is to key the currently active window to the object that has keyboard input focus.

%href
aplsel
aplobj
aplact
aplstr
aplkey
aplkeyd
aplkeyu
aplget
apledit


%index
aplstr
Key send string
%group
OS system control instructions
%prm
"strings"
"strings": Key strings to send

%inst
The character strings specified by "strings" are sent to the target object as keyboard input data.
^
The aplstr instruction can send the character string as it is, but it cannot send the information of special keys such as the [ALT] key.
The aplstr instruction only queues key information.
You need to put a wait or await instruction after it to reflect the result of the actual press.
Sending too much information at one time can overwhelm the queue and prevent it from being sent successfully.
The aplstr instruction is not recognized by all applications. If you do not accept the transmission of the aplstr instruction, try using the aplkey instruction.

%href
aplsel
aplobj
aplact
aplfocus
aplkey
aplkeyd
aplkeyu
aplget
apledit


%index
aplkey
Send key code
%group
OS system control instructions
%prm
p1,p2
p1 = 0 to (0): Key code
p2 = 0 to (0): Special key code
^p
( 1 = SHIFT / 2 = CTRL / 4 = ALT )
^p

%inst
Sends the keyed information to the target object.
^
Specify the key code with p1. This is the same key code used in the getkey instruction. (See table below)
^
Specify the special key with p2. If it is 1, the shift key is pressed, if it is 2, the CTRL key is pressed, and if it is 4, the ALT key is pressed at the same time.
^
The aplkey instruction only queues key information.
In order to reflect the result of the actual press, it is necessary to insert a wait or await instruction immediately after.
If you specify 0 for p1, only the special key code information is sent.
^p
     Key code list
 ---------------------------------------------
        3: Cancel ([CTRL] + [BREAK])
        4: 3 button Button in the middle of the mouse
        8: [BACKSPACE] (PC98 [BS])
        9 : [TAB]
       13 : [ENTER]
       16 : [SHIFT]
       17 : [CTRL]
       18: [ALT] ([GRPH] of PC98)
       20 : [CAPSLOCK]
       27 : [ESC]
       32: Space bar
       33: [PAGE UP] (PC98 [ROLLDOWN])
       34: [PAGEDOWN] (PC98 [ROLLUP])
       35: [END] (PC98 [HELP])
       36: [HOME] ([HOMECLR] of PC98)
       37: Cursor key [<-]
       38: Cursor key [Å™]
       39: Cursor key [->]
       40: Cursor key [Å´]
 ---------------------------------------------
  48 to 57: [0] to [9] (main keyboard)
  65-90: [A]-[Z]
  96 to 105: [0] to [9] (numeric keypad)
 112 ~ 121: Function keys [F1] ~ [F10]
 ---------------------------------------------
^p

%href
aplsel
aplobj
aplact
aplfocus
aplstr
aplkeyd
aplkeyu
aplget
apledit


%index
aplkeyd
Key press transmission
%group
OS system control instructions
%prm
p1,p2
p1 = 0 to (0): Key code
p2 = 0 to (0): Special key code
^p
( 1 = SHIFT / 2 = CTRL / 4 = ALT )
^p

%inst
Sends the keyed information to the target object.
^
Specify the key code with p1. This is the same key code used in the getkey instruction.
^
Specify the special key with p2. If it is 1, the shift key is pressed, if it is 2, the CTRL key is pressed, and if it is 4, the ALT key is pressed at the same time.
^
Unlike the aplkey instruction, the aplkeyd instruction sends only the information that the key was pressed.
Use it when you want to keep pressing a key or when you want to create a state where multiple keys are pressed at that time.
Also, after sending the information that the key was pressed with the aplkeyd command, the information that the key was released must be sent with the aplkeyu command. The aplkeyd instruction only queues key information.
In order to reflect the result of the actual press, it is necessary to insert a wait or await instruction immediately after.
If you specify 0 for p1, only the special key code information is sent.

%href
aplsel
aplobj
aplact
aplfocus
aplstr
aplkey
aplkeyu
aplget
apledit


%index
aplkeyu
Key up transmission
%group
OS system control instructions
%prm
p1,p2
p1 = 0 to (0): Key code
p2 = 0 to (0): Special key code
^p
( 1 = SHIFT / 2 = CTRL / 4 = ALT )
^p

%inst
The information that the key is released is sent to the target object.
^
Specify the key code with p1. This is the same key code used in the getkey instruction.
^
Specify the special key with p2. If it is 1, the shift key is pressed, if it is 2, the CTRL key is pressed, and if it is 4, the ALT key is pressed at the same time.
^
The aplkeyu instruction sends only the information that the key was released. Be sure to use it as a pair with the aplkeyd instruction.
If you omit the specification of p1, the key code specified by the aplkeyd instruction and the same special key code are used.
The aplkeyu instruction only queues key information.
In order to reflect the result of the actual press, it is necessary to insert a wait or await instruction immediately after.

%href
aplsel
aplobj
aplact
aplfocus
aplstr
aplkey
aplkeyd
aplget
apledit


%index
aplget
Get the string of the object
%group
OS system control instructions
%prm
p1,p2
p1 = variable: variable name to read the character string of the object
p2 = 0 to (64): Maximum number of characters

%inst
Gets the character string set for the object selected by the aplobj instruction.
^
If the object is "BUTTON" etc., the character string set there is read, and if it is a window, the character string displayed in the title is read.
^
If p2 is omitted, up to 64 characters can be read.
To read a character string of 64 characters or more, specify the maximum number of characters in p2.
(Sufficient buffer must be secured for the variable to be read in advance)
^
If the window specification is the default with the aplfocus instruction, the title string of the currently active window is read.
You cannot call the edits of the "EDIT" object with the aplget instruction.
Information other than the edited contents of the "EDIT" object can be obtained with the apledit command.

%href
aplsel
aplobj
aplact
aplfocus
aplstr
aplkey
aplkeyd
aplkeyu
apledit


%index
apledit
Edit control information acquisition
%group
OS system control instructions
%prm
p1,p2,p3
p1 = variable: numeric variable name where information is stored
p2 = 0 to 2: Acquisition information No.
p3 = 0 ~: Row index specification

%inst
Gets the information of the "EDIT" type object selected by the aplobj instruction.
^
Specify the variable name to read to in p1, and specify the type of information in p2.
^
p2 = 0: Current cursor position (1 byte unit)
p2 = 1: Total number of lines
p2 = 2: Number of characters on the line specified by p3
^
The parameter p3 is meaningful only when 2 is specified for p2.
Also, when p2 is 0 (cursor position acquisition), the number of bytes from the beginning to the cursor in the variable specified in p1, and if there is a selection range, the number of bytes in the range selected from the cursor position in the system variable stat. Is substituted.

%href
aplsel
aplobj
aplact
aplfocus
aplstr
aplkey
aplkeyd
aplkeyu
aplget



%index
clipset
Clipboard text transfer
%group
OS system control instructions
%prm
"strings"
"strings": Strings to send to the clipboard

%inst
Sends the character strings specified by "strings" to the clipboard.
^
The text data sent to the clipboard can be pasted by other applications.


%index
clipsetg
Clipboard image transfer
%group
OS system control instructions

%inst
Sends the currently selected screen as bitmap data to the clipboard.
^
The image data sent to the clipboard can be pasted by other applications.


%index
clipget
Get clipboard text
%group
OS system control instructions
%prm
p1,p2
p1 = variable: variable name where information is stored
p2 = 0 to (64): Maximum number of characters

%inst
Reads the content of the text sent to the clipboard and assigns it to the string type variable specified by p1.

The content to be read is only the text copied by other applications.
Images and sounds cannot be retrieved. If p2 is omitted, up to 64 characters can be read. To read a character string of 64 characters or more, specify the maximum number of characters in p2.
(Sufficient buffer must be secured for the variable to be read in advance)



%index
comopen
Initialize serial port
%group
Communication control command
%prm
p1,"protocol"
p1 = 0 to (0): COM port number
"protocol": Protocol specification string

%inst
Initializes the serial port so that it can send and receive.
^
To use the serial communication instruction set, you must first initialize the port with the comopen instruction.
Use p1 to specify the COM port number. If it is 1, COM1 corresponds, if it is 2, COM2Åc corresponds. If p1 is 0, the printer (parallel) port is specified instead of serial.
You can write a protocol specification string with "protocol".
The protocol specification character string must be described as follows.
^
"baud=1200 parity=N data=8 stop=1"
^
In the above example, the baud rate is specified as 1200 bps, no parity bit, 8 data bits, and 1 stop bit.
If nothing is written in "protocol" (specify ""), the current default value will be used. Normally, you don't have to specify anything.
^
With serial communication instructions, you can control only one port at a time.
Please note that it is not possible to build software that monitors multiple serial ports at the same time.
^
Be sure to open the serial port last, as once initialized, other applications will not be available until you open it. In particular, create a script that calls attention at the end with a onexit command etc. so that you do not press the close box during communication and end.
^
If the serial port is successfully initialized, the value of the system variable stat will be 0.
.. If the initialization fails, the value of the system variable stat will be 1.

%href
comclose
comput
comget
computc
computb
comgetc
comstat
comcontrol


%index
comclose
Release serial port
%group
Communication control command

%inst
Ends communication with the serial port.
^
The serial port initialized with the comopen instruction must always be released last with the comclose instruction.
Note that if the program terminates without the port being released by the comclose instruction, other programs will never be able to access the port.
..

%href
comopen


%index
comput
Send to serial port
%group
Communication control command
%prm
"send-string"
"send-string": Send string

%inst
Sends the character string specified by "send-string" to the serial port.
^
After executing the instruction, the result is returned in the system variable stat.
If the system variable stat is 0, it means that communication has failed and has not been sent.
If it is 1 or more, the number of bytes (characters) that was successfully transmitted is assigned.
This instruction sends a string. If you want to send non-string (binary) data, use the computeb instruction.

%href
comopen
comclose
computc
computb


%index
computc
Send to serial port
%group
Communication control command
%prm
p1
p1 = 0 to 255 (0): Transmission data (1 byte)

%inst
Sends 1 byte of numeric data specified by p1 to the serial port.
^
After executing the instruction, the result is returned in the system variable stat.
If the system variable stat is 0, it means that communication has failed and has not been sent.

%href
comopen
comclose
comput
computb


%index
computb
Send binary to serial port
%group
Communication control command
%prm
p1,p2
p1 = variable: variable name where binary data is stored
p2 = 0 ~: Transmission data size

%inst
Sends the buffer contents of the string type variable specified by p1 to the serial port as binary data.
Specify the transmission data size with p2. If you omit p2, the size of the entire variable buffer is used.
If you want to send a string to the serial port, use the compute instruction.
^
After executing the instruction, the result is returned in the system variable stat.
If the system variable stat is 0, it means that communication has failed and has not been sent.

%href
comopen
comclose
comput
computc


%index
comgetc
Received from serial port
%group
Communication control command
%prm
p1
p1 = Numeric variable: Variable name to which received data is assigned

%inst
Receives 1 byte from the serial port and assigns it to the variable specified by p1.
^
After executing the instruction, the result is returned in the system variable stat.
If the system variable stat is 0, it indicates that the receive buffer is empty.

%href
comopen
comclose
comget


%index
comget
Receive string from serial port
%group
Communication control command
%prm
p1,p2
p1 = string type variable: variable name to which received data is assigned
p2 = 1 ~ (64): Specify the number of received characters

%inst
Receives a string from the serial port and assigns it to the variable specified on p1.
^
You can specify the number of characters to receive with p2. After executing the instruction, the result is returned in the system variable stat.
If the system variable stat is 0, it indicates that the receive buffer is empty.
If the reception is successful, the character string is assigned to p1 and the number of characters actually received is assigned to the system variable stat.

%href
comopen
comclose
comgetc



%index
comcontrol
Special control of serial port
%group
Communication control command
%prm
p1
p1 = 1 to 9 (0): Special control function specification

%inst
Gives special control to the serial port.
With p1, specify the function to control from the following.
^p
           Value function
-----------------------------------------------------------------------
SETXOFF 1 Sends as if a XOFF character was received.
SETXON 2 Sends as if a XON character was received.
SETRTS 3 Sends an RTS (send request) signal.
CLRRTS 4 Clears the RTS (send request) signal.
SETDTR 5 Sends a DTR (data terminal ready) signal.
CLRDTR 6 Clears the DTR (data terminal ready) signal.
RESETDEV 7 Resets the device
SETBREAK 8 Characters Suspends transmission and disconnects the transmission line.
CLRBREAK 9 Cancels the disconnection status of the transmission line and resumes character transmission.
^p
If the status acquisition is successful, the system variable stat will be 0.
If an error occurs, the system variable stat will be 1.

%href
comstat



%index
comstat
Serial port status acquisition
%group
Communication control command
%prm
p1
p1 = Numeric array variable: Variable name to which state data is assigned

%inst
Gets the serial port status and assigns it to the variable specified in p1.
The following information is assigned to the variable specified by p1 from p1.0 to p1.3 in the array.
^p
-----------------------------------------------------------------------
a.0
When an error occurs, the following combination of error flags is assigned.

CE_RXOVER 0x0001 Receive buffer overflow.
CE_OVERRUN 0x0002 Overrun error.
CE_RXPARITY 0x0004 Parity error when receiving.
CE_FRAME 0x0008 Framing error.
CE_BREAK 0x0010 Break state.
CE_TXFULL 0x0100 The send buffer is full.
CE_PTO 0x0200 Timeout.
CE_IOE 0x0400 General I / O error.
CE_DNS 0x0800 No device selected.
CE_OOP 0x1000 Out of feed error.
CE_MODE 0x8000 This is an unsupported mode.

a.1
The following device status flags are assigned.

bit0 fCtsHold ON: Send waits for CTS
bit1 fDsrHold ON: Send waits for DSR
bit2 fRlsdHold ON: Send waits for RLSD (CD)
bit3 fXoffHold ON: Transmission is stopped because XOFF was transmitted.
bit4 fXoffSent ON: Transmission is stopped because XOFF was transmitted.
bit5 fEof ON: Received EOF
bit6 fTxim ON: Data remains in the send buffer

a.2
cbInQue Number of bytes of data in the receive buffer
a.3
cbOutQue Number of bytes of data in the send buffer
-----------------------------------------------------------------------
^p
If the status acquisition is successful, the system variable stat will be 0.
If an error occurs, the system variable stat will be 1.


%href
comcontrol





%index
gfini
Set the target screen
%group
Extended screen control command
%prm
p1,p2
p1 = 0 to (0): X size (dot unit) for screen operation
p2 = 0 to (0): Y size (dot unit) for screen operation

%inst
Full-color screen Set the screen for which operation commands are to be issued.
^
Be sure to set the target screen with the gfini command before using other full-color screen operation commands.
The gfini instruction targets the size specified by p1 and p2 from the current position of the window currently selected by the gsel instruction.
Be sure to perform this on the screen that has been initially set in full color mode.


%index
gfcopy
Translucent copy
%group
Extended screen control command
%prm
p1
p1 = 0-100 (0): Semi-transparent copy rate (%)

%inst
Copies the screen image at the rate specified by p1.
^
The copy destination will be the screen set by the gfini instruction.
The copy source will be the current position of the screen set as the drawing destination when the gfcopy command is executed.
The rate for p1 is 0-100 (%) and 100% is a normal copy. The actual screen is not updated just by executing this command.
It will be reflected only after updating the screen with "redraw 1" etc.

%href
gfini


%index
gfdec
Screen color subtraction
%group
Extended screen control command
%prm
p1,p2,p3
p1, p2, p3 = 0 to 255 (0): Color code (brightness of R, G, B)

%inst
The numerical values specified by p1, p2, and p3 are subtracted from all the dots in the screen set by the gfini instruction.
^
p1 is for R, p2 is for G, and p3 is for B. This is useful in full color mode when you want the effect of slowly fading out the color. The actual screen is not updated just by executing this command.
It will be reflected only after updating the screen with "redraw 1" etc.

%href
gfini


%index
gfinc
Screen color addition
%group
Extended screen control command
%prm
p1,p2,p3
p1, p2, p3 = 0 to 255 (0): Color code (brightness of R, G, B)

%inst
The numerical values specified by p1, p2, and p3 are added to all the dots in the screen set by the gfini instruction.
^
p1 is for R, p2 is for G, and p3 is for B. This is useful in full color mode for the effect of slowly whitening the color (whiteout). The actual screen is not updated just by executing this command.
It will be reflected only after updating the screen with "redraw 1" etc.

%href
gfini


%index
fxcopy
Copy / move files
%group
Extended file operation command
%prm
p1,"dest",p2
p1 = variable: Character string type variable name that stores the file name of the copy source
"dest": Copy destination path name
p2 = 0,1 (0): Mode specification (0 = copy / 1 = move)

%inst
Copies or moves the specified file to another path.
^
In p1, specify the variable name that stores the copy source file name in advance.
In "dest", specify the destination directory or drive.
Depending on the mode of p2, you can specify either copy or move.
If you omit the specification of p2, it will be a copy.
If you specify a move mode, the original file is deleted. However, the move must be in the same drive.
^
The fxcopy instruction uses the Windows shell to copy and move at high speed. It is faster than the HSP bcopy instruction, but please note that you cannot access the file specified by packfile.
If the instruction fails to execute, the system variable stat is assigned 1. If successful, the system variable stat will be 0.

%sample
a="test.bin"
fxcopy a, "c: \\\\ temp"; copy "test.bin" to C: \\ temp


%index
fxren
Rename file
%group
Extended file operation command
%prm
p1,"new name"
p1 = variable: string type variable name that stores the original file name
"new name": new file name

%inst
Renames the specified file to the file name specified by "new name".
^
In p1, specify the variable name that stores the original file name in advance.
For "new name", specify a new file name.
If the instruction fails to execute, the system variable stat is assigned 1. If successful, the system variable stat will be 0.


%index
fxinfo
Get drive information
%group
Extended file operation command
%prm
p1,p2,p3
p1 = variable: variable name where information is stored
p2 = 0 to (0): Drive specification
p3 = 0 to (0): Information type specification

%inst
Assigns information about the drive specified in p2 to the variable specified in p1.
^
The drive specified by p2 is the current drive if it is 0, the A drive if it is 1, the B drive if it is 2, and so on, 1 to 26 correspond to the A to Z drives.
You can get various drive information by specifying the information type on p3. The numerical values that can be specified with p3 are as follows.
^p
  p3: Variable type: Information content
 ---------------------------------------------------------
  0: Numeric type: Remaining capacity of drive (byte)
  1: Numeric type: Number of sectors per cluster
  2: Numeric type: Number of bytes per sector
  3: Numeric type: Number of free clusters
  4: Numeric type: Total number of clusters
  8: Numeric type: Drive type
 16: String type: Volume label name
 17: String type: File system name
 18: Numeric type: Volume serial number
 19: Numeric type: Maximum number of file characters that can be used
 20: Numeric type: File system flag
 32: Character string type: Remaining capacity of drive (byte) (supports large capacity)
^p
The type assigned to the variable of p1 differs depending on the specified type. For types 16 and 17, you must specify a string type variable in advance.
The details of the drive type value that can be obtained with type 8 are as follows.
^p
  Type: Content
 --------------------------------
     0: Unknown drive
     1: No drive
     2: Removable disk
     3: Hard disk
     4: Remote (network) drive
     5: CD-ROM drive
     6: RAM disk
^p
If the instruction fails to execute, the system variable stat is assigned 1. If successful, the system variable stat will be 0.
^
The remaining capacity of the drive obtained by specifying 0 for p3 is a value up to 2 Gbyte.
If the value exceeds 2G, specify 32 for p3 and use the method to obtain the size as a character string.


%index
fxaget
Get file attributes
%group
Extended file operation command
%prm
p1,"file"
p1 = variable name: numeric variable name where information is stored
"file": Specify file name

%inst
Reads the attributes of the file specified by "file" and assigns them to the variables specified by p1.
^
The read attributes include the following numbers.
^p
  Attribute: Content
 --------------------------------
     $ 1: Write-protected
     $ 2: Hidden files
     $ 4: System
    $ 10: Directory
    $ 20: Archive
    $ 80: Standard type
   $ 100: Temporary file
   $ 800: Compressed file
  $ 1000: Offline
^p
If multiple attributes are set at the same time, the value will be the sum of the respective values. If the instruction fails to execute, the system variable stat is assigned 1. If successful, the system variable stat will be 0.


%index
fxaset
Set file attributes
%group
Extended file operation command
%prm
"file",p1
"file": Specify file name
p1 = 0 to (0): Attribute to set

%inst
Set the attribute specified by p1 to the file specified by "file".
^
The following numerical values can be used for the attribute value specified by p1.
^p
  Attribute: Content
 --------------------------------
     $ 1: Write-protected
     $ 2: Hidden files
     $ 4: System
    $ 10: Directory
    $ 20: Archive
    $ 80: Standard type
   $ 100: Temporary file
   $ 800: Compressed file
  $ 1000: Offline
^p
If you want to set multiple file attributes at the same time, add the values of each.
If the instruction fails to execute, the system variable stat is assigned 1. If successful, the system variable stat will be 0.


%index
fxtget
Get timestamp
%group
Extended file operation command
%prm
p1,"file"
p1 = variable name: Numeric array variable name where information is stored
"file": Specify file name

%inst
Acquires the time stamp information of the file specified by "file" and assigns it to the variable specified by p1.
^
However, the variable of p1 is an array variable, and it is necessary to allocate enough memory to store 24 or more elements of numeric type.
Therefore, the variables specified by the fxtget and fxtset instructions should be used after declaring an array such as "dim a, 24" with the dim instruction in advance. The acquired time stamp information is assigned to each element of the array variable.
For example, if you specify "fxt get a," test "", the information will be assigned to variables a.0 to a.23. The details of the values assigned to each element of the array are as follows.
^p
  Element: Contents
 ----------------------------------------
   0: Year of creation (AD)
   1: Month of creation date
   2: Creation date day of the week (Sunday = 0)
   3: Date of creation
   4: At the time of creation date
   5: For the creation date
   6: Seconds of creation date
   7: Milliseconds of creation date
 ----------------------------------------
   8: Year of update date (AD)
   9: Update date month
  10: Update day of the week (Sunday = 0)
  11: Update date
  12: At the time of update date
  13: Update date
  14: Second of update date
  15: Update date milliseconds
 ----------------------------------------
  16: Year of the last access date (AD)
  17: Month of last access date
  18: Last access day of the week (Sunday = 0)
  19: Last access date
  20: At the time of the last access date
  21: For the last access date
  22: Seconds of last access date
  23: Milliseconds of last access date
 ----------------------------------------
^p
If the instruction fails to execute, the system variable stat is assigned 1.
If successful, the system variable stat will be 0.


%index
fxtset
Set timestamp
%group
Extended file operation command
%prm
p1,"file"
p1 = variable name: Numerical array variable name that stores the information to be set
"file": Specify file name

%inst
Change the time stamp information of the file specified by "file" to that of the variable specified by p1.
^
However, the variable of p1 is an array variable, and it is necessary to allocate enough memory to store 24 or more elements of numeric type. The array variable specified by p1 has the same format as that used by the fxtget instruction. For details on the values specified for array variables, refer to the explanation of the fxtget instruction.
If the instruction fails to execute, the system variable stat is assigned 1. If successful, the system variable stat will be 0.
^
The time stamp set by the fxtset instruction may not be set completely depending on the file system of the OS. This is because the file system does not store time in its entirety. For example, for Windows 95 (FAT), the time of the last access date is not recorded. It will be the date only. Also, data in seconds is recorded roughly.

%href
fxtget


%index
selfolder
Folder selection dialog
%group
Extended file operation command
%prm
p1,"message"
p1 = variable name: String type variable name that stores the selected path name
"message": The character string displayed in the dialog

%inst
Display the folder selection dialog used in the Windows system to get the folder name.
^
Upon successful selection, the system variable stat is assigned 0. If there is an error or cancellation during selection, the value of the system variable stat will be 1.
If selected successfully, the full pathname to the folder will be assigned to the variable specified in p1. Also, the folder name is assigned to the system variable refstr.
In the "message" part, you can specify the character string to be displayed above when the dialog is displayed.
If you specify "" ", the standard message" Please select a folder "is displayed.


%index
fxshort
Get DOS filename
%group
Extended file operation command
%prm
p1,"file"
p1 = variable name: String type variable name where information is stored
"file": Specify file name

%inst
Converts the file specified by "file" to a DOS file name and assigns it to the variable specified by p1.
^
The file name specified in "file" must be the long file name used by Windows.
It can be used to get the file name to be passed to a DOS prompt application.
^
To convert DOS file names to long file names, you can use the standard dirlist instruction.


%index
fxdir
Get a special directory name
%group
Extended file operation command
%prm
p1,p2
p1 = variable name: String type variable name where information is stored
p2 = 0 to (0): Type of directory information to be acquired

%inst
Assigns the directory name of the type specified in p2 to the variable specified in p1.
With this instruction, you can get the various directory names used by the Windows system.
^
The numerical values that can be specified with p2 are as follows.
^p
   p2: What is acquired
 ------------------------------------------------------------
  -2: Windows temporary folder
  -1: Windows System folder
   2: Folder in the Start Menu "Programs" group
   5: "My Documents" folder
   6: Folder with "favorites"
   7: "Startup" folder
   8: "Recent Documents" folder
   9: "Send To" folder
  11: Start menu folder
  16: Desktop folder
  21: Template folder
  26: Application Data folder
  27: Printer device folder
  32: Internet cache folder
  33: Internet Cookies folder
  34: Internet history folder
^p
If the specification is incorrect or an error occurs, 1 is assigned to the system variable stat. Upon successful completion, the system variable stat will be 0.


%index
fxlink
Create shortcut
%group
Extended file operation command
%prm
p1,"path"
p1 = variable name: String type variable name where the shortcut name is stored
"path": full pathname of the underlying file

%inst
Creates a shortcut to the file specified in p2 in the current directory with the name specified in p1.
^
The p1 must be a string variable that contains the shortcut name. Also, specify the shortcut name without including the extension, drive, or directory name.
(It will not be displayed in Explorer, but will automatically have the extension .lnk)
For p2, specify the location of the shortcut destination with the full path.
Also, if you specify a URL such as "http://www.onionsoft.net/hsp/" for p2, an internet shortcut will be created.
^
If the specification is incorrect or an error occurs, 1 is assigned to the system variable stat. Upon successful completion, the system variable stat will be 0.


%index
lzdist
Specify the compression / decompression destination directory
%group
Extended file operation command
%prm
"path"
"path": Decompression copy destination directory of lzcopy instruction

%inst
Specify the decompression copy destination directory of the lzcopy instruction.
^
When executing the lzcopy instruction, it is necessary to specify the copy destination in advance with the lzdist instruction.


%index
lzcopy
Compressed and decompressed copy
%group
Extended file operation command
%prm
"name"
"name": Compressed file name

%inst
Make a copy while decompressing the compressed file in Microsoft's compress.exe format.
^
The compressed file specified by "name" in the current directory is copied to the directory specified by the lzdist instruction in the decompressed form.
For "name", specify a name that does not include an extension (up to 8 characters).
When executing the lzcopy instruction, it is necessary to specify the copy destination in advance with the lzdist instruction.
^
If the specification is incorrect or an error occurs, 1 is assigned to the system variable stat. Upon successful completion, the system variable stat will be 0.





%index
emath
Specify fixed decimal precision
%group
Extended I / O control instructions
%prm
p1
p1 = 2 to 30 (8): Fixed decimal bit precision

%inst
Simple Mathematical Function Sets the precision of fixed decimals used throughout the instruction set.
^
Specify the precision bit number with p1. For example, if 16 is specified, the format will be "integer 16bit + decimal 16bit".
The higher the bit precision of a fixed decimal number, the more accurate the decimal point operation without error becomes possible, but the range that can be handled by the integer part becomes narrower.
By default, it is set to 8bit.


%index
emstr
Convert fixed decimals to strings
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1 = variable name: String type variable name where the character string is stored
p2 = 0 ~: Fixed decimal value
p3 = 1 to (10): Number of digits in the character string to be converted

%inst
Converts a fixed decimal value to a string containing a decimal point.
^
The converted character string is assigned to the character string type variable specified in p1.
For p2, specify the fixed decimal value (the variable to which it is assigned) to be converted.
You can specify the number of digits to be converted with p3.
If you omit the specification of p3, it will be 10 digits.


%index
emcnv
Convert a string to a fixed decimal
%group
Extended I / O control instructions
%prm
p1,"val"
p1 = variable name: numeric variable name where fixed decimals are stored
"val": A string indicating a fixed decimal number

%inst
Converts the string specified by "val" to a fixed decimal value and assigns it to the variable on p1.
^
For example, if you specify the string "3.1415", it will be converted to a fixed decimal and stored.


%index
emint
Convert fixed decimals to integers
%group
Extended I / O control instructions
%prm
p1,p2
p1 = variable name: Numeric variable name where integer values are stored
p2 = 0 ~: Fixed decimal value

%inst
"Converts a fixed decimal value to a normal 32-bit integer and assigns it to the numeric variable specified by p1.
^
When converting to an integer, all fractional parts are truncated.


%index
emsin
Ask for a sign
%group
Extended I / O control instructions
%prm
p1,p2
p1 = variable name: numeric string type variable name where the result is stored
p2 = 0 ~: Angle (fixed decimal)

%inst
Finds the sine value of the angle specified by p2 and assigns it to the variable specified by p1.
^
For the angle of p2, specify a fixed decimal value.
The unit is a number that starts from 0 and makes one rotation at 1.0.
If you look at the value of p2 as a 32-bit integer value, it starts from 0, 64 is 90 degrees, 128 is 180 degrees, 192 is 270 degrees, and 256 is 360 degrees (when the precision of the fixed decimal is 8 bits).


%index
emcos
Ask for cosine
%group
Extended I / O control instructions
%prm
p1,p2
p1 = variable name: numeric string type variable name where the result is stored
p2 = 0 ~: Angle (fixed decimal)

%inst
Finds the cosine value of the angle specified by p2 and assigns it to the variable specified by p1.
^
For the angle of p2, specify a fixed decimal value.
The unit is a number that starts from 0 and makes one rotation at 1.0.
If you look at the value of p2 as a 32-bit integer value, it starts from 0, 64 is 90 degrees, 128 is 180 degrees, 192 is 270 degrees, and 256 is 360 degrees (when the precision of the fixed decimal is 8 bits).


%index
emsqr
Find the square root
%group
Extended I / O control instructions
%prm
p1,p2
p1 = variable name: numeric string type variable name where the result is stored
p2 = 0 ~: Fixed decimal

%inst
Finds the square root of the fixed decimal number specified by p2 and assigns it to the variable specified by p1.
^
If you specify a negative value or 0 for p2, 0 is returned.


%index
ematan
Find the arc tangent
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1 = variable name: numeric string type variable name where the result is stored
p2 = 0 ~: X value
p3 = 0 ~: Y value

%inst
Find the Y / X arctangent and assign it to the variable specified by p1.
^
This is mainly used to find the angle between two points.
To find the angle between the coordinates (X1, Y1) and the coordinates of (X2, Y2), specify the difference between the coordinates, the X value is (X2-X1), and the Y value is (Y2-Y1).
The value of the angle assigned to p1 is the same as the unit of angle used in the emsin and emcos instructions (starting from 0 and making one rotation at 1.0).



%index
regkey
Registry key specification
%group
OS system control instructions
%prm
p1,"key-name",p2
p1 = 0 to (0): Key group specification
"key-name": Key name specification
p2 = 0 to 1 (0): Existing key (0) / New creation (1) Mode switch

%inst
Specifies the registry key to access. When reading or writing to the registry, you must first specify the key and read / write mode with the regkey instruction.
^
In p1, specify the key group. Choose from the following:
^p
   p1 : key group
 -----------------------------------------------------
   0  : HKEY_CURRENT_USER
   1  : HKEY_LOCAL_MACHINE
   2  : HKEY_USERS
   3  : HKEY_CLASSES_ROOT
   4: HKEY_DYN_DATA (Windows95 / 98 only)
   5: HKEY_PERFORMANCE_DATA (Windows NT only)
^p
In "key-name", the tree is separated by "\\\\" and the hierarchy is specified like "Software \\\\ OnionSoftware \\\\ hsed".
Finally, set the read / write mode with p2. If p2 is 0, the read mode is set and the contents of the section specified by the getreg instruction can be read. If p2 is 1, the new creation mode is set and the section specified by the setreg instruction is added.
Set p2 to 0 to read or modify an existing registry.
^
After executing the regkey instruction, the result is returned in the system variable stat.
If the system variable stat is non-zero, it indicates that something is wrong.


%index
getreg
Registry read
%group
OS system control instructions
%prm
p1,"section",p2,p3
p1 = variable name: variable name to read
"section": Specify section name
p2 = 0 to 1 (0): Type specification
p3 = 1 to (64): Read size specification

%inst
Reads the contents of the specified section into the variable specified by p1.
^
It is necessary to specify the location of the registry to be accessed with the regkey instruction in advance before using it. If the target registry location is not specified, an error will be displayed.
Specify the type with p2, the code of the type is as follows.
^p
   p2 : type code
 --------------------------
   0: Numerical value (32bit)
   1: String
   2: Binary data
^p
Specify the read size with p3. This is valid if you choose a string or binary type.
^
After executing the instruction, the result is returned in the system variable stat.
If the system variable stat is non-zero, it indicates that something is wrong.

%href
regkey


%index
setreg
Registry write
%group
OS system control instructions
%prm
p1,"section",p2,p3
p1 = variable name: variable name to write
"section": Specify section name
p2 = 0 to 1 (0): Type specification
p3 = 1 ~ (64): Write size specification

%inst
Writes the contents of the variable specified by p1 to the specified section.
^
It is necessary to specify the location of the registry to be accessed with the regkey instruction in advance before using it. If the target registry location is not specified, an error will be displayed.
Specify the type with p2, the code of the type is as follows.
^p
   p2 : type code
 ---------------------------
   0: Numerical value (32bit)
   1: String
   2: Binary data
^p
Specify the write size with p3. This is only valid when you choose the binary type.
^
Although all information can be accessed by the registry operation command, writing the wrong system information can cause serious problems such as the system not working in the worst case, so be careful when operating the registry.
^
After executing the instruction, the result is returned in the system variable stat.
If the system variable stat is non-zero, it indicates that something is wrong.

%href
regkey


%index
regkill
Registry key deletion
%group
OS system control instructions
%prm
p1,"key-name"
p1 = 0 to (0): Key group specification
"key-name": Key name specification

%inst
Deletes the specified registry key.
^
In p1, specify the key group. Choose from the following:
^p
   p1 : key group
 ---------------------------------------------------
   0  : HKEY_CURRENT_USER
   1  : HKEY_LOCAL_MACHINE
   2  : HKEY_USERS
   3  : HKEY_CLASSES_ROOT
   4: HKEY_DYN_DATA (Windows95 / 98 only)
   5: HKEY_PERFORMANCE_DATA (Windows NT only)
^p
In "key-name", the tree is separated by "\\\\" and the hierarchy is specified like "Software \\\\ OnionSoftware \\\\ hsed".
^
After executing the instruction, the result is returned in the system variable stat.
If the system variable stat is non-zero, it indicates that something is wrong.
^
Be careful if there are more keys under the specified registry key. If the OS is Windows NT and there are more keys under the registry key, an error will occur and you will not be able to delete them.
Keep this in mind when creating scripts that work on both Windows95 (98) / NT.


%index
reglist
Get registry list
%group
OS system control instructions
%prm
p1,p2
p1 = variable name: variable name to read
p2 = 0 to 1 (0): Mode specification

%inst
Gets the list of registry keys at the specified location.
^
It is necessary to specify the location of the registry to be accessed with the regkey instruction in advance.
When the mode of p2 is 0, the "section list" is acquired, and when the mode is 1, the "key list" is acquired.
For example, if there are two registry keys, "Software \\\\ OnionSoftware \\\\ hsed" and "Software \\\\ OnionSoftware \\\\ hspcomm", the key list below the location of "Software \\\\ OnionSoftware" is "". It will be "hsed" and "hspcomm".
This allows you to find out what keys and sections exist in the registry tree.

The acquired information is assigned to the character string type variable specified in p1.
Each item is retrieved separated by a line break (\\ n), so it is safer to have enough variable buffers in advance.
The acquired character string can be used as it is in the memory notepad instruction, listbox instruction, and combox instruction.

%href
regkey



%index
sysexit
Notify system of termination
%group
OS system control instructions
%prm
p1
p1 = 0 to (0): End type specification

%inst
Shut down a running Windows system.
^
Windows will exit according to the type specified in p1. When this instruction is executed, all applications will be terminated. Please use it with great care, such as saving the script being created.
Also, after the sysexit instruction, insert the end instruction to terminate the HSP script. The type specification specified by p1 is as follows.
^p
  Type: Content
 ----------------------------------
    0: Log off
    1: Reboot
    2: Shut down
    3: Turn off the power
^p
If you want to turn off the power, make sure to request "Shutdown"-> "Turn off" in succession.
^
On an OS with resource privileges such as Windows NT or 2000, this command cannot be executed unless you are logged on with administrator privileges.


%index
pipeexec
Execution with pipe
%group
Extended I / O control instructions
%prm
p1,"filename",p2
p1 = variable: string type variable name that stores standard output
"filename": The name of the file to be executed
p2 = 0 to 1 (0): Window display switch

%inst
Executes the file specified by "filename".
Executable files can acquire standard input and standard output settings through pipes. The pipeexec instruction is a function that mainly supports the execution of win32 console applications (32-bit applications that run at the DOS prompt).
In addition, please note that 16bit applications and batch files cannot be specified.

Specify the executable file with "filename". If you do not specify the full path, the standard search path is used.
When specifying command line options, specify the file name followed by the DOS prompt. (Example: "notepad.exe readme.txt")

The variable buffer specified by p1 stores the standard output at runtime.
Make sure to specify in advance a large buffer such as "sdim buf, 32000".
Specify window display ON / OFF with p2. By default, 0 (not displayed)
Will be. After executing the pipeexec instruction, be sure to use pipeget to monitor until the process ends.

%href
pipeget
pipeput


%index
pipeget
Execution monitoring with pipe
%group
Extended I / O control instructions
%prm
p1
p1 = variable: string type variable name where the result is stored

%inst
Monitor the process executed by the pipeexec instruction.
It is necessary to specify a string type variable that will be a buffer for acquiring pipe information in p1.
There is.
The status of file execution by pipeexec is returned in the system variable stat.
^p
  stat value | Contents | Contents of variable p1
 ---------------------------------------------------------
    0 | Execution end | No change
    1 | Preparing for execution | No change
    2 | Getting StdOutput | StdOutput
    3 | Getting StdError | StdError
    4 | Termination processing | No change
^p
Normally, after executing the pipeexec instruction, continue monitoring while inserting the wait / await instruction until the stat value becomes 0 (end of execution) with the pipeget instruction.
^
The size obtained in one execution is up to the buffer size reserved by the character string type variable specified by p1, so the buffer will not overflow. Normally, if you try to allocate a buffer of about 4096 characters, there should be no problem (example: "sdim buf, 4096").

%href
pipeput

%sample
	sdim ln,4096
	sdim buf,32000

	pipeexec buf,"notepad.exe",1
if stat: dialog "could not run": end

mes "Running ..."

	repeat
pipeget ln; get / update pipe
if stat = 0: break; Exit the loop when execution ends
	wait 10
	loop

mes "Execution completed ..."
	mes buf

	stop


%index
pipeput
Send 1 byte to the pipe
%group
Extended I / O control instructions
%prm
p1
p1 = 0 to 255 (0): Send code

%inst
The code specified in p1 is sent as standard input to the process being executed by the pipeexec instruction.

%href
pipeget



%index
dirlist2
Get extended directory
%group
Extended file operation command
%prm
p1,"filemask",p2,p3
p1 = variable name: size of the entire directory information
"filemask": Filemask for list
p2 = 0 to (0): Acquisition mode
p3 = 0 to (0): Directory delimiter
%inst
Get directory information.
You can search in more detail than the standard instruction dirlist.
The dirlist2 instruction completes in three steps.
^p
1. Select what to get with the dirlist2h instruction
Å´
2. Start acquisition with the dirlist2 instruction
Å´
3. Get the result with the dirlist2r instruction
^p
The dirlist2 instruction acquires directory information in a fixed mode.
The result can be obtained with the dirlist2r instruction.
When the dirlist2 instruction completed normally, the information was acquired in the system variable stat.
The total number of files will be assigned. The details of the acquisition mode are as follows.
^
"filemask" is the search file name by specifying a wildcard such as "*. *" Like the dirlist command.
^
With p3, it is possible to specify the directory delimiter at the time of acquisition. If 0 or omitted, "\\" is used.
^
Mode values can be summed and combined.
When mode 1 (bit0) is specified, all directories under the current directory are recursively searched to acquire file information.
^p
  Mode: What is acquired
 ---------------------------------------------------------------
    0: List of files in the current directory
    1: List of all files under the current directory
    2: Include hidden files and system attribute files in the list
^p
%href
dirlist2h
dirlist2r


%index
dirlist2h
Extended directory acquisition settings
%group
Extended file operation command
%prm
p1,p2
p1 = 0 to (0): List List flag
p2 = 0 to (0): List delimiter
%inst
Set the details of directory information acquisition by the dirlist2 instruction.
For the actual information acquisition method, refer to the explanation of the dirlist2 instruction.
^
The items specified by the list flag on p1 are separated by the delimiter and can be acquired as text information.

List List flags are as follows.
^p
  Flag: What is retrieved
 -----------------------------------------------------------------
     1: File name relative to the current
     2: File name excluding the path name
     4: File size
     8: File modification date
    16: File update time
   128: Only relative path name from current
^p
Flag values can be added and combined. If p1 is 0 or omitted, then all flags have been specified.
You can specify the symbol that separates the list with p2. If p2 is 0 or omitted, "," is specified.
%href
dirlist2
dirlist2r


%index
dirlist2r
Get extended directory 2
%group
Extended file operation command
%prm
p1
p1 = variable name: variable to get directory information
%inst
Assign the information obtained by the dirlist2 instruction to the variable.
It must be executed for a variable that has more memory than the size returned by the dirlist2 instruction.
For the actual information acquisition method, refer to the explanation of the dirlist2 instruction.
%href
dirlist2
dirlist2h


