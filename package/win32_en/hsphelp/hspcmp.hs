;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;

%type
Extension instructions
%ver
3.6
%note
Include hspcmp.as.

%date
2020/01/07
%author
onitama
%dll
hspcmp
%url
http://hsp.tv/
%port
Win


%index
hsc_ini
Initialization of HSPCMP.DLL
%group
Extended I / O control instructions
%prm
"filename"
"filename": The name of the file to compile


%inst
Initializes HSPCMP.DLL.
If you want to use the features of HSPCMP.DLL, you need to initialize it first.
The file specified by "filename" is to be compiled.
Specify the file name including the extension (it does not have to be as).




%index
hsc_refname
Specifying the error display file name
%group
Extended I / O control instructions
%prm
"filename"
"filename": Filename displayed in the error message


%inst
Specifies the source script file name displayed in the error message.
This means that even if you temporarily save the name "test.as" with a different name such as "hsptmp" and compile it, the error message will indicate that there is an error in the "test.as" file. It is for displaying.
If the source script file name does not need to be changed from the file specified in hsc_ini, it does not need to be specified.




%index
hsc_objname
Specifying the output object file name
%group
Extended I / O control instructions
%prm
"filename"
"filename": Output object file name


%inst
Specify the output object file name.




%index
hsc_compath
Specifying a common directory
%group
Extended I / O control instructions
%prm
"pathname"
"pathname": common directory path

%inst
Specify the common directory searched by #include.
"pathname" must always be a string ending in "\\".
If hsc_compath is not specified, the "common" directory under the EXE using hspcmp.dll is referenced.




%index
hsc_comp
Object file creation
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1 = 0 to (0): Compile configuration options
p2 = 0 to (0): Preprocessor configuration options
p3 = 0 to (0): Whether to display the debug window

%inst
The HSP code compiler compiles the source file to create an object file.
You can specify whether to output debug information to an object file with a parameter of p1.
If p1 is 0 or omitted, the debug information required for displaying error lines is not added to the object file.
If p1 is 1 (bit0), debug information is added.
If p1 is 2 (bit1), only preprocess processing is performed.
When p1 is 4 (bit2), the character string data is converted to UTF-8 code and output.
If p1 is 8 (bit3), the character string data file (strmap) used is output.
If p2 is 0, compile with the "__hsp30__" macro defined.
If p2 is 1, no macro is defined. This is the script editor
It is for passing the "Use HSP extension macro" flag to the compiler.
When the value of p2 is +4 (bit2), the packfile is created based on the instructions (#pack, #epack, #packopt) for automatic creation of the executable file included in the source.
If p3 is non-zero, embed a flag in the object file to show the debug window.
In order to execute the hsc_comp instruction, it is necessary to initialize and specify the file with the hsc_ini instruction.
Also, if necessary, specify the object file name output by hsc_objname. (By default, the output file name will be the file name specified by hdc_ini with the extension ".ax")
If necessary, execute the hsc_refname instruction in advance. As a compilation procedure,
^p
1. "hsc_ini"
2. "hsc_refname" (optional)
3. "hsc_objname" (optional)
4. "hsc_comp"
^p
It looks like.






%index
hsc_getmes
Specify error message output destination
%group
Extended I / O control instructions
%prm
p1
p1: String variable that receives the error message

%inst
Assigns a message output by HSPCMP.DLL such as an error to the character string type variable specified in p1.




%index
hsc_clrmes
Clear error message
%group
Extended I / O control instructions
%inst
Clears all message data output by the compiler.




%index
hsc_ver
Get the compiler version
%group
Extended I / O control instructions
%inst
Returns the version information of the HSP code compiler as a character string in the system variable refstr.




%index
hsc_bye
Compiler termination
%group
Extended I / O control instructions
%inst
Performs the termination processing of the HSP code compiler.
This instruction is executed automatically and is not normally used.




%index
pack_ini
Initialization of PACKFILE manager
%group
Extended I / O control instructions
%prm
"filename"
"filename": Operation target file name
%inst
Initializes the PACKFILE manager.
When performing a PACKFILE operation (instruction starting with "pack_"), it is necessary to initialize it first.
The target of the operation is the file specified by "filename".
Specify a file name without an extension.




%index
pack_view
Display the contents list of PACKFILE
%group
Extended I / O control instructions
%inst
The content list is displayed with the file specified by pack_ini as a DPM file. Get the result of pack_view with the hsc_getmes instruction.




%index
pack_make
Create DPM file
%group
Extended I / O control instructions
%prm
p1,p2
p1: Creation mode (0 = for standard EXE file / 1 = for external DPM file)
p2: Encryption key (0 = use standard key / others = encryption key)
%inst
Creates a DPM file with the file name specified in pack_ini.
In p1, you need to specify whether it is a standard EXE file or a DPM file for external reading.
Also, when creating a DPM file, you can set the encryption key with p2.
If you specify 0 for p2, a standard encrypted DPM file (2.61 compatible) is created.
If you specify a value other than 0 for p2, encryption using that value as the key is performed.
In this case, please note that if the key with the same value is not specified by the chdpm instruction on the script side when reading DPM, it will not be decrypted as a correct file.
The file to be included in the DPM file is the file specified by the text in "PACKFILE" in the current directory.



%index
pack_exe
Create an executable file
%group
Extended I / O control instructions
%prm
p1
p1: Creation mode (0 = standard / 1 = full screen mode / 2 = screen saver)

%inst
Creates an EXE file with the file name specified in pack_ini.
You can specify three modes (standard, full screen, screen saver) with p1.
The file to be included in the EXE file is the file specified by the text in "PACKFILE" in the current directory.
Also, the HSP runtime files (hsprt) must be in the proper directory.




%index
pack_opt
Specify executable file creation option
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1 = 0 to (640): Screen X size
p2 = 0 ~ (480): Screen Y size
p3 = 0 to (0): Operation switch at startup

%inst
Specifies options for creating an EXE file with the pack_exe instruction.
It must be specified before executing the pack_exe instruction.
You can set a special startup operation by specifying the following values for the operation switch at startup specified by p3.
^p
1 = Hide initial window
2 = No directory move
^p
The operation switch can select the function at the same time by adding.
Specify 0 if no special operation is required.




%index
pack_rt
Specify HSP runtime file
%group
Extended I / O control instructions
%prm
"filename"
"filename": Full path name with HSP runtime file (hsprt)

%inst
Specify the full path name of the HSP runtime file (hsprt) that is referenced when creating an EXE file with the pack_exe instruction.
If the HSP runtime file is not in the current directory, please specify it.
(Example: pack_rt "c: \\ hsp \\ hsprt")




%index
pack_get
Extract files from packfile
%group
Extended I / O control instructions
%prm
"filename"
"filename": Filename to retrieve

%inst
Extracts the stored file with the file name specified in pack_ini as the DPM file.
The file specified by "filename" is fetched and saved in the current directory.




%index
hsc3_getsym
Get the symbol name
%group
Extended I / O control instructions
%inst
Outputs the symbol name used by HSP to the message buffer of the compiler.
The output will be in the format "symbol name, sys [| var / func / macro] [| 1/2]".




%index
hsc3_messize
Get the size of the compiler message
%group
Extended I / O control instructions
%prm
val
val: Numeric variable that receives the size

%inst
Assigns the size of the entire message obtained by hsc_getmes to the variable specified by val.




%index
hsc3_make
Automatic creation of executable file
%group
Extended I / O control instructions
%prm
"path",sw
"path": full path with HSP runtime library
sw (0): iconins used flag (0 = unused / 1 = used)

%inst
Automatically creates an executable file.
It is necessary to initialize the PACKFILE manager by pack_ini in advance.
For "path", specify the full path where the HSP runtime library is located.
Create an executable file according to the packfile options.
When 1 is specified for sw, resource rewriting such as icons is executed by the iconins tool.
See the #packopt instruction for options to pass to the iconins tool.
Use hsc_comp to create a packfile with options.
%ref
pack_ini
#packopt


%index
hsc3_getruntime
Get runtime file
%group
Extended I / O control instructions
%prm
val, "objfile"
val: Variable to get the runtime name
"objfile": object file name

%inst
Required by the object file specified by "objfile"
Gets the runtime file name in the variable specified by val.
The variable of val must be initialized as a string type.
If the runtime file name is empty (""), it indicates that you are using the default runtime (hsp3.exe).



%index
hsc3_run
Runtime execution
%group
Extended I / O control instructions
%prm
"string"
"string": execution command line

%inst
Treats the contents of "string" as a command line for runtime execution.
For "string", "Runtime name", "Object file name", and "Startup option" must be specified in a space-separated form.



