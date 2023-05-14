
function checkExecutableSkill_HuoLi(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_HUOLI);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_HUOLI , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_HuoLi(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_HUOLI);
		obj.sq_IsCommandEnable(SKILL_HUOLI);
	}	
	
	
	return true;
}


function onSetState_HuoLi(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_HUOLI1);
		obj.sq_SendCreatePassiveObjectPacket(900073, 0, 0, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_HUOLI2);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_HUOLI3);
	}
	else if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_HUOLI4);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_HuoLi(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_HUOLI, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_HUOLI, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_HUOLI, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 3){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		obj.sq_SendCreatePassiveObjectPacket(900070, 0, 0, 0, 0);
	}
}


function onKeyFrameFlag_HuoLi(obj,flagIndex)
{

	if (flagIndex == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_HUOLI4);
		obj.sq_SendCreatePassiveObjectPacket(900057, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(900065, 0, -40, 0, 60);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUOLI , STATE_HUOLI, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if(flagIndex == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_HUOLI4);
		obj.sq_SendCreatePassiveObjectPacket(900057, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUOLI , STATE_HUOLI, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if(flagIndex == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_HUOLI4);
		obj.sq_SendCreatePassiveObjectPacket(900057, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(900065, 0, -20, 0, 70);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUOLI , STATE_HUOLI, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if(flagIndex == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_HUOLI4);
		obj.sq_SendCreatePassiveObjectPacket(900057, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUOLI , STATE_HUOLI, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}
