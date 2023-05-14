
function checkExecutableSkill_bloodmarble(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_bloodmarble);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_bloodmarble , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_bloodmarble(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_bloodmarble);
		obj.sq_IsCommandEnable(SKILL_bloodmarble);
	}	
	
	
	return true;
}


function onSetState_bloodmarble(obj, state, datas, isResetTimer)
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
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_bloodmarbleextractready_body);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_bloodmarbleextractLoop_body);
		obj.sq_PlaySound("SM_bloodmarble_02");
		obj.sq_SetStaticMoveInfo(0, 2800, 200, false, 700, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SendCreatePassiveObjectPacket(9000091, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(9000098, 0, 0, 0, 0);
	}	
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_bloodmarblethrow_body);
		obj.sq_SendCreatePassiveObjectPacket(70005800, 0, 0, 0, 0);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_bloodmarble(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_bloodmarble, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_bloodmarble, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_bloodmarble(obj,flagIndex)
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
