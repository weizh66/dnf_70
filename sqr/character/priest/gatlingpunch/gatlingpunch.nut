
function checkExecutableSkill_gatlingpunch(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_gatlingpunch);

	if (isUse) {
		obj.sq_IsEnterSkillLastKeyUnits(SKILL_gatlingpunch);
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_gatlingpunch , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_gatlingpunch(obj)
{
return true;
}

function onSetState_gatlingpunch(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_GatlingPunch_Loop);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_GatlingPunchLoop);
		obj.sq_SendCreatePassiveObjectPacket(99135, 0, 0, 0, 0);//§l©Ç

		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_gatlingpunch STATE_gatlingpunch, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_gatlingpunch);		
		local multiHit = sq_GetLevelData(obj, SKILL_gatlingpunch, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//®É¶¡½ü¨µ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}

	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_GatlingPunch_End);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_GatlingPunchFinish);
		obj.sq_SetStaticMoveInfo(0, 200, 300, false, 450, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_gatlingpunch STATE_gatlingpunch, 3, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_gatlingpunch);		
		local multiHit = sq_GetLevelData(obj, SKILL_gatlingpunch, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//®É¶¡½ü¨µ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}


function onProc_gatlingpunch(obj)
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
}

function onProcCon_gatlingpunch(obj)
{

	if(!obj) return;

	local substate = obj.getSkillSubState();

	if(substate == 0) {
		local bDownKey = obj.isDownSkillLastKey();
		local stateTimer = obj.sq_GetStateTimer();
		local grabMaxTime = obj.sq_GetIntData(SKILL_gatlingpunch, 1);
		
		if(!bDownKey || stateTimer >= grabMaxTime)
		{
			obj.getVar().clear_vector();
			obj.getVar().push_vector(1);
			obj.sq_AddSetStatePacket(STATE_gatlingpunch, STATE_PRIORITY_USER, true);
			return;
		}
	}
	else if(substate == 1) {
		
	}
}

function onEndCurrentAni_gatlingpunch(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		
	}
	else if(substate == 1){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_gatlingpunch(obj, damager, boundingBox, isStuck)
{

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_gatlingpunch, false, "character/priest/gatlingpunch/ap_gatlingpunch.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);

            local holdTime = sq_GetLevelData(obj, SKILL_gatlingpunch, 4, sq_GetSkillLevel(obj, SKILL_gatlingpunch) );

            masterAppendage.sq_SetValidTime( holdTime );
        }
}

function onKeyFrameFlag_gatlingpunch(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_gatlingpunch);
	
	if(flagIndex == 0) {
		obj.sq_SetShake(obj, 60, 2);
	}
	else if(flagIndex == 1){
		obj.sq_SetShake(obj, 80, 3);
	}
	else if(flagIndex == 2){
		sq_flashScreen(obj,10,80,10,204, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}
	else if(flagIndex == 3){
		obj.sq_SendCreatePassiveObjectPacket(99162, 0, 50, 0, 0);
	}
	else if(flagIndex == 4){
		obj.sq_SetShake(obj, 250, 5);
	}
	return true;
}


