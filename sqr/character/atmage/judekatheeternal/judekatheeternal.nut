
function checkExecutableSkill_judekatheeternal(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_judekatheeternal);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_judekatheeternal , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_judekatheeternal(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_judekatheeternal);
		obj.sq_IsCommandEnable(SKILL_judekatheeternal);
	}	
	
	
	return true;
}


function onSetState_judekatheeternal(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	//local num5 = obj.getVar().get_vector(4);
	obj.setSkillSubState(substate);//??�substate
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JudekaTheEternal_Cast_Body);
		obj.sq_SendCreatePassiveObjectPacket(245829, 0, 0, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JudekaTheEternal_Start_Body);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_judekatheeternal(obj)
{
    local substate = obj.getVar().get_vector(0);
  if (substate == 0)
    {
        obj.getVar().clear_vector();
        obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_judekatheeternal, STATE_PRIORITY_USER, true);
    }
else if(substate == 1)
	{
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
    }

}

function onKeyFrameFlag_judekatheeternal(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_judekatheeternal);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_judekatheeternal);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_judekatheeternal , STATE_judekatheeternal, 0, 1.0);
		local icepower  = sq_GetLevelData(obj, SKILL_judekatheeternal, 1, level);
		local expansionpower   = sq_GetLevelData(obj, SKILL_judekatheeternal, 2, level);
		local explosionpower   = sq_GetLevelData(obj, SKILL_judekatheeternal, 4, level);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_WriteDword(icepower);
		obj.sq_WriteDword(expansionpower);
		obj.sq_WriteDword(explosionpower);
	}
	return true;
}
