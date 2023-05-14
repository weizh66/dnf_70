
function checkExecutableSkill_ChargeExplosion(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_CHARGEEXPLOSION);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_CHARGEEXPLOSION , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_ChargeExplosion(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
	return obj.sq_IsCommandEnable(SKILL_CHARGEEXPLOSION); 
	obj.sq_IsCommandEnable(SKILL_CHARGEEXPLOSION);
	}	
	
	
	return true;
}


function onSetState_ChargeExplosion(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CHARGEEXPLOSIONDASH01);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_CHARGEEXPLOSIONATTACK1);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/ChargeExplosion_DS/Move03.ani"), 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CHARGEEXPLOSIONDASH02);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/ChargeExplosion_DS/Move03.ani"), 0, 0);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_CHARGEEXPLOSIONATTACK2);
		obj.sq_SetCurrentDirection(sq_GetOppositeDirection(obj.getDirection()));
		
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CHARGEEXPLOSIONUPPER);
		obj.sq_SetCurrentDirection(sq_GetOppositeDirection(obj.getDirection()));
	}	
}

function onEndCurrentAni_ChargeExplosion(obj)
{
	local substate = obj.getSkillSubState();
	
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_CHARGEEXPLOSION, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_CHARGEEXPLOSION, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_ChargeExplosion(obj,flagIndex)
{
	local id = sq_GetObjectId(obj);
	
	if (flagIndex == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CHARGEEXPLOSIONDASH01);
		obj.sq_SetStaticMoveInfo(0, 800, 800, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	else if (flagIndex == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CHARGEEXPLOSIONDASH02);
		obj.sq_SetStaticMoveInfo(0, 800, 800, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
	}
	else if (flagIndex == 2)
	{
		obj.sq_StartWrite();
		obj.sq_WriteDword(0);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24322, 0, 0, 0, 50);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(1);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24322, 0, 0, 0, 50);
	}
	return true;
}
