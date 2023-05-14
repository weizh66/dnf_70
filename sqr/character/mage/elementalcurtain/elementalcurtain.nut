
function checkExecutableSkill_elementalcurtain(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_elementalcurtain);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_elementalcurtain , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_elementalcurtain(obj)
{
return true;
}


function onSetState_elementalcurtain(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElementalCurtain_Cast_Body);
		obj.sq_SendCreatePassiveObjectPacket(99150, 0, 300, 0, 300);
		obj.sq_SendCreatePassiveObjectPacket(99148, 0, 300, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99147, 0, 300, 0, 0);
	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElementalCurtain_Shoot_Body);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_elementalcurtain(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_elementalcurtain, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onKeyFrameFlag_elementalcurtain(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_elementalcurtain);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_elementalcurtain);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_elementalcurtain , STATE_elementalcurtain, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24330, 0, 300, 0, 0);
	}
	return true;
}


