
function checkExecutableSkill_deadlyapproach(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_deadlyapproach);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_deadlyapproach , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_deadlyapproach(obj)
{
return true;
}


function onSetState_deadlyapproach(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DeadlyApproach_Start_Body);
		sq_SetZVelocity(obj,1100,-5500);
		local speed = 1000;
		obj.sq_SetStaticMoveInfo(0, speed, speed, false);	
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		obj.setTimeEvent(500,300,500,false);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DeadlyApproach_Air_Body);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DeadlyApproach_Fall_Body);
	}
	else if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DeadlyApproach_End_Body);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onProc_deadlyapproach(obj)
{
	local substate = obj.getSkillSubState();
						
		local ParticleObj = obj.getMyPassiveObject(24309,0);
		local angle = sq_GetIntData(obj, SKILL_deadlyapproach, 1);
			if (ParticleObj)
				{
					sq_SetCustomRotate(ParticleObj,sq_ToRadian(angle.tofloat()));
				}
		local ParticleObj1 = obj.getMyPassiveObject(24309,1);
		local angle1 = sq_GetIntData(obj, SKILL_deadlyapproach, 1);
			if (ParticleObj1)
				{
					sq_SetCustomRotate(ParticleObj1,sq_ToRadian(angle1.tofloat()));
				}
  if (substate == 2)
  {
    if (obj.getZPos() <= 0)
    {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_deadlyapproach, STATE_PRIORITY_IGNORE_FORCE, true);
    }
  }
}

function onEndCurrentAni_deadlyapproach(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_deadlyapproach, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_deadlyapproach, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_deadlyapproach, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 3){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_deadlyapproach(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_deadlyapproach);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_deadlyapproach);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_deadlyapproach , STATE_deadlyapproach, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_deadlyapproach , STATE_deadlyapproach, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
		obj.sq_SendCreatePassiveObjectPacket(24309, 0, -100, 0, 65);
	}
	else if(flagIndex == 2) {
		local level	    = sq_GetSkillLevel(obj, SKILL_deadlyapproach);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_deadlyapproach , STATE_deadlyapproach, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_deadlyapproach , STATE_deadlyapproach, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
		obj.sq_SendCreatePassiveObjectPacket(24309, 0, -100, 0, 65);
	}
	return true;
}


