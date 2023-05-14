
function checkExecutableSkill_saintillusion(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_saintillusion);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_saintillusion , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_saintillusion(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_saintillusion);
		obj.sq_IsCommandEnable(SKILL_saintillusion);
	}	
	
	
	return true;
}


function onSetState_saintillusion(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	//local num5 = obj.getVar().get_vector(4);
	obj.setSkillSubState(substate);//?銮substate
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SaintIllusion_Start);
		obj.sq_SendCreatePassiveObjectPacket(2568800, 0, 0, 0, 0);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SaintIllusion_Charge);
		obj.sq_SendCreatePassiveObjectPacket(2568200, 0, 0, 0, 0);
	}	
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SaintIllusion_Shoot1);
		obj.sq_SendCreatePassiveObjectPacket(25860, 0, 0, 0, 0);
		obj.sq_SetShake(obj,4,200);
	}	
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SaintIllusion_Shoot2);
		obj.sq_SendCreatePassiveObjectPacket(25860, 0, 0, 0, 0);
		obj.sq_SetShake(obj,4,200);
	}	
	if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SaintIllusion_Shoot1);
		obj.sq_SendCreatePassiveObjectPacket(25860, 0, 0, 0, 0);
		obj.sq_SetShake(obj,4,200);
	}	
	if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SaintIllusion_Shoot3);
		obj.sq_SetStaticMoveInfo(0, 200, 50, false, 700, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
		obj.sq_SendCreatePassiveObjectPacket(25859, 0, 0, 0, 0);
		obj.sq_SetShake(obj,6,200);
	}	
	else if(substate == 6)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SaintIllusion_Shoot_Stop);
		obj.sq_SendCreatePassiveObjectPacket(70005800, 0, 0, 0, 0);
	}	

}

function onEndCurrentAni_saintillusion(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_saintillusion, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_saintillusion, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_saintillusion, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_saintillusion, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_saintillusion, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 5){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(6);
		obj.sq_AddSetStatePacket(STATE_saintillusion, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 6){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_saintillusion(obj,flagIndex)
{
	if(!obj)
		return false;

	local isMyControlObject = obj.sq_IsMyControlObject();

	if (isMyControlObject())
	{
		
		obj.sq_SendCreatePassiveObjectPacket(000000, 0, 0, 0, 0);
	}
	return true;
}
