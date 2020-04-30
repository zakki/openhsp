
//
//	HSP3 editor object manager
//	onion software/onitama 2020
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../hsp3/hsp3config.h"
#include "../hsp3/hsp3debug.h"
#include "../hsp3/dpmread.h"
#include "../hsp3/strbuf.h"
#include "../hsp3/strnote.h"

#include "hgio.h"
#include "supio.h"
#include "hspwnd.h"


/*------------------------------------------------------------*/
/*
		Object base interface
*/
/*------------------------------------------------------------*/

texmesPos::texmesPos(void)
{
	texid = -1;
	length = 0;
	maxlength = TEXMESPOS_MAX;
	caret = -1;
	caret_cnt = 0;
}


texmesPos::~texmesPos(void)
{

}


/*------------------------------------------------------------*/
/*
		Object interface
*/
/*------------------------------------------------------------*/

void texmesPos::setString(char *str)
{
	texid = -1;
	msg = str;
	caret_cnt = 0;
}

int texmesPos::getPosX(int id)
{
	if ((id<0)||(id>=length)) return 0;
	return (int)pos[id];
}

int texmesPos::getPosFromX(int x)
{
	int i;
	int res = 0;
	for (i = 0; i < length; i++) {
		if ( pos[i]<=x ) res = i;
	}
	return res;
}

void texmesPos::setCaret(int id)
{
	caret = id;
	caret_cnt = 0;
}

char *texmesPos::getMessage(void)
{
	return (char *)msg.c_str();
}


