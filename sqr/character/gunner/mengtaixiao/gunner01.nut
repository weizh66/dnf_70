function checkExecutableSkill_gunner01(obj) //��skilll.lst��
{
	if (obj.sq_IsUseSkill(251)) //�＼��
	{
	obj.sq_AddSetStatePacket(251 , 1, false); //���B
	return true;
	}
return false;
}

function checkCommandEnable_gunner01(obj) //��skilll.lst��
{
return true;
}

function onSetState_gunner01(obj, state, datas, isResetTimer) //���ַ���
{
obj.sq_StopMove();
obj.sq_SetCurrentAnimation(9); //�����?FLAG
obj.sq_SendCreatePassiveObjectPacket(230067, 0, 0, 0, 0);//��?��obj obj��? �ȼ� ����XYZ
}

function onEndCurrentAni_gunner01(obj) //���ַ���
{
obj.sq_AddSetStatePacket(0, 1, false);
}


