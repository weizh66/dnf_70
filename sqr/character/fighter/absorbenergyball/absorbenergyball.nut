
function checkExecutableSkill_absorbenergyball(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_absorbenergyball);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		//obj.getVar().push_vector(1);
		//obj.getVar().push_vector(2);
		//obj.getVar().push_vector(3);
		//obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_absorbenergyball , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_absorbenergyball(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_absorbenergyball);
		obj.sq_IsCommandEnable(SKILL_absorbenergyball);
	}	
	
	
	return true;
}


function onSetState_absorbenergyball(obj, state, datas, isResetTimer)
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
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_lv1_InhaledEnergyShot_Body);
	}
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_absorbenergyball(obj)
{
	local substate = obj.getSkillSubState();//?觫substate
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_absorbenergyball(obj,flagIndex)
{

	if (flagIndex == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_lv1_InhaledEnergyShot_Body);
		obj.sq_SendCreatePassiveObjectPacket(900050, 0, 0, 0, 0);
		local fScreen = sq_flashScreen(obj,0,320,320,200, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_absorbenergyball , STATE_absorbenergyball, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
	return true;
}
