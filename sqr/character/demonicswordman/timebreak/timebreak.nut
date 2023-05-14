
function checkExecutableSkill_TimeBreak(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_TIMEBREAK);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_TIMEBREAK , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_TimeBreak(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
	return obj.sq_IsCommandEnable(SKILL_TIMEBREAK); 
	obj.sq_IsCommandEnable(SKILL_TIMEBREAK);
	}	
	
	
	return true;
}


function onSetState_TimeBreak(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIMEBREAK_READY_BODY);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/TimeBreak_DS/TimeBreak_Ready_ConcentRate1.ani"), 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIMEBREAK_ATTACK_BODY);
		obj.sq_SendCreatePassiveObjectPacket(990193, 0, 0, 0, 0);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_TIMEBREAK_END_BODY);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TIMEBREAK);
	}	
}

function onAttack_TimeBreak(obj, damager, boundingBox, isStuck)
{
		
	local id = sq_GetObjectId(damager);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(0);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24321, 0, 0, 0, 0);
}

function onEndCurrentAni_TimeBreak(obj)
{
	local substate = obj.getSkillSubState();
	
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_TIMEBREAK, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_TIMEBREAK, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);

	}
}


function onKeyFrameFlag_TimeBreak(obj,flagIndex)
{
	local id = sq_GetObjectId(obj);
			
	if (flagIndex == 0)
	{
		obj.sq_StartWrite();
		obj.sq_WriteDword(1);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24321, 0, 0, 0, 0);
	}
	return true;
}
