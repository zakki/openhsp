;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;

%type
Extension instructions
%ver
3.4
%note
Include hspcv.as.

%date
2009/08/01
%author
onitama
%dll
hspcv
%url
http://hsp.tv/
%port
Win


%index
cvreset
HSPCV initialization
%group
Extended screen control command
%inst
Discards all "CV buffers" of HSPCV and restores the initial state.
Initialization is performed automatically at the start and end of HSPCV.
Use the cvreset instruction when you want to explicitly initialize.



%index
cvsel
Target CV buffer settings
%group
Extended screen control command
%prm
p1
p1: CV buffer ID
%inst
Set the standard operation destination CV buffer ID.
If omitted when specifying the CV buffer ID in the parameter, the standard operation destination CV buffer ID is used.



%index
cvbuffer
Initialize CV buffer
%group
Extended screen control command
%prm
p1,p2,p3
p1 (0): CV buffer ID
p2 (640): Horizontal pixel size
p3 (480): Vertical pixel size
%inst
Initializes the CV buffer with the specified size.
By initializing the buffer, various image processing becomes possible.
The CV buffer is initialized in full color mode (8 bits each for RGB).
%href
cvload



%index
cvresize
Image resizing
%group
Extended screen control command
%prm
p1,p2,p3,p4
p1 (0): Horizontal pixel size
p2 (0): Vertical pixel size
p3: CV buffer ID
p4 (1): Interpolation algorithm
%inst
Resizes the CV buffer to the size specified in (p1, p2).
Specify the target CV buffer ID in p3.
If omitted, the ID set by the cvsel instruction is used.
Specify the interpolation algorithm with p4.
You can select one of the following contents to be specified in p4.
^p
CV_INTER_NN --Nearest Neighbor
CV_INTER_LINEAR --Bilinear (default)
CV_INTER_AREA --Resampling around pixels
(Moire can be reduced)
CV_INTER_CUBIC --bicubic
^p



%index
cvgetimg
Image acquisition
%group
Extended screen control command
%prm
p1,p2
p1 (0): CV buffer ID
p2 (0): Acquisition mode
%inst
Transfer the contents of the CV buffer to the HSP window buffer.
The window buffer of the HSP that is the transfer destination is the current operation destination window ID specified by the gsel instruction.
Specify the CV buffer ID that is the transfer source with p1.
If omitted, ID0 is used.
With p2, you can specify the transfer method.
If p2 is 0, the transfer will be performed with the HSP window buffer size unchanged.
If 1 is specified for p2, the HSP window buffer size will be changed to the same size as the CV buffer before forwarding.
%href
cvputimg



%index
cvputimg
Write to CV buffer
%group
Extended screen control command
%prm
p1
p1: CV buffer ID
%inst
Transfers the contents of the HSP window buffer to the CV buffer.
The window buffer of the HSP that is the transfer source is the current operation destination window ID specified by the gsel instruction.
Specify the CV buffer ID to be the transfer destination with p1.
If omitted, the ID set by the cvsel instruction is used.
%href
cvgetimg


%index
cvload
Image file reading
%group
Extended screen control command
%prm
"filename",p1
"filename": image file name
p1: CV buffer ID
%inst
Initializes the CV buffer with the contents of the specified image file.
Specify the target CV buffer ID with p1.
If omitted, the ID set by the cvsel instruction is used.

The format of the image file is determined by the file extension.
The formats and extensions that can be used are as follows.
^p
	Windows bitmaps - BMP, DIB
	JPEG files - JPEG, JPG, JPE
	Portable Network Graphics - PNG
	Portable image format - PBM, PGM, PPM
	Sun rasters - SR, RAS
	TIFF files - TIFF, TIF
	OpenEXR HDR images - EXR
	JPEG 2000 images - JP2
^p
If the process ends normally, the system variable stat will be 0.
If any error occurs, the system variable stat will be a non-zero value.
Please note that the executable file and the file embedded in the DPM file cannot be read by #pack, #epack, etc.
%href
cvsave



%index
cvsave
Image file writing
%group
Extended screen control command
%prm
"filename",p1,p2
"filename": image file name
p1: CV buffer ID
p2: Option value
%inst
Saves the contents of the CV buffer with the specified image file name.
Specify the target CV buffer ID with p1.
If omitted, the ID set by the cvsel instruction is used.

The format of the image file is determined by the file extension.
The formats and extensions that can be used are as follows.
^p
	Windows bitmaps - BMP, DIB
	JPEG files - JPEG, JPG, JPE
	Portable Network Graphics - PNG
	Portable image format - PBM, PGM, PPM
	Sun rasters - SR, RAS
	TIFF files - TIFF, TIF
	OpenEXR HDR images - EXR
	JPEG 2000 images - JP2
^p
The option value specified in p2 is for specifying the setting for each format.
Currently, only the quality (0 to 100) when saving in JPEG format can be specified.
If p2 is omitted, quality 95 will be used when saving in JPEG format.
If the process ends normally, the system variable stat will be 0.
If any error occurs, the system variable stat will be a non-zero value.
%href
cvload



%index
cvgetinfo
Get CV buffer information
%group
Extended screen control command
%prm
p1,p2,p3
p1: Variable for which CV buffer information is acquired
p2: CV buffer ID
p3: CV buffer information ID
%inst
Get information about the CV buffer and assign it to a variable on p1.
Specify the target CV buffer ID in p2.
If omitted, the ID set by the cvsel instruction is used.

You can specify the type of information to be acquired with p3.
The macros that can be specified for p3 are as follows.
^p
Macro content
	-------------------------------------------
CVOBJ_INFO_SIZEX Horizontal size
CVOBJ_INFO_SIZEY Vertical size
CVOBJ_INFO_CHANNEL Number of channels
CVOBJ_INFO_BIT Number of bits per channel
^p
%href
cvbuffer
cvload



%index
cvsmooth
Image smoothing
%group
Extended screen control command
%prm
p1,p2,p3,p4,p5
p1: Smoothing type
p2 : param1
p3 : param2
p4 : param3
p5: CV buffer ID
%inst
Apply smoothing to the CV buffer.
Specify the target CV buffer ID in p5.
If omitted, the ID set by the cvsel instruction is used.

The macros that can be specified with p1 are as follows.

CV_BLUR_NO_SCALE
(Add pixel values in the area of param1 x param2)

CV_BLUR
(After adding the pixel values in the area of param1 x param2,
 Scale with 1 / (param1 * param2))

CV_GAUSSIAN
(param1 x param2 Gaussian filter)

CV_MEDIAN
(param1 x param2 median filter)

CV_BILATERAL
(3 × 3 bilateral filter (param1 = color dispersion, param2 = spatial dispersion))
^p
http://www.dai.ed.ac.uk/CVonline/LOCAL_COPIES/MANDUCHI1/Bilateral_Filtering.html
^p
The parameter "param1 x param2" must specify an odd number of 1 or more.



%index
cvthreshold
Get image with threshold
%group
Extended screen control command
%prm
p1,p2,p3,p4
p1: Binarization type
p2: Threshold (real number)
p3: Pixel value after binarization (real number)
p4: CV buffer ID
%inst
The CV buffer is binarized based on the threshold value.
Specify the target CV buffer ID in p4.
If omitted, the ID set by the cvsel instruction is used.
The macros that can be specified with p1 are as follows.
^p
CV_THRESH_BINARY     : val = (val > thresh ? MAX:0)
CV_THRESH_BINARY_INV : val = (val > thresh ? 0:MAX)
CV_THRESH_TRUNC      : val = (val > thresh ? thresh:val)
CV_THRESH_TOZERO     : val = (val > thresh ? val:0)
CV_THRESH_TOZERO_INV : val = (val > thresh ? 0:val)
^p




%index
cvrotate
Image rotation
%group
Extended screen control command
%prm
p1,p2,p3,p4,p5,p6
p1 (0): Angle (real number)
p2 (1): Scale (real number)
p3 (0): X offset of center coordinates (real number)
p4 (0): Y offset of center coordinates (real number)
p5: Interpolation algorithm
p6: CV buffer ID
%inst
Rotate the entire CV buffer.
Set the angle (360 degrees around) with p1 and the scale with p2.
You can specify the center offset with (p3, p4).
In p5, specify the interpolation algorithm during rotation.
You can select one of the following to specify on p5.
^p
CV_INTER_NN --Nearest Neighbor
CV_INTER_LINEAR --Bilinear (default)
CV_INTER_AREA --Resampling around pixels
(Moire can be reduced)
CV_INTER_CUBIC --bicubic
^p
There is also an option that can be specified for p5 at the same time.
^p
CV_WARP_FILL_OUTLIERS-Fills Outlier Pixels
CV_WARP_INVERSE_MAP --Rotate in inverse matrix
^p
By default, CV_INTER_LINEAR + CV_WARP_FILL_OUTLIERS is specified.
Specify the target CV buffer ID in p6.
If omitted, the ID set by the cvsel instruction is used.



%index
cvarea
Specifying the copy source area
%group
Extended screen control command
%prm
p1,p2,p3,p4
p1 (0): Copy source X coordinate
p2 (0): Copy source Y coordinate
p3 (0): Copy area X size
p4 (0): Copy area Y size
%inst
Specify the copy source area when copying an image with the cvcopy instruction.
If all the parameters are 0, or if you omit all the parameters and execute the cvarea instruction, the entire CV buffer is targeted.
%href
cvcopy



%index
cvcopy
Copy of image
%group
Extended screen control command
%prm
p1,p2,p3,p4,p5
p1 (0): Copy source CV buffer ID
p2 (0): Copy destination X coordinate
p3 (0): Copy destination Y coordinate
p4: Copy destination CV buffer ID
p5 (0): Arithmetic options
%inst
Copy the contents of the CV buffer to another CV buffer.
The CV buffer ID specified in p1 is used as the copy source.
If you want to copy a part of the buffer, you need to set the position and size in advance with the cvarea instruction.
The operation option of p5 allows you to perform some operations when copying. The macros that can be specified for p5 are as follows.
^p
CVCOPY_SET
CVCOPY_ADD (addition)
CVCOPY_SUB (subtraction)
CVCOPY_MUL (multiplication)
CVCOPY_DIF (difference)
CVCOPY_AND (logical product)
^p
Specify the copy destination CV buffer ID in p4.
If omitted, the ID set by the cvsel instruction is used.

The color mode of the CV buffer must match the copy source and copy destination.
It is not possible to copy a mixture of grayscale (black and white) screens and full-color screens.
%href
cvarea



%index
cvxors
XOR operation of image
%group
Extended screen control command
%prm
p1,p2,p3,p4
p1 (255): R-value used in XOR operation
p2 (255): G value used in XOR operation
p3 (255): B value used in XOR operation
p4: Copy destination CV buffer ID
%inst
XOR the contents of the CV buffer.
From p1 to p3, specify the calculated value (0 to 255) for the RGB value.
Specify the target CV buffer ID in p4.
If omitted, the ID set by the cvsel instruction is used.
%href
cvcopy



%index
cvflip
Image inversion
%group
Extended screen control command
%prm
p1,p2
p1 (0): Inversion mode
p2: Copy destination CV buffer ID
%inst
Inverts the contents of the CV buffer.
You can specify the inversion mode with p1.
If p1 is 0, it will be upside down.
If p1 is 1 or more, it will be flipped horizontally.
If p1 is a negative value, it will be flipped vertically and horizontally.

Specify the target CV buffer ID in p2.
If omitted, the ID set by the cvsel instruction is used.



%index
cvloadxml
Read XML file
%group
Extended screen control command
%prm
"filename"
"filename": XML file name to read
%inst
Reads the file specified by "filename" as an XML file.
The XML file needs to be read in advance when necessary for face recognition of images.

If the process ends normally, the system variable stat will be 0.
If any error occurs, the system variable stat will be a non-zero value.

Please note that the executable file and the file embedded in the DPM file cannot be read by #pack, #epack, etc.
%href
cvfacedetect



%index
cvfacedetect
Image face recognition
%group
Extended screen control command
%prm
p1,p2
p1: CV buffer ID
p2 (1): Scale value (real number)
%inst
Recognize a specific pattern from the image in the CV buffer.
It is necessary to read the xml file with the pattern parameters in advance with the cvloadxml command.

Specify the target CV buffer ID with p1.
If omitted, the ID set by the cvsel instruction is used.

You can set the scale during processing with p2.
If you specify a value greater than 1 here, the buffer size will be reduced during processing. Time with large images etc.
It is recommended to specify in such cases.

After execution, the system variable stat returns the number recognized.
If stat is 0, it means that it is not recognized at all.
If stat is 1 or more, the area recognized by the cvgetface instruction can be obtained.
%href
cvgetface
cvloadxml



%index
cvgetface
Get recognized coordinates
%group
Extended screen control command
%prm
p1,p2,p3,p4
p1: Variable to which the recognized X coordinate is assigned
p2: Variable to which the recognized Y coordinate is assigned
p3: Variable to which the recognized X size is assigned
p4: Variable to which the recognized Y size is assigned
%inst
Gets the area recognized by the cvfacedetect instruction.
Coordinate values are assigned as integers to the variables p1 to p4.
The area can be acquired repeatedly as many times as the number recognized by the cvfacedetect instruction.

If it can be acquired normally, the system variable stat will be 0 after execution.
If there is no data available, the system variable stat will be 1.
%href
cvfacedetect



%index
cvmatch
Image matching inspection
%group
Extended screen control command
%prm
p1,p2,p3,p4,p5
p1: Variable to which the recognized X coordinate is assigned
p2: Variable to which the recognized Y coordinate is assigned
p3: Matching type
p4: Matching source CV buffer ID
p5: Matching destination CV buffer ID
%inst
From the matching destination CV buffer, find the area closest to the matching source CV buffer and return the result.
After execution, the resulting coordinates are assigned to the variables specified in (p1, p2).
Specifies the type of evaluation method used for matching in p3.
The macros that can be specified in p3 are as follows.
^p
CV_TM_SQDIFF
	R(x,y)=sumx',y'[T(x',y')-I(x+x',y+y')]^2

CV_TM_SQDIFF_NORMED
R (x, y) = sumx', y'[T (x', y')-I (x + x', y + y')] ^ 2 / sqrt [sumx', y'T (x', y') ^ 2 ・ sumx', y'I (x + x', y + y') ^ 2]

CV_TM_CCORR
R (x, y) = sumx', y'[T (x', y')  I (x + x', y + y')]

CV_TM_CCORR_NORMED
R (x, y) = sumx', y'[T (x', y')  I (x + x', y + y')] / sqrt [sumx', y'T (x', y') ) ^ 2 ・ sumx', y'I (x + x', y + y') ^ 2]

CV_TM_CCOEFF
R (x, y) = sumx', y'[T'(x', y')  I'(x + x', y + y')],
where T'(x', y') = T (x', y') --1 / (w ・ h) ・ sumx ", y" T (x ", y")
I'(x + x', y + y') = I (x + x', y + y') ―― 1 / (w ・ h) ・ sumx ", y" I (x + x ", y + y ")

CV_TM_CCOEFF_NORMED
R (x, y) = sumx', y'[T'(x', y')  I'(x + x', y + y')] / sqrt [sumx', y'T'(x') , y') ^ 2 ・ sumx', y'I'(x + x', y + y') ^ 2]
^p
Specify the target CV buffer ID in p5.
If omitted, the ID set by the cvsel instruction is used.

The cvmatch instruction only searches the closest area and does not guarantee that they are exactly the same.



%index
cvconvert
Color mode conversion
%group
Extended screen control command
%prm
p1,p2
p1 (0): Conversion mode
p2: CV buffer ID
%inst
Converts the CV buffer to the color mode specified by p1.
If p1 is 0, the full color screen becomes a grayscale (black and white) screen.
If p1 is 1, convert each grayscale (black and white) screen to a full-color screen.
Specify the target CV buffer ID in p2.
If omitted, the ID set by the cvsel instruction is used.



%index
cvcapture
Start camera capture
%group
Extended screen control command
%prm
p1,p2
p1 (0): Camera ID
p2: CV buffer ID
%inst
Starts input from the capture device.
In p1, specify the camera ID to identify the camera.
The values that can be specified with p1 are as follows.
If multiple devices are connected, they can be identified by adding the values one by one.
^p
Macro value content
-------------------------------------------------
CV_CAP_ANY 0 All available devices
CV_CAP_MIL      100	Matrox Imaging Library
CV_CAP_VFW      200	Video for Windows
CV_CAP_IEEE1394 300 IEEE1394 (Not supported in the current version)
^p
Specify the CV buffer ID to save the image captured by p2.
If omitted, the ID set by the cvsel instruction is used.

After starting the camera capture, you can get the image for each frame with the cvgetcapture command.
In addition, it is necessary to end the capture with the cvendcapture instruction whenever it is no longer needed.
%href
cvgetcapture
cvendcapture



%index
cvgetcapture
Get captured image
%group
Extended screen control command
%inst
Gets the frame image of the capture initiated by the cvcapture instruction.
The acquired CV buffer will be the ID set by the cvcapture instruction.
%href
cvcapture



%index
cvendcapture
End of camera capture
%group
Extended screen control command
%inst
Terminates the capture initiated by the cvcapture instruction.
%href
cvcapture



%index
cvopenavi
Start avi file acquisition
%group
Extended screen control command
%prm
"filename",p1
"filename": avi video file name
p1: CV buffer ID
%inst
Start inputting from the avi video file.
You will be able to get the frames in the specified file.

Specify the CV buffer ID to save the image captured by p1.
If omitted, the ID set by the cvsel instruction is used.

After starting the avi file acquisition, you can acquire the image for each frame by the cvgetavi command.
Also, when it is no longer needed, it is necessary to end the avi file acquisition with the cvcloseavi instruction.

The cvopenavi command is a function for simply extracting the contents of the avi file, not for normal video playback. Think of it as an auxiliary function for taking out the frame and processing it.
Also, the avi files that can be handled by the cvopenavi instruction are limited to the old format avi format, and not all avi files can be opened.
%href
cvgetavi
cvcloseavi



%index
cvgetavi
avi file image acquisition
%group
Extended screen control command
%inst
Gets the frame image of the avi file started by the cvopenavi command.
The acquired CV buffer will be the ID set by the cvcapture instruction.
%href
cvopenavi



%index
cvcloseavi
End of avi file acquisition
%group
Extended screen control command
%prm
%inst
Terminates the avi file acquisition started by the cvopenavi instruction.
%href
cvopenavi



%index
cvmakeavi
Start avi file output
%group
Extended screen control command
%prm
"filename",p1,p2,p3
"filename": Output avi video file name
p1 (-1): 32bit Codec code
p2 (29.97): Real frame rate (fps)
p3: CV buffer ID
%inst
Starts output to avi video file.
Creates an avi file with the specified file name.

Specify the 32-bit code (FOURCC) of the codec with p1.
If you specify -1 for p1, a dialog for selecting a codec opens.
Specify the real frame rate (fps) with p2.
If p2 is omitted, it will be 29.97fps.

Specify the CV buffer ID that holds the output image in p3.
If omitted, the ID set by the cvsel instruction is used.

After starting the output, it is necessary to register the image for each frame by the cvputavi instruction and finally call the cvendavi instruction.
%href
cvputavi
cvendavi



%index
cvputavi
Output image to avi file
%group
Extended screen control command
%inst
Add a frame image to the avi file started by the cvmakeavi command.
The referenced CV buffer will be the ID set by the cvmakeavi instruction.
%href
cvmakeavi



%index
cvendavi
End of avi file output
%group
Extended screen control command
%inst
Terminates the avi file output started by the cvmakeavi instruction.
%href
cvmakeavi



%index
cvj2opt
JPEG-2000 save option setting
%group
Extended screen control command
%prm
"format","option"
"format": format string
"option": option string
%inst
Make detailed settings when the JPEG-2000 format (.jp2) is specified with the cvsave instruction.
The format string can be one of the following:
(Please note that the extension remains jp2 even if you specify a format other than JPEG.)
^p
Format string format
	----------------------------------------
		mif	    My Image Format
		pnm	    Portable Graymap/Pixmap
		bmp	    Microsoft Bitmap
		ras	    Sun Rasterfile
		jp2	    JPEG2000 JP2 File Format Syntax
		jpc	    JPEG2000 Code Stream Syntax
		jpg	    JPEG
		pgx	    JPEG2000 VM Format
^p
Additional settings can be made using the option character string.
^p
Example:
		cvj2opt "jp2","rate=0.1"
		cvsave "test2000.jp2"
^p
The setting method of the option character string differs depending on the format.
For more information, command line tools included in the jasper library
See jasper options.
^p
http://www.ece.uvic.ca/~mdadams/jasper/
^p
%href
cvsave



