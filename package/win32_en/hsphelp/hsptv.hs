%dll
hsptv

%ver
3.4

%date
2009/08/01

%author
onitama

%url
http://hsp.tv/

%note
Include hsptv.as.
See hsptv_api.txt for restrictions on HSPTV compatible programs.

%type
HSPTV operation command

%group
Extended I / O control instructions

%port
Win
%index
hsptv_up
HSPTV data update

%prm
p1, "comment", p2
p1: Score value (32bit integer value)
"Comment": Comment string (up to 256 bytes)
p2: Optional function value

%inst
Update HSPTV data. Reflects score and comment information.
If the score is negative, only the latest data will be acquired.
(In the case of the HSPTV distribution program, this instruction causes communication with the server. Please create the program assuming that it will take some time to complete this instruction.)

For comments, you can specify the information of the character string to be set up to 256 bytes (255 half-width characters).

If p2 (optional function value) is omitted or 0 is specified, the data is updated as normal ranking (highest score).
If 0x1000 (4096) is specified for the option value, the score of the index specified by p1 is cleared (the score is set to 0).
If 0x2000 (8192) is specified for the option value, the user name is not reflected and an empty character string is always set.
Option values can be specified by adding multiple values.
(When clearing the contents of the data, use the option values 0x1000 and 0x2000 in combination.)

%href
hsptv_getrank

%index
hsptv_getrank
HSPTV data acquisition

%prm
p1, p2, p3, rank
p1: Variable name to which score information is assigned
p2: Variable name to which user name information is assigned
p3: Variable name to which comment information is assigned
rank: Rank index (0-29)

%inst
Reads the contents of HSPTV data into a variable.

As for the rank value, 0 is the 1st place and 29 is the 30th place. p1 is initialized as a numeric type, and p2 & p3 are initialized as a string type.

This instruction reads the data updated by the hsptv_up instruction into a variable. The content to be read is the information at the time when the hsptv_up instruction was last executed.
Also, since no communication occurs with this instruction, the information is read immediately.

%href
hsptv_up
