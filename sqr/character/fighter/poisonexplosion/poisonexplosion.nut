
function checkExecutableSkill_poisonexplosion(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_poisonexplosion);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_poisonexplosion , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_poisonexplosion(obj)
{
return true;
}


function onSetState_poisonexplosion(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PoisonExplosion_Start_Body);
		obj.sq_SendCreatePassiveObjectPacket(99137, 0, -50, 0, 0);
	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PoisonExplosion_Kick_Body);
		sq_SetZVelocity(obj,-500,1000);
		local speed = -500;
		obj.sq_SetStaticMoveInfo(0, speed, speed, false);	
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		obj.setTimeEvent(500,300,500,false);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_poisonexplosion(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_poisonexplosion, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onKeyFrameFlag_poisonexplosion(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_poisonexplosion);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_poisonexplosion);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_poisonexplosion , STATE_poisonexplosion, 0, 1.0);
		local poisonProb	= sq_GetLevelData(obj, SKILL_poisonexplosion, 8, level);
		local poisonLevel	= sq_GetLevelData(obj, SKILL_poisonexplosion, 4, level);
		local poisonTime	= sq_GetLevelData(obj, SKILL_poisonexplosion, 11, level);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_WriteDword(poisonProb);
		obj.sq_WriteDword(poisonLevel);
		obj.sq_WriteDword(poisonTime);
		obj.sq_SendCreatePassiveObjectPacket(24318, 0, 190, 30, 85);
	}
	return true;
}


