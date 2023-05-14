
function checkExecutableSkill_jackfrosticewater(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_jackfrosticewater);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_jackfrosticewater , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_jackfrosticewater(obj)
{
return true;
}


function onSetState_jackfrosticewater(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JackFrostIcewaterCast_body);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JackFrostIcewaterStartBack_body);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JackFrostIcewaterLoopBack_body);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JackFrostIcewaterLoopBack_body1);
	}
	if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JackFrostIcewaterLoopBackBounce01A_body);
	}
	if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JackFrostIcewaterLoopBackBounce01B_body);
	}
	else if(substate == 6)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_JackFrostIcewaterLoopBackBounce02_body);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_jackfrosticewater(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_jackfrosticewater, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_jackfrosticewater, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_jackfrosticewater, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_jackfrosticewater, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_jackfrosticewater, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 5){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(6);
		obj.sq_AddSetStatePacket(STATE_jackfrosticewater, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 6){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onKeyFrameFlag_jackfrosticewater(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_jackfrosticewater);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_jackfrosticewater);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_jackfrosticewater , STATE_jackfrosticewater, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24334, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99154, 0, 0, 0, 0);
	}
	else if(flagIndex == 2){
		local level	    = sq_GetSkillLevel(obj, SKILL_jackfrosticewater);
		local attack 	= obj.sq_GetBonusRateWithPassive(SKILL_jackfrosticewater , STATE_jackfrosticewater, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(attack.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24335, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99155, 0, 0, 0, 0);
	}
	else if(flagIndex == 3){
		local level	    = sq_GetSkillLevel(obj, SKILL_jackfrosticewater);
		local BonusRate = obj.sq_GetBonusRateWithPassive(SKILL_jackfrosticewater , STATE_jackfrosticewater, 4, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(BonusRate.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24336, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99156, 0, 0, 0, 0);
	}
	return true;
}


