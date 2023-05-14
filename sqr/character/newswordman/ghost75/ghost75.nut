function checkExecutableSkill_ghost75(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_ghost75);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_ghost75 , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_ghost75(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_ghost75);
		obj.sq_IsCommandEnable(SKILL_ghost75);
	}	
	
	
	return true;
}

function onSetState_ghost75(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_grab);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_ghost75(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		obj.sq_SendCreatePassiveObjectPacket(88804, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(6600590 0, 100, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(88804, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(88804, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(88804, 0, 0, 0, 0);

}


function onKeyFrameFlag_ghost75(obj,flagIndex)
{
	if(!obj)
		return false;

	local isMyControlObject = obj.sq_IsMyControlObject();

	if (isMyControlObject && flagIndex == 1)
	{
		
		obj.sq_SendCreatePassiveObjectPacket(000000, 0, 0, 0, 0);
	}
	return true;
}