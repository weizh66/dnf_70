function checkExecutableSkill_oneslashvs(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_ONESLASHVS);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_ONESLASHVS,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_oneslashvs(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_oneslashvs(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_ONESLASHVS); 
		if(state == 0)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_ONESLASHVS1);
			obj.sq_SendCreatePassiveObjectPacket(260162, 0, 0, 0, 0);
		}
	}

function onEndCurrentAni_oneslashvs(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}