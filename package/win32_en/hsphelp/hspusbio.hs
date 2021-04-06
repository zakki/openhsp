%dll
hspusbio

%ver
0.30

%date
2007/05/14

%author
K-K

%url
http://www.binzume.net/

%note
Include and use hspusbio.as or mod_usbio.as.

%type
User extension instructions

%index
uio_find
Search and initialize USB-IO
%group
USB device control instructions
%inst
Search and initialize USB-IO from the device.
If it fails, an error code will be returned in the system variable stat.
^p
  stat: Error details
 ----------------------------------------------------
   0: Normal
   1: No required driver (for example, if you have not connected USB-IO yet)
   2: USB-IO is not connected
^p

%href
uio_free


%index
uio_free
Release USB-IO
%group
USB device control instructions
%inst
Release USB-IO.
It is called automatically when HSP is closed, but there is no harm in calling it manually.

%href
uio_find


%index
uio_getdevs
Get the number of USB-IO connections
%group
USB device control instructions
%inst
Returns the number of connected USB-IOs in the system variable stat.

%href
uio_seldev


%index
uio_seldev
Choose from multiple USB-IOs
%group
USB device control instructions
%prm
p1
p1 (0): Number (value obtained from 0 to uio_getdevs)
%inst
Specify the number to use when multiple USB-IOs are connected.

%href
uio_getdevs


%index
uio_out
USB-IO data output
%group
USB device control instructions
%prm
p1,p2,p3
p1 (0): Output I / O port address (0 to 1)
p2 (0): Output content (8 bits)
p3 (0): Mode
%inst
Outputs arbitrary data to USB-IO.
If it fails, 1 is returned in the system variable stat.
If 1 is specified for p3, a pulse is sent to p1 of port 1 to rewrite port 0.

%href
uio_inp


%index
uio_inp
USB-IO data reading
%group
USB device control instructions
%prm
p1,p2,p3
p1: Variable to read data
p2 (0): I / O port address (0 to 1)
p3 (0): Mode
%inst
Input data from USB-IO.
If it fails, a non-zero value is returned in the system variable stat.
If 1 is specified for p3, a pulse is sent to p1 of port 1 and read from port 0.

%href
uio_out


