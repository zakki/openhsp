/*===================================================================
DllMetricsFunc.cpp
���l�̎擾�Ɋւ���֐����L�q���܂�
===================================================================*/

#include "DllDefnition.h"

/*----------------------------------------------------------------
Footy2SetMetrics
���l�ݒ�
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2SetMetrics(int nID,int nObject,int nValue,bool bRefresh){
	/*�錾*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	
	switch(nObject){
	case SM_MARK_VISIBLE:
		for (int i=0;i<3;i++)
			pFooty->m_cView[i].SetMarkVisible(nValue);
		break;
	case SM_LINENUM_WIDTH:
		for (int i=0;i<3;i++)
			pFooty->m_cView[i].SetLineWidth(nValue);
		break;
	case SM_RULER_HEIGHT:
		for (int i=0;i<3;i++)
			pFooty->m_cView[i].SetRulerHeight(nValue);
		break;
	}

	/*�ĕ`�悳����*/
	if (bRefresh)pFooty->m_cView[0].Refresh();
	return FOOTY2ERR_NONE;
}

/*----------------------------------------------------------------
Footy2GetMetrics
���l�擾
----------------------------------------------------------------*/
FOOTYEXPORT(int) Footy2GetMetrics(int nID,int nObject,int *pValue){
	/*Footy���擾����*/
	CFooty *pFooty = GetFooty(nID);
	if (!pFooty)return FOOTY2ERR_NOID;
	if (!pValue)return FOOTY2ERR_ARGUMENT;

	/*�Ԃ�*/
	switch(nObject){
	case SM_LAPEL_COLUMN:
		*pValue = (int)pFooty->m_cDoc.GetLapelColumn();
		break;
	case SM_LAPEL_MODE:
		*pValue = (int)pFooty->m_cDoc.GetLapelMode();
		break;
	case SM_MARK_VISIBLE:
		*pValue = pFooty->m_cView[0].GetMarkVisible();
		break;
	case SM_LINENUM_WIDTH:
		*pValue = pFooty->m_cView[0].GetLineCountWidth();
		break;
	case SM_RULER_HEIGHT:
		*pValue = pFooty->m_cView[0].GetRulerHeight();
		break;
	default:
		return FOOTY2ERR_ARGUMENT;
	}
	return FOOTY2ERR_NONE;
}

/*[EOF]*/
