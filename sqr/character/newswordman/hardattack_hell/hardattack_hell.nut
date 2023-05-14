function checkExecutableSkill_hardattack_hell(obj)  
{
	if (!obj) return false;

	local isUseSkill = obj.sq_IsUseSkill(SKILL_HARDATTACK_HELL);
	if (isUseSkill) 
    {
		obj.sq_AddSetStatePacket(STATE_HARDATTACK_HELL, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}



// 스킬아이콘 ?성? 조건을 따지는 ?수입니다. true를 리턴?면 스킬 아이콘이 ?성?가 됩니다. (발동조건 state는  소스에서 처리됩니다.)
function checkCommandEnable_hardattack_hell(obj)
{

	return true;
}

function onSetState_HARDATTACK_HELL(obj, state, datas, isResetTimer)
{

    obj.sq_StopMove();

    obj.getVar("flag").clear_vector();
    obj.getVar("flag").push_vector(0);

    obj.sq_SetCurrentAnimation(CUSTOM_ANI_HARDATTACK_HELL_BOBY);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
    obj.sq_SetCurrentAttackInfo(ATTACKINFO_HARDATTACK_HELL);


    local damage = obj.sq_GetBonusRateWithPassive(SKILL_HARDATTACK_HELL , STATE_HARDATTACK_HELL, 0, 1.0);
    obj.sq_SetCurrentAttackBonusRate(damage);		


		obj.sq_SetStaticSpeedInfo(SPEED_TYPE_CAST_SPEED, SPEED_TYPE_CAST_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);

}


function onEndCurrentAni_HARDATTACK_HELL(obj)
{

		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_HARDATTACK_HELL(obj,flagIndex)
{

    if (flagIndex == 1)
    {
        if (obj.getVar("flag").get_vector(0) == 0)
        {
            obj.getVar("flag").clear_vector();
            obj.getVar("flag").push_vector(1);

            local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_HARDATTACK_HELL, STATE_HARDATTACK_HELL, 1, 1.0);
            local attackBonusRate2 = obj.sq_GetBonusRateWithPassive(SKILL_HARDATTACK_HELL, STATE_HARDATTACK_HELL, 2, 1.0);


            sq_BinaryStartWrite();
            sq_BinaryWriteDword(attackBonusRate);	// attackBonusRate
            sq_BinaryWriteDword(13);	// attackBonusRate
            sq_BinaryWriteDword(4);	// attackBonusRate
            sq_BinaryWriteDword(attackBonusRate2);	// attackBonusRate
            sq_BinaryWriteDword(obj.sq_GetIntData(SKILL_HARDATTACK_HELL, 0));	// attackBonusRate
            obj.sq_SendCreatePassiveObjectPacket(24357, 0, 350, 1, 0);
		obj.sq_SetShake(obj,20,200);

        }

    }


}

function getScrollBasisPos_HARDATTACK_HELL(obj)
{
	if (!obj) return;
	local srcX = obj.getXPos();
	local dstX = 470;
	local destX = sq_GetDistancePos(srcX, obj.getDirection(), dstX);

	local stateTimer = obj.sq_GetStateTimer();
	local moveT = 10;
	local xPos = sq_GetUniformVelocity(srcX, destX, stateTimer, moveT);
	obj.sq_SetCameraScrollPosition(xPos, obj.getYPos(), 0);

	return true;
}