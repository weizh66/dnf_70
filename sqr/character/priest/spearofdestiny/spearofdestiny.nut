
function checkExecutableSkill_spearofdestiny(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_spearofdestiny);

	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_spearofdestiny , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_spearofdestiny(obj)
{
return true;
}

function onSetState_spearofdestiny(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_SpearOfDestiny_Cast_body);
	obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_SpearOfDestinyThrow);
	local damage = obj.sq_GetBonusRateWithPassive(SKILL_spearofdestiny , STATE_spearofdestiny, 0, 1.0);
	obj.sq_SetCurrentAttackBonusRate(damage);
		
	obj.sq_SendCreatePassiveObjectPacket(99174, 0, 0, 0, 0);
	obj.sq_SendCreatePassiveObjectPacket(99175, 0, 0, 0, 0);
	obj.sq_SendCreatePassiveObjectPacket(99176, 0, 0, 0, 40);
	obj.sq_SendCreatePassiveObjectPacket(99177, 0, 0, 0, 450);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}

function onEndCurrentAni_spearofdestiny(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_spearofdestiny(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_spearofdestiny);
	
	if(flagIndex == 1) {
		sq_flashScreen(obj,120,60,360,153, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}
	else if(flagIndex == 2){
		local level	    = sq_GetSkillLevel(obj, SKILL_spearofdestiny);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_spearofdestiny , STATE_spearofdestiny, 2, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24341, 0, 300, 15, 150);
		obj.sq_SendCreatePassiveObjectPacket(99170, 0, 300, 15, 0);
	}
	return true;
}


