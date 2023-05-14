
function checkExecutableSkill_plasmaboost(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_plasmaboost);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_plasmaboost , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_plasmaboost(obj)
{
	return true;
}

function createplasmaboostSpearExp(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","passiveobject/character/gunner/animation/plasmaboost/plasmaboostlaserloop_00.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}

function onSetState_plasmaboost(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostStart_Body);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostLoop_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_PlasmaBoost);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_plasmaboost , STATE_plasmaboost, 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
		createplasmaboostSpearExp(obj, 110, 0, 70);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostLoop_Body1);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_PlasmaBoost);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_plasmaboost , STATE_plasmaboost, 3, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
		createplasmaboostSpearExp(obj, 110, 0, 70);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostLoop_Body2);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_PlasmaBoost);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_plasmaboost , STATE_plasmaboost, 3, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	else if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_PlasmaBoostEnd_Body);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_plasmaboost(obj)
{
	local substate = obj.getSkillSubState();
	local HitCount = obj.getVar().getInt(0);
	obj.getVar().setInt(0,HitCount + 1);
  if (substate == 0)
    {
        obj.getVar().clear_vector();
        obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_plasmaboost, STATE_PRIORITY_IGNORE_FORCE, true);
    }
  if (substate == 1)
    {
        obj.getVar().clear_vector();
        obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_plasmaboost, STATE_PRIORITY_IGNORE_FORCE, true);
    }
  if (substate == 2)
    {
        obj.getVar().clear_vector();
        obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_plasmaboost, STATE_PRIORITY_IGNORE_FORCE, true);
    }
  if (substate == 3)
    {
        obj.getVar().clear_vector();
        obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_plasmaboost, STATE_PRIORITY_IGNORE_FORCE, true);
    }
else if(substate == 4)
	{
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
    }

}

function onProc_plasmaboost(obj)
{
	local HitCount = obj.getVar().getInt(0);
	local maxHitCount = obj.sq_GetIntData(SKILL_plasmaboost, 1);
	print(" maxHitCount:" + maxHitCount);
	print(" Count:" + HitCount);
	if(HitCount >= maxHitCount)
		{
			obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		}
		local substate = obj.getSkillSubState();
		if(substate <= 3)
		{
			if (sq_IsKeyDown(OPTION_HOTKEY_JUMP, ENUM_SUBKEY_TYPE_ALL))
			{
			obj.getVar().clear_vector();
			obj.getVar().push_vector(4);
			obj.sq_AddSetStatePacket(STATE_plasmaboost, STATE_PRIORITY_IGNORE_FORCE, true);
			}
		}
}


function onAttack_plasmaboost(obj, damager, boundingBox, isStuck)
{
        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_plasmaboost, false, "character/atgunner/plasmaboost/ap_plasmaboost.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);
            local holdTime = obj.sq_GetIntData(SKILL_plasmaboost, 0);
            masterAppendage.sq_SetValidTime( holdTime );
        }
}

function onKeyFrameFlag_plasmaboost(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_plasmaboost);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_plasmaboost);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_plasmaboost , STATE_plasmaboost, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24304, 0, 110, 0, 70);
		obj.sq_SendCreatePassiveObjectPacket(900065, 0, 30, 0, 70);
	}
	else if(flagIndex == 2){
		local level	    = sq_GetSkillLevel(obj, SKILL_plasmaboost);
		local power1 	= obj.sq_GetBonusRateWithPassive(SKILL_plasmaboost , STATE_plasmaboost, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power1.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24304, 0, 110, 0, 70);
		obj.sq_SendCreatePassiveObjectPacket(900065, 0, 30, 0, 70);
	}
	return true;
}

