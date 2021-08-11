;--------------------------------------------------
; SQLele help
;--------------------------------------------------

%dll
SQLele

%ver
1.17

%date
2018/06/07

%author
s.programs

%url
http://spn.php.xdomain.jp/

%note
Include and use sqlele.hsp. You need sqlite3.dll to run it.

%type
User extension instructions

%index
prm_blob
Specify a variable as an SQL parameter for BLOB type data

%prm
(v1, p1)
v1: Variable given as a BLOB type parameter
p1: Variable data size (in bytes)

%inst
This function is used to make a variable buffer a parameter of an SQL statement as BLOB type data. Only for the argument string of the sql_q instruction.

The parameters set by this function are treated as bind variables when the sql_q instruction is executed.

%href
sql_q

%sample
	...

	sql_q "INSERT INTO Tbl (v1, v2, v3) VALUES ("+prm_blob(v1, n1)+","+prm_blob(v2, n2)+","+prm_blob(v3, n3)+")"

%group
Function for parameters

%index
sql_q
Execute SQL statement

%prm
"p1", v1
"p1": SQL statement to execute
v1: Target recordset variable (default tmparr)

%inst
Executes a SQL statement.

On p1, specify the SQL statement to execute.

In v1, specify the recordset variable that receives the result data.

If there is a record set that results in a SELECT statement etc., the record data is fetched in the recordset variable. The system variable stat returns the number of rows in the record. If stat is 0, it means that there were no records.

The Recordset Variable is initialized as an array of two-dimensional string buffers. This array variable stores output data, type information, column names, and so on. Recordset variables can be referenced directly as a string array, sql_v () can be used to reference data by column name, and sql_type () can be used to get the original data type.

If v1 is omitted, the macro sets the variable name tmparr. In all SQLele instructions and functions, if the recordset variable is omitted, the variable name tmparr is given. Therefore, you can often omit the recordset variable specification.

If you want to use bindings for the parameters given in p1, use the prm_i (), prm_f (), prm_text (), prm_blob () functions. This makes processing more efficient.

The database must be open with the sql_open instruction in order to execute the sql_q instruction.

If you try to write to a database locked by a transaction of another process, wait for the lock to be released before the write is performed.

(Source) Recordset variable format
Data string = v1 (column [0 ~], record [0 ~ stat-1])
Column name = v1 (column [0 ~], stat)
Type = lpeek (v1 (column, record), strlen (v1 (column, record)) + 4)
Record counter = lpeek (v1 (0, 0), strlen (v1 (0, 0)) + 8)
BLOB size = lpeek (v1 (column, record), strlen (v1 (column, record)) + 12)
BLOB data = v1 (column, record) 16th byte or later
Number of records = length2 (v1) -1
Number of columns = length (v1)

%href
sql_v
sql_i
sql_f
sql_type
prm_i
prm_f
prm_text
prm_blob

%sample
	...

sql_q "SELECT ID, Val FROM [table]"
	count = stat

mes "count =" + count
	repeat count
		mes "ID = " + sql_v("ID") + " / Val = " + sql_v("Val")
		sql_next
	loop

%group
Database operation

%index
prm_f
Specify a floating point number as an SQL parameter

%prm
(p1)
p1: Floating point number given as a parameter

%inst
Use this function to make a floating point number a parameter of an SQL statement. Only for the argument string of the sql_q instruction.

The parameters set by this function are treated as bind variables when the sql_q instruction is executed.

%href
sql_q

%sample
	...

	sql_q "INSERT INTO Tbl (f1, f2, f3) VALUES ("+prm_f(0.0)+","+prm_f(1.0)+","+prm_f(2.0)+")"

%group
Function for parameters

%index
prm_i
Specify an integer as an SQL parameter

%prm
(p1)
p1: Integer given as a parameter

%inst
This function is used to make an integer a parameter of a SQL statement. Only for the argument string of the sql_q instruction.

The parameters set by this function are treated as bind variables when the sql_q instruction is executed.

%href
sql_q

%sample
	...

	sql_q "INSERT INTO Tbl (i1, i2, i3) VALUES ("+prm_i(0)+","+prm_i(1)+","+prm_i(2)+")"

%group
Function for parameters

%index
prm_text
Specify a string variable as a text type SQL parameter

%prm
(v1)
v1: Variable to be a text type parameter

%inst
This function is used to turn a string variable as text data into a parameter of an SQL statement. Only for the argument string of the sql_q instruction.

The parameters set by this function are treated as bind variables when the sql_q instruction is executed. It's faster than putting a string directly into an SQL statement. Use without enclosing in single quotes.

%href
sql_q
sqesc

%sample
	...

	sql_q "INSERT INTO Tbl (s1, s2, s3) VALUES ("+prm_text(s1)+","+prm_text(s2)+","+prm_text(s3)+")"

%group
Function for parameters

%index
sql_f
Get data as double from recordset variable

%prm
("p1", v1)
"p1": Column name
v1: Target recordset variable (default tmparr)

%inst
From the recordset variable, specify the column name to reference the data as a floating point number (regardless of the type of the original data).

Use the sql_next instruction to move the referenced record to the next.

%href
sql_q
sql_next
sql_v
sql_i
sql_type

%group
Recordset operation

%index
sql_i
Get data as int from recordset variable

%prm
("p1", v1)
"p1": Column name
v1: Target recordset variable (default tmparr)

%inst
From the recordset variable, specify the column name to reference the data as an integer value (regardless of the type of the original data).

Use the sql_next instruction to move the referenced record to the next.

%href
sql_q
sql_next
sql_v
sql_f
sql_type

%sample
	...

	sql_q "SELECT ID, ...", tmparr

	id = sql_i("ID")

%group
Recordset operation

%index
sql_type
Get the data type from a recordset variable

%prm
("p1", v1)
"p1": Column name
v1: Target recordset variable (default tmparr)

%inst
Get the data type from the recordset variable by specifying the column name.

The recordset variable obtained by the sql_q instruction is an array of string type, so if you want to know the original type, use this function. The meanings of the values are as follows.

type = sql_type("Col name", arr)

type == SQLITE_INTEGER-> INTEGER type
type == SQLITE_FLOAT-> FLOAT type
type == SQLITE_TEXT-> TEXT type
type == SQLITE_BLOB-> BLOB type
type == SQLITE_NULL	-> NULL

In SQLite, data in the same column can have different types depending on the record.

Use the sql_next instruction to move the referenced record to the next.

%href
sql_q
sql_next
sql_v
sql_i
sql_f

%group
Recordset operation

%index
sql_v
See recordset variable data

%prm
("p1", v1)
"p1": Column name
v1: Target recordset variable (default tmparr)

%inst
Refer to the data by specifying the column name from the recordset variable. This functional macro expands in a form that can be referenced as a variable.

The data type is a string type regardless of the original data type. If you want to know the original type, use sql_type ().

Since this macro is expanded as a variable, it can be used as it is in a standard function that requires a string type variable as an argument as shown below.

i = instr(sql_v("hoge"), 0, "srch")
s = strmid(sql_v("hoge"), 0, 99)

Use the sql_next instruction to move the referenced record to the next.

(Material) Macro specifications
Before expansion: sql_v ("Col", arr)
After expansion: arr (sql_colid ("Col", arr), [record counter])

%href
sql_q
sql_next
sql_i
sql_f
sql_type

%sample
Full argument
	sql_q "SELECT * FROM ...", tmparr
	repeat stat
		mes sql_v("col1", tmparr) + "/" +  sql_v("col2", tmparr)
		sql_next tmparr
	loop

Å´

Argument omitted
	sql_q "SELECT * FROM ..."
	repeat stat
		mes sql_v("col1") + "/" +  sql_v("col2")
		sql_next
	loop

%group
Recordset operation

%index
sqesc
Single quote escape

%prm
("p1")
"p1": Character string to convert

%inst
This function returns the value of all single quotes in a string in a row.

Example: "let's go"-> "let''s go"

For single quoted string literals used in SQL statements, if the string contains single quotes, they must be escaped by making them two consecutive.

If you simply want to insert a string variable into your SQL statement, you can use the faster prm_text ().

%href
prm_text

%sample
	...

sql_q "SELECT ... WHERE [Remarks] like'%" + sqesc (srch) + "%')"

%group
Function for parameters
%index
sql_next
Move to next record

%prm
v1
v1: Target recordset variable (default tmparr)

%inst
Advances the record counter in the recordset variable v1 by one.

The record counter is a counter recorded in the recordset variable, and indicates the position of the record fetched by the data acquisition function such as sql_v (), sql_i ().

If the counter is advanced beyond the actual number of records, an error will occur.

%href
sql_move
sql_v
sql_i
sql_f
sql_type
sql_blobsize
sql_blobcopy

%sample
	...

	sql_q "SELECT * FROM ..."
	repeat stat
		mes sql_v("Column")
		sql_next
	loop

%group
Recordset operation

%index
sql_blobcopy
Copy BLOB data to a variable

%prm
v1, "p1", v2
v1: Variable that receives the value
"p1": Column name
v2: Target recordset variable (default tmparr)

%inst
From the recordset variable, specify the column name and copy the BLOB data to another variable.

The variable that receives the value must be large enough than the BLOB size obtained by sql_blobsize () in advance with dim, sdim, and memexpand.

You can use sql_type () to determine if the data is of type BLOB.

Use the sql_next instruction to move the referenced record to the next.

%href
sql_blobsize
sql_next

%sample
	...

	sql_q "SELECT blob1 FROM ..."

Copy the BLOB data in column blob1 to the variable v
	size = sql_blobsize("blob1")
	sdim v, size
	sql_blobcopy v, "blob1"

%group
Recordset operation

%index
sql_blobsize
Get the size of the BLOB data

%prm
("p1", v1)
"p1": Column name
v1: Target recordset variable (default tmparr)

%inst
Get the size of BLOB data (binary data stored in the database) by specifying the column name from the recordset variable.

You can use sql_type () to determine if the data is of type BLOB. The BLOB data body is stored after the 16th byte of the variable that can be referenced by sql_v (), and can be copied to another variable with the sql_blobcopy instruction.

If you run this function on non-BLOB data, it will return 0.

Use the sql_next instruction to move the referenced record to the next.

%href
sql_blobcopy
sql_next

%sample
	...

	sql_q "SELECT ID, blob1 FROM ..."
	repeat stat
The size of blob1 of mes "ID" + sql_v (" ID ") + "is" + sql_blobsize ("blob1")
		sql_next
	loop

%group
Recordset operation

%index
sql_move
Move record position

%prm
p1, v1
p1: Record position specification [0 to] (0)
v1: Target recordset variable (default tmparr)

%inst
Sets the value of the read record position (record counter) of the recordset variable v1.

The record counter is a counter recorded in the recordset variable, and indicates the record that is the target of the data acquisition function such as sql_v (), sql_i ().

The record counter can be set to a value from 0 to (number of records-1). If you specify a value outside the range, an error will occur.

%href
sql_next

%sample
	sql_q "SELECT * FROM ..."
	repeat stat
		mes sql_v("Column")
		sql_next
	loop

 ; Å´ Do the same work

	sql_q "SELECT * FROM ..."
	repeat stat
		sql_move cnt
		mes sql_v("Column")
	loop

%group
Recordset operation

%index
sql_close
Close database

%prm

%inst
Closes (ends use) the database opened by the sql_open instruction.

Call it when you are finished using the database, such as when you exit the application.

%href
sql_open

%sample
	sql_open "test.db"

	...

	sql_close

%group
Database operation

%index
sql_open
Open database

%prm
"p1"
"p1": File name to open

%inst
Open the database file.

Specify the file name with p1. If the specified file does not exist, a new one will be created.

Specifying "" for p1 creates a temporary database on disk. Specifying ": memory:" creates a temporary database in memory without creating a file.

When you are finished using the database, use sql_close to close the database.

%href
sql_close

%sample
	sql_open "test.db"

	...

	sql_close

%group
Database operation

%index
sql_colid
Get array index of recordset variable from column name

%prm
("p1", v1)
"p1": Column name
v1: Target recordset variable (default tmparr)

%inst
Get the array index from the recordset variable by specifying the column name.

For example, if you execute the SQL statement "SELECT ID, hoge, foo FROM ..."

sql_colid("ID") == 0
sql_colid("hoge") == 1
sql_colid("foo") == 2

It will be.

The column name must be an exact match, including case.

This function is used by sql_v (), sql_i (), sql_f (), sql_type ().

%sample
	...

	sql_q "SELECT * FROM ...", arr

	c_id  = sql_colid("ID", arr)
	c_val = sql_colid("Val", arr)

	mes "ID=" + arr(c_id, 0) + " / Val=" + arr(c_val, 0)

%group
Recordset operation

%index
sql_collist
Get column list of recordset variables

%prm
("p1", v1)
"p1": Delimiter string
v1: Target recordset variable (default tmparr)

%inst
Gets the list of column names contained in the recordset variable.

In p1, specify the string that separates the column names. If you omit this argument, "," (comma) is used.

In v1, specify the recordset variable name. If you omit the recordset variable, the variable name tmparr is used.

%sample
	...

sql_q "SELECT * FROM Table1"; Get recordset

mes sql_collist (); Show list of column names contained in recordset variables

%group
Recordset operation

