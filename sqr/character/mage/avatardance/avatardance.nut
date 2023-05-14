function checkExecutableSkill_avatardance(obj)  
{
	if (!obj) return false;

	local isUseSkill = obj.sq_IsUseSkill(SKILL_avatardance);
	if (isUseSkill) 
    {

        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(0);
		obj.sq_AddSetStatePacket(STATE_avatardance, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}


function checkCommandEnable_avatardance(obj)
{

	return true;
}

function onSetState_avatardance(obj, state, datas, isResetTimer)
{
    local state = obj.getVar("state").get_vector(0);
	obj.sq_StopMove();
if(state == 0)
	{
		sq_flashScreen(obj,0,0,180,150, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarDance_A);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_AvatarDanceRightSlash);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_avatardance , STATE_avatardance, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
if(state == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarDance_B);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_AvatarDanceLeftSlash);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_avatardance , STATE_avatardance, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
if(state == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarDance_C);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_AvatarDanceRightSlash);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_avatardance , STATE_avatardance, 0, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);
	}
if(state == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarDance_D);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_AvatarDanceLeftSlash);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_avatardance , STATE_avatardance, 1, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
	}	
if(state == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarDance_E01);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_AvatarDancePushAttack);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_avatardance , STATE_avatardance, 2, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
	}	
if(state == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarDance_E02);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_AvatarDanceJumpUpper);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_avatardance , STATE_avatardance, 3, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
	}
if(state == 6)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarDance_F01);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_AvatarDanceDunkSlash);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_avatardance , STATE_avatardance, 4, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
	}
else if(state == 7)
	{
            obj.resetHitObjectList();
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_AvatarDance_F02);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_AvatarDanceDunkSlash);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_avatardance , STATE_avatardance, 4, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
}



function onAttack_avatardance(obj, damager, boundingBox, isStuck)
{
    local state = obj.getVar("state").get_vector(0);
    if (sq_IsFixture(damager))
        return false;
    if (state >=0 && state <= 5)
	{
      local dvalue = 1;
        if (sq_GetDirection(obj) == ENUM_DIRECTION_LEFT) dvalue = -1;
        if (state <= 2)
        {

            damager.setCurrentPos(obj.getXPos()+132*dvalue,obj.getYPos(),0);

        }else{

            damager.setCurrentPos(obj.getXPos() +309*dvalue,obj.getYPos(),0);
        }
	}

if(state <= 6)
	{
        if (!CNSquirrelAppendage.sq_IsAppendAppendage(damager, "character/mage/avatardance/ap_avatardance.nut"))
        {
            local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_BLOODSONG, false, "character/mage/avatardance/ap_avatardance.nut", true);				 
            if(masterAppendage) 
            {
                sq_HoldAndDelayDie(damager, obj, true, true, true, 0, 0, ENUM_DIRECTION_DOWN , masterAppendage);
            }
        }
else
	{
        if(damager)
        {
            CNSquirrelAppendage.sq_RemoveAppendage(damager, "character/mage/avatardance/ap_avatardance.nut");		
        }
	}

	}

}



function onEndCurrentAni_avatardance(obj)
{
    local state = obj.getVar("state").get_vector(0);
  if (state < 7)
    {
        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(state + 1);
		obj.sq_AddSetStatePacket(STATE_avatardance, STATE_PRIORITY_USER, true);

    }else{

		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
    }

}

function onProc_avatardance(obj)
{
    local state = obj.getVar("state").get_vector(0);
	local pAni = obj.sq_GetCurrentAni();
	local frmIndex = obj.sq_GetCurrentFrameIndex(pAni);

    if (state >= 5 && state < 7)
    {
        obj.setCurrentPos(obj.getXPos(),obj.getYPos(),140);
		obj.sq_SetStaticMoveInfo(0, 100, 200, false, 200, true);
		obj.sq_SetStaticMoveInfo(1, 0, 0, false);
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);
    }
    if (state == 0)
    {
        if (frmIndex == 3)
        {
            sq_flashScreen(obj,0,0,150,150, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }
    }

    if (state == 1)
    {
        if (frmIndex == 1)
        {
            obj.sq_SetShake(obj, 6, 150);
        }
    }

    if (state == 2)
    {

        if (frmIndex == 2)
        {
            obj.sq_SetShake(obj, 6, 150);
        }
    }

    if (state == 3)
    {

        if (frmIndex == 2)
        {
            obj.sq_SetShake(obj, 6, 150);
        }
    }
}