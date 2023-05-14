function checkExecutableSkill_suddenstrikevs(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_SUDDENSTRIKEVS);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_SUDDENSTRIKEVS,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_suddenstrikevs(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_suddenstrikevs(obj, state, datas, isResetTimer)
{
		if(!obj) return;
		obj.sq_StopMove();
		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_SUDDENSTRIKEVS); 
		if(state == 0)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SUDDENSTRIKEVS1);
			obj.sq_SendCreatePassiveObjectPacket(36487, 0, 280, -100, 0);
		}
	}

function onEndCurrentAni_suddenstrikevs(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}
	}