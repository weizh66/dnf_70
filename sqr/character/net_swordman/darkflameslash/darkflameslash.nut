function checkExecutableSkill_darkflameslash(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_DARKFLAMESLASH);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_darkflameslash(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_darkflameslash(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_DARKFLAMESLASH); 
		if(state == 0)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH1);
		}
		else if(state == 1)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH2);
			obj.sq_SendCreatePassiveObjectPacket(26361, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(94);
		}
		else if(state == 2)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH3);
			obj.sq_SendCreatePassiveObjectPacket(26363, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(95);
		}
		else if(state == 3)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH4);
			obj.sq_SetCurrentAttackInfo(94);
		}
		else if(state == 4)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH5);
			obj.sq_SetCurrentAttackInfo(95);
		}
	}

function onEndCurrentAni_darkflameslash(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH,STATE_PRIORITY_USER, true);
		}
		else if(state == 1)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(2);
			obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH,STATE_PRIORITY_USER, true);
		}
		else if(state == 2)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(3);
			obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH,STATE_PRIORITY_USER, true);
		}
		else if(state == 3)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(4);
			obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH,STATE_PRIORITY_USER, true);
		}
		else if(state == 4)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}
	}