function checkExecutableSkill_ghostout(obj)  
{
	if (!obj) return false;

	local isUseSkill = obj.sq_IsUseSkill(SKILL_GHOSTOUT);
	if (isUseSkill) 
    {

        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(0);
		obj.sq_AddSetStatePacket(STATE_GHOSTOUT, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}



// 스킬아이콘 ?성? 조건을 따지는 ?수입니다. true를 리턴?면 스킬 아이콘이 ?성?가 됩니다. (발동조건 state는  소스에서 처리됩니다.)
function checkCommandEnable_ghostout(obj)
{

	return true;
}

function onSetState_GHOSTOUT(obj, state, datas, isResetTimer)
{

    local state = obj.getVar("state").get_vector(0);
    obj.sq_StopMove();

    if (state == 0)
    {

        obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOSTOUT_CASTING);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);

    }

    if (state == 1)
    {
		sq_flashScreen(obj,0,0,1000,150, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOSTOUT_JUMP);
        obj.sq_SendCreatePassiveObjectPacket(12203, 0, 0, 1, 200);
        obj.sq_SendCreatePassiveObjectPacket(12204, 0, 0, 1, 0);
		obj.sq_SetShake(obj,20,200);
    }

    if (state == 2)
    {
        obj.getVar("isEnd").clear_vector();
        obj.getVar("isEnd").push_vector(0);

        local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_GHOSTOUT, STATE_GHOSTOUT, 0, 1.0);
        local attackBonusRate2 = obj.sq_GetBonusRateWithPassive(SKILL_GHOSTOUT, STATE_GHOSTOUT, 1, 1.0);
        sq_BinaryStartWrite();
        sq_BinaryWriteDword(attackBonusRate);	// attackBonusRate
        sq_BinaryWriteDword(15);	// attackBonusRate
        sq_BinaryWriteDword(attackBonusRate2);	// attackBonusRate

        obj.sq_SendCreatePassiveObjectPacket(24357, 0, 0, 1, -200);
        obj.sq_SendCreatePassiveObjectPacket(12201, 0, 0, 1, -200);
        obj.sq_SendCreatePassiveObjectPacket(12202, 0, 0, 1, -200);
		obj.sq_SetShake(obj,20,200);
        obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOSTOUT_ATTACK);
    }

}

function onProc_GHOSTOUT(obj)
{
    local height = 200;
    local state = obj.getVar("state").get_vector(0);
    if (state == 1)
    {
        obj.setCurrentPos(obj.getXPos(),obj.getYPos(),height);
    }
    if (state == 2)
    {
        if (obj.getVar("isEnd").get_vector(0) == 0)
        {
            obj.setCurrentPos(obj.getXPos(),obj.getYPos(),height);
        }else{

            if (obj.getZPos() <= 0)
            {

                obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);

            }
            obj.setCurrentPos(obj.getXPos(),obj.getYPos(),obj.getZPos()+5);
        
        }
    }
}

function onEndCurrentAni_GHOSTOUT(obj)
{
    local state = obj.getVar("state").get_vector(0);
    
    if (state == 0)
    {

        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(1);
		obj.sq_AddSetStatePacket(STATE_GHOSTOUT, STATE_PRIORITY_USER, true);
    }
    if (state == 1)
    {

        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(2);
		obj.sq_AddSetStatePacket(STATE_GHOSTOUT, STATE_PRIORITY_USER, true);
    }

    if (state == 2)
    {



        obj.getVar("isEnd").clear_vector();
        obj.getVar("isEnd").push_vector(1);

//		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
    }

}

function getScrollBasisPos_GHOSTOUT(obj)
{
	if (!obj) return;
	local srcX = obj.getXPos();
	local dstX = 460;
	local destX = sq_GetDistancePos(srcX, obj.getDirection(), dstX);

	local stateTimer = obj.sq_GetStateTimer();
	local moveT = 10;
	local xPos = sq_GetUniformVelocity(srcX, destX, stateTimer, moveT);
	obj.sq_SetCameraScrollPosition(xPos, obj.getYPos(), 0);

	return true;
}