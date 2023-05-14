
function checkExecutableSkill_FlashCut(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_FLASHCUT);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_FLASHCUT , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_FlashCut(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
	return obj.sq_IsCommandEnable(SKILL_FLASHCUT); 
	obj.sq_IsCommandEnable(SKILL_FLASHCUT);
	}	
	
	
	return true;
}


function onSetState_FlashCut(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FLASHCUTREADY);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FLASHCUTATK);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_FLASHCUTATK);
		obj.sq_PlaySound("SM_BOONGSAN");
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FLASHCUTEND);
	}	
}

function onAttack_FlashCut(obj, damager, boundingBox, isStuck)
{
		
	local id = sq_GetObjectId(damager);
		
	local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_FLASHCUT, false, "character/swordman/flashcut/ap_flashcut.nut", true);				 
		
	if(masterAppendage) 
	{
		sq_HoldAndDelayDie(damager, obj, true, true, true, 400, 200, ENUM_DIRECTION_NEUTRAL , masterAppendage);
	}
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(0);
		obj.sq_WriteDword(id);
		sq_SendCreatePassiveObjectPacketPos(obj,24302, 0, obj.getXPos(), obj.getYPos() + 1, obj.getZPos());
}


function onEndCurrentAni_FlashCut(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_FLASHCUT, STATE_PRIORITY_IGNORE_FORCE, true);
		obj.sq_SendCreatePassiveObjectPacket(700057, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(700058, 0, 500, 0, 70);
		obj.sq_SendCreatePassiveObjectPacket(700059, 0, 0, 0, 80);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_FLASHCUT, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_FlashCut(obj,flagIndex)
{
	if (flagIndex == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FLASHCUTATK);
		obj.sq_SetStaticMoveInfo(0, 3000, 3500, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	return true;
}
