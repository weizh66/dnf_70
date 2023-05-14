function checkExecutableSkill_speedslash(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_SPEEDSLASH);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_SPEEDSLASH,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_speedslash(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_speedslash(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_SPEEDSLASH); 
		if(state == 0)
		{

			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SPEEDSLASH1);
			obj.sq_SendCreatePassiveObjectPacket(260158, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SPEEDSLASH1);
			local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SPEEDSLASH , STATE_SPEEDSLASH, 0, 1.0);//動態0
			obj.sq_SetCurrentAttackBonusRate(attackBonusRate);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
		else if(state == 1)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SPEEDSLASH2);
			obj.sq_SendCreatePassiveObjectPacket(260157, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SPEEDSLASH2);
			local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SPEEDSLASH , STATE_SPEEDSLASH, 1, 1.0);//動態0
			obj.sq_SetCurrentAttackBonusRate(attackBonusRate);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);//
		}
		else if(state == 2)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_SPEEDSLASH3);
			obj.sq_SendCreatePassiveObjectPacket(260155, 0, 0, 0, 0);
			obj.sq_SendCreatePassiveObjectPacket(260156, 0, 0, 0, 0);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_SPEEDSLASH3);
			local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SPEEDSLASH , STATE_SPEEDSLASH, 2, 1.0);//動態0
			obj.sq_SetCurrentAttackBonusRate(attackBonusRate);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
	}

function onEndCurrentAni_speedslash(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_SPEEDSLASH,STATE_PRIORITY_USER, true);
		}
		else if(state == 1)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(2);
			obj.sq_AddSetStatePacket(STATE_SPEEDSLASH,STATE_PRIORITY_USER, true);
		}
		else if(state == 2)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}