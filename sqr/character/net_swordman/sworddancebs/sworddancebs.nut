function checkExecutableSkill_sworddancebs(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_SWORDDANCEBS);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_SWORDDANCEBS,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_sworddancebs(obj)
{
	if (!obj) return false;	
	return true;
}


function onSetState_sworddancebs(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_SWORDDANCEBS); 
		if(state == 0)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORDDANCEBS1);
			obj.sq_SendCreatePassiveObjectPacket(260172, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SWORDDANCEBS1);
			local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SPEEDSLASH , STATE_SPEEDSLASH, 1, 1.0);
			obj.sq_SetCurrentAttackBonusRate(attackBonusRate);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
		else if(state == 1)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORDDANCEBS2);
			obj.sq_SendCreatePassiveObjectPacket(260173, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SWORDDANCEBS1);
			local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SPEEDSLASH , STATE_SPEEDSLASH, 2, 1.0);
			obj.sq_SetCurrentAttackBonusRate(attackBonusRate);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
		else if(state == 2)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORDDANCEBS3);
			obj.sq_SendCreatePassiveObjectPacket(260174, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SWORDDANCEBS1);
			local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SPEEDSLASH , STATE_SPEEDSLASH, 2, 1.0);
			obj.sq_SetCurrentAttackBonusRate(attackBonusRate);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
		else if(state == 3)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORDDANCEBS4);
			obj.sq_SendCreatePassiveObjectPacket(260175, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SWORDDANCEBS1);
			local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SPEEDSLASH , STATE_SPEEDSLASH, 2, 1.0);
			obj.sq_SetCurrentAttackBonusRate(attackBonusRate);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
	}

function onEndCurrentAni_sworddancebs(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_SWORDDANCEBS,STATE_PRIORITY_USER, true);
		}
		else if(state == 1)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(2);
			obj.sq_AddSetStatePacket(STATE_SWORDDANCEBS,STATE_PRIORITY_USER, true);
		}
		else if(state == 2)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(3);
			obj.sq_AddSetStatePacket(STATE_SWORDDANCEBS,STATE_PRIORITY_USER, true);
		}
		else if(state == 3)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}