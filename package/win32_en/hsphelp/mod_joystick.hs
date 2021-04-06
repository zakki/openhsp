%ver
3.6
%date
2020/06/04
%group
I / O control instructions

%type
User extension instructions

%note
Include mod_joystick2.as.

%author
MIA / onitama

%dll
mod_joystick2

%port
Win
%index
joyGetPosEx
Get joystick input

%prm
p1, p2
p1: Numeric array variable to substitute the input state
p2: Port number

%inst
Gets the joystick input.
The following information is assigned to the array variable p1.

data (0) = always contains 52
data (1) = always contains 255
data (2) = 1st axis state (normal joystick X axis)
data (3) = 2nd axis state (normal joystick Y axis)
data (4) = 3rd axis state (throttle, etc.)
data (5) = state of axis 4
data (6) = state of axis 5
data (7) = 6th axis state
data (8) = Button state (up to 32 buttons)
data (9) = number of buttons pressed at the same time
data (10) = POV switch state
data (11) = preliminary information 1
data (12) = preliminary information 2

If the system variable stat is 0, the input is normal.

%sample
	repeat
		redraw 0
		color 255,255,255 : boxf : color 0,0,0
		joyGetPosEx data, 0
		pos 0,0 : mes "stat = " + stat
		repeat 13 : mes data(cnt) : loop
		redraw 1 : await 30
	loop

%href
jstick

%index
jstick
Get a stick instruction compatible value

%prm
p1, p2, p3
p1: Variable to be assigned
p2: Non-trigger type key specification
p3: Port number

%inst
stick Returns a value compatible with the instruction in a variable.
The keyboard is acquired by the stick command at the same time, and the joystick and keyboard input are supported at the same time.
The parameters specified by p1 and p2 have the same function as the stick instruction.
If an error occurs, subsequent acquisitions will be canceled and will resume when reconnected.
If you want to use it, please describe "#include" mod_joystick2.as "".
(If you specify the conventional "mod_joystick.as", it will work with the old specifications.)

%href
joyGetPosEx
stick

