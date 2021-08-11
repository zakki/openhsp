;============================================================
;	d3module help
;============================================================

%dll
d3module

%ver
1.68

%date
2018/06/01

%author
s.programs

%note
Include d3m.hsp.

%url
http://spn.php.xdomain.jp/
http://spn.php.xdomain.jp/hsp_d3m.htm

%type
User extension instructions

%index
d3dist
Find the absolute value of the distance (vector)

%prm
(x, y, z)
x, y, z: Find the distance x, y, z values (0.0)

%inst
A functional macro that returns the absolute value (sqrt (x * x + y * y + z * z)) of the input x, y, z distance (vector). The type of value returned is a real number (double).

You can find the distance in plane coordinates by omitting the z coordinate.

%group
Math support instructions

%index
d3rotate
Plane coordinate rotation calculation

%prm
x1, y1,  x0, y0,  va
x1, y1: Variable that returns the output value [double]
x0, y0: Original vector value to rotate
va: Rotation angle [rad]

%inst
Find the vector obtained by rotating the vector (or position) x0, y0 on the plane by va [radian] around the origin. The calculation result is assigned to the variable specified by x1 and y1.

Enter the angle in radians (angle unit with 2π ≒ 6.2831853 as one rotation).

%href
d3vrotate

%group
Math support instructions

%index
d3vrotate
Spatial rotation operation around an arbitrary axis

%prm
x1,y1,z1, x0,y0,z0, vx,vy,vz, va
x1, y1, z1: Variable that returns the output value [double]
x0, y0, z0: Original vector value to rotate
vx, vy, vz: Vector of axis of rotation
va: Rotation angle [rad]

%inst
Find a vector that is va [radian] rotated around the vector (or position) x0, y0, z0 and the vector vx, vy, vz that passes through the origin. The direction of rotation is counterclockwise when viewed from the positive direction of the rotation axis vector. It can be applied when finding a matrix for rotating an object in local coordinates. The calculation result is assigned to the variable specified by x1, y1, z1.

Enter the angle in radians (angle unit with 2π ≒ 6.2831853 as one rotation). The rotation axis vectors vx, vy, vz do not have to be unit vectors, but an error occurs if they have a magnitude of 0.

%href
d3rotate

%group
Math support instructions

%index
d3wincx
X center coordinates (int) when drawing on the screen

%inst
A variable that represents the center position (in integer pixels) when drawing on a 2D screen. This variable is set to the center of the current window (ginfo_winx / 2) each time the d3setcam instruction is executed. If you want to change the center position, change the contents of this variable after running d3setcam.

Normally, you do not need to change or reference the value of this variable. Also, do not change this variable to a type other than an integer. Changing to a non-integer type, such as a real number, will cause an error.

%href
d3wincy
d3setcam

%group
3D control instructions

%index
d3wincy
Y center coordinates (int) when drawing on the screen

%inst
A variable that represents the center position (in integer pixels) when drawing on a 2D screen. This variable is set to the center of the current window (ginfo_winy / 2) each time the d3setcam instruction is executed. If you want to change the center position, change the contents of this variable after running d3setcam.

Normally, you do not need to change or reference the value of this variable. Also, do not change this variable to a type other than an integer. Changing to a non-integer type, such as a real number, will cause an error.

%href
d3wincx
d3setcam

%group
3D control instructions

%index
d3setcam
Camera position setting

%prm
x1, y1, z1,  x2, y2, z2, va
x1, y1, z1: Camera position
x2, y2, z2: target position
va: Viewing angle scale (> 0.0) (1.0)

%inst
Set the camera coordinates x1, y1, z1 and orientation (target position x2, y2, z2). You must use this instruction to define the camera position before executing the d3module drawing instruction.

In d3module, the + z direction is the zenith direction of the camera. As an image, the x and y planes are the ground plane, and the z direction is up and down. Note that if the x and y positions of the camera position and the target position are equal, the camera cannot be set correctly.

The parameter va allows you to set the viewing angle scale. The default value is 1.0. Increasing this value will make the objects drawn on the screen smaller in inverse proportion to the value, allowing a wider range of objects to be drawn.

%href
d3setlocal

%group
3D control instructions

%index
d3setlocal
Local coordinate system settings

%prm
px,py,pz, m00,m01,m02, m10,m11,m12, m20,m21,m22
px, py, pz: Move position from origin
m00, m01, m02
m10, m11, m12: 3x3 coordinate transformation matrix
m20, m21, m22

%inst
Sets the local coordinate system. The local coordinate system applies to all d3module instructions except d3setcam.

This instruction allows you to configure various coordinate transformation settings that were not possible with d3setcam alone. The local coordinate system can be changed as many times as you like after initializing the camera position with d3setcam, making it easy to draw screens with multiple flying objects flying around. Also, setting the local coordinate system does not slow down the coordinate conversion process of d3module.

To return the coordinate system reference to the original global coordinate system, use d3setlocal 0,0,0, 1,0,0, 0,1,0, 0,0,1. (If you omit the parameter, this value is automatically entered.) After setting the camera position with the d3setcam instruction, the local coordinate system is reset as the same space as the global coordinate system.

・ Application example 1: Model position / attitude control
Objects that rotate or move (flying object models, etc.) can be drawn in any position and orientation without having to perform rotation / movement calculations on their own. px, py, pz represent the position of the object, and m00 to m22 represent the posture of the object. The meaning of the coordinate transformation matrix is as follows.

px, py, pz: Move position from origin
m00, m01, m02: Unit vector in the + x direction of local coordinates (x, y, z)
m10, m11, m12: Unit vector in the + y direction of local coordinates (x, y, z)
m20, m21, m22: Unit vector in the + z direction of local coordinates (x, y, z)

The vectors m00, m01, m02 and m10, m11, m12 and m20, m21, m22 are unit vectors that are orthogonal to each other.

If you want to rotate the posture matrix, it is convenient to use the d3vrotate instruction.
(Example) Rotate a vector in the x and y directions by an angle ang on the z vector axis (yow rotation)
	d3vrotate pm00,pm01,pm02,  pm00,pm01,pm02,  pm20,pm21,pm22,  ang
	d3vrotate pm10,pm11,pm12,  pm10,pm11,pm12,  pm20,pm21,pm22,  ang

・ Application example 2: Scale change of local coordinates
Objects in the local coordinate system can be made larger or smaller than when drawn in the global coordinate system.

Double the size of the object for x, y, and z
	d3setlocal 0,0,0, 2,0,0, 0,2,0, 0,0,2

; Set the size of the object to 0.5 times for x, y, z
	d3setlocal 0,0,0, 0.5,0,0, 0,0.5,0, 0,0,0.5

・ Application example 3: Coordinate system change
The default coordinate system of d3module is a right-handed system with the + z direction as the zenith, but this can be changed virtually. For example, if you want to change the coordinate system to one with the + y direction of the left-handed system as the zenith, set the local coordinate system as shown below.

Changed the coordinate system to the left-handed system
	d3setlocal 0,0,0, 1,0,0, 0,0,1, 0,1,0

・ Application example 4: Other coordinate transformation
In addition, you can freely perform linear spatial coordinate transformation using a 3x3 matrix, such as flattening or distorting objects.

px, py, pz: Move position from origin
m00, m01, m02: (x, y, z) component before conversion of x after conversion
m10, m11, m12: (x, y, z) component before conversion of y after conversion
m20, m21, m22: (x, y, z) component before conversion of z after conversion

; Set all z positions of the vertices of the drawing object to 0
	d3setlocal 0,0,0, 1,0,0, 0,1,0, 0,0,0

%href
d3setcam

%group
3D control instructions

%index
d3vpos
Current position setting inside d3module

%prm
x, y, z
x, y, z: Position to set

%inst
d3module Sets the virtual current position inside. The position set by this instruction becomes the start point of the d3lineto instruction and the drawing reference position of the d3particlem instruction.

Instructions such as d3pos and d3pset work by calling this instruction internally. You do not need to use this instruction to use the module normally.

%group
3D control instructions

%index
d3getpos
Returns the coordinate conversion result

%prm
vx, vy,  x, y, z
vx, vy: Variable that returns screen coordinates (x, y) [int]
x, y, z: 3D coordinates

%inst
Returns the screen coordinates that correspond to the 3D coordinates you entered.

If the system variable stat is 0, it means that the coordinates could not be converted because the position is behind the camera.

%group
3D control instructions

%index
d3pos
Set current position

%prm
x, y, z
x, y, z: Coordinates to set

%inst
Moves the current position to a point on the screen that corresponds to the 3D coordinates.

If the system variable stat is 0, it means that the coordinates could not be converted because the position is behind the camera. In that case, the current position does not change.

%group
3D control instructions

%index
d3initlineto
Initialization before using d3lineto, d3ribbonto

%inst
Initialize before using d3lineto and d3ribbonto.

Immediately after this instruction, the d3lineto and d3ribbonto instructions set only the origin of the line without drawing.

%href
d3lineto
d3ribbonto

%group
3D control instructions

%index
d3pset
Draw a point

%prm
x, y, z
x, y, z: 3D coordinates

%inst
Pset to the point on the screen that corresponds to the 3D coordinates you entered.

If the system variable stat is 0, it means that the coordinates could not be converted because the position is behind the camera.

%group
Basic drawing command

%index
d3lineto
Draw a line from the previous drawing position

%prm
x, y, z
x, y, z: Coordinates of drawing destination

%inst
Draws a line segment from the previous drawing position.

For drawing multiple continuous lines, it is faster to use this d3lineto instruction than the d3line instruction because the coordinate transformation calculation can be omitted by one point. Unlike the d3line instruction, it does not perform clipping processing, but it is suitable for drawing many short line segments.

D3initlineto must be executed before this instruction can be executed continuously. However, after executing instructions such as d3particle, d3circle, d3pset, d3pos, and d3getpos, you can draw a straight line starting from that position.

If the system variable stat is 0, it means that the coordinates could not be converted because the position is behind the camera.

%href
d3initlineto

%group
Basic drawing command

%index
d3line
Line drawing

%prm
x1, y1, z1,  x2, y2, z2
x1, y1, z1: 3D coordinate point 1
x2, y2, z2: 3D coordinate point 2

%inst
Draws a line connecting the two points in the entered 3D coordinates.

Because of the clipping process, you can also draw a line segment with one end behind the camera. (However, in that case, the operation will be slow.)

If the system variable stat is 0, it means that the coordinates could not be converted because the position is behind the camera.

%group
Basic drawing command

%index
d3arrow
Draw an arrow

%prm
x1, y1, z1,  x2, y2, z2
x1, y1, z1: 3D coordinate point 1 (arrowhead part)
x2, y2, z2: 3D coordinate point 2

%inst
Draws an arrow connecting the two points in the entered 3D coordinates. x1, y1, z1 are the arrowheads.

If the system variable stat is 0, it means that the coordinates could not be converted because the position is behind the camera.

%group
Basic drawing command

%index
d3box
Draw a box

%prm
x1, y1, z1,  x2, y2, z2
x1, y1, z1: 3D coordinate point 1
x2, y2, z2: 3D coordinate point 2

%inst
Draw a wire box that corresponds to the 3D coordinates.

The box drawn by this command has all sides parallel to the axes.

%group
Basic drawing command

%index
d3circle
Draw a circle

%prm
x, y, z, r, f
x, y, z: Center coordinates
r: radius (> 0.0)
f: Fill flag (0)

%inst
Draw a circle. This is a circle that always faces the camera, so it looks like a sphere. If the fill flag is 1, the inside of the circle will be filled.

If the system variable stat is 0, it means that the coordinates could not be converted because the position is behind the camera.

%group
Basic drawing command

%index
d3mes
Display string

%prm
str, x, y, z
str: Character string to display
x, y, z: Coordinates to display

%inst
Displays a string at the specified 3D coordinates with the current font settings.

If the system variable stat is 0, it means that the coordinates could not be converted because the position is behind the camera.

%group
Basic drawing command

%index
d3particlem
Particle drawing at the previous drawing position

%prm
pid, r
pid: Particle ID
r: Particle radius (> 0.0)

%inst
Draw particles at the same position as the one drawn by the previous d3module instruction. It operates faster than d3particle because the coordinate conversion calculation can be omitted.

Before executing this instruction, create particles with the d3mkparticle or d3ldparticle instruction.

%href
d3particle
d3particlemr
d3mkparticle
d3ldparticle

%group
Extended drawing command

%index
d3particlemr
Particle drawing at the previous drawing position (with rotation specified)

%prm
pid, r, a
pid: Particle ID
r: Particle radius (> 0.0)
a: Particle rotation angle (radians)

%inst
Draw particles at the same position as the one drawn by the previous d3module instruction. It operates faster than d3particler because the coordinate conversion calculation can be omitted. In addition to the functions of the d3particlem instruction, the d3particlemr instruction has the function of rotating and drawing particles in two dimensions. (It is slower than d3particlem due to the increased processing)

Before executing this instruction, create particles with the d3mkparticle or d3ldparticle instruction.

%href
d3particle
d3particler
d3particlem
d3mkparticle
d3ldparticle

%group
Extended drawing command

%index
d3particle
Particle drawing

%prm
pid, x, y, z, r
pid: Particle ID
x, y, z: 3D position to draw particles
r: Particle radius (> 0.0)

%inst
Draws particles at the specified drawing position according to the current gmode settings.

Before executing this instruction, create particles with the d3mkparticle or d3ldparticle instruction.

%href
d3mkparticle
d3ldparticle
d3particler
d3particlem
d3particlemr

%group
Extended drawing command

%index
d3particler
Particle drawing (with rotation specified)

%prm
pid, x, y, z, r, a
pid: Particle ID
x, y, z: 3D position to draw particles
r: Particle radius (> 0.0)
a: Particle rotation angle (radians)

%inst
Draws particles at the specified drawing position according to the current gmode settings. In addition to the functions of the d3particle instruction, the d3particler instruction has the function of rotating and drawing particles in two dimensions. (It is slower than d3particle due to the increased processing)

Before executing this instruction, create particles with the d3mkparticle or d3ldparticle instruction.

%href
d3mkparticle
d3ldparticle
d3particle
d3particlemr

%group
Extended drawing command

%index
d3mkparticle
Particle creation

%prm
pid, r, g, b, arry
pid: Particle ID (0 ~)
r, g, b: Color of particles to create (RGB)
arry: Particle shape (default = circular)

%inst
Create particles by specifying the color and shape. Executing this command will allow particles with the specified ID to be drawn. (Register the particle ID, not drawing.)

This instruction takes a little time to execute, so be sure to execute it all at once during the initialization process. With the particle drawing feature, screen IDs 27 and 29 are used internally by the d3module.

The first parameter, pid, specifies the ID of the particles to create. There is no particular upper limit on the particle ID, but please note that the memory of the maximum ID * 90KB used is consumed to retain the particle image inside the d3module.

The 2nd to 4th parameters r, g, b specify the color of the particles. If the RGB value is greater than 255, it will be processed by the saturation calculation. (The image will look like overexposure.)

You can create particles of various shapes by specifying an integer array variable that stores a sequence of particle shapes in the fifth parameter arry. If omitted, circular particles will be created.

The arry array is stored in the order of [Repeat Count], [Sequence Length], [Radius Sequence 0], [Radius Sequence 1] .... The Radius Sequence (0, 1, ...) plots the radius from the center of the vertex when the particle is considered a polygon. The value is an integer percentage of the particle's radius. Sequence Length specifies the length of the Radius Sequence stored in the array. Number of iterations specifies the number of iterations of the radius sequence.

For example, if you want to create a star-shaped particle with 10 jagged edges around it, the array would be arr = 10, 2, 100, 80. For equilateral triangle particles, arr = 3, 1, 100.

%sample
#include "d3m.hsp"

Particle creation

Default particle
	d3mkparticle  0,  255, 255, 255

Default particles (color saturated sample)
	d3mkparticle  1,  333, 555, 777

Jagged particles
	arr = 10, 2, 100, 80
	d3mkparticle  2,  999, 255, 255,  arr

Propeller?
	arr = 6, 6,  100, 90, 80, 70, 60, 50
	d3mkparticle  3,  255, 999, 255,  arr

Display
	color : boxf
	color , 255
	gmode 5, , , 255

	d3setcam 0, -100, 0

	repeat 4
		x = cnt * 20 - 30
		y = 0
		z = 0

		d3mes "pid " + cnt, x, y, z + 20
		d3particle cnt, x, y, z, 10
	loop

%href
d3ldparticle
d3particle

%group
Extended drawing command

%index
d3ldparticle
Particle image load

%prm
pid, sid, x, y, w, h
pid: Particle ID (0 ~)
sid: Window ID of the screen on which the particles are loaded
x, y: Upper left coordinate of the load source
w, h: size to load

%inst
Creates particles with the specified on-screen image. Executing this command will allow particles with the specified ID to be drawn. (Register the particle ID, not drawing.)

This instruction takes a little time to execute, so be sure to execute it all at once during the initialization process. With the particle drawing feature, screen IDs 27 and 29 are used internally by the d3module.

%href
d3mkparticle
d3particle

%group
Extended drawing command

%index
d3texture
Paste the image on the quadrilateral surface and draw

%prm
ax, ay, az, sid, x1, y1, w1, h1, div
ax, ay, az: Array variable containing x, y, z of quadrilateral vertices
sid: ID of the screen with the image to paste
x1, y1: Upper left position of the paste source [pixels]
w1, h1: Width and height of the image to be pasted [pixels]
div: Number of internal divisions of the quadrangle (1)

%inst
The image is pasted and displayed in the current gmode on the square face.

ax, ay, az stores the coordinates of the four vertices in the order of top left, top right, bottom right, bottom left.

The drawing quality of image scaling and the behavior when a rectangle becomes twisted follow the implementation of HSP's gsquare instruction.

If a value of 2 or more is specified for the argument div, each side of the quadrangle is divided and coordinate conversion / drawing is performed. For example, if you set 2, the rectangle is divided into 4 rectangles and 9 vertices and drawn like a "rice field". This sacrifices execution speed, but allows for deep texture mapping. If the rectangle has a twisted shape, it will be possible to draw a clean curve depending on the number of div divisions. However, be aware that there is no internal z-sorting, which can cause problems with the back vertices appearing in the foreground.

If the vertex is in the area behind the camera, the rectangle with that point as the vertex will not be drawn.

%href
d3square

%group
Extended drawing command

%index
d3square
Fill and draw a quadrilateral surface

%prm
ax, ay, az
ax, ay, az: Array variable containing x, y, z of quadrilateral vertices

%inst
Fills the square face with the currently selected color and gmode.

ax, ay, az stores the coordinates of the four vertices in the order of top left, top right, bottom right, bottom left.

The behavior when a quadrangle becomes twisted follows the implementation of the HSP gsquare instruction.

Also, if any one of the vertices is in the area behind the camera, the entire shape will not be drawn.

%href
d3texture
d3ribbonto

%group
Extended drawing command

%index
d3ribbonto
Fill and draw a continuous quadrilateral surface like a ribbon

%prm
x1, y1, z1, x2, y2, z2
x1, y1, z1: Drawing destination position 1
x2, y2, z2: Drawing destination position 2

%inst
Fills the position specified by d3ribbonto last time and the quadrangle whose vertices are the four points (x1, y1, z1), (x2, y2, z2) specified this time with the currently selected color and gmode. By executing this command continuously, you can draw a continuous quadrilateral surface like a ribbon. D3initlineto must be executed before this instruction can be executed continuously.

When drawing multiple faces that are continuous in a ribbon shape, it is faster to use this d3ribbonto instruction than the d3square instruction because the coordinate transformation calculation can be omitted by two points. You can also simplify the script by using this instruction.

%href
d3initlineto
d3square

%group
Extended drawing command

%index
d3timer
ms timer

%prm
()

%inst
Returns the elapsed time since Windows started in milliseconds (milliseconds, 1/1000 seconds).

This function is the Win32API timeGetTime () itself.

%group
Timer command

%index
d3getfps
Current frame rate (fps)

%prm
()

%inst
Returns the current frame rate (in fps).

This function should only be called once per frame for it to work properly.

%group
Timer command

