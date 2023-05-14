
function checkExecutableSkill_crystalofovermind(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_crystalofovermind);

	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_crystalofovermind , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_crystalofovermind(obj)
{
return true;
}


function onSetState_crystalofovermind(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_CrystalOfOverMind_Summon_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_CrystalOfOverMind);
		obj.sq_SendCreatePassiveObjectPacket(99146, 0, 260, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_crystalofovermind , STATE_crystalofovermind , 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
		
		obj.getVar("dama2").clear_obj_vector();
		
		
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}

function onEndCurrentAni_crystalofovermind(obj)
{
	obj.sq_SendCreatePassiveObjectPacket(99141, 0, 260, 0, 0);
	obj.sq_SendCreatePassiveObjectPacket(99145, 0, 260, 0, 0);
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onAttack_crystalofovermind(obj, damager, boundingBox, isStuck)
{

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_crystalofovermind, false, "character/mage/crystalofovermind/ap_crystalofovermind.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);

            local holdTime = sq_GetLevelData(obj, SKILL_crystalofovermind, 1, sq_GetSkillLevel(obj, SKILL_crystalofovermind) );

            masterAppendage.sq_SetValidTime( holdTime );
        }
    if (obj.sq_GetSkillSubState(obj) == 0)   
    {
        obj.getVar("dama2").push_obj_vector(damager);
    }
}

function onKeyFrameFlag_crystalofovermind(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_crystalofovermind);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_crystalofovermind);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_crystalofovermind , STATE_crystalofovermind, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24329, 0, 260, 0, 0);
	}
	return true;
}


