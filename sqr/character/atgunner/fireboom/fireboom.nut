

function checkExecutableSkill_fireboom(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_fireboom);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_fireboom , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}

function checkCommandEnable_fireboom(obj)
{
	return true;
}

function onSetState_fireboom(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(63);
		obj.sq_SendCreatePassiveObjectPacket(35500, 0, 0, 0, 0);
	local level = sq_GetSkillLevel(obj, SKILL_fireboom);
	local attack = sq_GetIntData(obj, SKILL_fireboom, 0, level);
	obj.sq_StartWrite();
	obj.sq_WriteDword(attack);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_fireboom(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_fireboom(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_fireboom);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_fireboom);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_fireboom , STATE_fireboom, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_fireboom , STATE_fireboom, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
	}
	return true;
}

