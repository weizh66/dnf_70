function checkExecutableSkill_hellslash(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_HELLSLASH);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_HELLSLASH,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_hellslash(obj)
{
	if (!obj) return false;	
	return true;
}


function onSetState_hellslash(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_HELLSLASH); 
		if(state == 0)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_HELLSLASH1);
			obj.sq_SendCreatePassiveObjectPacket(260170, 0, 0, 0, 0);
		}
		else if(state == 1)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_HELLSLASH2);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_HELLSLASH);
		}
	}

function onEndCurrentAni_hellslash(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_HELLSLASH,STATE_PRIORITY_USER, true);
		}
		else if(state == 1)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}