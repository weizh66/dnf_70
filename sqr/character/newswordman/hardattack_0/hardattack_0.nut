function checkExecutableSkill_hardattack_0(obj)  
{
	if (!obj) return false;

	local isUseSkill = obj.sq_IsUseSkill(SKILL_HARDATTACK_0);
	if (isUseSkill) 
    {

        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(0);
		obj.sq_AddSetStatePacket(STATE_HARDATTACK_0, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}



// ��ų������ ?��? ������ ������ ?���Դϴ�. true�� ����?�� ��ų �������� ?��?�� �˴ϴ�. (�ߵ����� state��  �ҽ����� ó���˴ϴ�.)
function checkCommandEnable_hardattack_0(obj)
{

	return true;
}


function onSetState_HARDATTACK_0(obj, state, datas, isResetTimer)
{

    local state = obj.getVar("state").get_vector(0);
    obj.sq_StopMove();

    if (state == 0)
    {

        obj.sq_SetCurrentAnimation(CUSTOM_ANI_HARDATTACK_READY);

		obj.sq_SetStaticSpeedInfo(SPEED_TYPE_CAST_SPEED, SPEED_TYPE_CAST_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
    }
    if (state == 1)
    {

        local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_HARDATTACK_0, STATE_HARDATTACK_0, 0, 1.0);

        sq_BinaryStartWrite();
        sq_BinaryWriteDword(attackBonusRate);	// attackBonusRate
        sq_BinaryWriteDword(12);	// attackBonusRate
        obj.sq_SendCreatePassiveObjectPacket(24357, 0, 120, 1, 0);

        obj.sq_SetCurrentAnimation(CUSTOM_ANI_HARDATTACK_ATTACK);

		obj.sq_SetStaticSpeedInfo(SPEED_TYPE_CAST_SPEED, SPEED_TYPE_CAST_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
    }

}

function onEndCurrentAni_HARDATTACK_0(obj)
{

    local state = obj.getVar("state").get_vector(0);
    if (state == 0)
    {

        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(1);
		obj.sq_AddSetStatePacket(STATE_HARDATTACK_0, STATE_PRIORITY_USER, true);
    }
    if (state == 1)
    {
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);

    }

}