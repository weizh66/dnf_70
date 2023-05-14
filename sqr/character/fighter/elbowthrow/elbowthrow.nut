
function checkExecutableSkill_elbowthrow(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_elbowthrow);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_elbowthrow , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_elbowthrow(obj)
{
return true;
}


function onSetState_elbowthrow(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElbowThrowTurnHeelStart);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ElbowThrowTurnHeelStart);
		obj.sq_SendCreatePassiveObjectPacket(99135, 0, 0, 0, 0);//吸怪

		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_elbowthrow STATE_elbowthrow, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_elbowthrow);		
		local multiHit = sq_GetLevelData(obj, SKILL_elbowthrow, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//時間輪巡
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);

		obj.getVar("dama2").clear_obj_vector();

	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElbowThrowTurnHeelLoop);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ElbowThrowTurnHeelLoop);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_elbowthrow STATE_elbowthrow, 4, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_elbowthrow);		
		local multiHit = sq_GetLevelData(obj, SKILL_elbowthrow, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//時間輪巡
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElbowThrowTurnHeelLoop);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ElbowThrowTurnHeelEnd);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_elbowthrow STATE_elbowthrow, 9, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_elbowthrow);		
		local multiHit = sq_GetLevelData(obj, SKILL_elbowthrow, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//時間輪巡
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}


function onProc_elbowthrow(obj)
{

	if(!obj) return;

	local substate = obj.getSkillSubState();
	local pAni = obj.sq_GetCurrentAni();
	local currentT = sq_GetCurrentTime(pAni);
	if(substate == 0) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
	else if(substate == 1) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
	else if(substate == 2) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}

}


function onEndCurrentAni_elbowthrow(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
	if (obj.getVar("dama2").get_obj_vector_size() > 0)
	{
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_elbowthrow, STATE_PRIORITY_IGNORE_FORCE, true);
		}else{obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		}
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_elbowthrow, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_SendCreatePassiveObjectPacket(99136, 0, 150, 0, 0);
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_elbowthrow(obj, damager, boundingBox, isStuck)
{

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_elbowthrow, false, "character/fighter/elbowthrow/ap_elbowthrow.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);

            local holdTime = sq_GetLevelData(obj, SKILL_elbowthrow, 7, sq_GetSkillLevel(obj, SKILL_elbowthrow) );

            masterAppendage.sq_SetValidTime( holdTime );
        }
    if (obj.sq_GetSkillSubState(obj) == 0)   
    {
        obj.getVar("dama2").push_obj_vector(damager);
    }
}

function onKeyFrameFlag_elbowthrow(obj,flagIndex)
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


