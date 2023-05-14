function checkExecutableSkill_moonspiritslash(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_MOONSPIRITSLASH);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_MOONSPIRITSLASH,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_moonspiritslash(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_moonspiritslash(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_MOONSPIRITSLASH); 
		if(state == 0)
		{
			obj.sq_SendCreatePassiveObjectPacket(36479, 0, -50, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SWORDDANCEBS1);
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_MOONSPIRITSLASH1);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
	}

function onEndCurrentAni_moonspiritslash(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}