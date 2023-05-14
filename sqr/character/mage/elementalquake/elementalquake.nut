
function checkExecutableSkill_elementalquake(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_elementalquake);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_elementalquake , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_elementalquake(obj)
{
return true;
}


function onSetState_elementalquake(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElementalQuake_CastingStart_Body);
		obj.sq_SendCreatePassiveObjectPacket(99151, 0, 380, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElementalQuake_CastingLoopA_Body);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElementalQuake_CastingLoopB_Body);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElementalQuake_CastingLoopC_Body);
	}
	else if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElementalQuake_CastingEnd_Body);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_elementalquake(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_elementalquake, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_elementalquake, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_elementalquake, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_elementalquake, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 4){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onKeyFrameFlag_elementalquake(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_elementalquake);
	
	if(flagIndex == 1) {
		obj.sq_SetShake(obj, 160, 2);
		
		local level	    = sq_GetSkillLevel(obj, SKILL_elementalquake);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_elementalquake , STATE_elementalquake, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24331, 0, 380, 0, 0);
	}
	else if(flagIndex == 2){
		obj.sq_SetShake(obj, 160, 2);
	}
	return true;
}


