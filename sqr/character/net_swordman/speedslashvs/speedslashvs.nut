function checkExecutableSkill_speedslashvs(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_SPEEDSLASHVS);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_SPEEDSLASHVS,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_speedslashvs(obj)
{
	if (!obj) return false;	
	return true;
}


function onSetState_speedslashvs(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();
		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_SPEEDSLASHVS); 
		if(state == 0)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SPEEDSLASHVS);
			obj.sq_SendCreatePassiveObjectPacket(260164, 0, 0, 0, 0);
		}
	}

function onEndCurrentAni_speedslashvs(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}