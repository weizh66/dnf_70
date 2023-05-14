
function checkExecutableSkill_ShengWu(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_SHENGWU);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_SHENGWU , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_ShengWu(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_SHENGWU);
		obj.sq_IsCommandEnable(SKILL_SHENGWU);
	}	
	
	
	return true;
}


function onSetState_ShengWu(obj, state, datas, isResetTimer)
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
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SHENGWU1);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_SHENGWU1);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SHENGWU2);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_SHENGWU2);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SHENGWU3);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_SHENGWU3);
	}
	else if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SHENGWU4);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_SHENGWU4);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 2.0, 2.0);	
}

function onEndCurrentAni_ShengWu(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_SHENGWU, STATE_PRIORITY_IGNORE_FORCE, true);
		obj.sq_SendCreatePassiveObjectPacket(000000, 0, 0, 0, 0);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_SHENGWU, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_SHENGWU, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 3){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_ShengWu(obj,flagIndex)
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
