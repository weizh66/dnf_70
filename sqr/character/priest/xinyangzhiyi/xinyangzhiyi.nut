
function checkExecutableSkill_XinYangZhiYi(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_XINYANGZHIYI);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		//obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_XINYANGZHIYI , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_XinYangZhiYi(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
	return obj.sq_IsCommandEnable(SKILL_XINYANGZHIYI); 
	obj.sq_IsCommandEnable(SKILL_XINYANGZHIYI);
	}	
	
	
	return true;
}


function onSetState_XinYangZhiYi(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	//local num5 = obj.getVar().get_vector(4);
	//local num6 = obj.getVar().get_vector(5);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DIVINEPUNISHMENTCAST);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DIVINEPUNISHMENTREADY);
		sq_SetZVelocity(obj, 600, -600);
	}
		if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DIVINEPUNISHMENTSTART);
		obj.sq_ZStop();
	}
		if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DIVINEPUNISHMENTLOOP);
		obj.sq_SendCreatePassiveObjectPacket(700081, 0, 0, 0, -200);
		obj.sq_ZStop();
	}
		if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DIVINEPUNISHMENTLOOPEND);
		obj.sq_ZStop();
	}
	else if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DIVINEPUNISHMENTFINISH);
		sq_SetZVelocity(obj, -800, -800);
	}	
}

function onEndCurrentAni_XinYangZhiYi(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_XINYANGZHIYI, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_XINYANGZHIYI, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_XINYANGZHIYI, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_XINYANGZHIYI, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_XINYANGZHIYI, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 5){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		obj.sq_SendCreatePassiveObjectPacket(700083, 0, 0, 0, 0);
		obj.sq_ZStop();
	}
}


function onKeyFrameFlag_XinYangZhiYi(obj,flagIndex)
{
	return true;
}
