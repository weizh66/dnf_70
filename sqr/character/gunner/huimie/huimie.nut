
function checkExecutableSkill_HuiMie(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_HUIMIE);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		//obj.getVar().push_vector(5);
		//obj.getVar().push_vector(6);
		//obj.getVar().push_vector(7);
		obj.sq_AddSetStatePacket(STATE_HUIMIE , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_HuiMie(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_HUIMIE);
		obj.sq_IsCommandEnable(SKILL_HUIMIE);
	}	
	
	
	return true;
}


function onSetState_HuiMie(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	//local num2 = obj.getVar().get_vector(1);
	//local num3 = obj.getVar().get_vector(2);
	//local num4 = obj.getVar().get_vector(3);
	//local num5 = obj.getVar().get_vector(4);
	//local num6 = obj.getVar().get_vector(5);
	//local num7 = obj.getVar().get_vector(6);
	//local num8 = obj.getVar().get_vector(7);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAMREADY);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAMATKA);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BURSTERBEAMATTACK01);
		obj.sq_SendCreatePassiveObjectPacket(9000770, 0, 500, 0, 0);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAMATKB);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BURSTERBEAMATTACK02);
		obj.sq_SendCreatePassiveObjectPacket(9000780, 0, 250, 0, 0);
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAMATKC);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BURSTERBEAMATTACK03);
		obj.sq_SendCreatePassiveObjectPacket(9000790, 0, 300, 0, 0);
	}
	if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAMATKD);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BURSTERBEAMATTACK04);
		obj.sq_SendCreatePassiveObjectPacket(9000780, 0, 350, 0, 0);
	}
	if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAMJUMP);
		sq_SetZVelocity(obj, 700, 700);
	}
	if(substate == 6)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAMFINISHATK);
		obj.sq_SendCreatePassiveObjectPacket(9000800, 0, 0, 0, -200);
		obj.sq_ZStop();
	}	
	else if(substate == 7)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAMEND);
	}	
	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_HuiMie(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_HUIMIE, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_HUIMIE, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_HUIMIE, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_HUIMIE, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 4){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(5);
		obj.sq_AddSetStatePacket(STATE_HUIMIE, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 5){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(6);
		obj.sq_ZStop();
		obj.sq_AddSetStatePacket(STATE_HUIMIE, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 6){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(7);
		obj.sq_SendCreatePassiveObjectPacket(9000820, 0, 430, 0, -200);
		obj.sq_AddSetStatePacket(STATE_HUIMIE, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 7){
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_HUIMIE(obj,flagIndex)
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
