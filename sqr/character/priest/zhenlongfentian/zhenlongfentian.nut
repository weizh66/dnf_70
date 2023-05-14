
function checkExecutableSkill_ZhenLongFenTian(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_ZHENLONGFENTIAN);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_ZHENLONGFENTIAN , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_ZhenLongFenTian(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
	return obj.sq_IsCommandEnable(SKILL_ZHENLONGFENTIAN); 
	obj.sq_IsCommandEnable(SKILL_ZHENLONGFENTIAN);
	}	
	
	
	return true;
}

function onSetState_ZhenLongFenTian(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_ADVANCEDDRAGON_BRIGHT_BODY);
	obj.sq_SendCreatePassiveObjectPacket(800011, 0, 200, 0, 0);
}

function onEndCurrentAni_ZhenLongFenTian(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_ZhenLongFenTian(obj,flagIndex)
{
	return true;
}
