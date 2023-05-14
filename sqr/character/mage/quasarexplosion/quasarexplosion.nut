

function checkExecutableSkill_quasarexplosion(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_quasarexplosion);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_quasarexplosion , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_quasarexplosion(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_quasarexplosion);
		obj.sq_IsCommandEnable(SKILL_quasarexplosion);
	}	
	
	
	return true;
}


function onSetState_quasarexplosion(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	//local num5 = obj.getVar().get_vector(4);
	obj.setSkillSubState(substate);//??çsubstate
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarFinishAdd_Body);
		obj.sq_SendCreatePassiveObjectPacket(25673, 0, 0, 0, 0);
	}
}

function onEndCurrentAni_quasarexplosion(obj)
{
	local substate = obj.getSkillSubState();//?ÈÄ∞ßubstate
	if(substate == 0){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}

}


function onKeyFrameFlag_quasarexplosion(obj,flagIndex)
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
