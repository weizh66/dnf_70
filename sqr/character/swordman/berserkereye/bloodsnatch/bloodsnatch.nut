function checkExecutableSkill_BloodSnatch(obj)
{
	if (!obj) return false;
	
	local isUse = obj.sq_IsUseSkill(SKILL_BLOODSNATCH);
	if (isUse) {
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(0);
		obj.sq_IsEnterSkillLastKeyUnits(SKILL_BLOODSNATCH);
		obj.sq_AddSetStatePacket(STATE_BLOODSNATCH, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}

function checkCommandEnable_BloodSnatch(obj)
{
	return true;
}

function onSetState_BloodSnatch(obj, state, datas, isResetTimer)
{	
	local state = obj.getVar("state").get_vector(0);
	
	if(state == 0)
	{
		obj.sq_StopMove();
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BLOODSNATCHCAST_BODY);
	}
	if(state == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BLOODSNATCHDASH_BODY);
	}
	if(state == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BLOODSNATCHCATCH_BODY);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BLOODSNATCH);
		
		local power = obj.sq_GetPowerWithPassive(SKILL_BLOODSNATCH, STATE_BLOODSNATCH, SKL_LVL_COLUMN_IDX_0, -1, 3.0);
		obj.sq_SetCurrentAttackPower(power);
		
	}
	if(state == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BLOODSNATCHSPIN_BODY);	
	}	
	if(state == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BLOODSNATCHFINISH_BODY);	
	}
}

function onAttack_BloodSnatch(obj, damager, boundingBox, isStuck)
{
	local id = sq_GetObjectId(damager);
		
	obj.sq_StartWrite();
	obj.sq_WriteDword(3);
	obj.sq_WriteDword(id);
	sq_SendCreatePassiveObjectPacketPos(obj,24328, 0, obj.getXPos(), obj.getYPos() + 1, obj.getZPos());
	
	obj.sq_StartWrite();
	obj.sq_WriteDword(4);
	obj.sq_WriteDword(id);
	sq_SendCreatePassiveObjectPacketPos(obj,24328, 0, obj.getXPos(), obj.getYPos() + 1, obj.getZPos());
}

function onEndCurrentAni_BloodSnatch(obj)
{
	local state = obj.getVar("state").get_vector(0);
	
	if(state == 0)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(1);
		obj.sq_AddSetStatePacket(STATE_BLOODSNATCH, STATE_PRIORITY_USER, true);
	}
	if(state == 1)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(2);
		obj.sq_AddSetStatePacket(STATE_BLOODSNATCH, STATE_PRIORITY_USER, true);
	}
	if(state == 2)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(3);
		obj.sq_AddSetStatePacket(STATE_BLOODSNATCH, STATE_PRIORITY_USER, true);
	}
	if(state == 3)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(4);
		obj.sq_AddSetStatePacket(STATE_BLOODSNATCH, STATE_PRIORITY_USER, true);
	}
	if(state == 4)
	{
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, true);
	}
}

function onKeyFrameFlag_BloodSnatch(obj,flagIndex)
{
	if(!obj) return;
	
	if (flagIndex == 0)	
	{
		sq_SetZVelocity(obj, 600, 0);
		obj.sq_SetStaticMoveInfo(0, 900, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if (flagIndex == 1)	
	{
		obj.sq_ZStop();
		obj.sq_SetStaticMoveInfo(0, 0, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	
	if (flagIndex == 2)	
	{
		sq_SetZVelocity(obj, -3000, 0);
		obj.sq_SetStaticMoveInfo(0, 450, 450, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if (flagIndex == 3)	
	{
		obj.sq_ZStop();
		obj.sq_SetStaticMoveInfo(0, 0, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		
		local power = obj.sq_GetPowerWithPassive(SKILL_BLOODSNATCH, STATE_BLOODSNATCH, SKL_LVL_COLUMN_IDX_1, -1, 3.0);
		local id = sq_GetObjectId(obj);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(5);
		obj.sq_WriteDword(id);
		obj.sq_WriteDword(power);
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(990287, 0, 0, 0, 0);
	}
	return true;
}