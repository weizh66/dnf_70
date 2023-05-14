
function checkExecutableSkill_shardmagnum(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_shardmagnum);

	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_shardmagnum , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_shardmagnum(obj)
{
return true;
}


function onSetState_shardmagnum(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_ShardMagnumBody_Body);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}

function onEndCurrentAni_shardmagnum(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_shardmagnum(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_shardmagnum);
	
	if(flagIndex == 1) {
		obj.sq_SetShake(obj, 50, 5);
		sq_flashScreen(obj,0,0,200,102, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		
		local level	    = sq_GetSkillLevel(obj, SKILL_shardmagnum);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_shardmagnum , STATE_shardmagnum, 0, 1.0);
		local iceProb	= sq_GetLevelData(obj, SKILL_shardmagnum, 2, level);
		local iceLevel	= sq_GetLevelData(obj, SKILL_shardmagnum, 3, level);
		local iceTime	= sq_GetLevelData(obj, SKILL_shardmagnum, 4, level);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_WriteDword(iceProb);
		obj.sq_WriteDword(iceLevel);
		obj.sq_WriteDword(iceTime);
		obj.sq_SendCreatePassiveObjectPacket(24323, 0, 80, 0, 0);
	}
	else if(flagIndex == 2){
		obj.sq_SetShake(obj, 200, 10);
		sq_flashScreen(obj,0,80,100,178, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}
	return true;
}


