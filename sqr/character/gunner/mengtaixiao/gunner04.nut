function checkExecutableSkill_gunner04(obj) //��skilll.lst��
{
	if (obj.sq_IsUseSkill(254)) //���ޯ�
	{
	obj.sq_AddSetStatePacket(254 , 1, false); //�����A
	return true;
	}
return false;
}

function checkCommandEnable_gunner04(obj) //��skilll.lst��
{
return true;
}

function onSetState_gunner04(obj, state, datas, isResetTimer) //���r�Ŧ�
{
obj.sq_StopMove();
obj.sq_SetCurrentAnimation(9); //���ʧ@ FLAG
obj.sq_SendCreatePassiveObjectPacket(130001, 0, 0, 0, 0);//���Ы�obj obj�s�� ���� ����XYZ
}

function onEndCurrentAni_gunner04(obj) //���r�Ŧ�
{
obj.sq_AddSetStatePacket(0, 1, false);
}

