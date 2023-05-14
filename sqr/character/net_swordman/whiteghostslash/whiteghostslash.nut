function checkExecutableSkill_whiteghostslash(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_WHITEGHOSTSLASH);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_WHITEGHOSTSLASH,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_whiteghostslash(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_whiteghostslash(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_WHITEGHOSTSLASH); 
		if(state == 0)
		{

			obj.sq_SetCurrentAnimation(CUSTOM_ANI_WHITEGHOSTSLASH1);
		}
		else if(state == 1)
		{
			obj.sq_SendCreatePassiveObjectPacket(36438, 0, 0, 0, 0);
			obj.sq_SendCreatePassiveObjectPacket(36437, 0, 0, 0, 0);
			obj.sq_SendCreatePassiveObjectPacket(36439, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SWORDDANCEBS1);
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_WHITEGHOSTSLASH2);
		}
	}

function onEndCurrentAni_whiteghostslash(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_WHITEGHOSTSLASH,STATE_PRIORITY_USER, true);
		}
		else if(state == 1)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}