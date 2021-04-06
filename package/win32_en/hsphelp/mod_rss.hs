%dll
mod_rss

%ver
3.3

%date
2009/08/01

%author
onitama

%url
http://hsp.tv/

%note
Include mod_rss.as.

%type
User-defined instructions

%group
I / O control instructions

%port
Win
Cli
Let
%index
rssload
Read RSS using XML Parser (MSXML)

%prm
p1, p2, "path", p3
p1 = variable: A string type array variable that assigns the contents of RSS
p2 = variable: String type array variable to which the link destination is assigned
"path": URL or file path
p3 = 0 to (5): Number of RSS fields to read

%inst
Load RSS using an XML parser (MSXML).

The result is assigned to p1 and p2. p1 and p2 are automatically initialized as string array variables.

For p3, specify the number of RSS fields to read. If p3 is omitted, 5 will be read.

If the RSS is successfully read, 0 is returned in the system variable stat.
If the acquisition fails, 1 is returned to stat, and if the specified URL or file path is not from RSS, 2 is returned to stat.

%sample
#include "mod_rss.as"

// RSS URL (RSS of HSPWiKi)
	url = "http://quasiquote.org/hspwiki/?c=rss"
// RSS load
	rssload desc, link, url, 6
if stat == 1: dialog "Failed to get.": end
if stat == 2: dialog "Not RSS.": end

// Display contents
mes "Displays the contents of RSS."
	mes url
	mes "----------------------------------------------------------------"
	foreach desc
		mes ""  +cnt + ":" + desc(cnt)
		mes "    (" + link(cnt) + ")"
	loop

	stop
