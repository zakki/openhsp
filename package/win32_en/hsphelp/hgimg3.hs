;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;
%type
Extension instructions
%ver
3.5
%note
Include hgimg3.as.
%date
2017/05/29
%author
onitama
%dll
hgimg3
%url
http://www.onionsoft.net/
%port
Win
%portinfo
It only works on Windows + DirectX 8 or later systems.

%index
hgini
Plugin initialization
%group
Extended screen control command
%prm
yofs,ysize
yofs: Shift the effective screen range vertically by + yofs
ysize: Set the effective screen range to ysize vertically
%inst
Initialize HGIM G3.
You must always initialize first and then use each HGIMG3 instruction.
The drawing destination (window ID) at the time when the hgini command is executed is registered as the display destination.
The drawing mode of HGIM G3 is also set according to the screen initialization mode (window mode or full screen mode) at that time.
If yofs and ysize are omitted or 0, the entire window will be drawn.
%href
hgbye
hgreset


%index
hgreset
Initialization of scene information
%group
Extended screen control command
%prm
%inst
Initializes the scene information.
All model, object, texture and event list information is discarded and reverted to a whole new scene state.
%href
hgini
hgbye


%index
hgbye
Release plugin
%group
Extended screen control command
%prm

%inst
Release HGIM G3.
It is automatically executed at the end of the program, so it usually does not need to be specified.
%href
hgini


%index
hgdraw
Draw
%group
Extended screen control command
%prm
p1
p1 (0): Mode
%inst
Performs all drawing processing of the object.
By default, all objects are drawn and the screen is updated.
hgdraw should always be paired with hgsync.
Please draw with the hgdraw command first, and then add a waiting time with hgsync at the end.
You can specify the mode with p1.
^p
Mode content
-----------------------------------------------
1 Reflect the drawing area
2 Do not draw Object
4 Do not initialize the screen
^p
Multiple mode values can be specified by adding them.
This makes it possible to draw in each drawing area on one screen.

%href
hgini
hgsync
hgview


%index
hgsync
Wait for time
%group
Extended screen control command
%prm
val
val: Waiting time
%inst
Weights are taken for the time (ms) specified by val.
hgsync should always be paired with hgdraw.
Please draw with the hgdraw command first, and then add a waiting time with hgsync at the end.
Substitute the load by HGIMG3 (time in milliseconds taken for processing) into the system variable stat.


%href
getsync
hgdraw


%index
hgsetreq
System request settings
%group
Extended screen control command
%prm
type,val
type: Setting type (SYSREQ_???)
val: Value to set
%inst
Make various system settings for HGIM G3.
The following symbols can be specified by the type value.
^p
Symbol name Contents
-----------------------------------------------
SYSREQ_MAXMODEL Maximum number of models
SYSREQ_MAXOBJ Maximum number of objects
SYSREQ_MAXTEX Maximum number of textures
SYSREQ_DXMODE Full screen mode switch
SYSREQ_DXHWND window handle (reference only)
SYSREQ_DXWIDTH Horizontal size in full screen mode
SYSREQ_DXHEIGHT Vertical size in full screen mode
SYSREQ_COLORKEY Transparent color code when registering texture
Cause code when SYSREQ_RESVMODE error occurs (reference only)
SYSREQ_MAXEVENT Maximum number of events
SYSREQ_MDLANIM Maximum number of animations per model
SYSREQ_CALCNORMAL X file model normal recalculation switch
SYSREQ_2DFILTER 2D texture interpolation mode when drawing
SYSREQ_3DFILTER Texture interpolation mode when drawing in 3D
SYSREQ_OLDCAM Operation in camera gaze mode
SYSREQ_QUATALG X-Files Model Animation Interpolation Mode
SYSREQ_DXVSYNC VSYNC wait mode in full screen mode
SYSREQ_DEFTIMER hgsync time wait mode (0 = HGIMG3 / 1 = await)
SYSREQ_NOMIPMAP Texture MIPMAP generation mode (0 = automatic / 1 = no MIPMAP)
SYSREQ_DEVLOST DirectX device existence flag (0 = existence / -1 = lost)
SYSREQ_MAXEMITTER Maximum number of emitters
SYSREQ_THROUGHFLAG X-direction border processing flag (0 = normal / 1 = through)
SYSREQ_OBAQMATBUF Number of material buffers for OBAQ
SYSREQ_2DFILTER2 2D Texture interpolation mode for direct drawing
SYSREQ_FPUPRESERVE FPU calculation accuracy setting option (0 = single precision / 1 = no change)
SYSREQ_DSSOFTWARE Using software sound buffer (1 = ON, 0 = OFF)
SYSREQ_DSGLOBAL Global Sound Focus (1 = ON, 0 = OFF)
SYSREQ_DSBUFSEC ogg Stream playback buffer size (in seconds)
^p
%href
hgini
hggetreq
%sample
; Set the transparent color to RGB = ($ 00, $ ff, $ ff)
(Available just before the texload instruction)
	hgsetreq SYSREQ_COLORKEY, $00ffff


%index
hggetreq
Get system request
%group
Extended screen control command
%prm
val,type
val: variable name to which the result is assigned
type: Setting type (SYSREQ_???)
%inst
Extracts the system setting value of HGIMG3 and assigns it to the variable specified by val.
The following symbols can be specified by the type value.
^p
Symbol name Contents
-----------------------------------------------
SYSREQ_MAXMODEL Maximum number of models
SYSREQ_MAXOBJ Maximum number of objects
SYSREQ_MAXTEX Maximum number of textures
SYSREQ_DXMODE Full screen mode switch
SYSREQ_DXHWND window handle
SYSREQ_DXWIDTH Horizontal size in full screen mode
SYSREQ_DXHEIGHT Vertical size in full screen mode
SYSREQ_COLORKEY Transparent color code when registering texture
SYSREQ_MAXEVENT Maximum number of events
Cause code when SYSREQ_RESULT error occurs
SYSREQ_RESVMODE Status code
SYSREQ_PTRD3D DIRECT3D8 COM pointer
SYSREQ_PTRD3DDEV DIRECT3DDEVICE8 COM pointer
^p
%href
hgini
hgsetreq


%index
hgrect
Direct drawing of rectangle
%group
Extended screen control command
%prm
p1,p2,p3,p4,p5,p6
p1 = 0 to (0): Rectangle center X coordinate
p2 = 0 to (0): Y coordinate of the center of the rectangle
p3 = 0 to (0.0): Rotation angle (unit is radian)
p4 = 0 ~ (?): X size
p5 = 0 ~ (?): Y size
%inst
Draws a rectangle (rectangle) of the size specified in (p4, p5) with the currently set color centered on the coordinates specified in (p1, p2).
You can specify the rotation angle as a real number with p3.
The unit of angle is radians (starting from 0 and going around at 2ÉŒ).
The grect instruction reflects the copy mode specification set in gmode.
^
If gmode is 0,1, normal fill.
If gmode is 3, it will be translucent at the specified rate.
When gmode is 5 or 6, color addition and color subtraction are performed respectively.
If the size specification of (p4, p5) is omitted, the copy size set by the gmode instruction is used.
^
The hgrect instruction performs the same operation as the standard instruction grect instruction on the screen of HGIMG3.
This command is a direct drawing command. Drawing is executed when the instruction is executed.
You should always draw directly between hgdraw and hgsync.

%href
hgline
hgrotate



%index
hgrotate
Direct drawing of rectangular image
%group
Extended screen control command
%prm
p1,p2,p3,p4,p5,p6
p1 = 0 ~ (0): Texture ID
p2 = 0 to (0): Upper left X coordinate of copy source
p3 = 0 to (0): Upper left Y coordinate of copy source
p4 = 0 to (0.0): Rotation angle (unit is radian)
p5 = 0 ~ (?): X size
p6 = 0 ~ (?): Y size
%inst
The hgrotate command performs texture drawing processing including rotation in the specified rectangular range.
Specify the texture ID of the copy source with p1, and specify the coordinates corresponding to the original image to be copied with (p2, p3). (Similar to the gcopy instruction)
The copy destination is the window ID specified as the current drawing destination, and the copy is performed to the coordinates centered on the location set by the pos command.
At that time, you can specify the rotation angle with a real number with p3.
The unit of angle is radians (starting from 0 and going around at 2ÉŒ).
In (p5, p6), specify the X and Y sizes after copying.
Also, the default copy size set by the gmode instruction is used for the X and Y sizes of the copy source.
In other words, if you specify a size larger than the size specified by the gmode instruction with (p5, p6), it will be expanded.
If (p5, p6) is omitted, copying will be performed in the same size as the copy source, that is, at the same size.
^
The hgrotate instruction reflects the copy mode specification set in gmode.
(See the gmode instruction reference for details)
^
The hgrotate instruction performs the same operation as the standard instruction grottate instruction on the screen of HGIMG3.
This command is a direct drawing command. Drawing is executed when the instruction is executed.
You should always draw directly between hgdraw and hgsync.

%href
hgline
hgrect


%index
hgline
Direct drawing of straight line
%group
Extended screen control command
%prm
p1,p2,p3,p4
p1 = 0 to (0): Start X coordinate
p2 = 0 to (0): Start Y coordinate
p3 = 0 ~ (?): End X coordinate
p4 = 0 ~ (?): End Y coordinate
%inst
Draws a line connecting the coordinates specified in (p1, p2) to the coordinates specified in (p3, p4) in the currently set color.
The hgline instruction reflects the copy mode specification set in gmode.
^
If gmode is 0,1, normal fill.
If gmode is 3, it will be translucent at the specified rate.
When gmode is 5 or 6, color addition and color subtraction are performed respectively.
^
The hgline instruction performs the same operation as the standard instruction line instruction on the screen of HGIMG3.
This command is a direct drawing command. Drawing is executed when the instruction is executed.
You should always draw directly between hgdraw and hgsync.

%href
hgrotate
hgrect


%index
settex
Register texture
%group
Extended screen control command
%prm
x,y,sw,mode
(x, y): Texture registration size
sw (0): Texture registration switch (0 = normal / 1 = Y inversion)
mode (-1): Update mode specified (-1 = new)
%inst
Registers the contents of the currently selected window ID as a texture.
If the texture is successfully registered, the texture ID will be assigned to the system variable stat.
If it fails, the system variable stat will be negative.
^
If the sw value is 1, the image is flipped upside down and the texture is registered.
If the mode value is -1 or omitted, normal registration processing is performed, and if you specify the texture ID already registered in the mode value, the texture with the same ID will be updated with the current window contents.
^
Normally, use the texload command and texload2 command to read the texture from the file.
%href
texload
texload2


%index
texload
Register texture from file
%group
Extended screen control command
%prm
"filename"
"filename": Image file of the texture to be registered
%inst
Register the contents of the image file "filename" as a texture.
The image can be the same format (BMP, JPG, GIF) that can be used with the picload command.
When the texture registration is completed, the texture ID is assigned to the system variable stat.
If it fails, an error dialog will be displayed.
^
The texload instruction automatically corrects textures that are not a multiplier of 2 (2,4,8,16Åc) to the correct size.
Please note that if your video card does not support the color mode or size of the texture, you may get an error even if the file exists.
Also, if you want to load a texture that contains an alpha channel, use the texload2 instruction.
^
This instruction is implemented as a module in hgimg3.as.
Also, when loading an image, HSP window ID3 is used internally.
%href
settex
texload2


%index
texload2
Register texture from file
%group
Extended screen control command
%prm
"filename",sx,sy
"filename": Image file of the texture to be registered
sx, sy: Reference texture size
%inst
Register the contents of the image file "filename" as a texture.
It behaves the same as the texload instruction, but is loaded using the DirectX API.
Available formats are BMP, JPG, GIF, PNG, DDS, TGA, TIFF, etc.
When the texture registration is completed, the texture ID is assigned to the system variable stat.
If it fails, a negative value is assigned to the system variable stat.
^
Image data including alpha channels such as DDS and TGA files can be enabled by reading with the texload2 instruction.
However, the texload2 instruction may scale the image size to the optimum size according to the specifications of the video card.
Use the texload and texload2 instructions properly as needed.
^
It is possible to forcibly specify the texture size with sx and sy.
Normally, it is okay to omit the specification.


%href
settex
texload



%index
loadtoon
Register toon texture from file
%group
Extended screen control command
%prm
p1,"filename"
p1: Model ID
"filename": Image file of the texture to be registered
%inst
Set the toon shading mode for the model specified in p1 and load the texture file with color information.
^
The X format 3D model must be loaded in advance by the addxfile instruction.
When setting toon shading, it is necessary to create image data with color information called toon texture in advance.
(Toon textures can be created with the maketoon command.)
^
This instruction is implemented as a module in hgimg3.as.
It also uses HSP window ID3 internally.

%href
maketoon



%index
maketoon
Create toon texture
%group
Extended screen control command
%prm
p1,p2
p1: Model ID
p2 (0): Creation mode
%inst
Creates a toon texture based on the model information specified in p1.
You can specify the creation mode with p2.
^p
Creation mode Contents
--------------------------------------------------------------
  1 Apply the created toon texture to the model
  2 Save the created toon texture to a file
^p
The maketoon instruction extracts the material color of the model and creates a standard toon texture.
If you specify 2 as the creation mode, the toon texture is saved as "toon.bmp".
The saved toon texture can be loaded and used with the loadtoon command, and by editing the image, it is possible to express finer toon shading.
^
This instruction is implemented as a module in hgimg3.as.
It also uses HSP window ID3 internally.

%href
loadtoon


%index
setfont
Original font definition
%group
Extended screen control command
%prm
cx,cy,px,sw
(cx, cy): XY size per font
  px: Number of dots to move to the right for each character display
  sw: 0 = No transparent color removal / 1 = Transparent color removal

%inst
Set the font to be displayed with the fprt instruction.
The texture used will be the one loaded immediately after this.
%href
texload
fprt
%sample
Preparing to display texture font
	;
	setfont 16,16,12,1	; font Tex select(cx,cy,px,mode)
texload "fontchr.bmp"; Registration of font texture


%index
fprt
Definition font character string display
%group
Extended screen control command
%prm
"mes",x,y
"mes": Character string to display
(x, y): Coordinates to display

%inst
Displays the contents of "mes" on the screen in the specified font.
Be sure to use it between the hgdraw instruction and the hgsync instruction.
When specifying (x, y), the upper left corner of the screen is (0,0).
%href
setfont
hgdraw
hgsync
%sample
; Drawing main
	;
hgdraw; drawing process
getsync t1,0; Get load from last time
	fprt "HGIMG Plugin test",8,108
	fprt "T:"+t1,8,124
hgsync 10; Draw if processing is not missed


%index
falpha
Set font character óØ value
%group
Extended screen control command
%prm
val
val: óØ composite value used for font display
%inst
Specifies the óØ composite value used in the font display by the fprt command.
After that, it applies to all fprt instructions.
Details about the óØ value are as follows.
^p
óØ composite value = 0 to 255: Performs óØ composite (blend) with the background
óØ composite value = 256 to 511: No composite (normal time)
óØ composite value = 512 to 767: Performs color addition (modulate) with the background
óØ composite value = 768 to 1023: Perform background and color subtraction
^p
%href


%index
setsizef
Specify the width and height of the registered model
%group
Extended screen control command
%prm
fsx,fsy
(fsx, fsy): X, Y size (real number)
%inst
Specifies the size value used when registering the model.
%href
addspr
addplate
addsplate
addbox


%index
clscolor
Background color setting
%group
Extended screen control command
%prm
color
color: color code
%inst
Set the background color to be filled with a single color.
If -1 is specified for color, the background will not be cleared.
color is the RGB code ($ rrggbb).
%href
clstex
clsblur


%index
clstex
Background texture settings
%group
Extended screen control command
%prm
id
id: texture ID
%inst
Specify the ID of the background texture.
If you specify -1 for id, the texture will not be used for the background.
%href
clscolor
clsblur
texload


%index
clsblur
Blur setting
%group
Extended screen control command
%prm
val
val: strength (0 to 255)
%inst
Sets the pseudo-blurring effect.
The smaller the intensity value set with val, the more the previous frame remains on the screen as an afterimage.
%href
clscolor
clstex


%index
texmake
Creating a message texture
%group
Extended screen control command
%prm
p1,p2,p3
p1 (256): Texture X size
p2 (256): Texture Y size
p3 (0): Creation mode
%inst
Creates a texture for drawing a message.
This texture can be used as the message drawing destination for the texmes instruction.
^
When the texture registration is completed, the texture ID is assigned to the system variable stat.
If it fails, a negative value is assigned to the system variable stat.
^
If the creation mode is 0, a 16-bit texture (A4R4G4B4) will be created.
If it is other than 0, it will be a 32-bit texture (A8R8G8B8).
By default, 16-bit textures are created.
When dealing with messages, 16-bit textures are faster and more compatible.
Specify a 32-bit texture for more accurate message drawing.

%href
texcls
texmes


%index
texcls
Clear message texture
%group
Extended screen control command
%prm
p1,p2
p1: Texture ID
p2 (0): Color code
%inst
Clears (erases) the contents of the message drawing texture.
Use p2 to set the background color for filling with a single color.
p2 is the RGB code ($ rrggbb).

%href
texmake
texmes


%index
texmes
Drawing on message texture
%group
Extended screen control command
%prm
"message",p1,p2,p3
"message": message string
p1: Texture ID
p2, p3: Drawing destination coordinates
%inst
Write a message to the message drawing texture.
Write to the texture of p1 by specifying the character string you want to draw in "message".
Please note that it is necessary to create a message drawing texture in advance by using the texmake command.
^
The texmes instruction writes antialiased characters to the texture.
The character font and color to be drawn are those specified by the font command and color command.
Since the texmes command only draws a character string on the texture, it is necessary to display the texture with the hgrotate command or sprite in order to actually display the character string.

%href
color
font
texmake
texcls
texopt


%index
texdel
Remove texture
%group
Extended screen control command
%prm
p1
p1: Texture ID
%inst
Deletes the texture specified by p1.
Deleted textures will be discarded from VRAM and can be replaced with new ones.

%href
texmake
texload
texload2


%index
setuv
Specify registered texture UV coordinates
%group
Extended screen control command
%prm
tx0,ty0,tx1,ty1
(tx0, ty0): Upper left coordinate of texture
(tx1, ty1): Lower right coordinates of texture
%inst
Specifies the UV value used when registering the model.
%href
addspr
addplate
addbox


%index
addspr
Create a 2D sprite model
%group
Extended screen control command
%prm
var,mode,x1,y1,x2,y2,texid
var: Variable name to which the created model ID is assigned
mode: 0 = No transparent color removal / 1 = Transparent color removal
(x1, y1): Upper left coordinate of texture
(x2, y2): Lower right coordinates of the texture
texid: texture ID
%inst
Create a 2D sprite model.
When the model is created successfully, the model ID is assigned to the variable specified by var.
If texid is specified, it will be referenced as the texture ID.
If texid is omitted, the next texture to be registered will be referenced.
You can set the coordinates of the texture referenced by (x1, y1)-(x2, y2).
If (x1, y1)-(x2, y2) is omitted, the value specified by setuv will be applied.

%href
setuv


%index
regobj
Object registration
%group
Extended screen control command
%prm
var,ModelID,mode,EventID
var: Variable name to which the created object ID is assigned
modelID: model ID
mode: mode value
EventID: EventID
%inst
Creates an object to display the specified model.
If successful, the created object ID will be assigned to the variable.
If the creation fails for any reason, -1 will be assigned.
^
Select the mode from the following.
^p
Label | Content
	--------------------------------------------------------------
OBJ_HIDE Hide (remove from screen)
OBJ_TREE Tree attribute (Y axis only faces front)
OBJ_XFRONT Front attribute (always faces the screen)
OBJ_MOVE XYZ Enable movement amount
OBJ_FLIP Invert in border area
OBJ_BORDER Enable border area
OBJ_LATE Always drawn later (for translucent objects)
OBJ_FIRST Always drawn first
OBJ_SORT Automatically drawn from the back (for 3D objects)
OBJ_LOOKAT Always face the direction of a specific object
OBJ_LAND Y Keep coordinates constant
OBJ_GROUND Recognized as ground
OBJ_STAND Place on the ground
OBJ_GRAVITY Enable gravity calculation
OBJ_STATIC Recognized as an obstacle
OBJ_BOUND Repulsion on the ground (for mesh map collision)
OBJ_ALIEN Aim at target (for mesh map collision)
OBJ_WALKCLIP Limited to movement (for mesh map collision)
OBJ_EMITTER Become an emitter-generating object
^p
If you want to select multiple items at the same time, separate them with "|" like "OBJ_LATE | OBJ_MOVE". If you do not specify anything, you can set it to 0 or omit it.
The object mode does not usually need to be set because the default mode is set in advance according to the model type.
The mode of OBJ_2D is set automatically, so please do not change it in the middle.
If you specify an EventID, the corresponding event is set on the object.
The EventID is omitted, or if the value is negative, the event is not set.
%href
delobj


%index
addplate
Create a PLATE model
%group
Extended screen control command
%prm
var,mode,sx,sy,x1,y1,x2,y2,texid
var: Variable name to which the created model ID is assigned
mode: 0 = No transparent color removal / 1 = Transparent color removal
(sx, sy): X, Y size
(x1, y1): Upper left coordinate of texture
(x2, y2): Lower right coordinates of the texture
texid: texture ID
%inst
Create a 3D PLATE model.
When the model is created successfully, the model ID is assigned to the variable specified by var.
A PLATE model is a rectangle that is drawn in solid color or texture and placed in 3D.
When the color is set by the setcolor command, it becomes a single color board.
If texid is specified, it will be referenced as the texture ID.
If texid is omitted, the next texture to be registered will be referenced.
Set the X and Y sizes of the board with (sx, sy). If omitted, the value specified by setsizef is applied.
You can set the coordinates of the texture referenced by (x1, y1)-(x2, y2).
If (x1, y1)-(x2, y2) is omitted, the value specified by setuv will be applied.
The PLATE model does not perform light source calculations.
If light source calculation is required, create a SPLATE model with the add plate command.

%href
addsplate
setcolor(HGIMG3)
setsizef
setuv


%index
addsplate
Create a board (SPLATE) model
%group
Extended screen control command
%prm
var,mode,sx,sy,texid
var: Variable name to which the created model ID is assigned
mode: 0 = No transparent color removal / 1 = Transparent color removal
(sx, sy): X, Y size
texid: texture ID
%inst
Create a 3D light source calculated board (SPLATE) model.
When the model is created successfully, the model ID is assigned to the variable specified by var.
SPLATE models are rectangles that are drawn in solid colors or textures and placed in 3D.
When the color is set by the setcolor command, it becomes a single color board.
If texid is specified, it will be referenced as the texture ID.
If texid is omitted, the next texture to be registered will be referenced.
Set the X and Y sizes of the board with (sx, sy). If omitted, the value specified by setsizef is applied.
It is almost the same as the addplate command, except that the light source calculation is performed and the texture UV coordinates cannot be specified.

%href
addplate
setcolor(HGIMG3)
setsizef


%index
setcolor(HGIMG3)
Single color polygon creation setting
%group
Extended screen control command
%prm
r,g,b
r, g, b: RGB color information (0 to 255 respectively)
%inst
Set the polygon color when creating a model.
It is used when creating a monochromatic polygon with the addplate, addbox command, etc.
%href
addplate
addbox


%index
addbox
Create a BOX model
%group
Extended screen control command
%prm
var,sx,sy,texid
var: Variable name to which the created model ID is assigned
(sx, sy): X, Y size
texid: texture ID
%inst
Create a BOX model.
When the model is created successfully, the model ID is assigned to the variable specified by var.
A BOX model is a cube that is drawn in solid color or texture and placed in 3D.
If texid is specified, it will be referenced as the texture ID.
When the color is set by the setcolor command, it becomes a single color box.
If UV is specified by the setuv instruction and texid is omitted,
The next texture to be registered is referenced. (However, the UV specification is not reflected)
Set the X and Y sizes of the board with (sx, sy). If omitted, the value specified by setsizef is applied.

%href
setsizef
setcolor(HGIMG3)
setuv


%index
addmesh
Create a board (MESH) model
%group
Extended screen control command
%prm
var,divx,divy,mode,sx,sy,texid
var: Variable name to which the created model ID is assigned
divx: number of mesh divisions X
divy: Number of mesh divisions Y
mode: 0 = No transparent color removal / 1 = Transparent color removal / 16 = Repeat
(sx, sy): X, Y size
texid: texture ID
%inst
Create a board (MESH) with divided 3D polygons.
When the model is created successfully, the model ID is assigned to the variable specified by var.
The BOX model is a split mesh that is drawn with a texture and placed in 3D.
If texid is specified, it will be referenced as the texture ID.
If UV is specified by the setuv command and texid is omitted, the next texture to be registered will be referenced. (However, the UV specification is not reflected)
Set the X and Y sizes of the board with (sx, sy). If omitted, the value specified by setsizef is applied.
^
It looks basically the same as a plate made with addplate, but it is divided into polygons of divsizex x divsizey.
When mode is 16, it becomes a repeat mode in which the specified texture is assigned to each polygon.
%href
setsizef
setuv
meshmap
objwalk


%index
addeprim
Create an effect (EPRIM) model
%group
Extended screen control command
%prm
var,mode,option
var: Variable name to which the created model ID is assigned
mode: Primitive mode
option: option value
%inst
Create an effect (EPRIM) model.
When the model is created successfully, the model ID is assigned to the variable specified by var.
The effect model is a model with a special shape for effect generation.
The effect model is a special model in which the color is set for each vertex and no light source calculation is performed, and the shape can be customized with the seteprim instruction.
The following shapes can be selected by the mode parameter.
^p
Label | Content
	--------------------------------------------------------------
EPRIM_CIRCLE Yen
EPRIM_CIRCLE2 Jagged circle
EPRIM_SQUARE Rounded rectangle
EPRIM_FAN Polygon with any number of vertices
^p
You can control the modeling with the option parameter.
If the option value is 0 or omitted, the model will be created as usual.
When the option value is 1, the model body is not generated and only the surrounding phosphorescence (SPREAD) is generated.
If the option value is 2, phosphorescent (SPREAD) is not generated and only the model body is generated.
%href
seteprim


%index
seteprim
Set effect (EPRIM) model
%group
Extended screen control command
%prm
Model,Param,Value
Model: Model ID
Param: Parameter ID
Value: The value to set for the parameter
%inst
Sets the generation parameters for the EPRIM model.
For Model, specify the model ID created by the addprim instruction.
Specify the parameter ID to be set in Param and the value to be set in Value as a real number or an integer.
The parameter ID specified by Param depends on the model shape created by the addprim instruction.
The parameter ID can be set from 0 to 8 with a real value.
Parameter IDs 16 to 19 are color code settings, and 32-bit integer values with Éø and RGB values can be set.
After changing the generation parameters with the seteprim command, the vertex coordinates are reconstructed when displaying.
To reduce the processing load, avoid executing the seteprim instruction every frame,
Make parameter changes only when necessary.
%href
addeprim


%index
setefx
Set efx group information
%group
Extended screen control command
%prm
id,x,y,z
id: object ID
(x, y, z): Value to set (default = 0)

%inst
Set the parameters of the object.
Sets the value specified by (x, y, z) to the efx group (special effects setting).
(x, y, z) can be a real number or an integer value.
^
For the object, the value of x is recognized as follows: The values of y and z are unused.
^p
0 to 255: Performs Éø composition (blend) with the background
256 to 511: No synthesis (normal time) (currently, blend concentration does not matter)
512 to 767: Performs background and color modulation
768 ~ 1023: Perform background and Éø value subtraction (subtract)
1024 to 1279: Perform background and color subtraction (substract2) (currently the blend density is disabled)
1280 to 1535: No synthesis (ignoring Z) (Currently, blend concentration is irrelevant)
^p
When this parameter is specified for the camera, x, y, z are recognized as follows.
^p
x: Viewing angle. The initial value is specified as 45 degrees (ÉŒ / 4).
y: Near Z value. Polygons in front of this distance from the camera will not be displayed.
z: Far Z value. Polygons deeper than this distance from the camera will not be displayed.
^p


%href
setpos
setang
setangr
setscale
setdir
setwork


%index
addefx
Add efx group information
%group
Extended screen control command
%prm
id,x,y,z
id: object ID
(x, y, z): Value to add (default = 0)

%inst
Set the parameters of the object.
Adds the value specified by (x, y, z) to the efx group (special effects setting).
(x, y, z) can be a real number or an integer value.

%href
addpos
addang
addangr
addscale
adddir
addwork


%index
getefx
Get efx group information
%group
Extended screen control command
%prm
id,x,y,z
id: object ID
(x, y, z): Variables to get

%inst
Gets the parameters of the object.
The contents of the efx group (special effects setting) are assigned to the variables specified by (x, y, z).
(x, y, z) is set as a real variable.
You can get the value as an integer value by adding "i" to the end of the instruction.

%href
getefxi
getpos
getang
getangr
getscale
getdir
getwork


%index
getangi
ang Get group information as an integer
%group
Extended screen control command
%prm
id,x,y,z
id: object ID
(x, y, z): Variables to get

%inst
Gets the parameters of the object.
The contents of the ang group (display angle) are assigned to the variables specified by (x, y, z).
(x, y, z) is set as an integer variable.

%href
getang
getposi
getangri
getscalei
getdiri
getefxi
getworki


%index
getefxi
Get efx group information as an integer
%group
Extended screen control command
%prm
id,x,y,z
id: object ID
(x, y, z): Variables to get

%inst
Gets the parameters of the object.
The contents of the efx group (special effects setting) are assigned to the variables specified by (x, y, z).
(x, y, z) is set as an integer variable.

%href
getefx
getposi
getangi
getangri
getscalei
getdiri
getworki


%index
selefx
Set object special effects to MOC information
%group
Extended screen control command
%prm
id
id: object ID
%inst
Set the MOC group that is the target of the MOC setting command to efx (effect).
id is the object ID.
%href
selmoc
selpos
selang
selscale
selcam
selcpos
selcang
selcint


%index
objset1
Set MOC information
%group
Extended screen control command
%prm
ofs,x
ofs: MOC offset number
x: Value to set

%inst
Set the MOC information.
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objsetf1
Set MOC information
%group
Extended screen control command
%prm
ofs,fx
ofs: MOC offset number
fx: Value to be set (real value)

%inst
Set the MOC information.
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objadd1
Add MOC information
%group
Extended screen control command
%prm
ofs,x
ofs: MOC offset number
x: Value to add

%inst
Add x to the value set in the MOC information.
%href
objset1
objadd1r
objset1r
objsetf1
objaddf1


%index
objadd1r
Add MOC information
%group
Extended screen control command
%prm
ofs,x
ofs: MOC offset number
x: Value to add (integer angle value)

%inst
Add x to the value set in the MOC information.
However, the parameter obtained by converting the integer value (1 rotation at 256) into radians is added.
Please note that the values will not be normal except for the parameters that specify the angle.
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objaddf1
Add MOC information
%group
Extended screen control command
%prm
ofs,fx
ofs: MOC offset number
fx: Value to be added (real value)

%inst
Add fx to the value set in the MOC information.
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objset1r
Set MOC information
%group
Extended screen control command
%prm
ofs,x
ofs: MOC offset number
x: Value to set

%inst
Set the angle information in the MOC information.
Convert an integer value (1 rotation at 256) to radians and write the parameters.
Please note that the values will not be normal except for the parameters that specify the angle.
%href
objset1
objadd1
objset1r
objsetf1
objaddf1


%index
objset2
Set MOC information
%group
Extended screen control command
%prm
ofs,x,y
ofs: MOC offset number
x: Value to set
y: Value to set 2

%inst
Set the MOC information.
Two parameters are targeted from the offset number specified in ofs.
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
objsetf2
Set MOC information
%group
Extended screen control command
%prm
ofs,fx,fy
ofs: MOC offset number
fx: Value to be set (real value)
fy: Value to be set 2 (real value)

%inst
Set the MOC information.
Two parameters are targeted from the offset number specified in ofs.
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
objadd2
Add MOC information
%group
Extended screen control command
%prm
ofs,x,y
ofs: MOC offset number
x: Value to add
y: Value to add 2

%inst
Add x and y to the value set in the MOC information.
Two parameters are targeted from the offset number specified in ofs.
%href
objset2
objadd2r
objset2r
objsetf2
objaddf2


%index
objaddf2
Add MOC information
%group
Extended screen control command
%prm
ofs,fx,fy
ofs: MOC offset number
fx: Value to be added (real value)
fy: Value to be added 2 (real value)

%inst
Add fx and fy to the value set in the MOC information.
Two parameters are targeted from the offset number specified in ofs.
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
objadd2r
Add MOC information
%group
Extended screen control command
%prm
ofs,fx,fy
ofs: MOC offset number
fx: Value to add (integer angle value)
fy: Value to be added 2 (integer angle value)
%inst
Add fx and fy to the value set in the MOC information.
However, the parameter obtained by converting the integer value (1 rotation at 256) into radians is added.
Please note that the values will not be normal except for the parameters that specify the angle.
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
objset2r
Set MOC information
%group
Extended screen control command
%prm
ofs,x,y
ofs: MOC offset number
x: Value to set
y: Value to set 2

%inst
Set the angle information in the MOC information.
Two parameters are targeted from the offset number specified in ofs.
Convert an integer value (1 rotation at 256) to radians and write the parameters.
Please note that the values will not be normal except for the parameters that specify the angle.
%href
objset2
objadd2
objset2r
objsetf2
objaddf2


%index
dxfload
Read DXF format file
%group
Extended screen control command
%prm
"filename",p1
"filename": Model file to read (DXF format)
p1 (0): Surface color specification (optional)
%inst
Read a DXF format file as model data.
The model ID read into the system variable stat is returned.
You can specify the surface color of the polygon read by p1. The surface color must be specified in the format ($ rrggbb) in which RGB is packed into a 24-bit integer.
If p1 is omitted or specified as 0, white (0xffffff) is selected.
DXF format is the basic 3D shape format supported by CAD and most 3D tools. Advanced information such as texture information is not reflected, but shapes can be exchanged.
The dxfload instruction only supports the DXF format 3D FACE type.
It may not be compatible with some files.
This instruction is defined in the hgimg3.as module.
%href
adddxf
%sample
dxfload "ball.dxf"; read dxf file
	m_model=stat
regobj obj, m_model; Object registration


%index
adddxf
Registration of DXF format data
%group
Extended screen control command
%prm
var1,var2,color
var1: Variable name to which the created model ID is assigned
var2: Buffer variable name to which DXF format data is assigned
color (0): Surface color specification (optional)
%inst
Register the DXF format model. The model data must be loaded in the variable buffer specified by var2 in advance.
When the model is registered normally, the model ID is assigned to the variable specified by var.
You can specify the surface color of the polygon read by color. The surface color must be specified in the format ($ rrggbb) in which RGB is packed into a 24-bit integer.
If color is omitted or specified as 0, white (0xffffff) is selected.
This instruction is for registering from the data read in the memory. If a DXF format file is available, use the dxfload instruction.
%href
dxfload


%index
modelscale
Resize the model
%group
Extended screen control command
%prm
id,x,y,z
id: model ID
(x, y, z): X, Y, Z magnification (real value)
%inst
Scales the entire specified model at the specified scale value.
This makes it possible to change the size of the model itself.


%index
cammode
Camera mode settings
%group
Extended screen control command
%prm
mode
mode: mode value
%inst
Sets the mode for camera orientation.
The modes that can be specified are
CAM_MODE_NORMAL (according to camera position and angle)
When,
CAM_MODE_LOOKAT (Camera is always looking at the gaze point)
is.
%href
selcam
selcpos
selcint


%index
settoonedge
Settings for toon shading
%group
Extended screen control command
%prm
p1,p2,p3,p4
p1: Model ID
p2 (0): Edge color (RGB code)
p3 (0): Z offset
p4 (0): X offset (0.0 to 1.0)
%inst
Make settings for toon shading of the model specified in p1.
In p2, specify the edge color code (RRGGBB).
For p3 and p4, the edge offset can be specified by the real value.
You can adjust the thickness of the contour line by changing the Z offset (p3).
The default value for Z offset is set to 0.005.
The X offset (p4) specifies the X-direction origin of the texture used for toon shading.
The default value of the X offset is set to 0.5, in which case the U value of the texture will be calculated centered on the half of the X direction.

%href
loadtoon
maketoon


%index
event_addefx
Added efx group addition event
%group
Extended screen control command
%prm
id,x,y,z
id: event ID
(x, y, z): Value to be added
%inst
The group addition event is added to the event ID specified by id.
The group addition event adds the value of (x, y, z) to the parameters that the object has.

%href
event_addpos
event_addang
event_addangr
event_addscale
event_adddir
event_addwork
newevent
setevent


%index
event_efx
Added efx group change event
%group
Extended screen control command
%prm
id,frame,x1,y1,z1,sw
id: event ID
frame: Number of frames until change
(x1, y1, z1): Value to be set
sw (0): Interpolation options
%inst
The group change event is added to the event ID specified by id.
The group change event sets the time-dependent changes in the parameters that the object has.
The value becomes (x1, y1, z1) when the number of frames specified by frame has elapsed.
The following values can be specified for the sw interpolation option.
^p
sw = 0: Linear interpolation (absolute value)
sw = 1: Spline interpolation (absolute value)
sw = 2: Linear interpolation (relative value)
sw = 3: Spline interpolation (relative value)
^p
If sw is omitted, the absolute value linear is set.

%href
event_pos
event_ang
event_angr
event_scale
event_dir
event_work
newevent
setevent


%index
event_setefx
Added efx group configuration event
%group
Extended screen control command
%prm
id,x1,y1,z1,x2,y2,z2
id: event ID
(x1, y1, z1): Set value (lower limit)
(x2, y2, z2): Set value (upper limit)
%inst
The group setting event is added to the event ID specified by id.
Group settings events set the parameters that an object has.
If you specify (x1, y1, z1) and (x2, y2, z2), the values within each range will be created with random numbers.
If (x2, y2, z2) is omitted and only (x1, y1, z1) is specified, the value will be set as it is.

%href
event_setpos
event_setang
event_setangr
event_setscale
event_setdir
event_setwork
newevent
setevent


%index
event_uv
Added UV setting event
%group
Extended screen control command
%prm
p1,p2,p3
p1: Event ID
p2: X offset
p3: Y offset
%inst
The UV setting event is added to the event ID specified by id.
The UV setting event dynamically changes the UVs of a single polygon in 2D and 3D (excluding x-format models).
This is for realizing texture animation, and when the event is executed, the UV coordinates of the texture are reset to the value (number of dots) specified by (p2, p3).

%href
newevent
setevent


%index
setobjmodel
Object model settings
%group
Extended screen control command
%prm
ObjID,modelID
ObjID: Object ID
modelID: model ID
%inst
Changes the model displayed by the specified object.
%href
regobj
setobjmode


%index
event_wpos
Added pos group change event
%group
Extended screen control command
%prm
id,frame,sw
id: event ID
frame: Number of frames until change
sw (1): Interpolation options
%inst
The group change event is added to the event ID specified by id.
The group change event sets the time-dependent changes in the parameters that the object has.
It becomes the value of the work group (work value) when the number of frames specified by frame has elapsed.
The following values can be specified for the sw interpolation option.
^p
sw = 0: Linear interpolation (absolute value)
sw = 1: Spline interpolation (absolute value)
sw = 2: Linear interpolation (relative value)
sw = 3: Spline interpolation (relative value)
^p
If sw is omitted, an absolute spline is set.

%href
event_wang
event_wangr
event_wscale
event_wdir
event_wefx
newevent
setevent


%index
event_wang
ang Added group change event
%group
Extended screen control command
%prm
id,frame,sw
id: event ID
frame: Number of frames until change
sw (0): Interpolation options
%inst
The group change event is added to the event ID specified by id.
The group change event sets the time-dependent changes in the parameters that the object has.
It becomes the value of the work group (work value) when the number of frames specified by frame has elapsed.
The following values can be specified for the sw interpolation option.
^p
sw = 0: Linear interpolation (absolute value)
sw = 1: Spline interpolation (absolute value)
sw = 2: Linear interpolation (relative value)
sw = 3: Spline interpolation (relative value)
^p
If sw is omitted, the absolute value linear is set.

%href
event_wpos
event_wangr
event_wscale
event_wdir
event_wefx
newevent
setevent


%index
event_wscale
scale Added group change event
%group
Extended screen control command
%prm
id,frame,sw
id: event ID
frame: Number of frames until change
sw (0): Interpolation options
%inst
The group change event is added to the event ID specified by id.
The group change event sets the time-dependent changes in the parameters that the object has.
It becomes the value of the work group (work value) when the number of frames specified by frame has elapsed.
The following values can be specified for the sw interpolation option.
^p
sw = 0: Linear interpolation (absolute value)
sw = 1: Spline interpolation (absolute value)
sw = 2: Linear interpolation (relative value)
sw = 3: Spline interpolation (relative value)
^p
If sw is omitted, the absolute value linear is set.

%href
event_wpos
event_wang
event_wangr
event_wdir
event_wefx
newevent
setevent


%index
event_wdir
Added dir group change event
%group
Extended screen control command
%prm
id,frame,sw
id: event ID
frame: Number of frames until change
sw (0): Interpolation options
%inst
The group change event is added to the event ID specified by id.
The group change event sets the time-dependent changes in the parameters that the object has.
It becomes the value of the work group (work value) when the number of frames specified by frame has elapsed.
The following values can be specified for the sw interpolation option.
^p
sw = 0: Linear interpolation (absolute value)
sw = 1: Spline interpolation (absolute value)
sw = 2: Linear interpolation (relative value)
sw = 3: Spline interpolation (relative value)
^p
If sw is omitted, the absolute value linear is set.

%href
event_wpos
event_wang
event_wangr
event_wscale
event_wefx
newevent
setevent


%index
event_wefx
Added efx group change event
%group
Extended screen control command
%prm
id,frame,sw
id: event ID
frame: Number of frames until change
sw (0): Interpolation options
%inst
The group change event is added to the event ID specified by id.
The group change event sets the time-dependent changes in the parameters that the object has.
It becomes the value of the work group (work value) when the number of frames specified by frame has elapsed.
The following values can be specified for the sw interpolation option.
^p
sw = 0: Linear interpolation (absolute value)
sw = 1: Spline interpolation (absolute value)
sw = 2: Linear interpolation (relative value)
sw = 3: Spline interpolation (relative value)
^p
If sw is omitted, the absolute value linear is set.

%href
event_wpos
event_wang
event_wangr
event_wscale
event_wdir
newevent
setevent


%index
event_regobj
Added object creation event
%group
Extended screen control command
%prm
id,model,event
id: event ID
model: model ID
event: Event ID
%inst
The object creation event is added to the event ID specified by id.
The object creation event, like the regobj instruction, creates a new object when the event is executed.
As parameters, you can specify the model ID for model and the event ID for event. Also, the coordinates of the generated object inherit the coordinates of the object executing the event.

%href
event_delobj
newevent
setevent


%index
event_eprim
Added effect setting event
%group
Extended screen control command
%prm
id,model,param,val1,val2
id: event ID
model: model ID
param: Parameter ID
val1: Setting value 1
val2: Setting value 2
%inst
The effect setting event is added to the event ID specified by id.
The same operation as the seteprim instruction can be performed when the event is executed.
For model, specify the model ID created by the addprim instruction.
If the model ID is a negative value, the model assigned to the object for which the event is set will be the target.
Specify the same parameter ID as the seteprim instruction in param.
However, for color specification (parameter ID 16 or later), different parameter IDs are assigned in the order of A-> R-> G-> B.
(In the seteprim instruction, the ID corresponding to 16 is divided into 16 (A), 17 (R), 18 (G), 19 (B).)
If val2 is omitted, the value of val1 will be set.
If val2 is specified, the values that are actually set will be val1 to val2.
val1 to val2 are generated by random numbers when the event is executed.

%href
addeprim
seteprim
newevent
setevent


%index
selcam
Set camera to MOC information
%group
Extended screen control command
%prm
mocofs
mocofs: MOC group specification
%inst
Set the MOC group that is the target of the MOC setting command to the camera.
Normally, use the selcpos, selcang, selcint instructions.
%href
selmoc
selpos
selang
selscale
seldir
selcpos
selcang
selcint


%index
sellight
Set the light source to MOC information
%group
Extended screen control command
%prm
id,ofs
id: Light source ID (0-3)
mocofs: MOC group specification
%inst
Set the MOC group that is the target of the MOC setting command to the light (light source).
Normally, use the sellpos, sellang, and sellcolor instructions.
%href
sellpos
sellang
sellcolor
selmoc
selcam


%index
selcpos
Set camera coordinates to MOC information
%group
Extended screen control command
%prm
%inst
Set the MOC group that is the target of the MOC setting command to A (moving coordinates) of the camera.
%href
selmoc
selpos
selang
selscale
seldir
selcam
selcang
selcint


%index
selcang
Set camera angle to MOC information
%group
Extended screen control command
%prm
%inst
Set the MOC group that is the target of the MOC setting command to B (rotation angle) of the camera.
If the cammode setting is set to gaze mode, the camera rotation angle will be set automatically.
%href
cammode
selmoc
selpos
selang
selscale
seldir
selcam
selcpos
selcint


%index
selcint
Set camera gaze point to MOC information
%group
Extended screen control command
%prm
%inst
Set the MOC group that is the target of the MOC setting command to C (viewpoint coordinates).
The gazing point is enabled by setting cammode.
%href
cammode
selmoc
selpos
selang
selscale
seldir
selcam
selcpos
selcang


%index
sellpos
Set the light source coordinates to MOC information
%group
Extended screen control command
%prm
id
id: Light source ID (0-3)
%inst
Set the MOC group that is the target of the MOC setting command to the coordinates of the light (light source).
%href
sellight
sellang
sellcolor
sellambient


%index
sellang
Set the light source angle to MOC information
%group
Extended screen control command
%prm
id
id: Light source ID (0-3)
%inst
Set the MOC group that is the target of the MOC setting command to the angle of the light (light source).
%href
sellight
sellpos
sellcolor
sellambient


%index
sellcolor
Set the light source color to MOC information
%group
Extended screen control command
%prm
id
id: Light source ID (0-3)
%inst
Set the MOC group that is the target of the MOC setting command to the color (R, G, B, Ambient) of the light (light source).
%href
sellight
sellpos
sellang
sellambient


%index
sellambient
Set ambient light color to MOC information
%group
Extended screen control command
%prm
id
id: Light source ID (0-3)
%inst
Set the MOC group that is the target of the MOC setting command to the ambient (ambient light) color (R, G, B).
%href
sellight
sellpos
sellang
sellcolor


%index
objgetv
Get MOC information as an integer value
%group
Extended screen control command
%prm
v
v: Variable name to which the value is assigned
%inst
Assign the value set in MOC to the variable v as an integer.
The value of each offset number is assigned to v.0 to v.3.
%href
objsetv
objsetfv
objgetfv
fvset
fvadd
fvsub
fvmul
fvdiv


%index
objsetv
Set MOC information as an integer value
%group
Extended screen control command
%prm
v
v: Variable name to which the value is assigned
%inst
Set the value assigned to the variable v as an integer to MOC.
v.0 to v.3 are set for each offset number.
%href
objgetv
objsetfv
objgetfv
fvset
fvadd
fvsub
fvmul
fvdiv


%index
objgetstr
Get MOC information as a character string
%group
Extended screen control command
%prm
sval
sval: String type variable name to which the result is assigned
%inst
Writes the value set in MOC to the variable sval as a character string.
%href
fv2str
f2str


%index
objact
Start specified animation
%group
Extended screen control command
%prm
ObjID,Anim,mode
ObjID: Object ID
Anim: Animation index value
mode (0): Setting mode (0 = immediate / 1 = at the end)
%inst
Starts the animation of the specified object.
Specifies an index value that indicates multiple animations in Anim.
The index value is represented by the numbers 0, 1, 2, 3 ... in the order in which multiple animations were read.
You can cancel (stop) the animation by specifying a negative value (-1) for Anim.
In addition, the mode of setting can be specified by the value of mode.
If the setting mode is set to 0 or omitted, the animation is switched immediately.
If you set the setting mode to 1, wait for the currently playing animation to finish before switching.
If you specify a negative value for Anim in setting mode 1, the animation will stop after the current animation has finished playing.
If the animation is played in setting mode 0, the playback speed will be returned to the default value and repeat playback will be performed.
At the start of the animation, the standard animation speed of the model (which can be changed with the modelspeed command) is set.
While the animation is playing, you can change the speed with the objspeed command.

%href
addxfile
addxanim
objspeed
modelspeed
getanim


%index
getanim
Get animation information
%group
Extended screen control command
%prm
p1,p2,p3
p1: Variable to which information is assigned
p2 (0): Object ID
p3 (0): Information ID
%inst
Gets information about the animation of the object specified by p2 and assigns it to the variable specified by p1.
The type of information to be acquired can be specified by the information ID on p3.
The following values are available for the information ID.
^p
Information ID Contents
-----------------------------------------------
  0 Time from the start of animation (ms)
  1 Animation loop flag
^p
The variable to which the result is assigned is automatically set to the integer type.
The animation loop flag is 0 at the beginning of the animation, but returns 1 when it is played to the end.

%href
objact


%index
addxfile
Create an X-file model
%group
Extended screen control command
%prm
var,"filename"
var: Variable name to which the created model ID is assigned
"filename": The name of the file to read
%inst
Load the x format model file.
When the model is loaded normally, the model ID is assigned to the variable specified by var.
If reading fails, -1 is assigned to the variable specified by var.

The x format read by HGIMG3 is compatible with DirectX 8 or later skin mesh.
Please prepare a one-skin model and various tools that can output animation separately that support x format output.

The normal recalculation switch (SYSREQ_CALCNORMAL) is set to a value other than 0 by the setreq instruction.
If so, recalculate the model normal.
Normally, the normals recorded in the x format file are used as they are.

%href
addxanim



%index
addxanim
Add X-Files animation
%group
Extended screen control command
%prm
ModelID,"filename"
ModelID: Model ID
"filename": The name of the file to read
%inst
Add animation data to the X-file model.
For ModelID, you need to specify the model ID that has already been read by the addxfile instruction.
If the animation is added successfully, the model ID will be assigned to the system variable stat.
If the animation addition fails, the system variable stat is assigned -1.
^
The addxanim instruction is used when switching between multiple animations in one model.
First, read the data including the entire model and the first animation with the addxfile instruction, and then use the addxanim instruction to register only the additional animation.
Make sure that the model and bone configurations are output from the same source.

Multiple animations can be switched with the objact command.
The animation index value for switching is set to 0 for the animation read by the addxfile instruction first, and then increases to 1,2,3, etc. each time it is added by the addxanim instruction.
^
The maximum number of animations you can add is 16 (including the original x-files) by default.
To increase the maximum number, use the setreq instruction to set the maximum number of animations (SYSREQ_MDLANIM) appropriately.
^
Only the first one can be read from an X file that has multiple animation information. When reading multiple, it is necessary to prepare multiple X files.

%href
addxfile
objact


%index
objspeed
Animation playback speed setting
%group
Extended screen control command
%prm
p1,p2
p1 (0): Object ID
p2 (0): Playback speed per frame (real value)
%inst
Sets the animation playback speed of the object ID specified by p1.
You can specify the playback speed (ms) per frame with p2 as a real value.
This command is for changing the playback speed of the animation being played by the objact command.
When the objact instruction is executed, the standard animation playback speed set by the modelspeed instruction is applied.
If you want to set the speed before playing the animation, use the modelspeed instruction.

%href
modelspeed
objact




%index
modelspeed
Animation playback speed setting (2)
%group
Extended screen control command
%prm
p1,p2
p1 (0): Model ID
p2 (0): Playback speed per frame (real value)
%inst
Sets the standard animation playback speed of the model ID specified by p1.
You can specify the playback speed (ms) per frame with p2 as a real value.
From now on, objects that use the specified model will be set as the standard velocity when playing the animation.
If the modelspeed instruction does not set the standard animation playback speed, 15 (ms) will be set when the object is initialized.
Use the objact command to change the playback speed of the animation that has already been played.


%href
objspeed
objact


%index
hgcapture
Get DirectX screen data
%group
Extended screen control command
%prm

%inst
Copy the frame buffer information drawn by HGIMG to the HSP screen.
The currently active screen is the copy destination, such as with the gsel command.
Be sure to copy to a buffer that is the same size as the HGIMG initialized.
The hgcapture instruction copies to the virtual screen buffer of HSP, but does not update the screen.
In order to reflect the acquired screen on the window, it is necessary to redraw with the redraw command.
Note that if the same buffer as the window ID that initialized HGIMG is used as the copy destination, the contents will not be displayed because the HGIMG screen is overlaid.
In addition, the hgcapture instruction copies a large amount of data from the frame buffer of the video card to the main memory, which causes a load on the video card and CPU.

%href
redraw



%index
objlight
Referenced light settings
%group
Extended screen control command
%prm
p1,p2,p3
p1 (0): Object ID where the light is set
p2 (0): Object ID referenced as a light
p3 (-1): Setting mode
%inst
Sets the light that affects the object ID specified by p1.
Specifies the object ID referenced in p2.
Normally, all objects are affected by the base light (HGOBJ_LIGHT).
The objlight command changes the state to be affected by objects other than the basic light.
Additional light objects referenced can be created with the reglight instruction.

You can specify the mode with p3. The value of p3 has the following meanings.
^p
Mode content
---------------------------------------
   1 Light direction
   2 Light color
   4 Light ambient colors
^p
When setting multiple items, add each mode value.
If p3 is omitted, all directions, colors, and ambient colors are set.

%href
reglight



%index
reglight
Registration of light object
%group
Extended screen control command
%prm
p1
p1: Variable name to which the created object ID is assigned
%inst
Registers an additional light object and assigns the ID to the variable specified in p1.
A light object can be treated as a light to be newly referenced by the objlight instruction.
The acquired object ID can be set and acquired in the same way as other objects.
The parameters that can be set are the same as for the basic light (HGOBJ_LIGHT).

%href
objlight



%index
getxinfo
Acquisition of X model display information
%group
Extended screen control command
%prm
p1,p2,p3
p1: Variable name to which the created model information character string is assigned
p2: Object ID
p3: Node ID
p4: Setting mode

%inst
The model information indicated by the object ID specified in p2 is used as a character string.
Assigns to the variable specified by p1.
You must always specify the object ID that has the X format model.
Information is assigned to the variable of p1 in the form of a character string.
You can specify the node ID with p2.
The node ID is a number starting from 0, and multiple IDs are assigned to each bone or mesh.
If you specify a negative value such as -1 for the node ID, all node information is returned in the form of one line and one element separated by a line feed code.
This allows you to find out the maximum number of node IDs.
(The maximum number of node IDs is the same for the same model, even if the modes are different.)
You can specify the type of information to be acquired with p4.
The values that can be specified in p4 are as follows.
^p
Mode content
---------------------------------------------
 0 node name
 World coordinates of one node
 2-node X, Y, Z rotation angle
 16 Number of materials in a node
 $ 1000 + MatID Diffuse Color
 $ 2000 + MatID Texture COM pointer (0 when no texture is used)
 $ 10000 + Index Vertex coordinates
 $ 20000 + Index UV coordinates
^p
Use $ 1000 and $ 2000 in combination with the Material ID.
The material ID is a 0-based value assigned to each node, and the number of valid material IDs can be found in mode 16.
^
$ 10000 and $ 20000 are used in combination with the Index in the internal buffer.
You can get the vertex coordinate or UV coordinate values of the specified index.
^
The getxinfo instruction can be used to obtain the individual position information of the model including bones.
When processing a model with many nodes, it may take some processing, so be careful with applications that operate in real time.
Currently, the values for modes 1 and 2 get information about the last drawn model.
Please note that if the model is shared by multiple objects, it will not be acquired correctly.

%href
setxinfo



%index
setxinfo
Detailed settings for X model information
%group
Extended screen control command
%prm
p1,p2,p3,x,y,z
p1: Object ID
p2: Node ID
p3: Setting mode
(x, y, z): Vector information to be set (real value)

%inst
Sets the detailed information of the model indicated by the object ID specified in p1.
You must always specify the object ID that has the X format model.
If your model has multiple nodes (such as bones and meshes), you can specify the node ID with p2.
The node ID is a number starting from 0, and multiple IDs are assigned to each bone or mesh.
(The range of node IDs that can be specified can be checked by acquiring the node list with the getxinfo command.)
You can specify the type of information to be acquired with p3.
The values that can be specified in p3 are as follows.
^p
Mode content
---------------------------------------------
 Local coordinates of one node (x, y, z)
 Rotation angle of 2 nodes (x, y, z)
 $ 1000 + MatID Material Color (xyz = RGB)
 $ 2000 + MatID Referenced texture (x = texture ID)
 $ 10000 + Index Vertex coordinates (x, y, z)
 $ 20000 + Index UV coordinates (x, y)
^p
Use $ 1000 and $ 2000 in combination with the Material ID.
The material ID is a 0-based value assigned to each node, and the number of valid material IDs can be found in mode 16 of the getxinfo instruction.
^
$ 10000 and $ 20000 are used in combination with the Index in the internal buffer.
You can directly edit the vertex coordinates or UV coordinates of the specified index.
^
The setxinfo instruction can be used to change the individual state of a model that contains bones.
Nodes with animation cannot be set.
Also, if you do not specify the correct node ID, the display may be corrupted, so be careful when using it.

%href
getxinfo



%index
getobjmodel
Get model ID of object
%group
Extended screen control command
%prm
var,id
var: variable name to which the result is assigned
id: object ID
%inst
Gets the model ID assigned to the specified object and assigns it to the variable specified by var.

%href
setobjmodel



%index
modelcols
Collision parameter settings (2)
%group
Extended screen control command
%prm
p1,p2
p1 (0): Model ID
p2 (1.0): Collision parameter X (real value)
p3 (1.0): Collision parameter Y (real value)
p4 (1.0): Collision parameter Z (real value)
p5 (0): Setting type
%inst
Sets the standard collision parameters of the model ID specified in p1.
After that, it is set as a collision parameter when initializing an object that uses the specified model.
When the setting type of p5 is 0, when the collision judgment of the getcoli instruction is performed,
You can specify the scale (magnification) for the specified value as a real number for each X, Y, Z axis.
(If the standard collision scale is not set, 1.0 (1x) will be set.)
If the setting type of p5 is 1, it will be the setting of the extended collision parameter.
Set a cylinder with p2 as the object weight (repulsive force), p3 as the height, and p4 as the radius for collision judgment.
(This is the setting to be used for terrain judgment by the objwalk command)

Collision parameters for each object can also be set with the setcolscale command.

%href
setcolscale




%index
setcolscale
Collision parameter settings
%group
Extended screen control command
%prm
p1,p2
p1 (0): Object ID
p2 (1.0): Collision parameter X (real value)
p3 (1.0): Collision parameter Y (real value)
p4 (1.0): Collision parameter Z (real value)
p5 (0): Setting type
%inst
Sets the collision parameter of the object ID specified by p1.
When the setting type of p5 is 0, the scale (magnification) for the specified value can be specified for each X, Y, and Z axes in real numbers when determining collision with the getcoli instruction.
(If the standard collision scale is not set, 1.0 (1x) will be set.)
If the setting type of p5 is 1, it will be the setting of the extended collision parameter.
Set a cylinder with p2 as the object weight (repulsive force), p3 as the height, and p4 as the radius for collision judgment.
(This is the setting to be used for terrain judgment by the objwalk command)

If the setcolscale instruction does not set collision parameters, the standard collision parameters for each model are used.

%href
modelcols



%index
modelshade
Shading mode setting
%group
Extended screen control command
%prm
p1,p2
p1 (0): Model ID
p2 (0): Shading mode
%inst
Sets the shading mode of the model ID specified by p1.
Shading mode shows how to calculate the light source when the model is displayed.
The mode value can be one of the following:
^p
Mode value Contents
	-----------------------------------------------------
0 Constant (no light source calculation)
1 Gouraud (DirectX standard light source calculation)
2 hemispherical lighting
^p
When the mode value is 0, the material color is always reflected as it is without calculating the light source. (Constant shading)
When the mode value is 0, the light source is calculated considering the light color and ambient color. The display color in this case is
^p
Brightness = Light intensity * Light color * Material color + Ambient color
^p
Is used. (If the brightness exceeds 255, it will be 255.)
When the mode value is 2, the hemispherical lighting is calculated with the light color as the celestial sphere and the ambient color as the ground color.
Hemispherical lighting can express softer and finer shadows than DirectX standard light source calculation.
In the current version, the shading mode setting can only be applied to x-format models.
Also, please note that the scale (color) parameter of the light is not currently reflected in shading mode 1.

%href


%index
modelorder
Rotation order mode setting
%group
Extended screen control command
%prm
p1,p2
p1 (0): Model ID
p2 (0): Rotation order mode
%inst
Sets the rotation order mode of the model ID specified by p1.
The rotation order mode allows you to set the rotation order when displaying 3D objects.
The mode value can be one of the following:
^p
Mode value macro Rotation order
	------------------------------------------------------
	    0     HGMODEL_ROTORDER_ZYX   Z->Y->X
	    1     HGMODEL_ROTORDER_XYZ   X->Y->Z
	    2     HGMODEL_ROTORDER_YXZ   Y->X->Z
^p
The default model has a mode value of 0.
(However, mode value 1 is the default only for x format models.)

The modelorder instruction is provided to set the orientation of an object that cannot be resolved by any means, or to make it compatible with existing data.
Normally, it is not a required instruction in the range of use.

%href


%index
objchild
Object parent-child relationship settings
%group
Extended screen control command
%prm
ObjID,ChildObjID
ObjID: Object ID
ChildObjID: Child object ID
%inst
Sets the object that is a child of the specified object.
The object specified by ChildObjID will have a parent-child relationship with the object specified by ObjID.
After that, the display will be performed in the form that inherits the coordinates, rotation angle, and scale of the parent object specified by ObjID.
Also, if the parent object is deleted, all its children will be deleted at the same time.
It is possible to set a multi-level structure by specifying the parent object that has children in ChildObjID.
You cannot give a child an object that already has some parent.
If you specify a negative value for ChildObjID, all parent-child settings of the object specified by ObjID will be discarded.
^
The current version does not reflect parent-child relationship settings for objects that have an x-format model. Please use only for 3D and 2D models other than x format.
%href
regobj
delobj


%index
objproj
Object projection change
%group
Extended screen control command
%prm
ObjID,Mode
ObjID: Object ID
Mode: Projection mode
%inst
Changes the projection mode of the object specified by ObjID.
When the projection mode is 0, clipping in the Z direction is performed according to the NearZ value and FarZ value of the camera as a normal object.
When the projection mode is 1, the camera's FarZ value is ignored as a special object.
You can change the projection mode when you want to draw only some objects in the distance, such as the background.
%href
regobj


%index
dmmini
Sound function initialization
%group
Extended multimedia control instructions
%prm
%inst
Initializes the sound function.
You only need to initialize it once at the beginning of program execution.
After that, you can use the sound playback function by DirectSound by using the command starting with dmm ~.
The sound function is used only when the initialization is performed by the dmmini instruction.
Even when using HGIMG3, if sound-related functions are not initialized, APIs related to sound such as DirectSound will not be used.
If you use HGIM G3 and other sound related plug-ins, you can use it as usual.

%href
dmmreset
dmmbye


%index
dmmreset
Reset sound function settings
%group
Extended multimedia control instructions
%prm
%inst
Resets the sound function settings.
All loaded sound data will be discarded.

%href
dmmini
dmmbye


%index
dmmbye
Sound function termination processing
%group
Extended multimedia control instructions
%prm
%inst
Performs the termination processing of the sound function.
Normally, the termination process is performed automatically, so it is not necessary to include this command.

%href
dmmreset
dmmini


%index
dmmdel
Delete sound data
%group
Extended multimedia control instructions
%prm
p1
p1 (0): Sound ID
%inst
Discards the sound ID information specified in p1.
%href
dmmload


%index
dmmvol
Sound data volume setting
%group
Extended multimedia control instructions
%prm
p1,p2
p1 (0): Sound ID
p2 (0): Volume (-10000 ~ 0)
%inst
Sets the volume of the sound ID specified in p1.
Specify the volume to be set with p2. 0 is the maximum volume (0db) and -10000 is the minimum volume (silence).
Since the unit of the set value is db (decibel), it is different from the volume felt by humans. Volsamp.hsp is prepared as a sample to set the natural volume when a person hears it, so please refer to it.
* Please note that the resolution of the value and the meaning of the specified value are different from the mmvol instruction.

%href
dmmpan
dmmload


%index
dmmpan
Sound data pan settings
%group
Extended multimedia control instructions
%prm
p1,p2
p1 (0): Sound ID
p2 (0): Panning value (-1000 to 10000)
%inst
Sets the pan (stereo balance) of the sound ID specified by p1.
Specify the panning value to be set in p2.
-10000 is 100% on the left side and 10000 is 100% on the right side.
* Please note that the resolution of the value is different from that of the mmpan instruction.

%href
dmmvol
dmmload


%index
dmmloop
Sound data loop settings
%group
Extended multimedia control instructions
%prm
p1,p2
p1 (0): Sound ID
p2 (0): Loop point (-1 = no loop)
%inst
Sets the loop information for the sound ID specified in p1.
If you specify a value greater than or equal to 0 for p2, playback will be repeated.
If p2 is a negative value, no loop is performed.
During streaming playback, you can specify the loop point with p2. The loop point is specified in sample units (1 / 44100 second for 44.1 kHz).

%href
dmmload


%index
dmmload
Reading sound data
%group
Extended multimedia control instructions
%prm
"File name", p1, p2
"File name": The name of the file to be read
p1 (-1): Sound ID to be registered (-1 = automatic assignment)
p2 (0): Playback mode (0 = normal, 1 = repeat)
%inst
Registers the file specified by "File name" as sound data.
For sound data, specify a file in wave format (extension .wav) or ogg vorbis format (extension .ogg).
All files that can be used by HSP, such as dpm files, can be used as files, including the in-memory image specified by the memfile instruction.

By specifying the sound ID number (any numerical value starting from 0) registered in p1, you can use various functions based on the sound ID number after that.
If you omit the specification of p1 or set it to a negative value, an unregistered sound ID number is automatically assigned.
The assigned sound ID number is assigned to the system variable stat after the dmmload instruction is executed.
You can specify the playback mode of wave format with p2.
If the playback mode is 0, it will be played only once. If it is 1, it will be repeated (repeat) playback.
For repetitive playback in ogg vorbis format, use the dmmloop instruction.

%href
dmmloop
dmmdel


%index
dmmplay
Playback of sound data
%group
Extended multimedia control instructions
%prm
p1,p2
p1 (0): Sound ID
p2 (0): Start point
%inst
Plays the sound ID specified by p1.
If the sound ID already specified is playing, it will be played from the beginning.
You can specify the starting point with p2.
If p2 is omitted or 0, the sound data is played from the beginning, otherwise it is played from the middle as an offset position from the beginning.
The unit specified by p2 is the number of bytes (byte) when the sound data is in wav format.
For stream data (ogg vorbis format), it is the number of samples (samples).
In addition, simultaneous playback of stream data is not supported.

%href
dmmstop
dmmvol
dmmpan
dmmloop
dmmload


%index
dmmstop
Stop playing sound data
%group
Extended multimedia control instructions
%prm
p1
p1 (-1): Sound ID (-1 = all sounds)
%inst
Stops playback of the sound ID specified by p1.
If p1 is omitted or a negative value is specified, all playing sounds will be stopped.

%href
dmmplay
dmmload


%index
dmmstat
Sound data status acquisition
%group
Extended multimedia control instructions
%prm
p1,p2,p3
p1: Variable for which state is acquired
p2 (0): Sound ID
p3 (0): Acquisition mode
%inst
Gets the state of the sound ID specified in p2 and assigns it to the variable in p1.
You can specify the mode to acquire with p3.
The values of the acquisition mode are as follows.
^p
Mode value Contents
	------------------------------------------------------
0 Setting flag value
1 Volume value
2 Panning value
3 Playback rate (0 = original)
4,5 Loop points (lower, upper 16 bits)
16 Playing flag (0 = Stopped / 1 = Playing)
$ 100 ogg Sound playback position (real number)
$ 101 ogg Overall size of sound (real number)
^p

%href
dmmplay
dmmload


%index
hgprm
Setting of operating parameters
%group
Extended screen control command
%prm
p1, p2, p3Åc
p1 (0): Parameter ID
p2 (0.0): Value to set
%inst
Set the operation of HGIM G3 in detail.
Sets the value of p2 to the parameter ID specified by p1.
The following values can be specified for the parameter ID.
^p
Parameter ID Contents
	------------------------------------------------------
0 Y coordinate that is the base point of the ground (initial value = 0.0)
(Referenced in OBJ_LAND object mode)
1 hour update flag (initial value = 1)
(Specify 0 to stop the interpolation of animation and movement)
2 The highest Y coordinate of the movable ground (initial value = -15.0)
(When the object is automatically moved, above the specified Y coordinate
You will not be able to move)
3 Specify the target object ID
(This item is currently unused and is available for future expansion)
4 Bound coefficient (initial value = 1.0)
(Referenced in the object mode of OBJ_BOUND)
5 Friction resistance (air, ground) (initial value = 0.95, 0.95)
(Sets the resistance to be added when the object moves automatically
This parameter ID must be set to two values)
^p
%href


%index
objaim
Manipulate objects toward goals
%group
Extended screen control command
%prm
ObjID,Target,Mode,x,y,z
ObjID (0): Object ID
Target (0): Target mode (0 = coordinates, 1 = angle)
Mode (0): Mode
x (1.0): Optional parameter X
y (1.0): Optional parameter Y
z (1.0): Optional parameter Z
%inst
Manipulate the coordinates and angle of the object specified by ObjID toward the target value.
In Target, set the target (target mode) to operate.
If it is 0 or omitted, the coordinates will be moved.
In Mode, you can select the content of the operation.

Mode 0: Move (or rotate) toward the target value

Moves (or rotates) toward the coordinates set in the work group information of the object.
(If the target mode is 0, it will move, and if it is 1, it will change the rotation angle.)
It is necessary to set the target coordinates in advance by using the setwork command.
The maximum movement amount per frame can be set by the optional parameters X, Y, Z.
For example, if (1,1,1) is specified, only one move per frame for each of X, Y, and Z will be performed.

Mode 1: Set the amount of movement toward the target value

Similar to Mode0, it moves toward the coordinates set in the work group information of the object.
However, instead of actually moving, set the movement amount in the dir group information.
This is for use when moving toward the specified coordinates when OBJ_MOVE is specified in the object mode.
For this mode, always specify target mode 0 (coordinates).

Mode 4: Set the angle toward the target value

Sets the angle towards the coordinates set in the object's work group information.
It is necessary to set the target coordinates in advance by using the setwork command.
The optional parameters X, Y, Z must specify the vector to which the original model is oriented.
For this mode, always specify target mode 0 (coordinates).

The objaim instruction allows a wide variety of object operations, but its settings are complicated.
It's a good idea to learn while practicing only the functions you need.
After executing the instruction, the system variable refdval is assigned the distance from the target coordinates.

%href
event_aim


%index
event_aim
Added object manipulation event
%group
Extended screen control command
%prm
id,Mode,x,y,z
id (0): Event ID
Mode (0): Mode
x (1.0): Optional parameter X
y (1.0): Optional parameter Y
z (1.0): Optional parameter Z
%inst
The object operation event is added to the event ID specified by id.
The same operation as the objaim instruction can be performed when the event is executed.
The mode and the values of the optional parameters X, Y, and Z can use the same contents as the obgiim instruction.
(Target mode is always 0.)

%href
objaim
newevent
setevent


%index
event_objact
Added animation setting event
%group
Extended screen control command
%prm
id,Anim,mode,speed
id (0): Event ID
Anim: Animation index value
mode (0): Setting mode (0 = immediate / 1 = at the end)
speed (0.0): Animation playback speed
%inst
The animation setting event is added to the event ID specified by id.
The same values as the objact instruction can be specified for the Anim and mode settings.
You can set the playback speed (similar to the objspeed command) with speed.
If the speed value is 0.0 or omitted, the playback speed will not be set.

%href
objact
objspeed
newevent
setevent


%index
hgview
Drawing area settings
%group
Extended screen control command
%prm
x,y,sx,sy
x (0): Upper left coordinate of drawing area (X)
y (0): Upper left coordinate of drawing area (Y)
sx (640): Horizontal size of drawing area
sy (480): Vertical size of drawing area
%inst
Set the area for drawing on the screen.
If you set the drawing area with hgview, it will be drawn only within the specified range after that.
This is effective when drawing by dividing one screen into several areas.
Please note that the mode of the hgdraw instruction must be specified to an appropriate value in order to reflect the drawing area.
The hgview command is a command to change the drawing settings so that the contents displayed in the main window are within the specified range. If you specify a different aspect ratio from the main window, the image will be distorted.
^p
Example:
hgdraw 0; drawing process (full screen)
hgview 0,0,320,240; Drawing area settings
hgdraw 1; Drawing process (within specified area)
hgsync 12; wait for time
^p

%href
hgdraw


%index
texopt
Set the character string drawing mode
%group
Extended screen control command
%prm
space,linespace,mode
space (0): Character spacing size
linespace (0): Line spacing size
mode (0): Specify drawing mode
%inst
Make detailed settings for the character string drawn by the texmes command.
With space and linespace, you can fine-tune the characters and line spacing size at the time of display in dot units.
If it is 0, the interval is normal. If the value is negative, the interval is narrow, and if it is positive, the interval is wide.
Also, depending on the mode, you can specify the drawing mode from the following.
^p
Mode content
-----------------------------------------------
0 with antialiasing
1 No antialiasing
2 No antialiasing + update only óØ value
^p

%href
texmes


%index
hgsettime
Real-time timer setting
%group
Extended screen control command
%prm
val,max
val (0): Value to set
max (100000): Upper limit of timer
%inst
Set the value of the real-time timer.
The real-time timer measures the time with high accuracy in 1ms units and can be used during the operation of HGIM G3.
(However, with the hgsetreq instruction, hgsync time wait mode (SYSREQ_DEFTIMER) is set.
Real-time timer is not available when set to await. )
The real-time timer always counts up by 1 every 1ms.
If the upper limit of the timer is exceeded, it will return to 0.
The value of the real-time timer can be obtained by the hggettime instruction.

%href
hgsetreq
hggettime


%index
hggettime
Get real-time timer
%group
Extended screen control command
%prm
val,type
val: variable name to which the result is assigned
type (0): Acquisition type
%inst
Gets the real-time timer information and assigns it to the variable specified by val.
The real-time timer measures the time with high accuracy in 1ms units and can be used during the operation of HGIM G3.
What is acquired depends on the value of the acquisition type.
If the acquisition type is 0, the value of the real-time timer that counts up every 1ms is acquired as it is.
If the acquisition type is 1, the real-time timer acquires the number of times the upper limit has been exceeded.
The value of the real-time timer can be set at any time with the hgsettime instruction.

%href
hgsettime



%index
meshmap
Update mesh map information
%group
Extended screen control command
%prm
var,id,mode,factor
var: Array variable name to which the mesh map information is assigned
id (0): Mesh model ID to be processed
mode (0): Update mode
factor (1.0): Magnification used for update (real number)
%inst
The mesh map information assigned to the array variable is reflected in the model.
The mesh map information holds the information of the grid unit divided in the X and Y directions as an integer type array variable. Various information such as UV can be updated in real time, including the height of each mesh vertex.
This allows you to represent undulating ground or map chips.
The updated information changes depending on the value specified in mode.
^p
Mode content
-----------------------------------------------
0 mesh Y coordinate
1 Mesh X coordinate
2 mesh Z coordinate
3 Mesh texture U coordinates
4 Mesh texture V coordinate
$ 100 mesh texture mapping
^p
When $ 100 (256) is specified for mode, the UV value for displaying the texture map chip for the terrain divided into 4 is set based on the value (0 to 3) of the mesh map information.

If the coordinates of the mesh change, the normals will be recalculated.
In that case, add 16 to the mode value to create a smooth normal.
(However, it is computationally expensive and applies to those that do not use repeating textures in the mesh map).

The meshmap instruction sets values for all vertices based on the contents of the array variable.
The factor factor is applied uniformly to the set value.
In other words, even if the value stored in the variable is 15, if you specify 0.1 for factor, the actual value set will be 1.5.
By using it in combination with the getvarmap command, you can set the height and map chip based on the image data.

%href
getvarmap
addmesh
objwalk



%index
getvarmap
Creating mesh map information
%group
Extended screen control command
%prm
var,sx,sy,mode
var: Array variable name to which mesh map information is assigned
sx (0): Number of divisions in the X direction
sy (0): Number of divisions in the Y direction
mode (0): Acquisition mode
%inst
Create mesh map information from the contents of the drawing buffer.
The mesh map information holds the information of the grid unit divided in the X and Y directions as an integer type array variable. Various information such as UV can be stored, including the height of each mesh vertex.
Reads the contents of the HSP image buffer specified as the drawing destination and sets the value in the specified array variable.
The variables to be assigned must be initialized as a two-dimensional array in advance.
Note that the size of the two-dimensional array reserves as many arrays as there are vertices, one more each than the number specified by (sx, sy).
(If the number of XY divisions is (sx, sy), the size for initializing the array is (sx + 1, sy + 1).)

The information to be acquired changes depending on the value specified in mode.
^p
Mode content
-----------------------------------------------
0 Luminance information with white as 0 and black as 255
1 A value that skips white and sets the others to 1.
2 White is skipped, other values are 2.
17 A value where white is 0 and the others are 1.
18 A value where white is 0 and the others are 2.
^p
The points in the image are read and the corresponding values are assigned as mesh map information.
(The color of the image does not matter. It reads the smallest value of RGB.)

%href
meshmap



%index
objwalk
Move on mesh map
%group
Extended screen control command
%prm
var,id,x,y,z
var: variable name to which the result is assigned
id (0): Object ID to move
x (0.0): Movement amount in the X direction (real number)
y (0.0): Movement amount in the Y direction (real number)
z (0.0): Movement amount in the Z direction (real number)
%inst
Moves the specified object in the (x, y, z) direction.
In addition to simply moving the coordinates, the appropriate destination is set after considering the Roche map showing the ground and the object with the extended collision.
The size (vector) actually moved is assigned to the variable specified by var.
(Variables are assigned values to elements 0 and 2 as a double type array)

If you want to move over undulating ground, the appropriate mode must be set for the object.
Objects with OBJ_GROUND mode set will be recognized as ground.
Objects with OBJ_STAND mode set will be placed on the ground.
Gravity calculation is added to the object for which the mode of OBJ_GRAVITY is set.
Also, if you want the object to be recognized as an obstacle, you need to set the mode and collision group.
Objects with the OBJ_STATIC mode set will be obstacles.

Various information obtained when moving with the objwalk command can be obtained with the getcolvec command.

%href
addmesh
meshmap
objfloor
getcolvec



%index
objfloor
Display offset setting from the ground
%group
Extended screen control command
%prm
id,offset
id (0): Object ID to set
offset (0.0): Offset value in the Y direction (real number)
%inst
Sets the offset value for the Y coordinate of the object that is displayed when moving over the ground.
This is a parameter for displaying by shifting the specified value upward from the coordinates corresponding to the ground.
Avoid getting buried in the ground depending on the center coordinates of the model.
The offset value set here is applied when moving on the ground with the objwalk command.

%href
regobj
objwalk



%index
getcolvec
Acquisition of collision information
%group
Extended screen control command
%prm
var1,var2,var3,id,mode
var1: Variable name to which the result of X is assigned
var2: Variable name to which the result of Y is assigned
var3: Variable name to which the result of Z is assigned
id (0): Target object ID
mode (0): Acquisition mode
%inst
Get various information about collisions and objects.
The information of the object specified by id is assigned to the variable specified by var1, var2, var3.
The information retrieved depends on the mode value.
The contents of mode are as follows.
^p
Mode content
-----------------------------------------------
 0 Get the slope (normal) of the ground at your feet
 1 Get the ground object ID, X, Y division number
 2 Get the collision scale value
 3 Get extended collision parameters
 4 Get the Y coordinate of the ground and the display Y offset value.
16 Get the ground object ID, X, Y division number
17 Various information about extrusion
18 Get object general-purpose user information
^p

For modes 0 to 15, var1 to var3 are set as real values.
After mode 16, var1 to var3 are set as integer values.
(It is not necessary to set the variable type in advance.)

For various information regarding the extrusion of mode 17, the flag value of whether or not the extrusion was performed to var1 was set to var2.
The ID of the object is assigned to var3, and the object ID of the extruded side is assigned to var3 when it is extruded.

%href
modelcols
setcolscale
objwalk



%index
getnearobj
Find the closest object
%group
Extended screen control command
%prm
var,id,group,range
var: variable name to which the result is assigned
id (0): Search source object ID
group (0): Collision group to be searched
range (10.0): Distance to search (real number)
%inst
Finds another object closest to the source object ID.
Finds the closest object around the object specified by id and assigns the object ID to the variable specified by var.
When searching, the collision group specified by group and the distance specified by range are referenced.
Searches only for objects that match the collision group specified by group.
(The group of the collision target set in advance by the setcoli command etc. is not referred to)
range specifies up to what distance to search.
For 3D objects, use the coordinate distance, and for 2D objects, use the distance (number of dots) on the 2D coordinates.

%href
getcoli
findobj



%index
wave_init
Ripples initialization
%group
Extended screen control command
%prm
p1,p2
p1 (32): Initialization X size
p2 (32): Initialization Y size
%inst
Initializes the ripple generation function.
Use the p1 and p2 parameters to specify the number of divisions in the X and Y directions.
The ripple generation function calculates ripple transmission and elasticity corresponding to the vertices of the mesh map.
However, it does not perform strict physics, and the amount of calculation is suppressed to a simple level that prioritizes performance.
These functions can be used for on-screen effects and effects.
Please note that in order to use the ripple generation function, it is necessary to initialize the grid and create an array variable to store the height information of the mesh.
Ripples can be initialized as many times as you like.
Initialization resets all vertices to height 0.

%href
wave_set
wave_apply



%index
wave_set
Set the height of the ripples
%group
Extended screen control command
%prm
x,y,pow,mode
x (0): X position of vertex
y (0): Y position of vertex
pow (0): height value
mode (0): Setting mode
%inst
Set the height of the ripples in the ripple generation function.
Be sure to initialize it with the wave_init instruction first.
Sets the height at the vertex (x, y) position as the value specified by pow.
You can also select some setting methods depending on the mode value.
^p
Mode content
-----------------------------------------------
0 Sets the value only at the specified position
1 Set the surrounding values so that they form a cone (weak)
2 Set the surrounding values so that they form a cone (strong)
3 Make it spherical (overwrite)
4 Make it spherical (additional)
^p

%href
wave_init
wave_apply



%index
wave_apply
Get the ripple state
%group
Extended screen control command
%prm
var,mode
var: variable name to which the result is assigned
mode (0): Acquisition mode
%inst
The calculation is performed by the ripple generation function, and the result is read into a variable.
Be sure to initialize it with the wave_init instruction first.
Also, the array variable specified by var must be an integer type and must be initialized with a value that is one larger than the grid size for both X and Y.
(Because the number of vertices is one more than the number of grid divisions)

The content of processing can be specified by the value of mode.
The contents of the mode are as follows.
^p
Mode content
-----------------------------------------------
0 Extract only the previous result
1 Perform elastic calculation and extract the result
2 Calculate the ripples and extract the result
-1 Write the contents of the variable to the ripple buffer (for debugging)
^p
The wave_apply instruction is just for performing calculations to apply to the mesh.
If you want to apply it to a mesh map for display on the actual screen, you need to use the meshmap instruction.

%href
wave_init
wave_set
meshmap


%index
delmodel
Delete model
%group
Extended screen control command
%prm
ModelID
ModelID: Model ID
%inst
Deletes the specified model.
All information about the model and loaded resources are also released.
If you delete the model assigned to the object, nothing will be displayed. (Note that the object is not deleted at that time either.)
Deleting and registering a model is a costly instruction, so it is not recommended to use it on a frame-by-frame basis.
It is efficient to prepare the necessary models before drawing the scene, and when replacing the scene, destroy them all with the hgreset command and then re-register.

%href
addbox
addeprim
addmesh
addplate
addsplate
addspr
addxfile


%index
hgcnvaxis
Perform 3D coordinate conversion
%group
Extended screen control command
%prm
var_x,var_y,var_z,x,y,z,mode
var_x: Variable to which the X value is assigned
var_y: Variable to which the Y value is assigned
var_z: Variable to which the Z value is assigned
x (0.0): X value of conversion source
y (0.0): Y value of conversion source
z (0.0): Z value of conversion source
mode (0): Conversion mode
%inst
Converts the 3D coordinates of (x, y, z) according to the determined mode.
The result is assigned in real type to the variables specified by var_x, var_y, var_z. (Variable type is set automatically)
The contents of conversion by mode value are as follows.
^p
Mode content
-----------------------------------------------
0 2D coordinate (X, Y) position to be drawn + Z buffer value
Same as 10 but with normalized (X, Y) coordinates
2 View-transformed (X, Y, Z) coordinates
+16 Treat the Y-axis value as positive or negative
^p
Modes 0 and 1 convert to the X, Y coordinates, and Z-buffer values of a 2D projection on the screen.
In mode 2, the view is converted to the X, Y, Z coordinate values that take the camera position into consideration.
Adding 16 to the mode value treats the Y-axis value as positive or negative. It is provided for compatibility with versions prior to HSP 3.21.

%href
getpos



%index
hgobaq
OBAQ initialization on HGIM G3
%group
Extended screen control command
%prm
p1,p2,p3
p1 (0): OBAQ system pointer value
p2 (0): Debug display mode setting (0 = ON / 1 = OFF)
p3 (0): 2D / 3D display mode setting (0 = 2D / 1 = 3D)
%inst
Initialize to use OBAQ (Physics Engine Plug-in) from HG IMG3.
After initializing the OBAQ plug-in in advance, it is necessary to specify the OBAQ system pointer value acquired by the qgetptr instruction in p1.
Specify the debug display mode with p2. This is similar to the display mode switch specified by the qdraw instruction.
Use p3 to switch the 2D / 3D display.
If the default or 0 is specified, the 2D mode is set and drawing is performed on the screen of HGIMG3 in the same way as normal OBAQ.
If 1 is specified for p3, it will be in 3D mode and the OBAQ drawing can be placed as an object in 3D space by pasting it on a 3D polygon (board).
To use the 3D display mode, it is necessary to separately create an OBAQ model with the addobaq3d command and register the object.

%href
qgetptr
addobaq3d


%index
hgceldiv
Cell division specification in HGIMG3
%group
Extended screen control command
%prm
p1,p2,p3,p4,p5
p1 = 0 ~ (0): Texture ID
p2 = 1 ~ (0): Horizontal division size
p3 = 1 ~ (0): Vertical division size
p4 = 0 to (0): Horizontal center coordinates
p5 = 0 to (0): Vertical center coordinates
%inst
Set the cell division size and center coordinates of the texture managed by HGIMG3.
This is the reference when specifying the cell ID in the material specification of the OBAQ object when using the OBAQ plug-in on HGIMG3.
hgceldiv is for reproducing the same function as the standard instruction celdiv with HGIMG3.
When using HGIMG3 alone, no special settings are required.

%href
celdiv


%index
addobaq3d
Create OBAQ 3D model
%group
Extended screen control command
%prm
var
var: Variable name to which the created model ID is assigned
%inst
Create an OBAQ 3D model.
When the model is created successfully, the model ID is assigned to the variable specified by var.
The OBAQ3D model draws objects managed by the OBAQ plug-in.
The OBAQ3D model draws on a flat plate, but it can be freely placed and rotated in 3D space. It is a model with the same properties as the PLATE model.
For the OBAQ3D model, it is necessary to initialize OBAQ and set the 3D display by the hgobaq instruction.

%href
hgobaq


%index
addline
Create a line segment model
%group
Extended screen control command
%prm
var,p1,p2,p3
var: Variable name to which the created model ID is assigned
p1 (-1): Texture ID
p2 (0): Cell ID, color code
p3 (16): Line size
%inst
Create a line model.
When the model is created successfully, the model ID is assigned to the variable specified by var.
The line segment model has a function to draw a line from the coordinates set in the object to the coordinates (relative position) set in the work group of the object.
If you specify a texture ID for p1, the texture is used to draw the line.
In that case, the value specified in p2 is treated as the cell ID (ID divided by hgceldiv).
If p1 is the default or a negative value, the line is drawn with the color code specified by p2. Also, when drawing a texture, the line size of p3 is valid.

%href
hgceldiv


%index
newemit
Create an emitter
%group
Extended screen control command
%prm
p1,p2,p3,p4
p1: Variable name to which the created emitter ID is assigned
p2 (0): Emitter mode
p3 (8): Number of objects created
p4 (-1): Emitter ID
%inst
Initializes the emitter and assigns the emitter ID to the variable specified by p1.
^
Emitters are a special mechanism that allows you to spawn multiple objects at once.
Think of it as an object generator that can be generated in any combination, such as random parameters.
When creating a new emitter, it is necessary to obtain the emitter ID with the new emit instruction.
You can specify the mode of the emitter to be initialized with p2.
^p
Mode value Contents
-----------------------------------------------
EMITMODE_NONE 0 Do nothing
EMITMODE_STATIC 1 Appears only and does not move
EMITMODE_CIRCLE 2 Move concentrically
EMITMODE_RANDOM 3 Move in random direction
EMITMODE_LOOKAT 16 Aim in the direction of movement (can be used with others)
^p
Sets the number of objects created by p3 at one time.
By default, 8 objects are created at once.
Various operations can be registered in the created emitter by the emitter setting command starting with "emit_".
You can specify the emitter ID to overwrite with p4.
When creating a new one, omit it or leave it at a negative value.
^
The object does not spawn as soon as the emitter is created.
It is generated when necessary after setting various generation conditions in advance.
When actually using the emitter, it can be generated at any time by the hgemit command, or it can be applied to the object by the setobjemit command.

%href
delemit
hgemit
setobjemit


%index
delemit
Remove emitter
%group
Extended screen control command
%prm
p1
p1 (0): Emitter ID
%inst
Deletes the emitter specified by p1.
The deleted emitter ID cannot be used until it is initialized again with the new emit instruction.
%href
newemit


%index
emit_size
Set the emitter generation range
%group
Extended screen control command
%prm
id,dx,dy,dz
id (0): Emitter ID
dx (0.0): Occurrence range X (real number)
dy (0.0): Occurrence range Y (real number)
dz (0.0): Occurrence range Z (real number)
%inst
Sets the range of objects that the emitter specified by id will generate.
The range of occurrence specifies how far it will be scattered from the originally specified coordinates of occurrence.
For example, if the origin of the emitter is (10,10,10) and the generation range is set to (20,10,0),
Objects generated from the emitter will be scattered by random numbers within the range of (10 to 30,10 to 20,10).
This allows the initial position to occur to vary to some extent.
For emitters for which emit_size is not set, (0,0,0) is set as the initial value.

%href
newemit


%index
emit_speed
Emitter speed setting
%group
Extended screen control command
%prm
id,speed,spdopt
id (0): Emitter ID
speed (1.0): Initial speed value (real number)
spdopt (0.0): Speed range (real number)
%inst
Sets the speed of the object that the emitter specified by id spawns.
Object velocity is a number given to an object that starts moving as soon as it occurs.
The higher the speed value, the faster the movement.
In the speed parameter, specify the initial value of the speed to be set.
If spdopt is greater than 0, it will vary within that range.
For example, if (1.0,5.0) is specified, the speed will be scattered by random numbers in the range of 1.0 to 6.0.
For emitters for which emit_speed is not set, (1.0, 0.0) is set as the initial value.
%href
newemit


%index
emit_angmul
Set the angle coefficient of the emitter
%group
Extended screen control command
%prm
id,dx,dy,dz
id (0): Emitter ID
dx (0.0): Angle coefficient X (real number)
dy (0.0): Angle coefficient Y (real number)
dz (0.0): Angle coefficient Z (real number)
%inst
Sets the object movement angle factor when the emitter specified by id is generated.
When the emitter spawns an object, the angle in the direction of movement is calculated.
Basically, in the case of EMITMODE_RANDOM mode, the movement direction is randomly selected from 360 degrees all around, and in the case of EMITMODE_CIRCLE mode, it is evenly distributed by the number of 360 degrees all around.
The angle factor is a number that is multiplied by this angle.
This makes it possible to set movement within a limited range such as 180 degrees and 90 degrees as well as 360 degrees all around.
For example, if 0.5 is specified for the angle coefficient, the calculation will be performed on half of the entire circumference (180 degrees). Furthermore, the range of movement can be freely set by setting the angle addition value with the emit_angopt command.
The angle coefficient can be set individually for each X, Y, and Z axes. Also, in the case of 2D sprites, only Z-axis rotation is reflected.
For emitters for which emit_angmul is not set, (1,1,1) is set as the initial value.

%href
newemit
emit_angopt


%index
emit_angopt
Set the angle addition value of the emitter
%group
Extended screen control command
%prm
id,dx,dy,dz
id (0): Emitter ID
dx (0.0): Angle addition value X (real number)
dy (0.0): Angle addition value Y (real number)
dz (0.0): Angle addition value Z (real number)
%inst
Set the object movement angle addition value when the emitter specified by id is generated.
When an object is generated by an emitter, the angle in the direction of movement is calculated, and a constant to be added to that value can be specified for each X, Y, and Z axes.
The movement direction (angle) of the generated object is
^p
Object angle = basic angle * angle coefficient + angle addition value
^p
It is calculated in the form of. (See the emit_angmul instruction reference for more information on basic angles)
When used in combination with the emit_angmul command to set the angle coefficient, it is possible to generate an object with a limited range of movement angles.
For emitters for which emit_angopt is not set, (0,0,0) is set as the initial value.

%href
newemit
emit_angmul


%index
emit_model
Set the emitter generation model
%group
Extended screen control command
%prm
id,model,modelnum,objmode,efx
id (0): Emitter ID
model (0): model ID
modelnum (0): model id range
objmode (0): Object mode setting value
efx (0x100): efx setting value

%inst
Set detailed parameters such as the model ID of the object in which the emitter specified by id occurs.
Specifies important factors such as the type of object generated by the emitter and the mode settings.
Be sure to set it when using the emitter.
In the model parameter, specify the model ID that occurs. The model ID is the same as the model ID that can be set with the regobj instruction.
With modelnum, you can specify the range of model IDs that will occur.
This can be used to spawn separate models at random.
For example, if the model ID is 3 and the modelnum is 4, objects will be randomly generated in the range of model IDs 3-6.
If you want to generate only a single model, leave modelnum at 0.
The objmode parameter allows you to specify the mode of the object that will be set when it occurs. The mode value is the same as the value specified by the regobj instruction.
The efx parameter allows you to specify the efx parameter of the object that is set when it occurs.
The efx parameter is the same as the first parameter specified by the setefx instruction.
This allows you to apply special effects settings such as translucency and addition to the object.

%href
newemit
regobj


%index
emit_event
Emitter event settings
%group
Extended screen control command
%prm
id,event,eventnum
id (0): Emitter ID
event (0): Event ID
eventnum (0): Event ID range
%inst
Sets the event ID of the object where the emitter specified by id occurs.
In the event parameter, specify the event ID that occurs. The event ID is the same as the event ID that can be set with the setevent instruction.
In eventnum, you can specify the range of event IDs that occur.
This can be used to generate separate events at random.
For example, if event ID is 2 and eventnum is 5, events will occur randomly in the range of model IDs 2-6.
If you want to raise only a single event, leave eventnum at 0.
For emitters for which emit_event is not set, the event is not set when the object is generated.

%href
newemit
setevent


%index
emit_num
Setting the number of emitters
%group
Extended screen control command
%prm
id,num,numopt
id (0): Emitter ID
num (0): Number of objects generated
numopt (0): Range of occurrence
%inst
Sets the number of objects that the emitter specified by id will generate.
num allows you to specify the number of objects that will occur.
This can be used to spawn a different number of objects at random.
For example, if the number of objects generated is 5 and numopt is 10, the number of generated objects will change randomly in the range of 5 to 14.
For emitters for which emit_num is not set, the emission range (numopt) is 0 along with the number of occurrences specified by newemit.

%href
newemit


%index
emit_group
Emitter group settings
%group
Extended screen control command
%prm
id,mygroup,enegroup
id (0): Emitter ID
mygroup (0): Group value to which you belong
enegroup (0): Group value for which collisions are detected
%inst
Sets the collision group of the object in which the emitter specified by id occurs. This is similar to the value set on the object by the setcoli instruction.
Use this to spawn an object with a specific collision group.
For emitters for which emit_group is not set, collision group is not set when the object is generated.

%href
newemit
setcoli


%index
hgemit
Emitter generation execution
%group
Extended screen control command
%prm
id,dx,dy,dz
id (0): Emitter ID
dx (0.0): X coordinate value (real number)
dy (0.0): Y coordinate value (real number)
dz (0.0): Z coordinate value (real number)
%inst
Generates the emitter specified by id from the coordinates of (dx, dy, dz).
It is necessary to set the object to be generated from the emitter in advance.
After execution, the total number of generated objects is assigned to the system variable stat.
Use the setobjemit instruction to apply an emitter to a placed object.
%href
newemit
setobjemit


%index
setobjemit
Apply emitter to object
%group
Extended screen control command
%prm
p1,p2
p1 (0): Object ID
p2 (0): Emitter ID
%inst
Sets the placed object as the origin of the emitter.
Assigns the emitter of p2 to the object specified by p1.
After that, it will also operate as an emitter when displaying an object.
You can cancel the application of the emitter by specifying a negative value for the emitter ID.
%href
hgemit


%index
groupmod
Apply calculation to the same group
%group
Extended screen control command
%prm
group,mocid,dx,dy,dz,opt
group (0): Collision group to be operated on
mocid (0): MOC application destination
dx (0.0): X operation value (real number)
dy (0.0): Y operation value (real number)
dz (0.0): Z operation value (real number)
opt (0): Calculation method
%inst
Perform operations collectively on models that belong to the same collision group.
Of all the valid objects, the one that specifies the collision group specified by the group parameter is the target of the operation.
Multiple bits can be combined in the collision group specified by the group parameter. For example, if you specify group 1 and group 2 at the same time, the value is 3.
The mocid parameter specifies a value that indicates the MOC group. The following can be specified for the MOC group.
^p
MOC group mocid
---------------------------
  pos           0
  ang           1
  scale         2
  dir           3
  efx           4
  work          5
^p
Use (dx, dy, dz) to set the value used in the operation.
The method of operation is specified by the opt parameter. The following can be specified for the opt parameter.
^p
  opt calculation method
---------------------------
   0 substitution
   1 addition
   2 subtraction
   3 multiplication
^p
When opt is omitted or 0 is specified, the value of (dx, dy, dz) is assigned to the target object as it is.
For other values, (dx, dy, dz) is calculated on the already assigned (X, Y, Z) value.
%href
setcoli


%index
hgqview
OBAQ view settings on HGIM G3
%group
Extended screen control command
%prm
ofsx,ofsy,ofsz,zoom
ofsx (0.0): Display offset in the X direction (real number)
ofsy (0.0): Display offset in the Y direction (real number)
ofsz (0.0): Display offset in the Z direction (real number)
zoom (4.0): Zoom magnification (real number)
%inst
Make settings for displaying obaq objects on HGIMG3.
The zoom parameter specifies the zoom magnification when displaying HGIMG3.
You can specify the display offset for the X, Y, Z axes with (ofsx, ofsy, ofsz).
%href
qview



%index
hgqcnvaxis
Convert OBAQ coordinates to HGIM G3 coordinates
%group
Extended screen control command
%prm
x,y,z,srcx,srcy
(x, y, z): Variables to get
srcx (0.0): X coordinate on OBAQ (real number)
srcy (0.0): Y coordinate on OBAQ (real number)
%inst
Converts the X, Y coordinates on the OBAQ to the X, Y, Z coordinates on the HGIMG3.
This is to find the coordinates when displaying an OBAQ object as a 3D object.
If you specify the X, Y coordinates on OBAQ with (srcx, srcy), the X, Y, Z coordinates on HGIMG3 will be assigned to the variable specified by (x, y, z) in real type.
%href
qcnvaxis


%index
enumobj
Start searching for objects
%group
Extended screen control command
%prm
group
group: Collision group
%inst
Finds objects that belong to the specified collision group.
Search results can be obtained with the getenum command.
If there are multiple search results, the following results are returned each time the getenum instruction is called.
If all searches are complete, the getenum instruction returns -1 as the object's ID.
%href
getenum


%index
getenum
Get object search results
%group
Extended screen control command
%prm
var
var: variable name to which the result is assigned
%inst
Gets the ID of the object searched by the enumobj instruction.
Each time you execute the getenum instruction, the following search results are obtained. When the acquisition is completed, -1 is substituted.

%href
enumobj



