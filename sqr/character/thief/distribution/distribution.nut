
function checkExecutableSkill_distribution(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_distribution);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_distribution , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_distribution(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_distribution);
		obj.sq_IsCommandEnable(SKILL_distribution);
	}	
	
	
	return true;
}


function onSetState_distribution(obj, state, datas, isResetTimer)
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
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Distribution_AttackA_body);
		obj.sq_SendCreatePassiveObjectPacket(234515, 0, 50, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(251164, 0, 50, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Distribution_AttackB_body);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Distribution_AttackA_body);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Distribution_AttackB_body);
	}
	if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Distribution_AttackA_body);
		obj.sq_SendCreatePassiveObjectPacket(251164, 0, 50, 0, 0);
	}
	if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Distribution_AttackB_body);
	}
	else if(substate == 6)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Distribution_AttackC_body);
		obj.sq_SendCreatePassiveObjectPacket(234521, 0, 50, 0, 0);
	}	
}

function onEndCurrentAni_distribution(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_distribution, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_distribution, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_distribution, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_distribution, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_distribution, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 5){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(6);
		obj.sq_AddSetStatePacket(STATE_distribution, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 6){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_distribution(obj,flagIndex)
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
