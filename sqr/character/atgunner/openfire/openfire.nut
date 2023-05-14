

function checkExecutableSkill_openfire(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_openfire);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_openfire , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}

function checkCommandEnable_openfire(obj)
{
	return true;
}

function onSetState_openfire(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_ATOpenFireCasting_Body);
		sq_SetZVelocity(obj, 1200, -3000);
		obj.sq_SendCreatePassiveObjectPacket(243051, 0, 300, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(243052, 0, 320, 0, -300);
		obj.sq_SendCreatePassiveObjectPacket(243053, 0, 330, 0, -400);
		obj.sq_SendCreatePassiveObjectPacket(243052, 0, 340, 0, -500);
		obj.sq_SendCreatePassiveObjectPacket(243053, 0, 350, 0, -600);
	local level = sq_GetSkillLevel(obj, SKILL_openfire);
	local attack = sq_GetIntData(obj, SKILL_openfire, 0, level);
	obj.sq_StartWrite();
	obj.sq_WriteDword(attack);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_openfire(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_openfire(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_openfire);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_openfire);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_openfire , STATE_openfire, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_openfire , STATE_openfire, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
	}
	return true;
}

