function checkExecutableSkill_Jupiter(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_JUPITER);
	if (isUse)
	{
		obj.getVar("jupiter").clear_vector();
		obj.getVar("jupiter").push_vector(0);
		obj.sq_AddSetStatePacket(STATE_JUPITER , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_Jupiter(obj)
{
	if (!obj) return false;

	return true;
}

function onSetState_Jupiter(obj, state, datas, isResetTimer)
{
	if(!obj) return;
	local subState = obj.getVar("jupiter").get_vector(0);
	obj.sq_StopMove();
	if(subState == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JUPITER_PICKUP);

		local appendage = CNSquirrelAppendage.sq_AppendAppendage(obj, obj, SKILL_JUPITER, true, "character/newpriest/jupiter/ap_jupiter.nut", false);
		appendage.sq_SetValidTime(180000);
		CNSquirrelAppendage.sq_Append(appendage, obj, obj);
	}
	else if(subState == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JUPITER_ATTACK_DASH);
	}
	else if(subState == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JUPITER_ATTACK_JUMP);
	}
	else if(subState == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JUPITER_ATTACK_UPPER);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}

function onEndCurrentAni_Jupiter(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_Jupiter(obj,flagIndex)
{
	if(!obj)
		return false;
	if(flagIndex == 10001)
	{
		obj.sq_SendCreatePassiveObjectPacket(2019090303, 0, 120, 0, 0);
	}
	else if(flagIndex == 10003)
	{
		obj.sq_SendCreatePassiveObjectPacket(2019090301, 0, -180, 0, 0);

		sq_SetMyShake(obj,8,50);
	}
	return true;
}
