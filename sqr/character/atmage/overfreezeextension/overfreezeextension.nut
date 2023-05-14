
function checkExecutableSkill_overfreezeextension(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_overfreezeextension);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_overfreezeextension , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_overfreezeextension(obj)
{
return true;
}


function onSetState_overfreezeextension(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_OverFreezeExtensionCasting);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_OverFreezeExtension);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_overfreezeextension , STATE_overfreezeextension , 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
		
		obj.getVar("dama2").clear_obj_vector();
	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_OverFreezeExtensionAttack);
		
		obj.sq_SetShake(obj, 120, 15);
		sq_flashScreen(obj,0,60,0,178, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_overfreezeextension(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_overfreezeextension, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_overfreezeextension(obj, damager, boundingBox, isStuck)
{

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_overfreezeextension, false, "character/atmage/overfreezeextension/ap_overfreezeextension.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);

            local holdTime = sq_GetLevelData(obj, SKILL_overfreezeextension, 1, sq_GetSkillLevel(obj, SKILL_overfreezeextension) );

            masterAppendage.sq_SetValidTime( holdTime );
        }
    if (obj.sq_GetSkillSubState(obj) == 0)   
    {
        obj.getVar("dama2").push_obj_vector(damager);
    }
}

function onKeyFrameFlag_overfreezeextension(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_overfreezeextension);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_overfreezeextension);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_overfreezeextension , STATE_overfreezeextension, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24324, 0, 0, 0, 0);
	}
	return true;
}


