

function checkExecutableSkill_gravitygrenade(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_gravitygrenade);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_gravitygrenade , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}

function checkCommandEnable_gravitygrenade(obj)
{
	return true;
}

function onSetState_gravitygrenade(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_GrenadeGravity_body);
		obj.sq_SendCreatePassiveObjectPacket(99206, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99205, 0, 200, 0, 0);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}

function onEndCurrentAni_gravitygrenade(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_gravitygrenade(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_gravitygrenade);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_gravitygrenade);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_gravitygrenade , STATE_gravitygrenade, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_gravitygrenade , STATE_gravitygrenade, 3, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
		obj.sq_SendCreatePassiveObjectPacket(24343, 0, 200, 0, 0);
	}
	return true;
}

