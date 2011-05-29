//
//			HSP3 OP
//			onion software/onitama 2008/5
//
#include <stdio.h>
#include <string>
#include <map>
#include <set>
#include <vector>
#include <stack>
#include <algorithm>

#include "hsp3op.h"
#include "supio.h"
#include "hsp3r.h"

void UpdateOperands( Block *task )
{
	std::stack<Op*> stack;

	for ( std::vector<Op*>::iterator it=task->operations.begin();
		 it != task->operations.end(); it++ ) {
		Op *op = *it;
		op->operands.clear();
		switch ( op->GetOpCode() ) {
		case PUSH_VAR_OP:
			{
				PushVarOp *pv = (PushVarOp*)op;
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
				stack.push( op );
			}
			break;
		case PUSH_VAR_PTR_OP:
			{
				PushVarPtrOp *pv = (PushVarPtrOp*)op;
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
				stack.push( op );
			}
			break;
		case PUSH_FUNC_PARAM_OP:
		case PUSH_FUNC_PARAM_PTR_OP:
			{
				VarRefOp *pv = (VarRefOp*)op;
				for ( int i = 0; i <  pv->GetArrayDim(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
				stack.push( op );
			}
			break;

		case PUSH_DNUM_OP:
		case PUSH_INUM_OP:
		case PUSH_LABEL_OP:
		case PUSH_STR_OP:
		case PUSH_FUNC_END_OP:
		case PUSH_DEFAULT_OP:
			stack.push( op );
			break;

		case PUSH_CMD_OP:
			while ( stack.top()->GetOpCode() != PUSH_FUNC_END_OP ) {
				op->operands.push_back( stack.top() );
				stack.pop();
			}
			op->operands.push_back( stack.top() );
			stack.pop();
			stack.push( op );
			break;

		case CALC_OP:
			op->operands.push_back( stack.top() );
			stack.pop();
			op->operands.push_back( stack.top() );
			stack.pop();
			stack.push( op );
			break;

		case VAR_INC_OP:
		case VAR_DEC_OP:

		case VAR_CALC_OP:
		case VAR_SET_OP:
			while ( !stack.empty() ) {
				op->operands.push_back( stack.top() );
				stack.pop();
			}
			break;
		case COMPARE_OP:
			op->operands.push_back( stack.top() );
			stack.pop();
			break;
		case CMD_OP:
			{
				CmdOp *pv = (CmdOp*)op;
				for ( int i = 0; i <  pv->GetCmdPNum(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
			}
			break;
		case MODCMD_OP:
			{
				ModCmdOp *pv = (ModCmdOp*)op;
				op->operands.push_back( stack.top() );
				stack.pop();
				for ( int i = 0; i <  pv->GetCmdPNum(); i++ ) {
					op->operands.push_back( stack.top() );
					stack.pop();
				}
			}
			break;
		case TASK_SWITCH_OP:
			break;
		default:
			break;
		}
	}

	// アクセスしている変数をリストアップ
	for ( std::vector<Op*>::iterator it=task->operations.begin();
		 it != task->operations.end(); it++ ) {
		Op *op = *it;

		switch ( op->GetOpCode() ) {
		case PUSH_VAR_OP:
		case PUSH_VAR_PTR_OP:
		case PUSH_FUNC_PARAM_OP:
		case PUSH_FUNC_PARAM_PTR_OP:
		case VAR_SET_OP:
		case VAR_INC_OP:
		case VAR_DEC_OP:
		case VAR_CALC_OP:
			{
				VarRefOp *vr = (VarRefOp*)op;
				task->usedVariables.insert( VarKey( vr->GetVarType(), vr->GetVarNo()) );
			}
			break;
		default:
			break;
		}
	}
}

void AnalyzeTask( Program* program, Block *task )
{
	UpdateOperands( task );

	// 代入の右辺が変数へのポインタの場合、値に置き換える
	while ( true ) {
		bool changed = false;
		for ( std::vector<Op*>::iterator it = task->operations.begin();
			  it != task->operations.end() && !changed; it++ ) {
			Op *op = *it;
			switch ( op->GetOpCode() ) {
			case VAR_INC_OP:
			case VAR_DEC_OP:
			case VAR_CALC_OP:
			case VAR_SET_OP:
				{
				VarRefOp *vro = (VarRefOp*)op;
				if (vro->operands.size() == 1) {
					Op *rhv = vro->operands[0];
					if ( rhv->GetOpCode() == PUSH_VAR_PTR_OP ) {
						PushVarPtrOp *pv = (PushVarPtrOp*)rhv;
						std::find( task->operations.begin(),
								   task->operations.end(),
								   pv)[0]
							= new PushVarOp( pv->GetVarNo(), pv->GetArrayDim() );
						delete pv;
						UpdateOperands( task );
						changed = true;
					}
				}
				}
				break;
			}
		}
		if ( !changed )
			break;
	}

	//	使っている変数
	for ( std::vector<Op*>::iterator it=task->operations.begin();
		 it != task->operations.end(); it++ ) {
		Op *op = *it;
		switch ( op->GetOpCode() ) {
		case PUSH_VAR_OP:
		case PUSH_VAR_PTR_OP:

		case PUSH_FUNC_PARAM_OP:
		case PUSH_FUNC_PARAM_PTR_OP:

		case VAR_INC_OP:
		case VAR_DEC_OP:

		case VAR_CALC_OP:
		case VAR_SET_OP:
			program->varTaskMap[((VarRefOp*)op)->GetVarKey()].insert( task->name );
			break;

		case PUSH_DNUM_OP:
		case PUSH_INUM_OP:
		case PUSH_LABEL_OP:
		case PUSH_STR_OP:
		case PUSH_FUNC_END_OP:
		case PUSH_CMD_OP:
		case CALC_OP:
		case COMPARE_OP:
		case CMD_OP:
		case MODCMD_OP:
		case TASK_SWITCH_OP:
			break;
		default:
			break;
		}
	}
}

void AnalyzeProgram(Program* program) {
	std::map<std::string, Block*>& blocks = program->blocks;
	std::map<VarKey, std::set<std::string> >& varTaskMap = program->varTaskMap;
	std::map<VarKey, VarInfo*>& varInfos = program->varInfos;

	for(std::map<std::string, Block*>::iterator it = blocks.begin(); it != blocks.end(); ++it) {
		Block *block = it->second;
		AnalyzeTask( program, block );

		for (std::set<VarKey>::iterator it2 = block->usedVariables.begin();
			 it2 != block->usedVariables.end(); ++it2) {
			if (varInfos.find(*it2) != varInfos.end())
				continue;
			VarInfo *var = new VarInfo(it2->first, it2->second);
			varInfos[*it2] = var;
		}
	}

	for(std::map<VarKey, std::set<std::string> >::iterator it = varTaskMap.begin();
		it != varTaskMap.end(); ++it) {
		if ( it->second.size() == 0 )
			continue;

		bool localVar = true;

		// 書き込んでから読み込むタスクだけかチェック
		for(std::set<std::string>::iterator it2 = it->second.begin();
			 it2 != it->second.end(); ++it2) {
			Block *block = program->blocks[*it2];
			VarInfo *var = varInfos[it->first];
			VarRefOp* firstAccessOp = NULL;

			for(std::vector<Op*>::iterator it2 = block->operations.begin();
				it2 != block->operations.end(); it2++) {
				Op *op = *it2;
				switch ( op->GetOpCode() ) {
				case PUSH_VAR_PTR_OP:
				case PUSH_VAR_OP:
				case PUSH_FUNC_PARAM_OP:
				case PUSH_FUNC_PARAM_PTR_OP:
				case VAR_SET_OP:
				case VAR_CALC_OP:
				case VAR_INC_OP:
				case VAR_DEC_OP:
				{
					VarRefOp* vrop = (VarRefOp*)op;
					if ( vrop->GetVarNo() != var->val )
						continue;
					if ( op->GetOpCode() == PUSH_VAR_PTR_OP ) {
						localVar = false;
					}
					if ( vrop->GetArrayDim() > 0) {
						localVar = false;
					}
					if ( vrop->IsParam() ) {
						localVar = false;
					}
					if ( !firstAccessOp ) {
						firstAccessOp = vrop;
					}
				}
				break;
				}
			}
			switch (firstAccessOp->GetOpCode()) {
			case VAR_SET_OP:
				break;
			case PUSH_VAR_OP:
			case PUSH_VAR_PTR_OP:
			case PUSH_FUNC_PARAM_OP:
			case PUSH_FUNC_PARAM_PTR_OP:
			case VAR_CALC_OP:
			case VAR_INC_OP:
			case VAR_DEC_OP:
				localVar = false;
				break;
			}
		}

		for (std::set<std::string>::iterator it2 = it->second.begin();
			 it2 != it->second.end(); ++it2) {
			Block *task = blocks[*it2];
			VarInfo *var = varInfos[it->first];

			var->localVar = localVar;
		}
	}
}
