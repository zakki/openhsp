
//
//	HSP3 stack support
//	(�ėp�X�^�b�N�}�l�[�W���[)
//	(int,double,string�Ȃǂ̉ϒ��f�[�^��push,pop�ł��܂�)
//	onion software/onitama 2004/6
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "stack.h"
#include "hspvar_core.h"
#include "hsp3debug.h"

/*------------------------------------------------------------*/
/*
		system data
*/
/*------------------------------------------------------------*/

int stm_max;
int stm_cur;
STMDATA *mem_stm;

/*------------------------------------------------------------*/
/*
		interface
*/
/*------------------------------------------------------------*/

void StackInit( void )
{
	stm_max = STM_MAX_DEFAULT;
	mem_stm = (STMDATA *)malloc( sizeof( STMDATA ) * stm_max );
	stm_cur = 0;
}

void StackTerm( void )
{
	StackReset();
	free( mem_stm );
}


static void StackAlloc( STMDATA *stm, int size )
{
	stm->mode = STMMODE_ALLOC;
	stm->ptr = (char *)malloc( size );
}

void StackReset( void )
{
	while(1) {
		if ( stm_cur == 0 ) break;
		StackPop();
	}
}

void StackPush( int type, char *data, int size )
{
	STMDATA *stm;
	double *dptr;
	if ( stm_cur > stm_max ) throw HSPERR_STACK_OVERFLOW;
	stm = &mem_stm[ stm_cur ];
	stm->type = type;
	stm->mode = STMMODE_SELF;
	switch( type ) {
	case HSPVAR_FLAG_LABEL:
	case HSPVAR_FLAG_INT:
		stm->ival = *(int *)data;
		stm->ptr = (char *)&(stm->ival);
		stm_cur++;
		return;
	case HSPVAR_FLAG_DOUBLE:
		dptr = (double *)&stm->ival;
		*dptr = *(double *)data;
		stm->ptr = (char *)dptr;
		stm_cur++;
		return;
	default:
		break;
	}
	StackAlloc( stm, size );
	memcpy( stm->ptr, data, size );
	stm_cur++;
}

void StackPush( int type, char *str )
{
	StackPush( type, str, (int)strlen(str)+1 );
}

void *StackPushSize( int type, int size )
{
	STMDATA *stm;
	if ( stm_cur > stm_max ) throw HSPERR_STACK_OVERFLOW;
	stm = &mem_stm[ stm_cur ];
	stm->type = type;
	StackAlloc( stm, size );
	stm_cur++;
	return (void *)stm->ptr;
}

void StackPushi( int val )
{
	STMDATA *stm;
	if ( stm_cur > stm_max ) throw HSPERR_STACK_OVERFLOW;
	stm = &mem_stm[ stm_cur ];
	stm->type = HSPVAR_FLAG_INT;
	stm->mode = STMMODE_SELF;
	stm->ptr = (char *)&(stm->ival);
	stm->ival = val;
	stm_cur++;
}


void StackPop( void )
{
	if ( stm_cur == 0 ) throw HSPERR_UNKNOWN_CODE;
	stm_cur--;
	if ( mem_stm[ stm_cur ].mode ) {
		free( mem_stm[ stm_cur ].ptr );
	}
}


