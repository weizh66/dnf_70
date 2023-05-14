function checkExecutableSkill_swordmain(obj)  
{
	if (!obj) return false;

    if (CNSquirrelAppendage.sq_IsAppendAppendage(obj, "character/newswordman/swordmain/ap_swordmain.nut"))
    {
        CNSquirrelAppendage.sq_RemoveAppendage(obj, "character/newswordman/swordmain/ap_swordmain.nut");		
		sq_flashScreen(obj,0,0,1000,150, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        obj.sq_SendCreatePassiveObjectPacket(12186, 0, 0, -1, 0);
        obj.sq_SetShake(obj, 5, 150);
        for (local i = 0;i<20;i++)
        {
            local iceCoreObj = obj.getMyPassiveObject(24315,i);
            if(iceCoreObj)
                iceCoreObj.sendStateOnlyPacket(0);
        }

        local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SWORDMAIN, STATE_SWORDMAIN, 1, 1.0);
        local attackBonusRate2 = obj.sq_GetBonusRateWithPassive(SKILL_SWORDMAIN, STATE_SWORDMAIN, 2, 1.0);
        obj.sq_StartWrite();
        obj.sq_WriteDword(attackBonusRate);
        obj.sq_WriteDword(obj.sq_GetIntData(SKILL_SWORDMAIN,1));
        obj.sq_WriteDword(obj.sq_GetIntData(SKILL_SWORDMAIN,2));
        obj.sq_WriteDword(attackBonusRate2);
        obj.sq_WriteDword(obj.sq_GetIntData(SKILL_SWORDMAIN,3));

        obj.sq_SendCreatePassiveObjectPacket(243162, 0, 0, 0, 0);
        return true;
    }
	local isUseSkill = obj.sq_IsUseSkill(SKILL_SWORDMAIN);

	if (isUseSkill) {
        
		obj.sq_AddSetStatePacket(STATE_SWORDMAIN, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}



// 스킬아이콘 ?성? 조건을 따지는 ?수입니다. true를 리턴?면 스킬 아이콘이 ?성?가 됩니다. (발동조건 state는  소스에서 처리됩니다.)
function checkCommandEnable_swordmain(obj)
{

	return true;
}

function onSetState_SWORDMAIN(obj, state, datas, isResetTimer)
{

	obj.sq_StopMove();
    obj.getVar("flag").clear_vector();
    obj.getVar("flag").push_vector(0);
    swordmain_Number = 5;

    obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORDMAIN_BOBY);
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 2.0, 2.0);	
}

function onEndCurrentAni_SWORDMAIN(obj)
{
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, true);
}

function onKeyFrameFlag_SWORDMAIN(obj, flagIndex)
{
    if (flagIndex == 1)
    {
        if (obj.getVar("flag").get_vector(0) == 0)
        {
            obj.getVar("flag").clear_vector();
            obj.getVar("flag").push_vector(1);

            local appendage = CNSquirrelAppendage.sq_AppendAppendage(obj, obj, SKILL_RESONANCE, false,
            "character/newswordman/swordmain/ap_swordmain.nut", false);

            local skill_level = sq_GetSkillLevel(obj, SKILL_SWORDMAIN);
            appendage.setAppendCauseSkill(BUFF_CAUSE_SKILL, sq_getJob(obj), SKILL_SWORDMAIN, skill_level);

            CNSquirrelAppendage.sq_AppendAppendageID(appendage, obj, obj, 230, true);

            obj.sq_StartWrite();
            obj.sq_WriteDword(0);	// attackBonusRate
            obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
            obj.sq_StartWrite();
            obj.sq_WriteDword(1);	// attackBonusRate
            obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
            obj.sq_StartWrite();
            obj.sq_WriteDword(2);	// attackBonusRate
            obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
            obj.sq_StartWrite();
            obj.sq_WriteDword(3);	// attackBonusRate
            obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
            obj.sq_StartWrite();
            obj.sq_WriteDword(4);	// attackBonusRate
            obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);

        }


    }


}