
function checkExecutableSkill_DDay(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_DDAY);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_DDAY , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_DDay(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_DDAY);
		obj.sq_IsCommandEnable(SKILL_DDAY);
	}	
	
	
	return true;
}


function onSetState_DDay(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_DDAY);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_DDay(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}


function onKeyFrameFlag_DDay(obj,flagIndex)
{

	if (flagIndex == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DDAY);
		obj.sq_SendCreatePassiveObjectPacket(600021, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_G96 , STATE_G96, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}
