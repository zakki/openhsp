%dll
form_decode

%ver
3.3

%date
2009/08/01

%author
onitama

%url
http://hsp.tv/

%note
Include form_decode.as.

%type
User-defined instructions

%group
String manipulation command

%port
Win
Cli
Let
%index
form_decode
Decode text

%prm
p1, p2, p3
p1 = variable: A string type variable that stores the conversion result
p2 = variable: String type variable to which the character string to be converted is assigned
p3 = 0 to (0): Conversion switch (0)

%inst
Decodes the text encoded for transmission to the original Japanese.

Setting p3 to 1 converts'&' to newline, and 2 converts'+' to blank.
If set to 3, both will be converted.

Character code conversion is not performed, so if character code conversion is required, it must be performed after decoding.

%sample
#include "form_decode.as"
#include "encode.as"
// URL of the page about "Wikipedia" on Wikipedia
	before = "http://ja.wikipedia.org/wiki/%E3%82%A6%E3%82%A3%E3%82%AD%E3%83%9A%E3%83%87%E3%82%A3%E3%82%A2"

// Perform decoding
	result = ""
	form_decode result, before

// Display results (convert UTF-8 to Shift JIS)
	mes utf8n2sjis(result)
	stop
