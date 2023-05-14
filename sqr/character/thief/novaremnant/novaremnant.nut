
function checkExecutableSkill_novaremnant(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_novaremnant);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_novaremnant , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_novaremnant(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_novaremnant);
		obj.sq_IsCommandEnable(SKILL_novaremnant);
	}	
	
	
	return true;
}


function onSetState_novaremnant(obj, state, datas, isResetTimer)
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
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_NovaRemnantJumpCasting_03);
		obj.sq_SendCreatePassiveObjectPacket(234525, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(251164, 0, 50, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_novaremnant_casting_body);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_novaremnant_jump_body);
	}	
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_novaremnant_finish_body);
		obj.sq_SendCreatePassiveObjectPacket(251164, 0, 50, 0, 0);
	}	
	else if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_novaremnant_hitend_body);
	}	
	else if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_novaremnant_hitend_body);
		obj.sq_SendCreatePassiveObjectPacket(234529, 0, 0, 0, 0);
	}	

}

function onEndCurrentAni_novaremnant(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_novaremnant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_novaremnant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_novaremnant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_novaremnant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_novaremnant, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 5){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_novaremnant(obj,flagIndex)
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
