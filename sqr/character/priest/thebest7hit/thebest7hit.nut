
function checkExecutableSkill_thebest7hit(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_thebest7hit);

	if (isUse) {
		obj.sq_IsEnterSkillLastKeyUnits(SKILL_thebest7hit);
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_thebest7hit , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_thebest7hit(obj)
{
return true;
}


function onSetState_thebest7hit(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Atk1Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TheBest7Hit1);
		obj.sq_SendCreatePassiveObjectPacket(99179, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_thebest7hit , STATE_thebest7hit, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
		
		obj.getVar("dama2").clear_obj_vector();
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Atk2Body_01);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TheBest7Hit2);
		obj.sq_SendCreatePassiveObjectPacket(99181, 0, 0, 0, 0);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_thebest7hit STATE_thebest7hit, 1, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_thebest7hit, 1);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Atk3Body_01);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TheBest7Hit3);
		obj.sq_SendCreatePassiveObjectPacket(99183, 0, 0, 0, 0);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_thebest7hit STATE_thebest7hit, 2, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_thebest7hit, 2);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Atk4Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TheBest7Hit4);
		obj.sq_SendCreatePassiveObjectPacket(99185, 0, 0, 0, 0);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_thebest7hit STATE_thebest7hit, 3, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_thebest7hit, 3);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Atk5Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TheBest7Hit5);
		obj.sq_SendCreatePassiveObjectPacket(99187, 0, 0, 0, 0);
		sq_SetZVelocity(obj, 400, -400);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_thebest7hit STATE_thebest7hit, 4, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_thebest7hit, 4);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Atk6Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TheBest7Hit6);
		obj.sq_SendCreatePassiveObjectPacket(99189, 0, 0, 0, -150);
		obj.sq_ZStop();
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_thebest7hit STATE_thebest7hit, 5, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_thebest7hit, 5);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	else if(substate == 6)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Atk7Body_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_TheBest7Hit7);
		sq_SetZVelocity(obj, -500, -500);
		obj.sq_SendCreatePassiveObjectPacket(99191, 0, 0, 0, -150);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_thebest7hit STATE_thebest7hit, 6, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local multiHit = obj.sq_GetIntData(SKILL_thebest7hit, 6);
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

function onProcCon_thebest7hit(obj)
{

	if(!obj) return;

	local substate = obj.getSkillSubState();

	if(substate == 0) {
		
	}
	else if(substate == 1) {
		
	}
	else if(substate == 2) {
		
	}
	else if(substate == 3) {
		
	}
	else if(substate == 4) {
		
	}
	else if(substate == 5) {
		local bDownKey = obj.isDownSkillLastKey();
		local stateTimer = obj.sq_GetStateTimer();
		local grabMaxTime = obj.sq_GetIntData(SKILL_thebest7hit, 7);
		
		if(!bDownKey || stateTimer >= grabMaxTime)
		{
			obj.getVar().clear_vector();
			obj.getVar().push_vector(6);
			obj.sq_AddSetStatePacket(STATE_thebest7hit, STATE_PRIORITY_USER, true);
			return;
		}
	}
	else if(substate == 6) {
		
	}
	
}

function onProc_thebest7hit(obj)
{

	if(!obj) return;

	local substate = obj.getSkillSubState();
	local pAni = obj.sq_GetCurrentAni();
	local currentT = sq_GetCurrentTime(pAni);
	if(substate == 0) 
	{
		
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
	else if(substate == 5) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
	else if(substate == 6) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
}

function onEndCurrentAni_thebest7hit(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
	if (obj.getVar("dama2").get_obj_vector_size() > 0)
	{
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_thebest7hit, STATE_PRIORITY_IGNORE_FORCE, true);
		}else{obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		}
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_thebest7hit, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_thebest7hit, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_thebest7hit, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_thebest7hit, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 5){
		
	}
	else if(substate == 6){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_thebest7hit(obj, damager, boundingBox, isStuck)
{

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_thebest7hit, false, "character/priest/thebest7hit/ap_thebest7hit.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);

            local holdTime = sq_GetLevelData(obj, SKILL_thebest7hit, 0, sq_GetSkillLevel(obj, SKILL_thebest7hit) );
            masterAppendage.sq_SetValidTime( holdTime );
        }
    if (obj.sq_GetSkillSubState(obj) == 0)   
    {
        obj.getVar("dama2").push_obj_vector(damager);
    }
}

function onKeyFrameFlag_thebest7hit(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_thebest7hit);
	
	if(flagIndex == 0) {
		obj.sq_SetShake(obj, 80, 2);
	}
	else if(flagIndex == 1){
		sq_flashScreen(obj,0,160,80,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetShake(obj, 560, 8);
	}
	else if(flagIndex == 2){
		sq_flashScreen(obj,0,160,80,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetShake(obj, 320, 5);
	}
	else if(flagIndex == 3){
		sq_flashScreen(obj,0,160,80,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetShake(obj, 240, 7);
	}
	else if(flagIndex == 4){
		sq_flashScreen(obj,0,160,80,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetShake(obj, 240, 5);
	}
	else if(flagIndex == 5){
		sq_flashScreen(obj,0,160,80,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}
	else if(flagIndex == 6){
		obj.sq_SetShake(obj, 160, 7);
	}
	else if(flagIndex == 7){
		obj.sq_SetShake(obj, 240, 7);
	}
	else if(flagIndex == 8){
		sq_flashScreen(obj,0,160,400,255, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetShake(obj, 320, 7);
	}
	return true;
}



