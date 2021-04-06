;
;HELP source file for HSP help manager
;(Lines beginning with ";" are treated as comments)
;

%type
Extension instructions
%ver
3.51
%note
Include hspinet.as.

%date
2017/09/13
%author
onitama
%dll
hspinet
%url
http://hsp.tv/
%port
Win


%index
netinit
Initialization of internet connection
%group
Extended I / O control instructions
%inst
Initializes Wininet.dll.
When using an instruction that starts with net ~, it must be executed only once at the beginning.
After execution, the result is stored in the system variable stat.
If it is 0, it means that it ended normally, otherwise it means that an error has occurred.
%href
netterm



%index
netterm
Termination of internet connection
%group
Extended I / O control instructions
%inst
Finish Wininet.dll.
Normally, this instruction is automatically called at the end of the program, so there is no need to write it in a script.
%href
netinit



%index
netexec
Perform the smallest unit of processing
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which the processing result is assigned

%inst
Performs the smallest unit of processing.
It executes time-consuming processes such as waiting for a response from the server and downloading in small units.
In the main program, it is necessary to call the netexec instruction while taking a fine wait time (wait) with the await instruction.
^p
Example:
Loop to wait for results
	repeat
	netexec res
	if res : break
	await 50
	loop
^p
After execution, the result is assigned to the variable specified by p1.
If the content is 0, it means that processing is ongoing.
If the content is 1, it means that the process has completed normally.
If the content is negative, it indicates that some kind of error has occurred.
If stat becomes a value other than 0, please process the corresponding processing on the script side as appropriate.

%href
netmode
netsize



%index
netmode
Get mode
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which the mode value is assigned

%inst
Gets the current processing mode.
The mode value is assigned to the variable specified by p1.
The contents of the mode value are as follows.
Make sure to issue the http request in the state of INET_MODE_READY.
Make sure to issue the ftp request in the state of INET_MODE_FTPREADY.
^p
Label | Value State
------------------------------------------------------
INET_MODE_NONE | 0 Uninitialized state
INET_MODE_READY | 1 Waiting state
INET_MODE_REQUEST | 2 http request acceptance
INET_MODE_REQSEND | 3 http Request is being sent
INET_MODE_DATAWAIT | 4 http receiving data
INET_MODE_DATAEND | 5 http Data reception end processing in progress
INET_MODE_INFOREQ | 6 http Information request is being sent
INET_MODE_INFORECV | 7 http Information data is being received
INET_MODE_FTPREADY | 8 ftp standby
INET_MODE_FTPDIR | 9 Getting ftp directory information
INET_MODE_FTPREAD | 10 Receiving ftp file
INET_MODE_FTPWRITE | 11 Sending ftp file
INET_MODE_FTPCMD | 12 ftp command transmission termination processing in progress
INET_MODE_FTPRESULT | 13 ftp server reply data is being received
INET_MODE_ERROR | 14 Error status
^p

%href
netexec



%index
neterror
Get net error string
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which the error string is assigned

%inst
Gets a string that shows the details when an error occurs.
It is assigned as a character string to the variable specified by p1.



%index
neturl
URL settings
%group
Extended I / O control instructions
%prm
"URL"
"URL": A string indicating the URL

%inst
http Set the URL to make the request.
The URL must be set without the file name, including the scheme name.
For "http://www.onionsoft.net/hsp/index.html", please set up to "http://www.onionsoft.net/hsp/".
Be sure to set the URL by the neturl command first for the http request. At the time of executing the neturl instruction, the http request has not been issued yet.
The http request is issued by the netrequest command or the netload command.
When making a request via SSL connection, specify the URL starting with "https: //".
%href
netrequest
netload
netfileinfo



%index
netrequest
http request issuance
%group
Extended I / O control instructions
%prm
"FileName"
"FileName": The name of the file making the request

%inst
Make an http request.
First, you need to specify the URL excluding the file name with the neturl instruction.
After issuing an http request with the netrequest instruction, it is necessary to perform reception processing on the script side with the netexec instruction.
A netload command for automatic reception processing is also provided separately.
%href
neturl
netload
netfileinfo



%index
netload
http file acquisition
%group
Extended I / O control instructions
%prm
"FileName"
"FileName": The name of the file making the request

%inst
Make an http request.
First, you need to specify the URL excluding the file name with the neturl instruction.
The netload instruction suspends processing until the file acquisition is completed.
You can easily get the file, but please be aware that the screen may remain stopped if the file is large or the reception condition is poor.
If you want to perform another process in parallel while receiving the file, use the netrequest instruction to make an http request.
%href
neturl
netrequest
netfileinfo



%index
netfileinfo
http file information acquisition
%group
Extended I / O control instructions
%prm
p1,"FileName"
p1: Variable name to which file information is assigned
"FileName": The name of the file making the request

%inst
Get the file information on the http server.
First, you need to specify the URL excluding the file name with the neturl instruction.
If the acquisition is successful, the value of the system variable stat becomes 0, and the information character string returned by the server as a character string type is assigned to the variable specified by p1.
If acquisition fails, the system variable stat is assigned a non-zero value.
The type of information returned by the server depends on the http server.
For details, refer to the explanation of http protocol such as RFC.
The netfileinfo instruction suspends processing until the file acquisition is completed.
%href
neturl
netload



%index
netdlname
Download name setting
%group
Extended I / O control instructions
%prm
"FileName"
"FileName": File name when downloaded

%inst
Set the file name when retrieving the file.
If the file name is not set by the netdlname instruction, the file name that made the http request is used.
Even if an empty string ("") is specified in the netdlname instruction, the file name that made the http request is used.
%href
netrequest
netload



%index
netproxy
Proxy settings
%group
Extended I / O control instructions
%prm
"ServerName",p1,p2
"ServerName": File name to make the request
p1 (0): Port number
p2 (0): Local connection flag

%inst
Set the proxy server used for http connections.
In "ServerName", set the proxy server name.
If you specify an empty string (""), no proxy is set.
Specifies the proxy server port number used by http on p1.
On p2, set whether to exclude local addresses from access through proxies. If 1, only local addresses are excluded from the proxy. If 0, use the proxy, including the local address.
When the netproxy instruction is executed, the previous session is canceled and the settings made by the neturl instruction and netheader instruction are reset.
^p
Example:
	netinit
if stat: dialog "Cannot connect to the internet.": End
	netproxy "proxy_server",8080,1
	neturl "http://www.onionsoft.net/hsp/"
	netload "index.html"
^p
%href
netagent
netheader



%index
netagent
Agent settings
%group
Extended I / O control instructions
%prm
"AgentName"
"AgentName": Agent name to be set

%inst
http Set the character string of the agent information passed to the server when connecting. The agent name specified in "AgentName" is set.
If you specify an empty string (""), it will be the default setting.
When the netagent instruction is executed, the previous session is canceled and the settings made by the neturl instruction and netheader instruction are reset.
%href
netproxy
netheader



%index
netheader
Header string settings
%group
Extended I / O control instructions
%prm
"HeaderString"
"HeaderString": String added to the header

%inst
Set the header string passed to the server when connecting to http.
If you specify an empty string (""), it will not be set.
The header string does not normally need to be set, but it can be used to set additional information or operation settings.
The header string set by the netheader instruction is applied to all subsequent requests.
^p
Example:
Add referrer
	netheader "Referer:http://www.onionsoft.net/\n\n"
^p
%href
netagent



%index
netsize
Get file reception size
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which the file reception size is assigned

%inst
Gets the size of the file received for the http request issued by the netrequest instruction.
The file reception size is assigned to the variable specified by p1.
The file reception size is for checking the contents received by the netexec instruction. If you check the file size by acquiring file information in advance, you can measure the progress rate.
%href
netexec



%index
filecrc
Get CRC32 of file
%group
Extended I / O control instructions
%prm
p1,"FileName"
p1: Variable name to which the CRC value is assigned
"FileName": File name to check CRC

%inst
Finds the CRC32 of the specified file and assigns it to the variable on p1.
CRC32 is a 32-bit number calculated based on the contents of the file.
It can be used to check the contents of files.
%href
filemd5



%index
filemd5
Get MD5 of file
%group
Extended I / O control instructions
%prm
p1,"FileName"
p1: Variable name to which the MD5 value is assigned
"FileName": MD5 file name to check

%inst
Finds the MD5 of the specified file and assigns it to the variable on p1.
The MD5 value is a string type and is represented as a 32-character hexadecimal number such as "f96b697d7cb7938d525a2f31aaf161d0".
The MD5 value can be used as a hash value that uniquely represents the contents of the file. For more information, see the MD5 documentation.
It can be used to check the contents of files.
%href
varmd5
filecrc



%index
ftpopen
Start FTP session
%group
Extended I / O control instructions
%prm
p1,p2,p3,p4,p5
p1: ftp server address (string)
p2: ftp login user name (string)
p3: ftp login user password (string)
p4: Port number (optional)
p5: PASSIVE mode flag (optional)

%inst
Connect to the ftp server and start a session.
Connect to ftp with the server address in p1, the username in p2, and the password in p3.
You can specify the port number with the p4 parameter.
If you omit p4, the standard port number is used.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
You can set the PASSIVE mode flag when connecting with the p5 parameter.
If p5 is set to 1, ftp connection will be made in PASSIVE mode. If 0 or omitted, it will be a normal ftp connection.
^
It is necessary to initialize by the netinit instruction in advance.
After starting an ftp session, you can only use ftp-related instructions. When performing other net operations such as http, be sure to terminate the ftp session with the ftpclose command.

%href
ftpclose


%index
ftpclose
End of FTP session
%group
Extended I / O control instructions

%inst
Terminates the session started by the ftpopen instruction.

%href
ftpopen


%index
ftpresult
Get FTP processing result string
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which the FTP processing result string is assigned

%inst
Server reply message for processing by ftp related instructions
Get it and assign it to the variable specified in p1.
It is assigned as character string data to the variable of p1.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen


%index
ftpdir
FTP directory move
%group
Extended I / O control instructions
%prm
p1,p2
p1: Variable to which the current directory location is assigned
p2: Destination directory name (character string)

%inst
Assigns the current directory name on the ftp server to the variable specified in p1 as character string data.
If you specify a directory name for p2, move to that location.
If you omit the specification of p2, the directory will not be moved.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen


%index
ftpdirlist
Get FTP directory list 1
%group
Extended I / O control instructions

%inst
Make a request to get the list of files in the current directory on the ftp server.
The actual file list is done with the ftpdirlist2 instruction.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen
ftpdirlist2


%index
ftpdirlist2
FTP directory list acquisition 2
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which the file list is assigned

%inst
Be sure to start an ftp session with the ftpopen instruction and use this instruction after the file list acquisition is completed with the ftpdirlist instruction.
The following is an example of getting the file list.
^p
Example:
Loop to wait for results
	ftpdirlist
	repeat
	netexec mode
	if res : break
	await 50
	loop
	ftpdirlist2 res
^p
File list acquisition must be divided into three steps: request by ftpdirlist instruction, waiting for reception by netexec instruction, and acquisition of result by ftpdirlist2 instruction.
The file list assigned to p1 is multi-line character string data separated for each entry per line.
One line is separated by "," in the order of "" file name "", file size, and modification date.

%href
ftpopen
ftpdirlist
netexec


%index
ftpcmd
Execution of FTP command
%group
Extended I / O control instructions
%prm
p1
p1: FTP command string to execute

%inst
Executes the FTP command specified by p1.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen


%index
ftprmdir
Delete FTP directory
%group
Extended I / O control instructions
%prm
p1
p1: Character string indicating the directory to be deleted

%inst
Deletes the directory specified by p1.
If the execution is successful, 0 is assigned to the system variable stat and the system variable stat is assigned.
If it fails, another value will be assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen
ftpmkdir


%index
ftpmkdir
Create FTP directory
%group
Extended I / O control instructions
%prm
p1
p1: Character string indicating the directory to be created

%inst
Creates the directory specified by p1.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen
ftprmdir


%index
ftpget
FTP file acquisition
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1: File name (character string) obtained from the server
p2 (""): File name (character string) created locally
p3 (0): Transfer mode (0 = binary / 1 = ASCII)

%inst
Get the file on the ftp server.
Specify the file name on the server with p1.
Specify the name of the file downloaded and created with p2.
If p2 is omitted or "" is specified, the same name as p1 is used.
Specify the transfer mode with p3. If the transfer mode is omitted or specified as 0, it will be transferred as binary data, and if it is specified as 1, it will be transferred as ASCII data.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen
ftpput


%index
ftpput
FTP file transmission
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1: File name (character string) created on the server
p2 (""): File name (string) sent locally
p3 (0): Transfer mode (0 = binary / 1 = ASCII)

%inst
Send the file on an ftp server.
Specify the file name to be created on the server with p1.
Specify the file name sent locally with p2.
If p2 is omitted or "" is specified, the same name as p1 is used.
Specify the transfer mode with p3. If the transfer mode is omitted or specified as 0, it will be transferred as binary data, and if it is specified as 1, it will be transferred as ASCII data.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen
ftpget


%index
ftprename
FTP file rename
%group
Extended I / O control instructions
%prm
p1,p2
p1: Change source file name (character string)
p2: New file name (string)

%inst
Rename the file on the ftp server.
Specify the source file name with p1 and the new file name with p2.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen
ftpdelete


%index
ftpdelete
FTP file deletion
%group
Extended I / O control instructions
%prm
p1
p1: File name to delete (character string)

%inst
Delete the file on the ftp server.
If the execution is successful, 0 is assigned to the system variable stat, and if it is unsuccessful, any other value is assigned.
Be sure to start an ftp session with the ftpopen instruction before using this instruction.

%href
ftpopen
ftprename


%index
netrequest_get
http request issuance (GET)
%group
Extended I / O control instructions
%prm
"FileName"
"FileName": The name of the file making the request

%inst
Make an http request.
Similar to the netrequest command, but you can get the downloaded data image as data in memory instead of a file.
^
In "FileName", specify the name of the file to make the request.
First, you need to specify the URL excluding the file name with the neturl instruction.
^
After issuing an http request with the netrequest instruction, receive processing is performed with the netexec instruction.
You need to do it on the script side.
After the processing is completed, you can receive the data in any variable by the netgetv command or the netgetv_data command.
If you want to request data from CGI in POST format, use the netrequest_post instruction.

%href
netgetv
netgetv_data
netgetv_size
netrequest
netrequest_post
netrequest_put
netrequest_delete
neturl


%index
netrequest_post
http request issuance (POST)
%group
Extended I / O control instructions
%prm
"FileName",p1
"FileName": The name of the file making the request
p1: Character string type variable name that stores the data for POST

%inst
Make an http request.
Similar to the netrequest command, but you can get the downloaded data image as data in memory instead of a file.
It also supports CGI parameter passing in POST format.
^
In "FileName", specify the name of the file to make the request.
First, you need to specify the URL excluding the file name with the neturl instruction.
In p1, specify the variable name that stores the data for POST.
In advance, the variable must be a character string type and store POST format data.
The POST format data is similar to the "&" separated parameters specified in the GET format URL.
However, if you want to send binary data, you need to encode the data into a string.
Since the netrequest_post instruction issues the passed character string as POST data as it is, perform this encoding in advance.
^p
Example:
;Specify the URL
neturl "http://www.onionsoft.net/hsp/beta/"

;Pass parameters to CGI in POST format
prm = "mode=find&cond=and&log=0&word=script"
netrequest_post "betabbs.cgi",prm
^p
After issuing an http request with the netrequest instruction, it is necessary to perform reception processing on the script side with the netexec instruction.
After the processing is completed, you can receive the data in any variable by the netgetv command or the netgetv_data command.
If you want to request data from CGI in GET format, use the netrequest_get instruction.

%href
netgetv
netgetv_data
netgetv_size
netrequest
netrequest_get
netrequest_put
netrequest_delete
neturl


%index
netrequest_delete
http request issue (DELETE)
%group
Extended I / O control instructions
%prm
"FileName"
"FileName": The name of the file making the request

%inst
Make an http request.
The netrequest_delete command sends a DELETE request and deletes the specified resource (file name).
First, you need to specify the URL excluding the file name with the neturl instruction.
^
After issuing an http request with the netrequest instruction, receive processing is performed with the netexec instruction.
You need to do it on the script side.
After the processing is completed, you can receive the data in any variable by the netgetv command or the netgetv_data command.

%href
netgetv
netgetv_data
netgetv_size
netrequest
netrequest_put
netrequest_get
neturl


%index
netrequest_put
http request issuance (PUT)
%group
Extended I / O control instructions
%prm
"FileName",p1
"FileName": The name of the file making the request
p1: Character string type variable name that stores the data for PUT

%inst
Make an http request.
The netrequest_put instruction can send a PUT request to update the specified resource.
First, you need to specify the URL excluding the file name with the neturl instruction.
The parameter information corresponds to the CGI parameter passing in the POST format, similar to the netrequest_post instruction.
^
In "FileName", specify the name of the file to make the request.
First, you need to specify the URL excluding the file name with the neturl instruction.
In p1, specify the variable name that stores the data for POST.
In advance, the variable must be a character string type and store POST format data.
The POST format data is similar to the "&" separated parameters specified in the GET format URL.
^
After issuing an http request with the netrequest instruction, it is necessary to perform reception processing on the script side with the netexec instruction.
After the processing is completed, you can receive the data in any variable by the netgetv command or the netgetv_data command.
If you want to request data from CGI in GET format, use the netrequest_get instruction.

%href
netgetv
netgetv_data
netgetv_size
netrequest
netrequest_get
netrequest_post
netrequest_delete
neturl


%index
netgetv
Get the result of http request
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which data is assigned

%inst
Get the result of http request by netrequest_get and netrequest_post instructions.
Be sure to confirm that the download is completed by the reception process using the netexec instruction before acquiring the data.
The variable specified by p1 is automatically initialized as a string type with the required size.
(There is no need to initialize variables or allocate memory in advance.)
The retrieved data is processed as text (string). If you want to get other data (binary), use the netgetv_data instruction.
After executing the instruction, the data size is assigned to the system variable stat.

%href
netgetv_data
netgetv_size
netrequest_get
netrequest_post
netrequest_put
netrequest_delete



%index
varmd5
Get MD5 of variable buffer
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1: Variable name to which the MD5 value is assigned
p2: Referenced variable name
p3 (0): Buffer size

%inst
Finds MD5 from the contents of the specified variable buffer and assigns it to the variable on p1.
The MD5 value is a string type and is represented as a 32-character hexadecimal number such as "f96b697d7cb7938d525a2f31aaf161d0".
The MD5 value can be used as a hash value that uniquely represents the contents of memory. For more information, see the MD5 documentation.
If you want to find MD5 from the contents of a file, use the filemd5 instruction.
%href
filemd5


%index
b64encode
BASE64 encoding
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1: BASE64 Variable name to which the converted character string is assigned
p2: Variable name with conversion source data
p3 (-1): Buffer size

%inst
Base64-encodes (converts) the contents of the variable buffer specified by p2 and assigns it to the variable of p1.
If the value of p3 is omitted or set to a negative value, the size is automatically determined using the data contained in p2 as a character string.
BASE64 is stored as a string type. It is used when temporarily converting binary data etc. to a character string.
To decode (return) a BASE64 format character string to the original data, use the b64 decode instruction.
%href
b64decode


%index
b64decode
BASE64 decoding
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1: Variable name to which the decoded data is assigned
p2: Variable name with BASE64 format data
p3 (-1): Buffer size

%inst
Base64 decodes the contents of the variable buffer specified by p2 and assigns it to the variable of p1.
The variable in p2 must be assigned a BASE64 encoded string.
%href
b64encode


%index
rc4encode
RC4 encoding
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1: Variable name
p2: Password string
p3 (-1): Buffer size

%inst
Encrypts the contents of the variable buffer specified by p1 with the RC4 compatible (ARCFOUR) algorithm.
When encrypting, the password string specified in p2 is used as the key.
Specify the buffer size with p3. If p3 is omitted or a negative value is set, the size is automatically determined using the contents of the variable buffer as a character string.
With RC4 encryption, there is no change in data size before and after encryption.
Also, since encoding and decoding are performed in the same process, the encoded data will be decrypted to the original data by encrypting it again with the same key.

%href
b64encode
b64decode


%index
urlencode
URL encoding
%group
Extended I / O control instructions
%prm
p1,p2
p1: Variable name to which the URL-encoded string is assigned
p2: Variable name with conversion source data

%inst
URL-encodes (converts) the contents (character string) of the variable buffer specified in p2 and assigns it to the variable in p1.
The variable specified by p1 is automatically initialized as a string type.
Please note that the maximum number of characters that can be output by URL encoding is 4095 characters.
If you want to decode (return) the URL-encoded string to the original data, use the urldecode instruction.
%href
urldecode


%index
urldecode
URL decoding
%group
Extended I / O control instructions
%prm
p1,p2
p1: Variable name to which the decoded data is assigned
p2: Variable name with URL-encoded data

%inst
Returns the URL-encoded string to the original string.
Decodes the contents of the variable buffer specified by p2 and assigns it to the variable of p1.
Please note that the maximum number of characters that can be output by decoding is 4095 characters.
%href
urlencode


%index
jsonopen
Open JSON format
%group
Extended I / O control instructions
%prm
p1,p2
p1: Variable name to which the JSON pointer value is assigned
p2: Variable name with JSON format data

%inst
Reads a JSON-formatted string and makes the content accessible.
The character string stored in the variable specified by p2 is regarded as JSON format and the data is parsed.
After reading, the JSON pointer value is assigned to the variable specified by p1.
By specifying the JSON pointer value in the instruction that handles the JSON format, it is possible to access various data.
After reading the data with the jsonopen instruction, it is necessary to execute the jsonclose instruction at the end to release the memory.
%href
jsonclose


%index
jsonclose
JSON format termination process
%group
Extended I / O control instructions

%inst
Releases the memory of the data read by the jsonopen instruction.
%href
jsonopen


%index
jsonout
Output JSON format data to a variable
%group
Extended I / O control instructions
%prm
p1,p2
p1: Variable name to which JSON format data is assigned
p2 (-1): JSON pointer value

%inst
Outputs JSON format data to the variable specified by p1.
Specify the pointer value of the JSON data output by p2.
If p2 is omitted or a negative value is set, the data read by the jsonopen instruction will be the target.
The variable specified by p1 is initialized as a character string type and its size is automatically secured.

%href
jsonopen


%index
jsongetobj
Get a JSON object
%group
Extended I / O control instructions
%prm
p1,"name",p2
p1: Variable name to which the JSON pointer value is assigned
"name": Object distinguished name
p2 (-1): JSON pointer value

%inst
Gets the object with the name specified by "name" and assigns the JSON pointer value to the variable specified by p1.
Specify the object (JSON pointer value) to be searched with p2.
If p2 is omitted or set to a negative value, the root hierarchy of the data read by the jsonopen instruction is used.
If the specified name does not exist, 0 will be assigned as the JSON pointer value.
If you specify an empty (NULL) JSON pointer value for p2, the system variable stat becomes 1 and execution is not performed.
%href
jsonnext


%index
jsonnext
Get the next JSON object
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1: Variable name to which the JSON pointer value is assigned
p2 (-1): JSON pointer value
p3 (0): Acquisition option

%inst
Gets the value related to the JSON object (JSON pointer value) specified in p2 and assigns it to the variable specified in p1.
The value retrieved depends on the capture options on p3. The following values can be specified for p3.
^p
Acquisition option contents
--------------------------------------------
  0 Next object (next)
  1 Previous object (prev)
  2 Child hierarchy object (child)
  3 Object type value
^p
With the jsonnext instruction, you can get objects in the same hierarchy and objects in the child hierarchy (array).
If p2 is omitted or set to a negative value, the root hierarchy of the data read by the jsonopen instruction is used.
If the specified JSON object does not exist, 0 is assigned as the JSON pointer value.
If you specify an empty (NULL) JSON pointer value for p2, the system variable stat becomes 1 and execution is not performed.
%href
jsongetobj


%index
jsongets
Get a string from a JSON object
%group
Extended I / O control instructions
%prm
p1,"name",p2
p1: Variable name to which the acquired character string is assigned
"name": Object distinguished name
p2 (-1): JSON pointer value

%inst
Gets the character string recorded in the object and assigns it to the variable specified in p1.
Specify the target object (JSON pointer value) in p2.
If "name" is omitted or specified as an empty character string (""), the character string recorded in the object itself specified by p2 is acquired.
If you specify a name with "name", the object with the same name is searched for and the value is obtained from the objects in the same hierarchy as the object specified by p2.
If the specified name does not exist, p1 is not assigned and the system variable stat is assigned 1 to exit.
If p2 is omitted or set to a negative value, the root hierarchy of the data read by the jsonopen instruction is used.
If you specify an empty (NULL) JSON pointer value for p2, the system variable stat becomes 1 and execution is not performed.
%href
jsongeti
jsonnkf


%index
jsongeti
Get an integer value from a JSON object
%group
Extended I / O control instructions
%prm
p1,"name",p2
p1: Variable name to which the acquired integer value is assigned
"name": Object distinguished name
p2 (-1): JSON pointer value

%inst
Gets the integer value recorded in the object and assigns it to the variable specified by p1.
Specify the target object (JSON pointer value) in p2.
If "name" is omitted or specified as an empty string (""), the integer value recorded in the object itself specified by p2 is acquired.
If you specify a name with "name", the object with the same name is searched for and the value is obtained from the objects in the same hierarchy as the object specified by p2.
If the specified name does not exist, p1 is not assigned and the system variable stat is assigned 1 to exit.
If p2 is omitted or set to a negative value, the root hierarchy of the data read by the jsonopen instruction is used.
If you specify an empty (NULL) JSON pointer value for p2, the system variable stat becomes 1 and execution is not performed.
%href
jsongets


%index
jsonnewobj
Create a new JSON object
%group
Extended I / O control instructions
%prm
p1,p2,"name"
p1: Variable name to which the JSON pointer value is assigned
p2 (-1): Parent JSON pointer value
"name": Object distinguished name

%inst
Create a new JSON object and assign the JSON pointer value to the variable specified by p1.
Specifies the parent object (JSON pointer value) in p2.
If p2 is omitted or set to a negative value, the root hierarchy of the data read by the jsonopen instruction is used.
Used by users to create their own JSON objects.
Note that after creating a new JSON object, you need to finally delete the most parent hierarchy with the jsondelobj instruction.
%href
jsondelobj


%index
jsondelobj
Delete JSON object
%group
Extended I / O control instructions
%prm
p1
p1 (0): JSON pointer value

%inst
Delete the JSON object.
Note that after creating a new JSON object with the jsonnewobj instruction, you need to delete the most parent hierarchy with the jsondelobj instruction at the end.
Use the jsonclose instruction to release the data read by the jsonopen instruction. (It is not necessary to release it with the jsondelobj instruction.)
%href
jsonnewobj


%index
jsonsetprm
Set a value in the JSON object
%group
Extended I / O control instructions
%prm
p1,p2,p3
p1 (0): JSON pointer value
p2 (0): Set value
p3 (0): Configuration options

%inst
Sets the parameters associated with the JSON object (JSON pointer value) specified in p1.
The parameters to be set depend on the options on p3. The following values can be specified for p3.
^p
Setting option contents
--------------------------------------------
  0 Next object (next)
  1 Previous object (prev)
  2 Child hierarchy object (child)
  3 Object type value
  4 Integer value set for the object
^p
With the jsonsetprm instruction, you can directly set the objects in the child hierarchy (array) and the concatenation of the objects.
Overwriting the already set value may break the hierarchical structure, so be careful when setting it.
If you specify an empty (NULL) JSON pointer value for p1, the system variable stat becomes 1 and execution is not performed.
%href
jsongetobj


%index
jsonputs
Add string to JSON object
%group
Extended I / O control instructions
%prm
p1,"name","strings"
p1 (0): JSON pointer value
"name": Object distinguished name
"strings": Strings to set

%inst
Adds an object with string data to the JSON object (JSON pointer value) specified by p1.
In "name", specify the distinguished name of the object to be added, and in "strings", specify the character string.

%href
jsonputi
jsonnkf


%index
jsonputi
Add numbers to JSON object
%group
Extended I / O control instructions
%prm
p1,"name",p2,p3
p1 (0): JSON pointer value
"name": Object distinguished name
p2 (0): Value to set
p3 (0): Configuration options

%inst
Adds an object with numeric data to the JSON object (JSON pointer value) specified by p1.
In "name", specify the distinguished name of the object to be added, and in p2, specify a numerical value.
p
The type of numerical value to be set depends on the p3 option. The following values can be specified for p3.
^p
Setting option contents
--------------------------------------------
  0 integer value
  1 BOOL value (False, True)
^p
If the setting option is a BOOL value, True is set if the value of p2 is other than 0, and False is set if it is 0.

%href
jsonputs


%index
jsonnkf
JSON string conversion settings
%group
Extended I / O control instructions
%prm
"option1","option2"
"option1": Conversion option at acquisition
"option2": Conversion option at the time of setting

%inst
Set the code conversion of the character string handled by JSON.
JSON data can be retained in any character code by converting the character strings used in the jsongets and jsonputs instructions.
Specify the code conversion parameter by NKF by "option1" and "option2" parameters.
"option1" is used when the character string is acquired by the jsongets instruction, and "option2" is used when the character string is set by the jsonputs instruction.
The optional string is the same as that used by the nkfcnv instruction.
By specifying SJIS input / output in NKF conversion, you can specify the character code handled by HSP as it is.

%href
jsongets
jsonputs
nkfcnv


%index
nkfcnv
Perform character code conversion by NKF
%group
Extended I / O control instructions
%prm
p1,p2,"option",p3,p4
p1: Variable to which the converted character string is assigned
p2: Variable to which the conversion source string is assigned
"option": NKF conversion option
p3 (-1): Character string size of conversion source
p4 (-1): Maximum output destination buffer size

%inst
Character code conversion is performed by NKF for the character string stored in the variable specified by p2, and the result is assigned to the variable specified by p1.
You can specify NKF conversion options with "option". This allows you to arbitrarily specify the character code to be input and the character code to be output.
If the "option" parameter is omitted, the input code is automatically detected and converted to SJIS.
Below is a list of the main options. (Multiple optional character strings can be specified in succession.) In addition to this, many other specifications are possible. See nkf_doc.txt in the doclib folder for more information.
^p
Setting option contents
--------------------------------------------
    j Convert to JIS
    e Convert to EUC
    s Convert to SJIS
    w Convert to UTF8
    J The conversion source is assumed to be JIS (ISO-2022-JP).
    E The conversion source is assumed to be EUC (AT & T).
    S conversion source assumes SJIS
    W Conversion source assumes UTF-8
    W16 conversion source assumes UTF-16 (Little Endian)
    W16B conversion source assumes UTF-16 (Big Endian)
^p
In p3, specify the character string size (number of bytes) of the conversion source. If p3 is omitted or a negative value, the input is automatically calculated as an ansi string in C format.
In p4, specify the output destination buffer size. No conversions beyond this size will be performed. If p4 is omitted or a negative value, the default size (32KB) is used.
The variable specified by p1 is automatically initialized after allocating a string-sized buffer. It is not necessary to initialize with sdim in advance.

%href
nkfguess


%index
nkfguess
Get the character code recognition result by NKF
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which the resulting string is assigned

%inst
Acquires the recognized conversion source character code when converted by the nkfcnv instruction.
The result is assigned as a string to the variable specified by p1. Be sure to convert with the nkfcnv instruction first.

%href
nkfcnv


%index
getenv
Get environment variables
%group
Extended I / O control instructions
%prm
p1,"name"
p1: Variable to which the resulting string is assigned
"name": environment variable name

%inst
Gets the value of an environment variable and assigns it to the variable.
The result is assigned as a string type.
The variable buffer is automatically adjusted to fit the string.

%href


%index
getctime
Get date and time by string
%group
Extended I / O control instructions
%prm
p1,p2
p1: Variable to which the resulting string is assigned
mode (0): Specify the format to be acquired

%inst
Get the date and time as a string.
The format to be acquired is specified by the value of mode.
^p
 mode contents
---------------------------------------------
   0 Current time (local) by the asctime function in C language
        Example: Sun Nov 6 08:49:37 1994
   1 Current time (GMT / UTC) by the asctime function in C language
        Example: Sun Nov 6 08:49:37 1994
   2 Date format defined in RFC 1123
        Example: Sun, 06 Nov 1994 08:49:37 GMT
^p

%href
gettime


%index
getenvprm
Get specified string element
%group
Extended I / O control instructions
%prm
p1, p2, "name", code
p1: Variable to which the resulting string is assigned
p2: String type variable to which the search content is assigned
"name": element name
code: Delimiter code (default is'&')

%inst
The getenvprm instruction has a specific delimiter, such as "A = 123 & B = 456 & C = 789".
From the character string separated by the character code ("&" in this case)
Extract the one whose first part matches "name".
Multiple information as a character string by passing CGI parameters etc.
It is used to retrieve a specific item from the passed items.
For example, if the variable a is assigned "A = 123 & B = 456 & C = 789"
When "getenv prm res, a," B = "" is executed, the variable res is "789".
The string is assigned.
The variable specified by p2 is a string type and is pre-initialized.
is needed.
If there is no corresponding element name, "" (character string of length 0) is
It will be substituted.
It is possible to specify the delimiter code for code.
If you omit the code specification,'&' is used.

%href


%index
netgetv_data
Get the result of http request
%group
Extended I / O control instructions
%prm
p1
p1: Variable to which data is assigned

%inst
Get the result of http request by netrequest_get and netrequest_post instructions.
Be sure to confirm that the download is completed by the reception process using the netexec instruction before acquiring the data.
The operation is similar to the netgetv instruction, but the netgetv instruction gets the text (string), while the netgetv_data instruction gets the binary data in the buffer.
Therefore, it is necessary to reserve the memory buffer required for download as a character string type in advance for the variable specified by p1. (The required size can be obtained with the netgetv_size function.)
After executing the instruction, the data size is assigned to the system variable stat.

%href
netgetv
netgetv_size
netrequest_get
netrequest_post


%index
netgetv_size
Get file reception size
%group
Extended I / O functions

%inst
Returns the size of the data acquired as a result of the http request by the netrequest_get and netrequest_post instructions.
Be sure to confirm that the download is completed by the reception process using the netexec instruction before acquiring the data.
%href
netexec
netgetv_data



