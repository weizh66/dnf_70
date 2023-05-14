
function checkExecutableSkill_JiWu(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_JIWU);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_JIWU , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_JiWu(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_JIWU);
		obj.sq_IsCommandEnable(SKILL_JIWU);
	}	
	
	
	return true;
}


function onSetState_JiWu(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FINALHEAVENSTARTNEW_BODY);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Start/.ani"), 0, 0);
	
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FINALHEAVENREADYNEW_BODY);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_JIWU2);
		obj.sq_SendCreatePassiveObjectPacket(991186, 0, 60, 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Ready/BackDustReady.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Ready/FrontDustReady_00.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Ready/WindReady_00.ani"), 0, 0);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FINALHEAVENATTACKNEW_BODY);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_JIWU3);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/BackBlastAttack_00.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/BackBlastAttackHit_03.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/BackDustAttack_13.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/FrontBGEffectAttack_02.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/FrontBlastAttack_06.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/FrontBlastAttackHit_32.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/FrontDustAttack_05.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/FrontDustAttackHit_08.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/FrontStoneAttack_06.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(-1, obj.sq_CreateCNRDAnimation("Effect/Animation/FinalHeaven_New/Attack/FrontStoneAttackHit_02.ani"), 0, 0);
	}	
}

function onAttack_JiWu(obj, damager, boundingBox, isStuck)
{
	local id = sq_GetObjectId(damager);
	
	local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_JIWU, false, "character/fighter/jiwu/ap_jiwu.nut", true);
	
	if(masterAppendage) 
	{
		sq_HoldAndDelayDie(damager, obj, true, true, true, 200, 200, ENUM_DIRECTION_NEUTRAL , masterAppendage);
	}
		obj.sq_StartWrite();
		obj.sq_WriteDword(0);
		obj.sq_WriteDword(id);
		sq_SendCreatePassiveObjectPacketPos(obj,24350, 0, obj.getXPos(), obj.getYPos() + 1, obj.getZPos());
}

function onEndCurrentAni_JiWu(obj)
{
	local substate = obj.getSkillSubState();
	
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_JIWU, STATE_PRIORITY_IGNORE_FORCE, true);
		obj.sq_SendCreatePassiveObjectPacket(991183, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(991184, 0, 0, 0, 0);
		
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_JIWU, STATE_PRIORITY_IGNORE_FORCE, true);
		obj.sq_SendCreatePassiveObjectPacket(991185, 0, 0, 0, 0);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_JiWu(obj,flagIndex)
{
	if(!obj)
		return false;

	local isMyControlObject = obj.sq_IsMyControlObject();

	if (isMyControlObject())
	{
		
		obj.sq_SendCreatePassiveObjectPacket(000000, 0, 0, 0, 0);
	}
	return true;
}
