
function checkExecutableSkill_chasercluster(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_chasercluster);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_chasercluster , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_chasercluster(obj)
{
return true;
}


function onSetState_chasercluster(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ChaserClusterBodyStart_09);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ChaserClusterPush);
		obj.sq_SendCreatePassiveObjectPacket(99153, 0, 130, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99153, 0, 300, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(99153, 0, 220, -40, 0);
		obj.sq_SendCreatePassiveObjectPacket(99153, 0, 370, -40, 0);
		obj.sq_SendCreatePassiveObjectPacket(99153, 0, 150, -60, 0);
		obj.sq_SendCreatePassiveObjectPacket(99153, 0, 320, -55, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_chasercluster , STATE_chasercluster , 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
		
		obj.getVar("dama2").clear_obj_vector();
	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ChaserClusterBodyEnd_06);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_chasercluster(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_chasercluster, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1){
		obj.sq_SendCreatePassiveObjectPacket(99152, 0, 130, 0, 0);
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_chasercluster(obj, damager, boundingBox, isStuck)
{

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_chasercluster, false, "character/mage/chasercluster/ap_chasercluster.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);

            local holdTime = sq_GetLevelData(obj, SKILL_chasercluster, 4, sq_GetSkillLevel(obj, SKILL_chasercluster) );

            masterAppendage.sq_SetValidTime( holdTime );
        }
    if (obj.sq_GetSkillSubState(obj) == 0)   
    {
        obj.getVar("dama2").push_obj_vector(damager);
    }
}

function onKeyFrameFlag_chasercluster(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_chasercluster);
	
	if(flagIndex == 0) {
		local level	    = sq_GetSkillLevel(obj, SKILL_chasercluster);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_chasercluster , STATE_chasercluster, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24332, 0, 130, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(24332, 0, 300, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(24332, 0, 220, -40, 0);
		obj.sq_SendCreatePassiveObjectPacket(24332, 0, 370, -40, 0);
		obj.sq_SendCreatePassiveObjectPacket(24332, 0, 150, -60, 0);
		obj.sq_SendCreatePassiveObjectPacket(24332, 0, 320, -55, 0);
	}
	else if(flagIndex == 1){
		obj.sq_SetShake(obj, 100, 5);
		}
	else if(flagIndex == 2){
		local level	    = sq_GetSkillLevel(obj, SKILL_chasercluster);
		local attack 	= obj.sq_GetBonusRateWithPassive(SKILL_chasercluster , STATE_chasercluster, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(attack.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24333, 0, 130, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(24333, 0, 300, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(24333, 0, 220, -40, 0);
		obj.sq_SendCreatePassiveObjectPacket(24333, 0, 370, -40, 0);
		obj.sq_SendCreatePassiveObjectPacket(24333, 0, 150, -60, 0);
		obj.sq_SendCreatePassiveObjectPacket(24333, 0, 320, -55, 0);
		}
	return true;
}


