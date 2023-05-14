
function checkExecutableSkill_lollipopcrush(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_lollipopcrush);

	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_lollipopcrush , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_lollipopcrush(obj)
{
return true;
}

function onSetState_lollipopcrush(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_LollipopCrush);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}

function onEndCurrentAni_lollipopcrush(obj)
{
	obj.sq_SendCreatePassiveObjectPacket(99157, 0, 180, -30, 0);
	obj.sq_SendCreatePassiveObjectPacket(99157, 0, 180, 30, 0);
	obj.sq_SendCreatePassiveObjectPacket(99158, 0, 250, -40, 0);
	obj.sq_SendCreatePassiveObjectPacket(99158, 0, 140, 0, 0);
	obj.sq_SendCreatePassiveObjectPacket(99158, 0, 170, 10, 0);
	obj.sq_SendCreatePassiveObjectPacket(99158, 0, 190, 35, 0);
	obj.sq_SendCreatePassiveObjectPacket(99159, 0, 230, 0, 0);
	obj.sq_SendCreatePassiveObjectPacket(99159, 0, 220, -35, 0);
	obj.sq_SendCreatePassiveObjectPacket(99159, 0, 175, 20, 0);
	obj.sq_SendCreatePassiveObjectPacket(99159, 0, 225, -15, 0);
	obj.sq_SendCreatePassiveObjectPacket(99159, 0, 190, -45, 0);
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_lollipopcrush(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_lollipopcrush);
	
	if(flagIndex == 1) {
		sq_flashScreen(obj,20,80,10,204, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		
		local level	    = sq_GetSkillLevel(obj, SKILL_lollipopcrush);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_lollipopcrush , STATE_lollipopcrush, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_SendCreatePassiveObjectPacket(24337, 0, 180, 0, 0);
	}
	else if(flagIndex == 2){
		obj.sq_SetShake(obj, 700, 5);
	}
	return true;
}


