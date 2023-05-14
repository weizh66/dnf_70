



function checkExecutableSkill_nenofbrilliance(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_nenofbrilliance);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_nenofbrilliance , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_nenofbrilliance(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_nenofbrilliance);
		obj.sq_IsCommandEnable(SKILL_nenofbrilliance);
	}	
	
	
	return true;
}


function onSetState_nenofbrilliance(obj, state, datas, isResetTimer)
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
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_NenOfBrillianceCast);
		obj.sq_SendCreatePassiveObjectPacket(258400, 0, 0, 0, 0);
		sq_SetZVelocity(obj, 700, -1200);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_NenOfbrillianceCharge);


		obj.sq_ZStop();
	}	
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_NenOfbrillianceCharge);
		obj.sq_ZStop();
	}	
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_NenOfbrillianceCharge);
		obj.sq_ZStop();
	}	
	else if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_NenOfbrillianceFinish);
		obj.sq_SendCreatePassiveObjectPacket(258405, 0, 0, 0, -180);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_nenofbrilliance(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_nenofbrilliance, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_nenofbrilliance, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_nenofbrilliance, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_nenofbrilliance, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 4){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_nenofbrilliance(obj,flagIndex)
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
