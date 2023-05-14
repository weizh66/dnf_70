
function checkExecutableSkill_chaindestruction(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_chaindestruction);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_chaindestruction , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_chaindestruction(obj)
{
return true;
}


function onSetState_chaindestruction(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ChainDestruction01_New);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ChainDestructionNew_1);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_chaindestruction , STATE_chaindestruction, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
		sq_SetZVelocity(obj,300,-1400);
		local speed = 300;
		obj.sq_SetStaticMoveInfo(0, speed, speed, false);	
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		obj.setTimeEvent(500,300,500,false);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ChainDestruction02_New);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ChainDestructionNew_3);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ChainDestructionNew_Finish);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_chaindestruction , STATE_chaindestruction, 1, 1.0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_chaindestruction , STATE_chaindestruction, 2, 1.0);
		local damage2 = damage + damage1;
		obj.sq_SetCurrentAttackBonusRate(damage2);

	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ChainDestruction03_New);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ChainDestructionNew_2);
		obj.sq_SendCreatePassiveObjectPacket(99131, 0, 90, 0, 85);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_chaindestruction , STATE_chaindestruction, 3, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}


function onProc_chaindestruction(obj)
{
	local substate = obj.getSkillSubState();
  if (substate == 1)
  {
    if (obj.getZPos() <= 0)
    {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_chaindestruction, STATE_PRIORITY_IGNORE_FORCE, true);
    }
  }
}

function onEndCurrentAni_chaindestruction(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_chaindestruction, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_chaindestruction, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_chaindestruction(obj,flagIndex)
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


