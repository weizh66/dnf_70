
function checkExecutableSkill_armageddonstrike(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_armageddonstrike);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_armageddonstrike , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_armageddonstrike(obj)
{
return true;
}


function onSetState_armageddonstrike(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ArmageddonStrikeStart_Body);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_ArmageddonStrike);
		obj.sq_SendCreatePassiveObjectPacket(241724, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_armageddonstrike , STATE_armageddonstrike , 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
		
		obj.getVar("dama2").clear_obj_vector();
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ArmageddonStrikeCreate_Body);
		obj.sq_SetShake(obj, 1600, 5);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ArmageddonStrikeExplosion_Body);
		obj.sq_SetShake(obj, 1200, 4);
		sq_flashScreen(obj,0,80,480,255, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_armageddonstrike(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_armageddonstrike, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_armageddonstrike, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onAttack_armageddonstrike(obj, damager, boundingBox, isStuck)
{

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_armageddonstrike, false, "character/atmage/armageddonstrike/ap_armageddonstrike.nut", true);				 

        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, false, false, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);

            local holdTime = sq_GetLevelData(obj, SKILL_armageddonstrike, 3, sq_GetSkillLevel(obj, SKILL_armageddonstrike) );

            masterAppendage.sq_SetValidTime( holdTime );
        }
    if (obj.sq_GetSkillSubState(obj) == 0)   
    {
        obj.getVar("dama2").push_obj_vector(damager);
    }
}

function onKeyFrameFlag_armageddonstrike(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_armageddonstrike);
	
	if(flagIndex == 1) {
		obj.sq_SetShake(obj, 780, 2);
	}
	else if(flagIndex == 2){
		sq_flashScreen(obj,300,2500,0,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}
	else if(flagIndex == 3){
		obj.sq_SetShake(obj, 1440, 4);
		sq_flashScreen(obj,0,120,420,204, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}
	else if(flagIndex == 4){
		obj.sq_SetShake(obj, 800, 1);
		
		local level	    = sq_GetSkillLevel(obj, SKILL_armageddonstrike);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_armageddonstrike , STATE_armageddonstrike, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24328, 0, 0, 0, 0);
	}
	return true;
}


