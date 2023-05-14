function checkExecutableSkill_fire1(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_fire1);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_fire1 , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_fire1(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_fire1);
		obj.sq_IsCommandEnable(SKILL_fire1);
	}	
	
	
	return true;
}

function onSetState_fire1(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_grab);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_fire1(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	obj.sq_SendCreatePassiveObjectPacket(38022, 0, 0, 0, 0);

}


function onKeyFrameFlag_fire1(obj,flagIndex)
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