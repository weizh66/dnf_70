
function checkExecutableSkill_convergencecannon(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_convergencecannon);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_convergencecannon , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_convergencecannon(obj)
{
return true;
}


function onSetState_convergencecannon(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ConvergenceCannonStart_Body);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ConvergenceCannonCreate_Body);
	}
	else if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_ConvergenceCannonShot_Body);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_convergencecannon(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_convergencecannon, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_convergencecannon, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 2){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		obj.sq_SendCreatePassiveObjectPacket(24327, 0, 350, 0, 0);
	}
}

function onKeyFrameFlag_convergencecannon(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_convergencecannon);
	
	if(flagIndex == 1) {
		sq_flashScreen(obj,0,0,240,102, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		
		local level	    = sq_GetSkillLevel(obj, SKILL_convergencecannon);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_convergencecannon , STATE_convergencecannon, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
	}
	else if(flagIndex == 2){
		sq_flashScreen(obj,120,0,0,102, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}
	else if(flagIndex == 3){
		sq_flashScreen(obj,0,300,0,102, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}
	else if(flagIndex == 4){
		sq_flashScreen(obj,0,0,360,153, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SendCreatePassiveObjectPacket(24326, 0, 130, 0, 0);
	}
	else if(flagIndex == 5){
		sq_flashScreen(obj,360,0,0,102, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetShake(obj, 100, 2);
	}
	else if(flagIndex == 6){
		sq_flashScreen(obj,0,60,360,255, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetShake(obj, 180, 6);
		
		local level	    = sq_GetSkillLevel(obj, SKILL_convergencecannon);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_convergencecannon , STATE_convergencecannon, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(99140, 0, 130, 0, 0);
	}
	return true;
}


