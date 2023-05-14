
function checkExecutableSkill_fastdraw(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_fastdraw);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_fastdraw , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_fastdraw(obj)
{
return true;
}


function onSetState_fastdraw(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_LeftHandStart);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_FastDrawBodyAttack);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_fastdraw STATE_fastdraw, 5, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_fastdraw);		
		local multiHit = sq_GetLevelData(obj, SKILL_fastdraw, 0, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_LeftHandTurn);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_FastDrawBodyAttack);
		obj.sq_SendCreatePassiveObjectPacket(8906, 0, -20, 0, 60);
		obj.sq_SendCreatePassiveObjectPacket(11054, 0, 20, 0, -75);//お
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(900061, 0, 55, 0, 14);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_fastdraw STATE_fastdraw, 6, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_fastdraw);		
		local multiHit = sq_GetLevelData(obj, SKILL_fastdraw, 0, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_LeftHandShot);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_LeftHandEnd);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
	}
	if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_RightHandTrun);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_FastDrawBodyAttack);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_fastdraw STATE_fastdraw, 5, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_fastdraw);		
		local multiHit = sq_GetLevelData(obj, SKILL_fastdraw, 0, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_RightHandShot);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
	}
	if(substate == 6)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_RightHandEnd);
		obj.sq_SendCreatePassiveObjectPacket(11054, 0, 20, 0, -75);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(900061, 0, 55, 0, 14);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
	}
	if(substate == 7)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_LeftHandStart_Low);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_FastDrawBodyAttack);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_fastdraw STATE_fastdraw, 6, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_fastdraw);		
		local multiHit = sq_GetLevelData(obj, SKILL_fastdraw, 0, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 8)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_LeftHandTurn_Low);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_FastDrawBodyAttack);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_fastdraw STATE_fastdraw, 5, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_fastdraw);		
		local multiHit = sq_GetLevelData(obj, SKILL_fastdraw, 0, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 9)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_LeftHandShot_Low);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
	}
	if(substate == 10)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_LeftHandEnd_Low);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
	}
	if(substate == 11)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_RightHandTrun_Low);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_FastDrawBodyAttack);
		obj.sq_SendCreatePassiveObjectPacket(11054, 0, 20, 0, -75);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_fastdraw STATE_fastdraw, 5, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_fastdraw);		
		local multiHit = sq_GetLevelData(obj, SKILL_fastdraw, 0, skillLevel);
		print(" multiHit:" + multiHit + " delay:" + delay);
		print(delay / multiHit);
		obj.sq_timer_.setParameter(delay / multiHit, multiHit - 1);
		obj.sq_timer_.resetInstant(0);//丁近ǖ
		obj.getVar("flag").clear_vector();
		obj.getVar("flag").push_vector(delay);
	}
	if(substate == 12)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_RightHandShot_Low);
		obj.sq_SendCreatePassiveObjectPacket(900058, 0, -50, 0, 45);
		obj.sq_SendCreatePassiveObjectPacket(70014, 0, 96, 0, 118);
	}
	else if(substate == 13)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_FastDraw_Body_RightHandEnd_Low);

	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onProc_fastdraw(obj)
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
	}
	else if(substate == 3) 
	{
	}
	else if(substate == 4) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
	else if(substate == 5) 
	{
	}
	else if(substate == 6) 
	{
	}
	else if(substate == 7) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
	else if(substate == 8) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
	else if(substate == 9) 
	{
	}
	else if(substate == 10) 
	{
	}
	else if(substate == 11) 
	{
		if (obj.sq_timer_.isOnEvent(currentT) == true)
			obj.resetHitObjectList();
	}
	else if(substate == 12) 
	{
	}
	else if(substate == 13) 
	{
	}
}

function onEndCurrentAni_fastdraw(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 5){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(6);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 6){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(7);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 7){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(8);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 8){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(9);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 9){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(10);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 10){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(11);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 11){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(12);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 12){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(13);
		obj.sq_AddSetStatePacket(STATE_fastdraw, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 13){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_fastdraw(obj,flagIndex)
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


