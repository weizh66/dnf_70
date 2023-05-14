 function checkExecutableSkill_Rage(obj)
{
	if (!obj) return false;
	
	local isUse = obj.sq_IsUseSkill(SKILL_RAGE);
	if (isUse) {
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(0);
		obj.sq_IsEnterSkillLastKeyUnits(SKILL_RAGE);
		obj.sq_AddSetStatePacket(STATE_RAGE, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}

function checkCommandEnable_Rage(obj)
{
	return true;
}

function onSetState_Rage(obj, state, datas, isResetTimer)
{	
	local state = obj.getVar("state").get_vector(0);
	
	if(state == 0)
	{
		obj.sq_StopMove();
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_RAGESTARTBODY_BODY);	
	}
	if(state == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_RAGELOOP01BODY_BODY);
	}
	if(state == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_RAGELOOP02BODY_BODY);
	}
	if(state == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_RAGELOOP03BODY_BODY);	
	}	
	if(state == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_RAGEENDBODY_BODY);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_RAGEEND);
		
		local power = obj.sq_GetPowerWithPassive(SKILL_RAGE, STATE_RAGE, SKL_LVL_COLUMN_IDX_2, -1, 3.0);
		obj.sq_SetCurrentAttackPower(power);
	}
}

function onEndCurrentAni_Rage(obj)
{
	local state = obj.getVar("state").get_vector(0);
	
	if(state == 0)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(1);
		obj.sq_AddSetStatePacket(STATE_RAGE, STATE_PRIORITY_USER, true);
	}
	if(state == 1)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(2);
		obj.sq_AddSetStatePacket(STATE_RAGE, STATE_PRIORITY_USER, true);
	}
	if(state == 2)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(3);
		obj.sq_AddSetStatePacket(STATE_RAGE, STATE_PRIORITY_USER, true);
	}
	if(state == 3)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(4);
		obj.sq_AddSetStatePacket(STATE_RAGE, STATE_PRIORITY_USER, true);
	}
	if(state == 4)
	{
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, true);
	}
}

function onKeyFrameFlag_Rage(obj,flagIndex)
{
	if(!obj) return;
	
	local id = sq_GetObjectId(obj);
	
	if (flagIndex == 0)	
	{
		local power = obj.sq_GetPowerWithPassive(SKILL_RAGE, STATE_RAGE, SKL_LVL_COLUMN_IDX_0, -1, 2.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(6);
		obj.sq_WriteDword(id);
		obj.sq_WriteDword(power);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
	}	
	else if (flagIndex == 1)	
	{
		obj.sq_StartWrite();
		obj.sq_WriteDword(10);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(11);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(12);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(13);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
	}
	else if (flagIndex == 2)	
	{
		local power = obj.sq_GetPowerWithPassive(SKILL_RAGE, STATE_RAGE, SKL_LVL_COLUMN_IDX_1, -1, 6.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(7);
		obj.sq_WriteDword(id);
		obj.sq_WriteDword(power);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
	}	
	else if (flagIndex == 3)	
	{
		local power = obj.sq_GetPowerWithPassive(SKILL_RAGE, STATE_RAGE, SKL_LVL_COLUMN_IDX_1, -1, 6.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(8);
		obj.sq_WriteDword(id);
		obj.sq_WriteDword(power);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
	}	
	else if (flagIndex == 4)	
	{
		local power = obj.sq_GetPowerWithPassive(SKILL_RAGE, STATE_RAGE, SKL_LVL_COLUMN_IDX_1, -1, 6.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(9);
		obj.sq_WriteDword(id);
		obj.sq_WriteDword(power);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
	}
	else if (flagIndex == 5)	
	{
		obj.sq_StartWrite();
		obj.sq_WriteDword(14);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(15);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(16);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(17);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
	}
	return true;
}
