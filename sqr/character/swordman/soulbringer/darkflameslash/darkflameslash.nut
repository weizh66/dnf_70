 function checkExecutableSkill_DarkFlameSlash(obj)
{
	if (!obj) return false;
	
	local isUse = obj.sq_IsUseSkill(SKILL_DARKFLAMESLASH);
	if (isUse) {
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(0);
		obj.sq_IsEnterSkillLastKeyUnits(SKILL_DARKFLAMESLASH);
		obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}

function checkCommandEnable_DarkFlameSlash(obj)
{
	return true;
}

function onSetState_DarkFlameSlash(obj, state, datas, isResetTimer)
{	
	local state = obj.getVar("state").get_vector(0);
	
	if(state == 0)
	{
		obj.sq_StopMove();
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH_READY_BODY);
	}
	if(state == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH_ATK1_BODY);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkFlameSlash/DFSAtkA01_Slash_01_Dod.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkFlameSlash/DFSAtkA02_Smoke_01.ani"), 0, 0);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKFLAMESLASH_ATK1);
		
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH, STATE_DARKFLAMESLASH, 1, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	if(state == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH_ATK2_BODY);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkFlameSlash/DFSAtkB01_Slash_02_DodA.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkFlameSlash/DFSAtkB02_Slash_02_DodB.ani"), 0, 0);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKFLAMESLASH_ATK2);
		
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH, STATE_DARKFLAMESLASH, 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	if(state == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH_ATK3_BODY);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKFLAMESLASH_ATK1);
		
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH, STATE_DARKFLAMESLASH, 3, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	if(state == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKFLAMESLASH_FINISH_BODY);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKFLAMESLASH_ATK2);
		
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH, STATE_DARKFLAMESLASH, 4, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
}

function onAttack_DarkFlameSlash(obj, damager, boundingBox, isStuck)
{
	local state = obj.getVar("state").get_vector(0);
	
	if(state == 4)
	{
		local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH, STATE_DARKFLAMESLASH, SKL_LVL_COLUMN_IDX_0, 1.0);	
		local id = sq_GetObjectId(damager);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(3);
		obj.sq_WriteDword(id);
		obj.sq_WriteDword(attackBonusRate);
		sq_SendCreatePassiveObjectPacketPos(obj,99999999, 0, obj.getXPos(), obj.getYPos() + 1, obj.getZPos());
	}
}

function onEndCurrentAni_DarkFlameSlash(obj)
{
	local state = obj.getVar("state").get_vector(0);
	
	if(state == 0)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(1);
		obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH, STATE_PRIORITY_USER, true);
	}
	if(state == 1)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(2);
		obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH, STATE_PRIORITY_USER, true);
	}
	if(state == 2)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(3);
		obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH, STATE_PRIORITY_USER, true);
	}
	if(state == 3)
	{
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(4);
		obj.sq_AddSetStatePacket(STATE_DARKFLAMESLASH, STATE_PRIORITY_USER, true);
	}
	if(state == 4)
	{
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, true);
	}
}

function onKeyFrameFlag_DarkFlameSlash(obj,flagIndex)
{
	local id = sq_GetObjectId(obj);
	
	if (flagIndex == 0)
	{
		obj.sq_SetStaticMoveInfo(0, 500, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if (flagIndex == 1)	
	{
		obj.sq_SetStaticMoveInfo(0, 0, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if (flagIndex == 2)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKFLAMESLASH_ATK1);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH , STATE_DARKFLAMESLASH, 1, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	if (flagIndex == 3)
	{
		obj.sq_SetStaticMoveInfo(0, 500, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if (flagIndex == 4)	
	{
		obj.sq_SetStaticMoveInfo(0, 0, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKFLAMESLASH_ATK2);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH , STATE_DARKFLAMESLASH, 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	
	if (flagIndex == 5)
	{
		obj.sq_SetStaticMoveInfo(0, 500, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if (flagIndex == 6)	
	{
		obj.sq_SetStaticMoveInfo(0, 0, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if (flagIndex == 7)
	{
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKFLAMESLASH_ATK3);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH , STATE_DARKFLAMESLASH, 3, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	
	if (flagIndex == 8)
	{
		obj.sq_SetStaticMoveInfo(0, 500, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	if (flagIndex == 9)	
	{
		obj.sq_SetStaticMoveInfo(0, 0, 0, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKFLAMESLASH_FINISH);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_DARKFLAMESLASH , STATE_DARKFLAMESLASH, 4, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}