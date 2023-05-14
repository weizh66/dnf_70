

function checkExecutableSkill_fsc_7(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_fsc_7);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_fsc_7 , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}

function checkCommandEnable_fsc_7(obj)
{
	return true;
}

function onSetState_fsc_7(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_FSCActionBody_Body);
		obj.sq_SendCreatePassiveObjectPacket(243049, 0, 130, 0, 90);
	local level = sq_GetSkillLevel(obj, SKILL_fsc_7);
	local attack = sq_GetIntData(obj, SKILL_fsc_7, 1, level);
	obj.sq_StartWrite();
	obj.sq_WriteDword(attack);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_fsc_7(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_fsc_7(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_fsc_7);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_fsc_7);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_fsc_7 , STATE_fsc_7, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_fsc_7 , STATE_fsc_7, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
	}
	return true;
}

