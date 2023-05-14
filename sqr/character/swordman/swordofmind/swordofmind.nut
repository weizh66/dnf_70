function checkExecutableSkill_SwordOfMind(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_SWORDOFMIND);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_SWORDOFMIND , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_SwordOfMind(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
	return obj.sq_IsCommandEnable(SKILL_SWORDOFMIND); 
	obj.sq_IsCommandEnable(SKILL_SWORDOFMIND);
	}	
	
	
	return true;
}


function onSetState_SwordOfMind(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORDOFMINDCHARGE);
	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORDOFMINDCHARGEATTACK);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_SWORDOFMINDATTACK);
	}	
}

function onAttack_SwordOfMind(obj, damager, boundingBox, isStuck)
{
	
	local id = sq_GetObjectId(damager);
	
	local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_SWORDOFMIND, false, "character/swordman/swordofmind/ap_swordofmind.nut", true);				 
	
	if(masterAppendage) 
    {
		sq_HoldAndDelayDie(damager, obj, true, true, true, 300, 300, ENUM_DIRECTION_NEUTRAL , masterAppendage);
	}
	
		obj.sq_StartWrite();
		obj.sq_WriteDword(0);
		obj.sq_WriteDword(id);
		sq_SendCreatePassiveObjectPacketPos(obj,24303, 0, obj.getXPos(), obj.getYPos() + 1, obj.getZPos());

}

function onEndCurrentAni_SwordOfMind(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_SWORDOFMIND, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_SwordOfMind(obj,flagIndex)
{
	return true;
}