%dll
hsp3imp

%ver
3.3

%date
2009/08/01

%author
onitama

%url
http://hsp.tv/

%note
Include hsp3imp.as.

%type
Extension instructions

%group
Extended I / O control instructions

%port
Win
%index
hspini 
Initialization of HSP3IMP.DLL

%prm
mode,xsize,ysize,handle
mode: Initialization mode ($ 100 = Initialize as child window)
       bit0 = window hidden (ON / OFF)
       bit1 = Current directory change prohibited (ON / OFF)

xsize: HSP initialization window size (X)
ysize: HSP initialization window size (Y)
handle: Parent window handle (HWND)

%inst
Initialize HSP3IMP.DLL.
Initializes HSP3 and reads the object file.
Before executing hspini, it is necessary to make various settings using the hspprm instruction.

%index
hspbye
Destroy the initialized instance of HSP3

%prm

%inst
Destroy the instance of HSP3 initialized by the hspini instruction.
It must be executed at the end to finish HSP3.

%index
hspexec
Performing HSP3 tasks

%prm

%inst
Executes the HSP3 task initialized by the hspini instruction.
The hspexec instruction does not return until the executed code finishes or an error occurs. (In the meantime, HSP3 tasks will run.)
Please note that HSP3IMP.DLL is intended to operate as a single task.

%index
hspprm
Get settings and information about HSP3IMP.DLL

%prm
p1,p2,p3,p4
p1: Setting or acquisition mode
p2, p3, p4: Parameters according to p1

%inst
Make settings and get information about HSP3IMP.DLL.
The contents specified from p2 to p4 change depending on the value of p1.
Refer to the following for the parameters to be set.

p1(mode)
-----------------------------------------------------------
    0 Specify display offset from parent window
             (Set the X and Y offset values with p2 and p3)
    1 Specify startup parameter (used only for HSPTV)
0x100 Get pointer to HSPCTX structure
             (The result will be written to the address specified in p4)
0x101 Function specification to initialize extended instruction
             (Register a function that takes an HSP3TYPEINFO pointer as an argument on p4)
0x102 Specify HSP3 object file name
             (Set the address where the file name is stored in p4)
