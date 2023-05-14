
function checkExecutableSkill_plasmaboosted(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_plasmaboosted);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_plasmaboosted , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_plasmaboosted(obj)
{
return true;
}

function createplasmaboostedSpearExp(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","passiveobject/character/gunner/animation/plasmaboost/plasmaboostlaserloop_00.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}

function onSetState_plasmaboosted(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostedStart_Body);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_plasmaboosted , STATE_plasmaboosted, 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostedLoop_Body);
		createplasmaboostedSpearExp(obj, 160, 0, 85);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostedLoop_Body1);
		createplasmaboostedSpearExp(obj, 160, 0, 85);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostedLoop_Body2);
		createplasmaboostedSpearExp(obj, 160, 0, 85);
	}
	if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostedLoop_Body3);
		createplasmaboostedSpearExp(obj, 160, 0, 85);
	}
	if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostedLoop_Body4);
		createplasmaboostedSpearExp(obj, 160, 0, 85);
	}
	else if(substate == 6)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostedEnd_Body);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_plasmaboosted(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_plasmaboosted, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_plasmaboosted, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_plasmaboosted, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_plasmaboosted, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_plasmaboosted, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 5){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(6);
		obj.sq_AddSetStatePacket(STATE_plasmaboosted, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 6){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_plasmaboosted(obj, damager, boundingBox, isStuck)
{
        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_plasmaboosted, false, "character/gunner/plasmaboosted/ap_plasmaboosted.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);
            local holdTime = obj.sq_GetIntData(SKILL_plasmaboosted, 0);
            masterAppendage.sq_SetValidTime( holdTime );
        }
}

function onKeyFrameFlag_plasmaboosted(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_plasmaboosted);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_plasmaboosted);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_plasmaboosted , STATE_plasmaboosted, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24304, 0, 110, 0, 70);
	}
	else if(flagIndex == 2){
		local level	    = sq_GetSkillLevel(obj, SKILL_plasmaboosted);
		local power1 	= obj.sq_GetBonusRateWithPassive(SKILL_plasmaboosted , STATE_plasmaboosted, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power1.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24304, 0, 110, 0, 70);
	}
	else if(flagIndex == 3){
		local level	    = sq_GetSkillLevel(obj, SKILL_plasmaboosted);
		local power2 	= obj.sq_GetBonusRateWithPassive(SKILL_plasmaboosted , STATE_plasmaboosted, 4, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power2.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24304, 0, 110, 0, 70);
	}
	else if(flagIndex == 4){
		local level	    = sq_GetSkillLevel(obj, SKILL_plasmaboosted);
		local power3 	= obj.sq_GetBonusRateWithPassive(SKILL_plasmaboosted , STATE_plasmaboosted, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power3.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24304, 0, 110, 0, 70);
	}
	else if(flagIndex == 5){
		local level	    = sq_GetSkillLevel(obj, SKILL_plasmaboosted);
		local power4 	= obj.sq_GetBonusRateWithPassive(SKILL_plasmaboosted , STATE_plasmaboosted, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power4.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24304, 0, 110, 0, 70);
	}
	return true;
}


