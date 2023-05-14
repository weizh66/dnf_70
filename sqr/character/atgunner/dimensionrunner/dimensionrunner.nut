

function checkExecutableSkill_dimensionrunner(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_dimensionrunner);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_dimensionrunner , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}

function checkCommandEnable_dimensionrunner(obj)
{
	return true;
}

function onSetState_dimensionrunner(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(63);
		obj.sq_SendCreatePassiveObjectPacket(45013, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(45008, 0, 0, 0, 0);
	local level = sq_GetSkillLevel(obj, SKILL_dimensionrunner);
	local attack = sq_GetIntData(obj, SKILL_dimensionrunner, 0, level);
	obj.sq_StartWrite();
	obj.sq_WriteDword(attack);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_dimensionrunner(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_dimensionrunner(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_dimensionrunner);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_dimensionrunner);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_dimensionrunner , STATE_dimensionrunner, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_dimensionrunner , STATE_dimensionrunner, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
	}
	return true;
}

