
function checkExecutableSkill_msc7(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_msc7);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_msc7 , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_msc7(obj)
{
return true;
}

function onSetState_msc7(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_MSC7MotionA_Body);
	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_MSC7MotionB_Body);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_msc7(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_msc7, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onKeyFrameFlag_msc7(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_msc7);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_msc7);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_msc7 , STATE_msc7, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24345, 0, 168, -1, 92);
		obj.sq_SendCreatePassiveObjectPacket(99220, 0, 168, -1, 92);
	}
	else if(flagIndex == 2){
		obj.sq_SetShake(obj, 150, 5);
	}
	return true;
}


