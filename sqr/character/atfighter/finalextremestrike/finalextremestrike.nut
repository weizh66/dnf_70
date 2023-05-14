

function checkExecutableSkill_finalextremestrike(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_finalextremestrike);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_finalextremestrike , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_finalextremestrike(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_finalextremestrike);
		obj.sq_IsCommandEnable(SKILL_finalextremestrike);
	}	
	
	
	return true;
}


function onSetState_finalextremestrike(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	//local num5 = obj.getVar().get_vector(4);
	obj.setSkillSubState(substate);//??峴ubstate
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Fireworks_Cast_Body);
		obj.sq_SendCreatePassiveObjectPacket(201810, 0, 0, 0, 0);
	}
}

function onEndCurrentAni_finalextremestrike(obj)
{
	local substate = obj.getSkillSubState();//?閫哀ubstate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_finalextremestrike(obj,flagIndex)
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












