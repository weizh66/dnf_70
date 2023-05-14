
function checkExecutableSkill_demolitionpunch(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_demolitionpunch);

	if (isUse) {
		obj.sq_IsEnterSkillLastKeyUnits(SKILL_demolitionpunch);
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_demolitionpunch , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_demolitionpunch(obj)
{
return true;
}

function onSetState_demolitionpunch(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DemolitionPunch_A_Body);

	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DemolitionPunch_B_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DemolitionPunch);
		local pAttack = sq_GetCurrentAttackInfo(obj);
		local attackRate = obj.sq_GetBonusRateWithPassive(SKILL_demolitionpunch STATE_demolitionpunch, 0, 1.0);
		sq_SetCurrentAttackBonusRate(pAttack, attackRate);
		local ani = obj.sq_GetCurrentAni();
		local delay = 0; 
		if(ani)
		delay = ani.getDelaySum(false);
		local skillLevel = sq_GetSkillLevel(obj, SKILL_demolitionpunch);		
		local multiHit = sq_GetLevelData(obj, SKILL_demolitionpunch, 2, skillLevel);
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

function onProc_demolitionpunch(obj)
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
}

function onProcCon_demolitionpunch(obj)
{

	if(!obj) return;

	local substate = obj.getSkillSubState();

	if(substate == 0) {
		local bDownKey = obj.isDownSkillLastKey();
		local stateTimer = obj.sq_GetStateTimer();
		local grabMaxTime = obj.sq_GetIntData(SKILL_demolitionpunch, 1);
		
		if(!bDownKey || stateTimer >= grabMaxTime)
		{
			obj.getVar().clear_vector();
			obj.getVar().push_vector(1);
			obj.sq_AddSetStatePacket(STATE_demolitionpunch, STATE_PRIORITY_USER, true);
			return;
		}
	}
	else if(substate == 1) {
		
	}
}

function onEndCurrentAni_demolitionpunch(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		
	}
	else if(substate == 1){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onKeyFrameFlag_demolitionpunch(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_demolitionpunch);
	
	if(flagIndex == 1) {
		obj.sq_SetShake(obj, 150, 5);
		obj.sq_SendCreatePassiveObjectPacket(99163, 0, 111, 0, 149);
	}
	return true;
}


