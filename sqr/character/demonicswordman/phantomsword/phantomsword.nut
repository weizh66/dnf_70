
function checkExecutableSkill_PhantomSword(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_PHANTOMSWORD);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_PHANTOMSWORD , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_PhantomSword(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_PHANTOMSWORD);
		obj.sq_IsCommandEnable(SKILL_PHANTOMSWORD);
	}	
	
	
	return true;
}


function onSetState_PhantomSword(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_PSREADYACTION_BODY);
}

function onEndCurrentAni_PhantomSword(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}


function onKeyFrameFlag_PhantomSword(obj,flagIndex)
{
	local id = sq_GetObjectId(obj);
	
	if (flagIndex == 0)
	{
		obj.sq_StartWrite();
		obj.sq_WriteDword(0);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24317, 0, 220, 0, 0);
	}
	if (flagIndex == 1)
	{
		obj.sq_SendCreatePassiveObjectPacket(990192, 0, 220, 0, 0);
	}
	return true;
}
