
function checkExecutableSkill_miraclespliter(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_miraclespliter);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_miraclespliter , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_miraclespliter(obj)
{
return true;
}

function onSetState_miraclespliter(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_MSDash_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_MiracleSpliterDash);
		obj.sq_SetStaticMoveInfo(0, 500, 600, false, 0, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_miraclespliter STATE_miraclespliter, 0, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_miraclespliter);		
		local multiHit = sq_GetLevelData(obj, SKILL_miraclespliter, 2, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//時間輪巡
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_MSAtk_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_MiracleSpliterAtk);
		obj.sq_SendCreatePassiveObjectPacket(99164, 0, 150, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99165, 0, 110, 0, 50);
		obj.sq_SendCreatePassiveObjectPacket(99166, 0, -60, 0, 0);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_miraclespliter STATE_miraclespliter, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_miraclespliter);		
		local multiHit = sq_GetLevelData(obj, SKILL_miraclespliter, 2, skillLevel);
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

function onProc_miraclespliter(obj)
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

function onEndCurrentAni_miraclespliter(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_miraclespliter, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onKeyFrameFlag_miraclespliter(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_miraclespliter);
	
	if(flagIndex == 0) {
		obj.sq_SendCreatePassiveObjectPacket(99167, 0, -10, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99168, 0, -20, 30, 0);
		obj.sq_SendCreatePassiveObjectPacket(99169, 0, 5, 30, 0);
	}
	else if(flagIndex == 1){
		obj.sq_SendCreatePassiveObjectPacket(99167, 0, -10, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99168, 0, -20, 30, 0);
		obj.sq_SendCreatePassiveObjectPacket(99169, 0, 5, 30, 0);
	}
	else if(flagIndex == 2){
		obj.sq_SendCreatePassiveObjectPacket(99167, 0, -10, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99168, 0, -20, 30, 0);
		obj.sq_SendCreatePassiveObjectPacket(99169, 0, 5, 30, 0);
	}
	else if(flagIndex == 3){
		sq_flashScreen(obj,0,0,240,204, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetShake(obj, 240, 5);
	}
	return true;
}


