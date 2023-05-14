
function checkExecutableSkill_HuXiao(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_HUXIAO);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		//obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_HUXIAO , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_HuXiao(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_HUXIAO);
		obj.sq_IsCommandEnable(SKILL_HUXIAO);
	}	
	
	
	return true;
}


function onSetState_HuXiao(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	//local num5 = obj.getVar().get_vector(4);
	//local num6 = obj.getVar().get_vector(5);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERSTART);
		obj.sq_SendCreatePassiveObjectPacket(900089, 0, 0, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERREPEAT);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		obj.sq_SetStaticMoveInfo(0, 300, 400, false, 400, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERENDBACKSTEP);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKESTART);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERENDATKA);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEPUNCH);
	}
	if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERENDATKB);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEUPPER);
	}
	else if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERENDATKC);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEKICK);
	}	
		obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_HuXiao(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_HUXIAO, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_HUXIAO, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_HUXIAO, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_HUXIAO, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_HUXIAO, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 5){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_HuXiao(obj,flagIndex)
{

	if (flagIndex == 1)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 2)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 3)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 4)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 5)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 6)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 7)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 8)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIGERSTRIKEDASH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 9)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERENDBACKSTEP);
		obj.sq_SetStaticMoveInfo(0, -600, -600, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 10)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERENDATKA);
		obj.sq_SetStaticMoveInfo(0, 600, 600, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 11)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERENDATKA);
		obj.sq_SetStaticMoveInfo(0, 0, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		obj.sq_SendCreatePassiveObjectPacket(900087, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if (flagIndex == 12)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIGERENDATKC);
		obj.sq_SendCreatePassiveObjectPacket(900088, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_HUXIAO , STATE_HUXIAO, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}