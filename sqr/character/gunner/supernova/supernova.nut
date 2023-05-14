
function checkExecutableSkill_SuperNova(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_SUPERNOVA);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_SUPERNOVA , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_SuperNova(obj)
{
return true;
}


function onSetState_SuperNova(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_SUPERNOVA);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_SuperNova(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}


function onKeyFrameFlag_SuperNova(obj,flagIndex)
{

	if (flagIndex == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SUPERNOVA);
		obj.sq_SendCreatePassiveObjectPacket(990175, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_SUPERNOVA , STATE_SUPERNOVA, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}
