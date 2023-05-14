function checkExecutableSkill_ghostdecollation(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_GHOSTDECOLLATION);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_GHOSTDECOLLATION,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_ghostdecollation(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_ghostdecollation(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_GHOSTDECOLLATION); 
		if(state == 0)
		{

			obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOSTDECOLLATION1);
		}
		else if(state == 1)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOSTDECOLLATION2);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SWORDDANCEBS1);
			obj.sq_SendCreatePassiveObjectPacket(36470, 0, 200, 0, 0);
			obj.sq_SendCreatePassiveObjectPacket(36471, 0, 200, 0, 0);
		}
	}

function onEndCurrentAni_ghostdecollation(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_GHOSTDECOLLATION,STATE_PRIORITY_USER, true);
		}
		else if(state == 1)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}