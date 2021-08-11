;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;

%type
Built-in instructions
%ver
3.6
%note
ver3.6 standard instruction
%date
2015/02/25
%author
onitama
%url
http://hsp.tv/
%port
Win



%index
newcom
Creating a new COM object type variable
%group
COM object manipulation instructions
%prm
p1,p2,p3,p4
p1: Variable name
p2: Interface name or class ID
p3 (0): Creation mode (optional)
p4: Referrer pointer (optional)

%inst
Initializes the variable specified in p1 as a COM object type.
If the variable in p1 is not a COM object type, it will be initialized as a COM object type.
^
If it is already a COM object type, the previous object will be destroyed.
You can specify the class ID or program ID (ProgID) with p2.
^p
example:
	newcom ie, "InternetExplorer.Application"	; ProgID
^p
In the above example, the program ID is used for initialization.
This initializes the variable ie as a COM object type variable.
In addition, it is possible to initialize by specifying the interface name already defined by the #usecom instruction.
^p
example:
	#define IID_IDirectMusicPerformance8 "{679c4137-c62e-4147-b2b4-9d569acb254c}"
	#define IID_IDirectMusicLoader8      "{19e7c08c-0a44-4e6a-a116-595a7cd5de8c}"
#usecom IDirectMusicLoader8 IID_IDirectMusicLoader8 CLSID_DirectMusicLoader8
	newcom loader, IDirectMusicLoader8
^p
You can specify the creation mode with p3. If p3 is omitted, mode 0 is set.
^p
Mode content
------------------------------------------------------------------
  0 Call COM of the specified class as a server
 -1 Create a COM object type variable with the pointer specified by p4
^p
If p3 is -1, the value specified in p4 is used without creating a new COM object.
Create a COM object type variable to be a pointer.
^
COM object type variables are used as a mechanism for calling the COM mechanism of Windows from HSP. See the programming manual (hspprog.htm) for more information.


%href
#usecom
#comfunc
delcom
axobj
querycom
comres
mcall



%index
delcom
Discard COM object type variables
%group
COM object manipulation instructions
%prm
p1
p1: Variable name

%inst
Deletes an instance of a variable of COM object type specified in p1.
p1 must be a variable whose COM object type has already been set by the newcom instruction.
^p
example:
	delcom v
^p
The delcom instruction decrements the reference count of the initialized COM object and invalidates the instance set in the variable.
Normally, the created COM object instance is automatically destroyed inside HSP, so there is no need to explicitly destroy it with the delcom instruction.
^
A variable of COM object type that has been destroyed once cannot be used until it is initialized again by the newcom instruction.

%href
querycom
newcom



%index
comres
Set method return assignment variable
%group
Memory management instructions
%prm
p1
p1: Variable name

%inst
Sets the variable specified in p1 as the method return assignment variable.
The method return assignment variable is the target to which the result is assigned when a COM automation (IDispatch) method call is made using a COM object type variable.
In order to get the result of a method call made by the mcall instruction, the variable must be set by the results instruction.

%href
mcall
querycom
newcom
delcom




%index
querycom
Creating COM object type variables
%group
COM object manipulation instructions
%prm
p1,p2,p3
p1: Variable name
p2: Referenced variable name
p3: Interface name

%inst
Queries another interface for the interface of the COM object type variable specified in p2, and initializes the variable specified in p1 as the COM object type.
If the variable in p1 is not a COM object type, it will be initialized as a COM object type.
If it is already a COM object type, the previous object will be destroyed.
Specifies the interface name already defined in p3.
The interface name must be defined by the #usecom instruction.

%href
#usecom
newcom
delcom
mcall



%index
comevent
Start acquiring COM events
%group
COM object manipulation instructions
%prm
p1,p2,p3,*label
p1: Variable name
p2: Variable name of the event acquisition source
p3: Connection point GUID
* label: Label of the event subroutine

%inst
Initializes the variable specified by p1 as a COM object type for event processing.
Get any event from the variable (COM object type) specified by p2 and prepare.
The COM object specified by p2 must already be initialized by the newcom instruction.
Specify the connection point GUID in string format with p3.
If p3 is omitted, the default connection point obtained by IProvideClassInfo2 is searched.
Specify the label of the event processing subroutine with * label.
If the preparation for event acquisition fails, an error will occur.
If successful, a subroutine jump interrupt will be generated at the location specified by * label each time an event occurs.
In the event subroutine specified by * label, the comevdisp function and comevarg instruction
It is possible to get the details of the event.

If the come event instruction is executed again for a variable for which event acquisition has already started, the previous event queue setting becomes invalid.
Event retrieval continues until the delcom instruction destroys the COM object.


%href
newcom
delcom
comevarg
comevdisp




%index
comevarg
Get parameters for COM events
%group
COM object manipulation instructions
%prm
p1,p2,p3,p4
p1: Variable name to which the result is assigned
p2: Referenced COM object type variable name
p3 (0): Parameter index
p4 (0): Acquisition mode (0 = normal conversion, 1 = conversion to character string 2 = Variant conversion)

%inst
Gets the event parameters (arguments) in the event subroutine of the variable (COM object type) specified by p2.
The variable specified by p2 must be initialized by the come event instruction.
You must always get it in the event subroutine.

You can specify the index of the parameter with p3. The index is a number starting from 0, and the valid index range differs depending on the event.
You can specify the parameter acquisition method with p4.
If 0 or omitted, the default conversion method (the system automatically converts strings, numbers, etc.) is used.
If 1 is specified for p4, it will be acquired after being converted to a character string by the COM system.
If you specify 2 for p4, the value is retrieved as a Variant type.

%href
comevent
comevdisp



%index
sarrayconv
Perform batch conversion with Variant type
%group
COM object manipulation instructions
%prm
p1,p2,p3,p4
p1: Variable to store the result
p2: Conversion source variable
p3 (0): Conversion mode
p4 (0): Binary data size

%inst
Performs batch conversion with Variant type.
The mode of p3 allows you to specify the mode of conversion.
The mode values that can be specified are as follows.
^p
p3 Contents
---------------------------------------------
Create a SafeArray from the entire 0-column variable p2 and set it to the Variant variable p1.
      Store
1 SafeArray stored in Variant type variable p2 is changed to array variable p1
      Store The area of p1 is reclaimed.
2 SafeArray from binary data of only 4 bytes from variable p2
      Create (VT_UI1 type) and store it in p1.
3 One-dimensional SafeArray (VT_UI1 type) stored in Variant type variable p2
      Or VT_I1 type) binary data is stored in the variable p1.
      The area for variable p1 must be reserved in advance.
^p

%href
comevarg

