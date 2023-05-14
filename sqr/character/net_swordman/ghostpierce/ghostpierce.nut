function checkExecutableSkill_ghostpierce(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_GHOSTPIERCE);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_GHOSTPIERCE,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_ghostpierce(obj)
{
	if (!obj) return false;	
	return true;
}



function onSetState_ghostpierce(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_GHOSTPIERCE); 
		if(state == 0)
		{

			obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOSTPIERCE1);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
		else if(state == 1)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOSTPIERCE2);
			obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_HELLSLASH);
			obj.sq_SendCreatePassiveObjectPacket(260159, 0, 0, -67, 0);
			obj.sq_SendCreatePassiveObjectPacket(260160, 0, 224, 0, 0);
			
			local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_GHOSTPIERCE , STATE_GHOSTPIERCE, 0, 1.0);
			obj.sq_SetCurrentAttackBonusRate(attackBonusRate);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
		else if(state == 2)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOSTPIERCE3);
			obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
		}
	}

function onEndCurrentAni_ghostpierce(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_GHOSTPIERCE,STATE_PRIORITY_USER, true);
		}
		else if(state == 1)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(2);
			obj.sq_AddSetStatePacket(STATE_GHOSTPIERCE,STATE_PRIORITY_USER, true);
		}
		else if(state == 2)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}