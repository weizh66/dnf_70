
function checkExecutableSkill_pentagon(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_pentagon);

	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_pentagon , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}

function checkCommandEnable_pentagon(obj)
{
return true;
}

function onSetState_pentagon(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_Pentagon_Body);
		
	obj.sq_SendCreatePassiveObjectPacket(99192, 0, 0, 0, 0);
	obj.sq_SendCreatePassiveObjectPacket(99195, 0, 250, -20, 0);
	obj.sq_SendCreatePassiveObjectPacket(99196, 0, -155, 55, 0);
	obj.sq_SendCreatePassiveObjectPacket(99197, 0, -250, -20, 0);
	obj.sq_SendCreatePassiveObjectPacket(99198, 0, 140, 55, 0);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}

function onEndCurrentAni_pentagon(obj)
{
	obj.sq_SendCreatePassiveObjectPacket(99193, 0, 0, 0, 0);
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_pentagon(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_pentagon);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_pentagon);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_pentagon , STATE_pentagon, 2, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24342, 0, 0, 0, 0);
	}
	return true;
}


