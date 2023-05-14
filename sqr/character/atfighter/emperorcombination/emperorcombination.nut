
function checkExecutableSkill_emperorcombination(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_emperorcombination);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_emperorcombination , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_emperorcombination(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_emperorcombination);
		obj.sq_IsCommandEnable(SKILL_emperorcombination);
	}	
	
	
	return true;
}


function onSetState_emperorcombination(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	//local num5 = obj.getVar().get_vector(4);
	obj.setSkillSubState(substate);//?銮substate
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_EmperorCombinationBody_01);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_EmperorCombinationAttack1);
		obj.sq_SendCreatePassiveObjectPacket(230012, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(700043, 0, 0, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_EmperorCombinationBody_02);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		obj.sq_SendCreatePassiveObjectPacket(230015, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(230017, 0, 0, 0, 0);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_EmperorCombinationBody_03);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_EmperorCombinationAttack3);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_emperorcombination(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_emperorcombination, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_emperorcombination, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

