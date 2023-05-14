
function checkExecutableSkill_zigadvent(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_zigadvent);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_zigadvent , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_zigadvent(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_zigadvent);
		obj.sq_IsCommandEnable(SKILL_zigadvent);
	}	
	
	
	return true;
}


function onSetState_zigadvent(obj, state, datas, isResetTimer)
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
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_zigadventcast);
		obj.sq_SendCreatePassiveObjectPacket(2501860, 0, 0, 0, 0);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_zigadvent(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		obj.sq_SendCreatePassiveObjectPacket(250186, 0, 200, 0, 0);
	}
}


function onKeyFrameFlag_zigadvent(obj,flagIndex)
{
	if (flagIndex == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_zigadventcast);
		obj.sq_SendCreatePassiveObjectPacket(250186, 0, 100, 0, 0);
	}
	return true;
}

