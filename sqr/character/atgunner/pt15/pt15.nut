
function checkExecutableSkill_PT15(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_PT15);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_PT15 , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_PT15(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_PT15);
		obj.sq_IsCommandEnable(SKILL_PT15);
	}	
	
	
	return true;
}


function onSetState_PT15(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PT15READY);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PT15BACKSHOT);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PT15NORMALSHOT);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_PT15(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_PT15, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_PT15, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_PT15(obj,flagIndex)
{

	if (flagIndex == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PT15BACKSHOT);
		obj.sq_SendCreatePassiveObjectPacket(900075, 0, 0, 0, 80);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_PT15 , STATE_PT15, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if(flagIndex == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PT15NORMALSHOT);
		obj.sq_SendCreatePassiveObjectPacket(900074, 0, 0, 0, 90);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_PT15 , STATE_PT15, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}
