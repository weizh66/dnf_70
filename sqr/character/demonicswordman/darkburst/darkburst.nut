
function checkExecutableSkill_DarkBurst(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_DARKBURST);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_DARKBURST , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_DarkBurst(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
	return obj.sq_IsCommandEnable(SKILL_DARKBURST); 
	obj.sq_IsCommandEnable(SKILL_DARKBURST);
	}	
	
	
	return true;
}


function onSetState_DarkBurst(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKBURST_READY_BODY);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/1_Ready/Back/DarkBurst_Ready_Back.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/1_Ready/Front/DarkBurst_Ready_Front.ani"), 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKBURST_SWING_BODY);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_DARKBURSTPUSH);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/2_Swing/Back/DarkBurst_Swing_Back.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/2_Swing/Front/DarkBurst_Swing_Front.ani"), 0, 0);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKBURST_SMASH_BODY);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/3_Smash/Back/DarkBurst_Smash_Back.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/3_Smash/Front/DarkBurst_Smash_Blade01.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/DarkBurst_Smash_Back_ScreenGlow.ani"), 0, 0);
	}
	else if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DARKBURST_FINISH_BODY);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/4_Finish/DarkBurst_Finish_Front_Glow01.ani"), 0, 0);
		obj.sq_AddStateLayerAnimation(0, obj.sq_CreateCNRDAnimation("Effect/Animation/DarkBurst_DS/4_Finish/DarkBurst_Finish_Front_Glow02.ani"), 0, 0);
	}	
}

function onEndCurrentAni_DarkBurst(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_DARKBURST, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_DARKBURST, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_DARKBURST, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 3){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_DarkBurst(obj,flagIndex)
{
	local id = sq_GetObjectId(obj);
			
	if (flagIndex == 0)
	{
		obj.sq_StartWrite();
		obj.sq_WriteDword(0);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24320, 0, 0, 0, 0);
	}
	else if (flagIndex == 1)
	{
		obj.sq_StartWrite();
		obj.sq_WriteDword(1);
		obj.sq_WriteDword(id);
		obj.sq_SendCreatePassiveObjectPacket(24320, 0, 0, 0, 0);
	}
	return true;
}
