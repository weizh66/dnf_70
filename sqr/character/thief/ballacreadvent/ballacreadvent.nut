function checkExecutableSkill_ballacreadvent(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_ballacreadvent);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_ballacreadvent , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_ballacreadvent(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_ballacreadvent);
		obj.sq_IsCommandEnable(SKILL_ballacreadvent);
	}	
	
	
	return true;
}

function onSetState_ballacreadvent(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(72);
}

function onEndCurrentAni_ballacreadvent(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	obj.sq_SendCreatePassiveObjectPacket(19826160, 0, 0, 0, 0);

}


function onKeyFrameFlag_ballacreadvent(obj,flagIndex)
{
	if(!obj)
		return false;

	local isMyControlObject = obj.sq_IsMyControlObject();

	if (isMyControlObject && flagIndex == 1)
	{
		
		obj.sq_SendCreatePassiveObjectPacket(000000, 0, 0, 0, 0);
	}
	return true;
}