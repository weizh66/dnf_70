function checkExecutableSkill_fire(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_fire);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_fire , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_fire(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_fire);
		obj.sq_IsCommandEnable(SKILL_fire);
	}	
	
	
	return true;
}

function onSetState_fire(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_grab);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_fire(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	obj.sq_SendCreatePassiveObjectPacket(240379, 0, 0, 0, 0);

}


function onKeyFrameFlag_fire(obj,flagIndex)
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