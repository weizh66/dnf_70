
function checkExecutableSkill_blt(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_blt);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_blt , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_blt(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_blt);
		obj.sq_IsCommandEnable(SKILL_blt);
	}	
	
	
	return true;
}


function onSetState_blt(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_G96);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_blt(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}


function onKeyFrameFlag_blt(obj,flagIndex)
{

	if (flagIndex == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_G96);
		obj.sq_SendCreatePassiveObjectPacket(130007, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_blt , STATE_blt, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}
