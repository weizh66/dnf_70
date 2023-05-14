
function checkExecutableSkill_corkscrewblow(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_corkscrewblow);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_corkscrewblow , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_corkscrewblow(obj)
{
return true;
}


function onSetState_corkscrewblow(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CorkscrewBlowReady_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_CorkscrewBlowReady);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_corkscrewblow STATE_corkscrewblow, 0, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_corkscrewblow);		
		local multiHit = sq_GetLevelData(obj, SKILL_corkscrewblow, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CorkscrewBlowAttackA_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_CorkscrewBlowAttack);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_corkscrewblow STATE_corkscrewblow, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_corkscrewblow);		
		local multiHit = sq_GetLevelData(obj, SKILL_corkscrewblow, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CorkscrewBlowAttackB_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_CorkscrewBlowAttack);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_corkscrewblow STATE_corkscrewblow, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_corkscrewblow);		
		local multiHit = sq_GetLevelData(obj, SKILL_corkscrewblow, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CorkscrewBlowAttackB_Body1);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_CorkscrewBlowAttack);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_corkscrewblow STATE_corkscrewblow, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_corkscrewblow);		
		local multiHit = sq_GetLevelData(obj, SKILL_corkscrewblow, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	else if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_CorkscrewBlowEnd_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_CorkscrewBlowFinish);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_corkscrewblow STATE_corkscrewblow, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_corkscrewblow);		
		local multiHit = sq_GetLevelData(obj, SKILL_corkscrewblow, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onProc_corkscrewblow(obj)
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
	else if(substate == 3) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
	else if(substate == 4) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
}

function onEndCurrentAni_corkscrewblow(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_corkscrewblow, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_corkscrewblow, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_corkscrewblow, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_corkscrewblow, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 4){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_corkscrewblow(obj,flagIndex)
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


