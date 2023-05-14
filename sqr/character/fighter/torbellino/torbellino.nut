
function checkExecutableSkill_torbellino(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_torbellino);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_torbellino , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_torbellino(obj)
{
return true;
}


function onSetState_torbellino(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Torbellino_Jump_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_Torbellino);
		obj.sq_SendCreatePassiveObjectPacket(99135, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_torbellino , STATE_torbellino , 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	

		obj.getVar("dama2").clear_obj_vector();

	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Torbellino_End_Body);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_Torbellino_Spin);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_torbellino(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
	if (obj.getVar("dama2").get_obj_vector_size() > 0)
	{
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_torbellino, STATE_PRIORITY_IGNORE_FORCE, true);
		}else{obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		}
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_torbellino, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_torbellino(obj, damager, boundingBox, isStuck)
{

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_torbellino, false, "character/fighter/torbellino/ap_torbellino.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);

            local holdTime = sq_GetLevelData(obj, SKILL_torbellino, 4, sq_GetSkillLevel(obj, SKILL_torbellino) );

            masterAppendage.sq_SetValidTime( holdTime );
        }
    if (obj.sq_GetSkillSubState(obj) == 0)   
    {
        obj.getVar("dama2").push_obj_vector(damager);
    }
}

function onKeyFrameFlag_torbellino(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_torbellino);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_torbellino);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_torbellino , STATE_torbellino, 3, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_torbellino , STATE_torbellino, 1, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
		obj.sq_SendCreatePassiveObjectPacket(24351, 0, 0, 0, 50);
		obj.sq_SendCreatePassiveObjectPacket(24351, 0, 70, -30, 50);
		obj.sq_SendCreatePassiveObjectPacket(24351, 0, 50, 25, 50);
		obj.sq_SendCreatePassiveObjectPacket(24351, 0, -50, 23, 50);
	}
	return true;
}


