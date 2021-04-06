;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;

%type
Extension instructions
%ver
3.4
%note
Include hspdb.as.

%date
2009/08/01
%author
onitama
%dll
hspdb
%url
http://hsp.tv/
%port
Win
%portinfo
Windows + ODBC environment is required.


%index
dbini
Initialize ODBC
%group
Extended I / O control instructions


%inst
Initializes ODBC. It must be done only once at the beginning.
After execution, the result is stored in the system variable stat.
If it is 0, it means that it ended normally, otherwise it means that an error occurred.



%index
dbbye
Performs HSPDB termination processing
%group
Extended I / O control instructions
%inst
Performs the termination processing of the entire HSPDB.
Normally, this instruction is automatically called at the end of the program, so there is no need to write it in a script.


%index
dbopen
Connect to DB
%group
Extended I / O control instructions
%prm
p1,p2
p1: Connection specification string
p2 = 0 to 1 (0): Connection mode

%inst
Starts a connection to the DB specified by the connection specification character string.
In addition to being able to specify a DSN name such as "DSN = TEST", various parameters such as drivers and files can be described as a character string for the connection specification character string.
Please refer to the ODBC related materials for details on the connection specification string.
If the connection mode is 1, a dialog for confirming the connection will pop up.
If the connection mode is 0, the connection will be made with the specified character string.
After execution, the result is stored in the system variable stat. If it is 0, it means that it ended normally, otherwise it means that an error occurred.

%href
dbclose



%index
dbclose
Disconnect DB
%group
Extended I / O control instructions
%inst
Disconnects the DB connected by the dbopen instruction.
%href
dbopen



%index
dbstat
Get the current state
%group
Extended I / O control instructions
%inst
Assign the current connection status etc. to the system variable stat.
^p
 stat: state
 -------------------------
   1: An error has occurred
   2: Cutting
   3: Connecting
   4: Waiting for SQL response
^p
%href
dbsend



%index
dbspchr
Specify the delimiter
%group
Extended I / O control instructions
%prm
p1
p1: 0 to 255: Character code

%inst
Set the character to separate the items of the result obtained by the dbgets instruction.
Normally, items are separated by ",", but please set if you want to use different characters. For example, if you specify "dbspchr 9", the TAB code becomes the delimiter.

%href
dbgets




%index
dbsend
Send SQL string
%group
Extended I / O control instructions
%prm
"..."
"...": SQL string

%inst
Sends the control string according to the SQL syntax to the connected DB.
After execution, the result is stored in the system variable stat. If it is 0, it means that it ended normally, otherwise it means that an error occurred.
If it ends normally, you can get the result with the dbgets instruction.

%href
dbgets
dbopen




%index
dbgets
Get the result string
%group
Extended I / O control instructions
%prm
p1
p1: Variable name to which the resulting string is assigned

%inst
Gets the result for the SQL string sent by the dbsend instruction.
In p1, you need to specify the variable name to which the result string will be assigned.

The variable specified by p1 is forced to be a string type and receives as much data as the size of the variable buffer allows (the buffer does not overflow).
After execution, the result is stored in the system variable stat. If it is 0, it means that the data was received normally. A value of 1 indicates that an error occurred while retrieving the result. A case of 2 indicates that there is no more data to receive.

When retrieving data, there is a possibility that large data will be retrieved many times, so if the content of the system variable stat is 0, execute dbgets again and loop until the data is received to the end Please be so.

%href
dbsend
dbspchr


