
function checkExecutableSkill_pistolcarbine(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_pistolcarbine);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_pistolcarbine , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_pistolcarbine(obj)
{
return true;
}


function onSetState_pistolcarbine(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PistolCarbineStart_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_PistolCarbine);
		obj.sq_SendCreatePassiveObjectPacket(99200, 0, 0, 0, 0);
		obj.setTimeEvent(0,obj.sq_GetIntData(SKILL_pistolcarbine, 4),0,false);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_pistolcarbine STATE_pistolcarbine, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_pistolcarbine, 0);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//時間輪巡
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PistolCarbineLoop_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_PistolCarbine);
		obj.setTimeEvent(0,obj.sq_GetIntData(SKILL_pistolcarbine, 6),0,false);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_pistolcarbine STATE_pistolcarbine, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_pistolcarbine, 1);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//時間輪巡
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PistolCarbineEnd_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_PistolCarbine);
		obj.setTimeEvent(0,obj.sq_GetIntData(SKILL_pistolcarbine, 8),0,false);//第三個0是ontimeevevt執行次數
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_pistolcarbine STATE_pistolcarbine, 0, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_pistolcarbine, 2);
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

function onProc_pistolcarbine(obj)
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

function onEndCurrentAni_pistolcarbine(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_pistolcarbine, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_pistolcarbine, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_pistolcarbine(obj, damager, boundingBox, isStuck)
{
        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_pistolcarbine, false, "character/gunner/pistolcarbine/ap_pistolcarbine.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);
            local holdTime = obj.sq_GetIntData(SKILL_pistolcarbine, 3);
            masterAppendage.sq_SetValidTime( holdTime );
        }
}

function onTimeEvent_pistolcarbine(obj, timeEventIndex, timeEventCount)
{
    local substate = obj.getVar().get_vector(0);

    if (substate == 0)
    {
        if (timeEventIndex == 0)
        {
            if (timeEventCount<= obj.sq_GetIntData(SKILL_pistolcarbine, 5))
            {
                obj.sq_SendCreatePassiveObjectPacket(99201, 0, 165, -7, 110);
                obj.sq_SendCreatePassiveObjectPacket(99201, 0, 150, 7, 110);
            }
        }
    }
    if (substate == 1)
    {
        if (timeEventIndex == 0)
        {
            if (timeEventCount<= obj.sq_GetIntData(SKILL_pistolcarbine, 7))
            {
                obj.sq_SendCreatePassiveObjectPacket(99201, 0, 165, -7, 110);
                obj.sq_SendCreatePassiveObjectPacket(99201, 0, 150, 7, 110);
            }
        }
    }
    if (substate == 2)
    {
        if (timeEventIndex == 0)
        {
            if (timeEventCount<= obj.sq_GetIntData(SKILL_pistolcarbine, 9))
            {
                obj.sq_SendCreatePassiveObjectPacket(99201, 0, 165, -7, 110);
                obj.sq_SendCreatePassiveObjectPacket(99201, 0, 150, 7, 110);
            }
        }
    }
    
}


function onKeyFrameFlag_pistolcarbine(obj,flagIndex)
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


