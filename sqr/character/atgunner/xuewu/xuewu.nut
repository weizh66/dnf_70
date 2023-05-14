
function checkExecutableSkill_XueWu(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_XUEWU);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_XUEWU , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_XueWu(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_XUEWU); 
		obj.sq_IsCommandEnable(SKILL_XUEWU);
	}	
	
	
	return true;
}


function onSetState_XueWu(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_XUEWU);
	obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BLOODNCHAINHOLDATTACK);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_XueWu(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}


function onKeyFrameFlag_XueWu(obj,flagIndex)
{

	if (flagIndex == 1)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BLOODNCHAINHOLDATTACK);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 2)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BLOODNCHAINHOLDATTACK);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_XUEWU);
		obj.sq_SendCreatePassiveObjectPacket(700040, 0, 80, 0, 80);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_XUEWU , STATE_XUEWU, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}
