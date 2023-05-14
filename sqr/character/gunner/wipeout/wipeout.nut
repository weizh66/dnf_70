

function checkExecutableSkill_wipeout(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_wipeout);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_wipeout , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}

function checkCommandEnable_wipeout(obj)
{
	return true;
}

function onSetState_wipeout(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_WipeOutBody_body);
		obj.sq_SendCreatePassiveObjectPacket(24308, 0, 60, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(990032, 0, 60, 0, 0);
	local level = sq_GetSkillLevel(obj, SKILL_wipeout);
	local attack = sq_GetIntData(obj, SKILL_wipeout, 0, level);
	obj.sq_StartWrite();
	obj.sq_WriteDword(attack);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_wipeout(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_wipeout(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_wipeout);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_wipeout);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_wipeout , STATE_wipeout, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_wipeout , STATE_wipeout, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
	}
	return true;
}

