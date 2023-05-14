function checkExecutableSkill_spinningslashvs(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_SPINNINGSLASHVS);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_SPINNINGSLASHVS,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_spinningslashvs(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_spinningslashvs(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_SPINNINGSLASHVS); 
		if(state == 0)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SPINNINGSLASHVS1);
			obj.sq_SendCreatePassiveObjectPacket(36473, 0, 100, 0, 0);
		}
	}

function onEndCurrentAni_spinningslashvs(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}