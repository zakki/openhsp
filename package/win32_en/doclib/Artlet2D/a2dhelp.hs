;--------------------------------------------------
; Artlet2D for HSP3 help
;--------------------------------------------------

%dll
Artlet2D

%ver
1.01 R3.1

%date
2018/06/16

%author
s.programs

%url
http://spn.php.xdomain.jp/

%note
Please include a2d.hsp.

%type
User extension instructions

%port
Win

%portinfo
Windows XP or later environment is required.

%index
alClipModeRect
Specify the area to clip

%prm
px, py, pw, ph
px, py: Upper left coordinate of clipping area (rectangle) (0, 0)
pw, ph: Width / height of the clipping rectangle (0, 0)

%inst
Specifies the rectangular area to clip.

Artlet2D drawing commands will only draw within the area specified here.

Clipping mode applies to various drawing instructions such as alDraw ~, alFill ~, alCopy ~.

%href
alResetClipMode

%group
clipping

%index
alResetClipMode
Release the clipping area

%inst
Returns the clipping mode to the default.

Clipping mode applies to various drawing instructions such as alDraw ~, alFill ~, alCopy ~.

%href
alClipModeRect

%group
clipping

%index
alColor
Set drawing color

%prm
R, G, B, A
R, G, B: Drawing color RGB [0-255] (0)
A: Drawing alpha value [0-255] (255)

%inst
Sets the color to draw with Artlet2D.

R, G, and B are the same 8-bit RGB values specified by the color instruction.

For A, specify the alpha value (transparency) at the time of drawing. A = 0 is completely transparent and 255 is completely opaque. If you omit the A value, 255 is given.

(By executing this instruction, the drawing color of the HSP screen selected by the gsel instruction will also be changed accordingly.)

%href
alHsvColor
alSysColor

%sample
#include "a2d.hsp"

alCreateImage 0, 640, 480; Create virtual image
	if stat = -1 {
dialog "Failed to initialize GDI +."
		end
	}

alColor 255, 0, 0, 128; Set drawing color to "semi-transparent red"
	alFillEllip  0,  0, 100, 100
alColor 0, 255, 0, 128; Set drawing color to "semi-transparent green"
	alFillEllip 30, 50, 100, 100
alColor 0, 0, 255, 128; Set drawing color to "semi-transparent blue"
	alFillEllip 60,  0, 100, 100

alCopyImageToScreen 0, 0; Image transfer from virtual image to HSP screen
redraw; HSP screen redraw

%group
Brush settings

%index
alGradientColor
Set gradient brush

%prm
x1, y1, x2, y2, ARGB1, ARGB2, mode
x1, y1: Point 1
x2, y2: point 2
ARGB1: Color 1
ARGB2: Color 2
mode: Wrap mode (0)

%inst
Set the gradient brush.

The gradation pattern that is set is that the color changes from ARGB1 to ARGB2 from point (x1, y1) to point (x2, y2).

The constants WrapModeTile (= 0) and WrapModeTileFlipX (= 1) can be used for mode.

ARGB values are a combination of R, G, B, and A values into a single integer value, and each digit in hexadecimal notation means 0xAARRGGBB. You can easily write values using the macros ARGB (A, R, G, B) or RGBA (R, G, B, A) built into the module.

%sample
#include "a2d.hsp"

alCreateImage 0, 640, 480; Create virtual image
	if stat = -1 {
dialog "Failed to initialize GDI +."
		end
	}

Gradient brush settings
	alGradientColor 100, 100, 400, 200, RGBA(255,0,0), RGBA(0,0,255)
	alFillEllip 100, 100, 200, 100

alCopyImageToScreen 0, 0; Image transfer from virtual image to HSP screen
redraw; HSP screen redraw

%href
alColor

%group
Brush settings

%index
alHsvColor
Set drawing color in HSV

%prm
H, S, V, A
H, S, V: Drawing color HSV (0)
A: Drawing alpha value [0-255] (255)

%inst
Set the colors drawn by Artlet2D in HSV (Hue, Saturation, Brightness).

H, S, V are specified in the same format as the hsvcolor instruction.

For A, specify the alpha value (transparency) at the time of drawing. A = 0 is completely transparent and 255 is completely opaque. If you omit the A value, 255 is given.

(By executing this instruction, the drawing color of the HSP screen selected by the gsel instruction will also be changed accordingly.)

%href
alColor
alSysColor

%group
Brush settings

%index
alSysColor
Set the drawing color from the system color

%prm
p1, A
p1: System color No. (0)
A: Drawing alpha value [0-255] (255)

%inst
Set the color to be drawn by Artlet2D from the system color.

For p1, specify the system color number. Use the same number as the syscolor instruction.

For A, specify the alpha value (transparency) at the time of drawing. A = 0 is completely transparent and 255 is completely opaque. If you omit the A value, 255 is given.

(By executing this instruction, the drawing color of the HSP screen selected by the gsel instruction will also be changed accordingly.)

%href
alColor
alHsvColor

%group
Brush settings

%index
alCopyImageToImage
Image copy (Image-> Image)

%prm
sID, dID, dx, dy, w, h, sx, sy
sID: Copy source Image ID
dID: Copy destination Image ID
dx, dy: Copy destination rectangle Upper left coordinates (0)
w, h: Copy rectangle Width / Height (9999)
sx, sy: Copy source rectangle Upper left coordinates (0)

%inst
Copies an image from the source Image ID to the destination Image ID.

If the argument indicating the coordinates is omitted, the coordinates 0, 0 and the entire image (maximum 9999, 9999) are copied for both the copy destination and the copy source.

For information on image transfer between Image ID and HSP screen, see alCopyImageToScreen, alCopyScreenToImage.

%href
alCopyImageToScreen
alCopyScreenToImage

%group
Copy / zoom

%index
alCopyImageToScreen
Image copy (Image-> HSP screen)

%prm
sID, dID, dx, dy, w, h, sx, sy
sID: Copy source Image ID
dID: Copy destination HSP screen ID
dx, dy: Copy destination rectangle Upper left coordinates (0)
w, h: Copy rectangle Width / Height (9999)
sx, sy: Copy source rectangle Upper left coordinates (0)

%inst
Copy the image from the source Image ID to the destination HSP screen ID.

If the argument indicating the coordinates is omitted, the coordinates 0, 0 and the entire image (maximum 9999, 9999) are copied for both the copy destination and the copy source.

%href
alCopyImageToImage
alCopyScreenToImage

%group
Copy / zoom

%index
alCopyScreenToImage
Image copy (HSP screen-> Image)

%prm
sID, dID, dx, dy, w, h, sx, sy
sID: Copy source HSP screen ID
dID: Copy destination Image ID
dx, dy: Copy destination rectangle Upper left coordinates (0)
w, h: Copy rectangle Width / Height (9999)
sx, sy: Copy source rectangle Upper left coordinates (0)

%inst
Copy the image from the source HSP screen ID to the destination Image ID.

If the argument indicating the coordinates is omitted, the coordinates 0, 0 and the entire image (maximum 9999, 9999) are copied for both the copy destination and the copy source.

%href
alCopyImageToImage
alCopyImageToScreen

%group
Copy / zoom

%index
alCopyModeAlpha
Set semi-transparent copy mode

%prm
p1
p1: Alpha value [0.0-1.0] double

%inst
Set to copy semi-transparently when copying an image.

Transparency is set with parameter p1. If p1 is 0.0, it is completely transparent, and if it is 1.0, it is completely opaque.

The set copy mode is applied to the following instructions.

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

When the desired processing is completed, you can return to the default copy mode with the alResetCopyMode instruction.

Copy mode is applied regardless of the HSP Screen ID or virtual image ID of the drawing destination.

%sample
;Fill in the sample script

%href
alResetCopyMode

%group
Copy mode

%index
alResetCopyMode
Reset copy mode

%inst
Returns the image copy mode to the default state.

Copy mode applies to the following instructions.

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

Copy mode is applied regardless of the HSP Screen ID or virtual image ID of the drawing destination.

%href
alCopyModeColorMatrix
alCopyModeAlpha
alCopyModeGamma
alCopyModeColorKey

%group
Copy mode

%index
alCopyModeColorKey
Set color key copy mode

%prm
color1, color2
color1: Key range lower limit RGB value
color2: Key range upper limit RGB value

%inst
Set the range of colors to be treated as transparent colors when copying images.

The color argument is a combination of R, G, and B values into a single integer value, and each digit in hexadecimal notation means 0xRRGGBB. (Unlike the COLORREF type.) The module's built-in macro RGBA (R, G, B) makes it easy to write values.

For example, the code below sets the mode to copy only purple (255, 0, 255) as a transparent color.

alCopyModeColorKey 0xff00ff, 0xff00ff

The set copy mode is applied to the following instructions.

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

When the desired processing is completed, you can return to the default copy mode with the alResetCopyMode instruction.

Copy mode is applied regardless of the HSP Screen ID or virtual image ID of the drawing destination.

%sample
;Fill in the sample script

%href
alResetCopyMode

%group
Copy mode

%index
alCopyModeColorMatrix
Set color matrix copy mode

%prm
arr
arr: Array representing the color matrix

%inst
Set to perform color matrix conversion when copying an image.

The argument arr is a double-type one-dimensional array that represents the color matrix.

arr = m00,m01,m02,m03,m04, m10,m11,m12,m13,m14, m20,m21,m22,m23,m24, m30,m31,m32,m33,m34

Specify the value that becomes. Each array element (matrix element) indicates that the source color (R G B A) is converted as follows and then output to the copy destination color (R'G'B'A').

R' = m00 * R + m01 * G + m02 * B + m03 * A + m04
G' = m10 * R + m11 * G + m12 * B + m13 * A + m14
B' = m20 * R + m21 * G + m22 * B + m23 * A + m24
A' = m30 * R + m31 * G + m32 * B + m33 * A + m34

Each element is described with a value that sets the maximum brightness to 1.0.

The argument array can be made easier to read by writing the following using the macros MAT_R, MAT_G, MAT_B, MAT_A (= 0, 5, 10, 15) built into the module.

	cmatrix(MAT_R) = m00, m01, m02, m03, m04
	cmatrix(MAT_G) = m10, m11, m12, m13, m14
	cmatrix(MAT_B) = m20, m21, m22, m23, m24
	cmatrix(MAT_A) = m30, m31, m32, m33, m34
	alCopyModeColorMatrix cmatrix

With the Muller Matrix, you can get various effects such as adjusting image brightness, negative / positive inversion, translucency, grayscale conversion, sepia color conversion, RGB exchange, and grayscale imaging of alpha channels.

(Example of matrix creation)

No conversion (basic)
	cmatrix(MAT_R) = 1.0, 0.0, 0.0, 0.0, 0.0
	cmatrix(MAT_G) = 0.0, 1.0, 0.0, 0.0, 0.0
	cmatrix(MAT_B) = 0.0, 0.0, 1.0, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.0

Brighten the whole
	cmatrix(MAT_R) = 1.0, 0.0, 0.0, 0.0, 0.2
	cmatrix(MAT_G) = 0.0, 1.0, 0.0, 0.0, 0.2
	cmatrix(MAT_B) = 0.0, 0.0, 1.0, 0.0, 0.2
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.2

Darken the whole
	cmatrix(MAT_R) = 1.0, 0.0, 0.0, 0.0, -0.2
	cmatrix(MAT_G) = 0.0, 1.0, 0.0, 0.0, -0.2
	cmatrix(MAT_B) = 0.0, 0.0, 1.0, 0.0, -0.2
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, -0.2

Copy translucently
	cmatrix(MAT_R) = 1.0, 0.0, 0.0, 0.0, 0.0
	cmatrix(MAT_G) = 0.0, 1.0, 0.0, 0.0, 0.0
	cmatrix(MAT_B) = 0.0, 0.0, 1.0, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 0.5, 0.0

Convert to grayscale
	cmatrix(MAT_R) = 0.299, 0.587, 0.114, 0.0, 0.0
	cmatrix(MAT_G) = 0.299, 0.587, 0.114, 0.0, 0.0
	cmatrix(MAT_B) = 0.299, 0.587, 0.114, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.0

Convert to sepia
	cmatrix(MAT_R) = 0.393, 0.769, 0.189, 0.0, 0.0
	cmatrix(MAT_G) = 0.349, 0.686, 0.168, 0.0, 0.0
	cmatrix(MAT_B) = 0.272, 0.534, 0.131, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.0

Negative / positive reversal
	cmatrix(MAT_R) = -1.0, 0.0, 0.0, 0.0, 0.0
	cmatrix(MAT_G) = 0.0, -1.0, 0.0, 0.0, 0.0
	cmatrix(MAT_B) = 0.0, 0.0, -1.0, 0.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 1.0, 0.0

Convert alpha channel to grayscale
	cmatrix(MAT_R) = 0.0, 0.0, 0.0, 1.0, 0.0
	cmatrix(MAT_G) = 0.0, 0.0, 0.0, 1.0, 0.0
	cmatrix(MAT_B) = 0.0, 0.0, 0.0, 1.0, 0.0
	cmatrix(MAT_A) = 0.0, 0.0, 0.0, 0.0, 1.0

The color matrix copy mode applies to the following instructions.

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

When the desired processing is completed, you can return to the default copy mode with the alResetCopyMode instruction.

Copy mode is applied regardless of the HSP Screen ID or virtual image ID of the drawing destination.

%sample
;Fill in the sample script

%href
alResetCopyMode

%group
Copy mode

%index
alCopyModeGamma
Set gamma adjustment copy mode

%prm
p1
p1: Gamma value double

%inst
Adjust the gamma value when copying an image and set it to copy.

The set copy mode is applied to the following instructions.

alCopyImageToImage
alCopyImageToScreen
alCopyScreenToImage
alStretchImageToImage
alStretchImageToScreen
alStretchScreenToImage

When the desired processing is completed, you can return to the default copy mode with the alResetCopyMode instruction.

Copy mode is applied regardless of the HSP Screen ID or virtual image ID of the drawing destination.

%sample
;Fill in the sample script

%href
alResetCopyMode

%group
Copy mode

%index
alCreateImage
Create a virtual image

%prm
ID, pw, ph
ID	: Image ID [0-511] (0)
pw: width [1-] (640)
ph: Height [1-] (480)

%inst
Create a virtual image (virtual screen, Image) of the Artlet2D module.

For ID, specify the Image ID of the virtual image to be created. If you specify an Image ID that already exists, the existing virtual image is destroyed and a new virtual image is created.

For pw and ph, specify the size of the virtual image to be created in pixels.

The virtual image created by this instruction is a bitmap with an alpha channel in ARGB 32bpp format. You can use Artlet2D's drawing instructions to draw an image in this buffer or save the image to disk. Artlet2D also keeps brush, pen, and font status for each virtual image.

If you have created multiple virtual images, you can use the alSelectImage instruction to switch the operation destination. Use alDeleteImage to delete the virtual image. Both instructions use the Image ID specified in the alCreateImage instruction as an argument. After executing the alCreateImage command, the created virtual image will be selected.

Since the virtual image is not drawn directly on the screen, you need to transfer the contents to the HSP screen by using the alCopyImageToScreen command etc. to display the contents of the virtual image.

If you want to create a virtual image directly from an image file, use the alCreateImageByFile instruction.

Virtual images cannot be created in an environment where GDI + is not installed on the computer (in an environment without gdiplus.dll), and the system variable stat returns -1. In this case, Artlet2D cannot be used. If the alCreateImage instruction successfully creates a virtual image, stat returns 0.

%href
alSelectImage
alDeleteImage
alCreateImageByFile

%sample
#include "a2d.hsp"

alCreateImage 0, 640, 480; Create virtual image
	if stat = -1 {
dialog "Failed to initialize GDI +."
		end
	}

alFillEllip 0, 0, 200, 100; Draw an ellipse in a virtual image

alCopyImageToScreen 0, 0; Image transfer from virtual image to HSP screen
redraw; HSP screen redraw

%group
Image management

%index
alCreateImageByFile
Create a virtual image from an image file

%prm
ID, "file"
ID	: Image ID
"file": Read file name

%inst
Load an image file and create a virtual image.

For ID, specify the Image ID of the virtual image to be created. If you specify an Image ID that already exists, the existing virtual image is destroyed and a new virtual image is created.

The virtual image initialized by this instruction is a bitmap with an alpha channel in ARGB 32bpp format regardless of the image file format.

If the image does not load correctly, or if GDI + is not installed on your computer, the value of the system variable stat will be -1. If successful, stat will be 0.

%href
;Fill in related items

%group
File operations

%index
alDeleteImage
Delete virtual image

%prm
ID
ID	: Image ID [0-511] (0)

%inst
Deletes the specified virtual image.

After executing this command, the virtual image will not be selected, so if you want to draw on another virtual image, select another virtual image with the alSelectImage command.

Artlet2D automatically releases GDI + when all virtual images have been deleted.

%href
alCreateImage
alDeleteAll

%group
Image management

%index
alSelectImage
Select a virtual image

%prm
ID
ID	: Image ID [0-511] (0)

%inst
Select the virtual image you want to operate on.

For the argument ID, specify the image created by the alCreateImage command.

Artlet2D drawing commands, brushes, and font selection commands are performed on the virtual image selected by the alSelectImage command.

If an Image ID that does not exist is specified, the system variable stat returns -1. If the image is switched successfully, 0 is returned in stat.

%href
alCreateImage

%group
Image management

%index
alDeleteAll
Delete all virtual images

%inst
Delete all Artlet2D virtual images and free GDI +.

After executing this instruction, you can use Artlet2D again by creating an image with the alCreateImage instruction.

This instruction is automatically executed at the end of HSP script execution.

%href
alDeleteImage

%group
Image management

%index
alGetID
Get the currently selected Image ID

%prm
()

%inst
Gets the ID (Image ID) of the currently selected virtual image.

If no currently valid Image ID is selected, -1 is returned.

%href
alSelectImage

%group
Image management

%index
alDrawArc
Drawing an arc

%prm
x, y, w, h, ang0, ang1
x, y: Upper left coordinate of the rectangle circumscribing the reference ellipse
w, h: The size of the rectangle circumscribing the reference ellipse
ang0: Start angle (degrees)
ang1: End angle (degrees)

%inst
Draw an arc.

%href
alDrawPie
alFillPie

%group
Drawing

%index
alDrawPie
Fan drawing

%prm
x, y, w, h, ang0, ang1
x, y: Upper left coordinate of the rectangle circumscribing the reference ellipse
w, h: The size of the rectangle circumscribing the reference ellipse
ang0: Start angle (degrees)
ang1: End angle (degrees)

%inst
Draw a sector.

This sector is a shape that draws a frame with lines instead of filling.

%href
alDrawArc
alFillPie

%group
Drawing

%index
alFillPie
Fill fan-shaped drawing

%prm
x, y, w, h, ang0, ang1
x, y: Upper left coordinate of the rectangle circumscribing the reference ellipse
w, h: The size of the rectangle circumscribing the reference ellipse
ang0: Start angle (degrees)
ang1: End angle (degrees)

%inst
Draw a sector.

%href
alDrawArc
alDrawPie

%group
Drawing

%index
alDrawClosedCurve
Drawing a closed curve

%prm
arr, p1, p2
arr: int array containing coordinate data
p1: Number of coordinate data
p2: Curve strength (0.5)

%inst
Draws a curve based on the given array.

The data in the array arr is a sequence of x1, y1, x2, y2, ..., xN, yN. p1 specifies how many points the array contains. This instruction draws a curve through all the specified points. For p2, specify the strength of the curve. If this value is 0, the drawing result will be equal to the polygonal line.

For example, to draw a rice ball type figure,

arr = 0, 100,  50, 0,  100, 100
alDrawClosedCurve arr, 3

will do.

%group
Drawing

%index
alDrawCurve
Draw a curve

%prm
arr, p1, p2
arr: int array containing coordinate data
p1: Number of coordinate data
p2: Curve strength (0.5)

%inst
Draws a curve based on the given array.

The data in the array arr is a sequence of x1, y1, x2, y2, ..., xN, yN. p1 specifies how many points the array contains. This instruction draws a curve through all the specified points. For p2, specify the strength of the curve. If this value is 0, the drawing result will be equal to the polygonal line.

For example, to draw an arched shape

arr = 0, 100,  50, 0,  100, 100
alDrawCurve arr, 3

will do.

%group
Drawing

%index
alDrawEllip
Draw an ellipse

%prm
x, y, w, h
x, y: Upper left coordinates of the circumscribed rectangle
w, h: The size of the circumscribed rectangle

%inst
Draws an ellipse inscribed in the rectangle of the position and size specified by the argument.

%href
alFillEllip

%group
Drawing

%index
alFillEllip
Drawing a filled ellipse

%prm
x, y, w, h
x, y: Upper left coordinates of the circumscribed rectangle
w, h: The size of the circumscribed rectangle

%inst
Draws an ellipse inscribed in the rectangle of the position and size specified by the argument.

%href
alDrawEllip

%group
Drawing

%index
alDrawLine
Draw a line segment

%prm
x1, y1, x2, y2
x1, y1: Point 1
x2, y2: point 2

%inst
Draw a line segment extending from (x1, y1) to (x2, y2).

Artlet2D (GDI +) does not have the concept of "current position". Unlike the HSP standard line instruction, two points must be specified in full.

%group
Drawing

%index
alDrawLines
Drawing a polygonal line

%prm
arr, p1
arr: int array containing coordinate data
p1: Number of coordinate data

%inst
Draws a polyline based on the given array.

The data in the array arr is a sequence of x1, y1, x2, y2, ..., xN, yN. p1 specifies how many points the array contains.

For example, to draw a V-shaped shape

arr = 0, 0,  50, 100,  100, 0
alDrawLines arr, 3

will do.

If you want to draw a figure (polygon) with a closed line, see alDrawPoly, alFillPoly. Also, if you want to draw a polygonal line with a smooth curve, see alDrawCurve.

%group
Drawing

%index
alDrawPoly
Draw polygon

%prm
arr, p1
arr: int array containing coordinate data
p1: Number of coordinate data

%inst
Draws a polygon based on the given array.

The data in the array arr is a sequence of x1, y1, x2, y2, ..., xN, yN. p1 specifies how many points the array contains.

For example, to draw a triangle

arr = 0, 100,  50, 0,  100, 100
alDrawPoly arr, 3

will do.

%group
Drawing

%index
alDrawRect
Rectangle drawing

%prm
x, y, w, h
x, y: Upper left coordinates of the rectangle
w, h: Rectangle size

%inst
Draws a rectangle with the position and size specified by the argument.

This rectangle is a shape with a line drawn instead of a fill.

%href
alFillRect

%group
Drawing

%index
alFillRect
Drawing a filled rectangle

%prm
x, y, w, h
x, y: Upper left coordinates of the rectangle
w, h: Rectangle size

%inst
Draws a rectangle with the position and size specified by the argument.

%href
alDrawRect

%group
Drawing

%index
alDrawText
Drawing a string

%prm
"str", px, py, w, h, ax, ay
"str": String to draw
px, py: drawing position (0, 0)
w, h: Width and height of drawing area (9999, 9999)
ax, ay: Alignment mode (0, 0)

%inst
Draws a string on the virtual image.

Draws the string with the argument "str" in a rectangular area with a width of w and a height of h, with the upper left coordinates as px and py. If the string exceeds the width of the rectangular area, it will be automatically wrapped and drawn.

You can specify horizontal and vertical alignment with the arguments ax and ay.

ax: 0 = left justified, 1 = center justified, 2 = right justified
ay: 0 = top justified, 1 = center justified, 2 = bottom justified

For example, if you want to draw a string in the rectangular area of (0, 0)-(640, 480) with both top and bottom centered.

alDrawText "string", 0, 0, 640, 480, 1, 1

will do.

You must always select a font with the alFont instruction before executing the alDrawText instruction.

%sample
#include "a2d.hsp"

alCreateImage 0, 640, 480; Create virtual image
	if stat = -1 {
dialog "Failed to initialize GDI +."
		end
	}

alFont "Times New Roman", 40; Set font
alDrawText "Artlet2D test"; Draw text

Centered and drawn on the entire screen
	alDrawText "centering", 0, 0, 640, 480, 1, 1

alCopyImageToScreen 0, 0; Image transfer from virtual image to HSP screen
redraw; HSP screen redraw

%href
alFont

%group
Drawing

%index
alFont
Set font

%prm
"font", p1, p2
"font": font name ("Arial")
p1: Font size [1-] (16)
p2: Font style (0)

%inst
Specifies the font to draw with the alDrawText instruction.

The arguments are the same as the HSP standard font instruction. However, bitmap fonts cannot be used as the font type. You must always use TrueType fonts that have vector data.

(Execution of this instruction also changes the font setting of the HSP screen selected by the gsel instruction.)

%sample
;Fill in the sample script

%href
alDrawText

%group
Brush settings

%index
alErase
Erase the entire virtual image

%inst
Erases the entire bitmap of the virtual image to black / transparent (ARGB (0, 0, 0, 0)).

%group
Pixel manipulation

%index
alEraserBrush
Eraser brush settings

%inst
Set the brush to an eraser brush.

Pixels drawn with this brush selected will be erased as black / transparent (ARGB (0, 0, 0, 0)).

%sample
alEraserBrush
alFillRect 10, 10, 10, 10; Erase this rectangular area

%group
Brush settings

%index
alFillClosedCurve
Drawing a filled closed curve

%prm
arr, p1, p2
arr: int array containing coordinate data
p1: Number of coordinate data
p2: Curve strength (0.5)

%inst
Draws a curve based on the given array.

The array arr is a sequence of points x1, y1, x2, y2, ..., xN, yN. This instruction draws a curve through all the specified points.

p1 specifies how many points the array contains.

For p2, specify the strength of the curve. If this value is 0, the drawing result will be equal to the polygonal line.

For example, to draw a rice ball type figure,

arr = 0, 100,  50, 0,  100, 100
alFillClosedCurve arr, 3

will do.

%group
Drawing

%index
alFillPoly
Drawing a filled polygon

%prm
arr, p1
arr: int array containing coordinate data
p1: Number of coordinate data

%inst
Draws a polygon based on the given array.

The array arr is a sequence of points x1, y1, x2, y2, ..., xN, yN.

p1 specifies how many points the array contains.

For example, to draw a triangle

arr = 0, 100,  50, 0,  100, 100
alFillPoly arr, 3

will do.

%group
Drawing

%index
alGetFileWidth
Get the width and height of the image file

%prm
"file", vx, vy
"file": File name
vx, vy: Variable that receives the value

%inst
Gets the width and height of the image file in pixels.

Supports GDI + readable formats such as BMP, GIF, JPEG, PNG, and TIFF.

If the image fails to load correctly, the value of the system variable stat will be -1. If successful, stat will be 0.

%href
alLoadFile

%group
File operations

%index
alLoadFile
Load image file

%prm
"file", px, py
"file": File name
px, py: drawing position (0)

%inst
Loads the image file on top of the current virtual image.

Supports GDI + readable formats such as BMP, GIF, JPEG, PNG, and TIFF.

Specify the upper left coordinates of the drawing destination with the arguments px and py.

The alCreateImageByFile command is useful if you want to create a virtual image directly from an image file.

If the image fails to load correctly, the value of the system variable stat will be -1. If successful, stat will be 0.

%href
;Fill in related items

%group
File operations

%index
alGetHeight
Get the height of the virtual image

%prm
()

%inst
Gets the height of the currently selected virtual image.

If no currently valid Image ID is selected, -1 is returned.

%href
alGetWidth

%group
Image management

%index
alGetWidth
Get the width of the virtual image

%prm
()

%inst
Gets the X size (width) of the currently selected virtual image.

If no currently valid Image ID is selected, -1 is returned.

%href
alGetHeight

%group
Image management

%index
alGetPixel
Get pixel value

%prm
(px, py)
px, py: Pixel to get the value

%inst
Gets the 1 pixel value on the current virtual image. The value obtained is a number in ARGB format.

ARGB values are a combination of R, G, B, and A values into a single integer value, and each digit in hexadecimal notation means 0xAARRGGBB. The values of R, G, B, and A can be obtained with the macros ARGB_A (), ARGB_R (), ARGB_G (), and ARGB_B ().

example
;R-value of virtual image (0, 0)
r = RGBA_R( alGetPixel(0, 0) )

%href
alSetPixel

%group
Pixel manipulation

%index
alSetPixel
Set pixel value

%prm
px, py, ARGB
px, py: Pixel to get the value
ARGB: ARGB value to set

%inst
Sets the value to 1 pixel on the current virtual image.

ARGB values are a combination of R, G, B, and A values into a single integer value, and each digit in hexadecimal notation means 0xAARRGGBB. You can easily write values using the macros ARGB (A, R, G, B) or RGBA (R, G, B, A) built into the module.

%href
alGetPixel

%group
Pixel manipulation

%index
alPenStyle
Set pen style

%prm
p1
p1: Pen style No.

%inst
Sets the style of the pen.

The following constants are defined as pen styles.

DashStyleSolid (= 0) (default)
DashStyleDash		(= 1)
DashStyleDot		(= 2)
DashStyleDashDot	(= 3)
DashStyleDashDotDot	(= 4)

The pen style set here is applied to commands that draw lines, such as alDrawLine.

%sample
;Fill in the sample script

%href
alPenWidth

%group
Brush settings

%index
alPenWidth
Set the thickness of the pen

%prm
p1
p1: Pen thickness [1-] int

%inst
Sets the thickness of the pen in pixels.

The pen thickness set here is applied to commands that draw lines, such as alDrawLine and alDrawEllip.

%sample
;Fill in the sample script

%href
alPenStyle

%group
Brush settings

%index
alResetTransMode
Reset coordinate conversion mode

%inst
Returns the coordinate conversion mode to the default state (no conversion).

Coordinate transformation modes apply to various drawing instructions such as alDraw ~, alFill ~, alCopy ~.

The coordinate transformation mode is applied to the virtual image ID that was selected when the mode change instruction was executed.

%href
alTransModeMatrix
alTransModeOffsetRotateZoom
alTransModeRotateAt

%group
Coordinate conversion mode

%index
alTransModeMatrix
Set the coordinate transformation matrix

%prm
m11, m12, m21, m22, dx, dy
m11, m12, 
m21, m22: 2x2 coordinate transformation matrix (matrix)
dx, dy: offset

%inst
Set the matrix as the coordinate transformation mode.

Coordinate transformation modes apply to various drawing instructions such as alDraw ~, alFill ~, alCopy ~.

The coordinate transformation mode is applied to the virtual image ID that was selected when the mode change instruction was executed.

%href
alResetTransMode

%group
Coordinate conversion mode

%index
alTransModeOffsetRotateZoom
Set coordinate conversion parameters

%prm
dx, dy, pa, sx, sy
dx, dy: offset (0)
pa: Rotation angle (degrees) (0)
sx, sy: zoom (1.0)

%inst
Set the parameter as the coordinate conversion mode.

dx and dy specify the offset to translate the drawing position.
pa specifies the angle to rotate (around the original origin).
sx and sy specify the amount to stretch in the vertical and horizontal directions (based on the original coordinate system).

Coordinate transformation modes apply to various drawing instructions such as alDraw ~, alFill ~, alCopy ~.

The coordinate transformation mode is applied to the virtual image ID that was selected when the mode change instruction was executed.

%href
alResetTransMode

%group
Coordinate conversion mode

%index
alTransModeRotateAt
Set coordinate conversion parameters

%prm
pa, px, py
pa: Rotation angle (degrees)
px, py: Center coordinates of rotation (0)

%inst
Set the rotation around any point as the coordinate conversion mode.

pa specifies the angle to rotate.
px, py specify the center point of rotation.

Coordinate transformation modes apply to various drawing instructions such as alDraw ~, alFill ~, alCopy ~.

The coordinate transformation mode is applied to the virtual image ID that was selected when the mode change instruction was executed.

%href
alResetTransMode

%group
Coordinate conversion mode

%index
alSaveFile
Save image file

%prm
"file", "MIME", px, py, w, h
"file": Save file name
"MIME": MIME type ("image / png")
px, py: Save target rectangle Upper left (0, 0)
w, h: Rectangle to be saved Width / Height (currentWidth, currentHeight)

%inst
Save the current virtual image as a file.

The save format is specified by the MIME argument. The MIME type that can be specified is one of "image / bmp", "image / jpeg", "image / gif", "image / tiff", "image / png". If you omit the argument, the default value is "image / png". The pixel format will be 32bpp ARGB (if supported by that format).

You can save part of the virtual image with the arguments px, py, w, h. If you omit these arguments, the entire virtual image is targeted.

If the image could not be saved, the value of the system variable stat will be -1. If successful, stat will be 0.

%sample
;Fill in the sample script

%href
;Fill in related items

%group
File operations

%index
alStretchImageToImage
Image Stretch Copy (Image-> Image)

%prm
sID, dID, sx, sy, sw, sh, dx, dy, dw, dh
sID: Copy source Image ID
dID: Copy destination Image ID
sx, sy: Copy source rectangle Upper left coordinates
sw, sh: Copy source rectangle Width / height
dx, dy: Copy destination rectangle Upper left coordinates
dw, dh: Copy destination rectangle Width / height

%inst
Enlarges / reduces and copies an image from an arbitrary rectangular area of the copy source Image ID to an arbitrary rectangular area of the copy destination Image ID.

For information on image transfer between Image ID and HSP screen, see alStretchImageToScreen, alStretchScreenToImage.

%href
alStretchImageToScreen
alStretchScreenToImage

%group
Copy / zoom

%index
alStretchImageToScreen
Image Stretch Copy (Image-> HSP screen)

%prm
sID, dID, sx, sy, sw, sh, dx, dy, dw, dh
sID: Copy source Image ID
dID: Copy destination HSP screen ID
sx, sy: Copy source rectangle Upper left coordinates
sw, sh: Copy source rectangle Width / height
dx, dy: Copy destination rectangle Upper left coordinates
dw, dh: Copy destination rectangle Width / height

%inst
Copies an image from any rectangular area of the copy source Image ID to any rectangular area of the destination HSP screen ID by enlarging / reducing the image.

%href
alStretchImageToImage
alStretchScreenToImage

%group
Copy / zoom

%index
alStretchScreenToImage
Image Stretch Copy (HSP screen-> Image)

%prm
sID, dID, sx, sy, sw, sh, dx, dy, dw, dh
sID: Copy source HSP screen ID
dID: Copy destination Image ID
sx, sy: Copy source rectangle Upper left coordinates
sw, sh: Copy source rectangle Width / height
dx, dy: Copy destination rectangle Upper left coordinates
dw, dh: Copy destination rectangle Width / height

%inst
Copies an image by enlarging / reducing it from an arbitrary rectangular area of the copy source HSP screen ID to an arbitrary rectangular area of the copy destination Image ID.

%href
alStretchImageToImage
alStretchImageToScreen

%group
Copy / zoom

%index
alTextureImage
Set texture brush

%prm
ID, mode
ID: Texture Image ID [0-511] (0)
mode: Wrap mode (0)

%inst
Set the texture brush.

In ID, specify the ID of the virtual image that holds the image data of the texture.

For mode, you can specify the constants WrapModeTile (= 0), WrapModeTileFlipX (= 1), WrapModeTileFlipY (= 2), WrapModeTileFlipXY (= 3).

If you want to create a virtual image from a texture image file, it's simple to use the alCreateImageByFile command.

%sample
;Fill in the sample script

%href
;Fill in related items

%group
Brush settings

