

function checkExecutableSkill_gravitygrenade1(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_gravitygrenade1);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_gravitygrenade1 , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}

function checkCommandEnable_gravitygrenade1(obj)
{
	return true;
}

function onSetState_gravitygrenade1(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_ATOpenFireCasting_Body);
		sq_SetZVelocity(obj, 1200, -3000);
		obj.sq_SendCreatePassiveObjectPacket(99206, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99205, 0, 200, 0, 0);
	local level = sq_GetSkillLevel(obj, SKILL_gravitygrenade1);
	local attack = sq_GetIntData(obj, SKILL_gravitygrenade1, 0, level);
	obj.sq_StartWrite();
	obj.sq_WriteDword(attack);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_gravitygrenade1(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_gravitygrenade1(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_gravitygrenade1);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_gravitygrenade1);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_gravitygrenade1 , STATE_gravitygrenade1, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_gravitygrenade1 , STATE_gravitygrenade1, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
	}
	return true;
}

