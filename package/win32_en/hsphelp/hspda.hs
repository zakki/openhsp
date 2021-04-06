;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;

%type
Extension instructions
%ver
3.5
%note
Include hspda.as.
%date
2015/02/13
%author
onitama
%dll
hspda
%url
http://hsp.tv/
%port
Win



%index
csvstr
Convert one line of CSV to an array
%group
Extended I / O control instructions
%prm
p1,p2
p1: String type array variable name to which the result is assigned
p2: Character string extracted from one CSV line
%inst
Expands only one line of data extracted from CSV format data into a character string type array variable.
 CSV format is text data separated by ",".
For example, if you have four strings separated by "," such as "a, b, c, d", you can use the csvstr instruction to "a.0 =" a "" and "a.1 =". Each element can be assigned to an array variable separately, such as "b", "a.2 =" c "", and "a.3 =" d "".
The array variable specified by p1 must always be a string type array variable.
^
The number of characters reserved in the array variable and the part that exceeds the limit of the array are ignored. (No error or data corruption)
^
If an error occurs during instruction execution, the system variable stat will be 1.
If converted successfully, the system variable stat will be 0.



%index
csvnote
Convert one line of CSV to memory note
%group
Extended I / O control instructions
%prm
p1,p2
p1: String type variable name to which the result is assigned
p2: Character string extracted from one CSV line
%inst
Expands only one line of data extracted from CSV format data into a character string type variable in memory notepad format.
CSV format is text data separated by ",".
For example, if you have four character strings separated by "," such as "a, b, c, d", you can use the csvstr command to make "" a \\ nb \\ nc \\ nd \\ n "". Can be assigned to as the data handled by the memory notepad instruction (data separated by "\\ n").
^
If an error occurs during instruction execution, the system variable stat will be 1.
If converted successfully, the system variable stat will be 0.


%index
xnotesel
Exclusive memory note initialization
%group
Extended I / O control instructions
%prm
p1,p2
p1: Target string type variable name
p2: Maximum number of items (256 by default)
%inst
Initializes the exclusive memory note.
The target variable and the reference count are reset.
^
Exclusive memory notes are long string data with one item per line, similar to those used in memory notepad instructions.
However, exclusive memory notes can only add different items (lines).
If you try to add an item that you already have, only the reference count will be updated, not the actual one. This makes it possible to store the same character string without duplication, and apply it to duplicate statistics, character string search, etc.
^
For exclusive memory notes, specify the target variable in xnotesel and set the maximum number of items if necessary.
After that, each time the xnoteadd instruction is executed, an item is added to the variable of the exclusive memory note.
%href
xnoteadd


%index
xnoteadd
Exclusive memory note item added
%group
Extended I / O control instructions
%prm
p1
p1: Character string added to the exclusive memory note
%inst
Adds an item to the exclusive memory note.
The item must be a string that does not contain line breaks.
When executed, the index to which the item is added is assigned to the system variable stat.
^
Items that are already in the exclusive memory note are not added.
In that case, the index of the item already included in the system variable stat is assigned, and the reference count of the item is incremented by one.
The reference count of an item can be obtained with the sort get instruction.
%href
xnotesel



%index
csvsel
Select the target buffer for CSV search
%group
Extended I / O control instructions
%prm
val,mode
val: Variable name that stores the character string to be searched by CSV
mode: Delimited character code
%inst
Select the buffer to be searched for CSV.
You can specify a variable that contains a CSV or notepad format string.

You can specify the delimiter character in mode.
If mode is omitted or set to 0, "," is used.
You can support tab-delimited csv files by specifying 9.
%href
csvres
csvflag
csvopt
csvfind


%index
csvres
Specify CSV search result output buffer
%group
Extended I / O control instructions
%prm
val
val: Variable name to output CSV search results
%inst
Specifies the CSV search result output buffer.
It must be a string type variable with a certain size.
Secure the size in advance with the sdim instruction, etc., according to the expected output result. Usually about 32000 bytes is enough.
If the size of the output result overflows the buffer, the search will be interrupted within the specified buffer size, so buffer overflow will not occur.
%href
csvsel
csvflag
csvopt
csvfind


%index
csvflag
Set item flag for CSV search
%group
Extended I / O control instructions
%prm
id,val
id: Item ID
val: Set value (0 to 255)
%inst
Set the flag for each item that is the target of CSV search.
If the setting value is 0, CSV search will not be performed.
If it is other than 0, it will be the target item of CSV search.
By default, all items are searched.
The item id is incremented by 1 to the right for each delimiter, with the leftmost item as 0.
%href
csvsel
csvres
csvopt
csvfind


%index
csvopt
Set CSV search options
%group
Extended I / O control instructions
%prm
p1
p1: Optional value
%inst
Set options for CSV search.
You can specify the following values: If you specify more than one, you can connect them with the "+" or "|" operator.
^p
 CCSV_OPT_ANDMATCH; AND search
 CCSV_OPT_NOCASE; Equalize half-width uppercase and lowercase letters
 CCSV_OPT_ZENKAKU; Equalize full-width and half-width
 CCSV_OPT_ADDLINE; Add line number to the beginning
 CCSV_OPT_EXPRESSION; Specify regular expression (not implemented)
^p
%href
csvsel
csvres
csvflag
csvfind


%index
csvfind
Perform CSV search
%group
Extended I / O control instructions
%prm
"string",p1,p2
"string": Search keyword
p1: Maximum number of result outputs (0 = unlimited)
p2: Start index of result output (0 = beginning)
%inst
Perform a CSV search.
It is necessary to specify the buffer (csvsel) to be searched and the output destination (csvres).
 The CSV line containing the keyword specified by "string" will be extracted to the result buffer.
 Keywords can be specified over multiple lines (memory notepad format).
If you include the AND search option in the csvopt instruction, only the rows that match all of the multiple keywords are fetched.
Otherwise, it will be an OR search that retrieves rows that match any of the multiple keywords.
%href
csvsel
csvres
csvflag
csvopt


%index
rndf_ini
Initialization of real random numbers
%group
Extended I / O control instructions
%prm
p1
p1 (-1): Initialization seed value
%inst
Initializes real random numbers.
You can specify the seed (seed value) used for initialization in p1.
If you omit p1 or specify -1, a random seed value obtained from the clock is set.
Real random numbers are initialized when the plugin is initialized, so it is not necessary to include the rndf_ini instruction.
%href
rndf_get
rndf_geti


%index
rndf_get
Get real random numbers
%group
Extended I / O control instructions
%prm
p1
p1: Variable name to which a real random number is assigned
%inst
Get a real random number and assign it to the variable specified by p1.
Real random numbers are real numbers greater than or equal to 0 and less than 1 and are generated by the Mersenne Twister algorithm.
%href
rndf_ini
rndf_geti


%index
rndf_geti
Get random numbers
%group
Extended I / O control instructions
%prm
p1,p2
p1: Variable name to which a real random number is assigned
p2 (100): Range value of random numbers to be generated
%inst
Integer Random number is acquired and assigned to the variable specified by p1.
Random numbers are integers greater than or equal to 0 and less than the number specified by p2.
The random numbers obtained here are generated by an algorithm similar to the real random numbers obtained by rndf_get (Mersenne Twister).
%href
rndf_ini
rndf_get


%index
getvarid
Get variable ID
%group
Extended I / O control instructions
%prm
p1,"name"
p1: Variable name to which the result is assigned
"name": variable name
%inst
Converts the variable name to the variable ID.
The variable ID is a number managed inside the HSP system and is assigned a value starting from 0.
The result is assigned to the variable specified by p1.
If the variable name does not exist, -1 is assigned.

%href
getvarname
getmaxvar



%index
getvarname
Get variable name
%group
Extended I / O control instructions
%prm
p1,p2
p1: Variable name to which the result is assigned
p2: Variable ID
%inst
Get the variable name from the variable ID.
The variable ID is a number managed inside the HSP system and is assigned a value starting from 0.
The result is assigned to the variable specified by p1.
If the corresponding variable ID does not exist, an empty string ("") is assigned.

%href
getvarid
getmaxvar



%index
getmaxvar
Get the maximum number of variable IDs
%group
Extended I / O control instructions
%prm
p1
p1: Variable name to which the result is assigned
%inst
Gets the maximum number of variable IDs currently available.
The result is assigned to the variable specified by p1.
The variable ID is a number managed inside the HSP system and is assigned a value starting from 0.
If the maximum number is 10, the available variable IDs are 0-9.

%href
getvarname
getvarid



%index
vsave
Save all variables
%group
Extended I / O control instructions
%prm
"filename"
"filename": filename
%inst
Saves all defined variable data to a file.
The file specified by "filename" is created.
The saved file can be used to read variable data with the vload or vload_start instruction.
The vsave instruction saves the contents of all variables, including arrays and module variables, but does not cover cloned variables, comobj, or variant variables.
Also, although it is possible to save label type variables, please note that the label information may not be correct when reading.
If successful, the system variable stat is assigned 0.
If the process is not completed correctly, the system variable stat will be a non-zero value.

%href
vload
vsave_start



%index
vload
Read all variables
%group
Extended I / O control instructions
%prm
"filename"
"filename": filename
%inst
Reads all defined variables from the file.
The file specified by "filename" must have variable data saved by the vsave or vsave_start instruction.
The vload instruction searches all currently defined variable names in the data stored in the file and loads the matching names.
Variables that are not saved in the file retain their original contents.
In addition, module type variables are not read unless the module name and the number of module variable definitions are the same as when they were saved.
If successful, the system variable stat is assigned 0.
If the process is not completed correctly, the system variable stat will be a non-zero value.

%href
vsave
vload_start



%index
vsave_start
Start variable storage
%group
Extended I / O control instructions
%prm
%inst
Starts variable saving by individual specification.
You must always start with the vsave_start instruction, specify the required variables with the vsave_put instruction, and finally execute the vsave_end instruction.
Variable saving by individual specification is the same as the vsave instruction except that arbitrary variable data can be saved in a file.
If successful, the system variable stat is assigned 0.
If the process is not completed correctly, the system variable stat will be a non-zero value.

%href
vsave_put
vsave_end



%index
vsave_put
Specify variables to save
%group
Extended I / O control instructions
%prm
p1
p1: Variables to save
%inst
Specify the variable to be saved by individual specification.
Be sure to execute the vsave_start instruction first.
Variable saving by individual specification is the same as the vsave instruction except that arbitrary variable data can be saved in a file.
Saves the contents of all variables, including arrays and module variables, but not cloned variables, comobj, or variant variables.
Also, although it is possible to save label type variables, please note that the label information may not be correct when reading.
If successful, the system variable stat is assigned 0.
If the process is not completed correctly, the system variable stat will be a non-zero value.

%href
vsave_start
vsave_end



%index
vsave_end
End of variable saving
%group
Extended I / O control instructions
%prm
"filename"
"filename": filename
%inst
Ends variable saving by individual specification.
Be sure to execute the vsave_start instruction first.
When executed, the file specified by "filename" will be created.
If successful, the system variable stat is assigned 0.
If the process is not completed correctly, the system variable stat will be a non-zero value.

%href
vsave_put
vsave_start



%index
vload_start
Start reading variables
%group
Extended I / O control instructions
%prm
"filename"
"filename": filename
%inst
Variable reading by individual specification is started.
Be sure to start with the vload_start instruction, specify the required variables with the vload_get instruction, and finally execute the vload_end instruction.
Reading variables by individual specification is the same as the vload instruction, except that arbitrary variable data can be read from a file.
If successful, the system variable stat is assigned 0.
If the process is not completed correctly, the system variable stat will be a non-zero value.

%href
vload_get
vload_end



%index
vload_get
Specifying variables to read
%group
Extended I / O control instructions
%prm
p1
p1: Variable to read
%inst
Specify the variable to be read from the file by individual specification.
Be sure to execute the vload_start instruction first.
Reading variables by individual specification is the same as the vload instruction, except that arbitrary variable data can be read from a file.
The vload_get instruction searches the data stored in the file for the specified variable name, and reads if there is data with a matching name.
If it is not saved in a file, the contents of the variable are preserved.
In addition, module type variables are not read unless the module name and the number of module variable definitions are the same as when they were saved.
If successful, the system variable stat is assigned 0.
If the process is not completed correctly, the system variable stat will be a non-zero value.

%href
vload_start
vload_end



%index
vload_end
End of variable reading
%group
Extended I / O control instructions
%prm
%inst
Ends variable reading by individual specification.
Be sure to execute the vload_start instruction first.
If successful, the system variable stat is assigned 0.
If the process is not completed correctly, the system variable stat will be a non-zero value.

%href
vload_start
vload_get





