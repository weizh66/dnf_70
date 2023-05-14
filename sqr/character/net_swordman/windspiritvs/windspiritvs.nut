function checkExecutableSkill_windspiritvs(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_WINDSPIRITVS);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_WINDSPIRITVS,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_windspiritvs(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_windspiritvs(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_WINDSPIRITVS); 
		if(state == 0)
		{
		obj.sq_SendCreatePassiveObjectPacket(36481, 0, 100, 0, 0);
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_WINDSPIRITVS1);
		}
	}

function onEndCurrentAni_windspiritvs(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}
	}