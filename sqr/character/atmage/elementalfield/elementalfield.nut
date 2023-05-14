
function checkExecutableSkill_elementalfield(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_elementalfield);

	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_elementalfield , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_elementalfield(obj)
{
return true;
}


function onSetState_elementalfield(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_ElementalField);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}

function onEndCurrentAni_elementalfield(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_elementalfield(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_elementalfield);
	
	if(flagIndex == 1) {
		sq_flashScreen(obj,100,250,0,127, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		
		local level	    = sq_GetSkillLevel(obj, SKILL_elementalfield);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_elementalfield , STATE_elementalfield, 2, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24325, 0, 0, 0, 0);
	}
	else if(flagIndex == 2){
		obj.sq_SetShake(obj, 200, 8);
	}
	return true;
}


