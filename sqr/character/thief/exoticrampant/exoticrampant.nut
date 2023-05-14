
function checkExecutableSkill_exoticrampant(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_exoticrampant);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_exoticrampant , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_exoticrampant(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_exoticrampant);
		obj.sq_IsCommandEnable(SKILL_exoticrampant);
	}	
	
	
	return true;
}


function onSetState_exoticrampant(obj, state, datas, isResetTimer)
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
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ExoticRampantAttack);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ExoticRampantAttack);
		obj.sq_SendCreatePassiveObjectPacket(251164, 0, 50, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ExoticRampantAttackShadow);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ExoticRampantAttack);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ExoticRampantFinalAttack);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ExoticRampantFinalAttack);
		obj.sq_SendCreatePassiveObjectPacket(251164, 0, 50, 0, 0);
	}	
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ExoticRampantFinalAttackShadow);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ExoticRampantFinalAttack);
	}	
	else if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ExoticRampantAttackHitEnd);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ExoticRampantHitEndAttack);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_exoticrampant(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_exoticrampant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_exoticrampant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_exoticrampant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_exoticrampant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 4){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_exoticrampant(obj,flagIndex)
{
	if(!obj)
		return false;

	local isMyControlObject = obj.sq_IsMyControlObject();

	if (isMyControlObject())
	{
		
		obj.sq_SendCreatePassiveObjectPacket(000000, 0, 0, 0, 0);
	}
	return true;
}
