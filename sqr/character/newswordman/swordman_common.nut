swordmain_Number <- 5

function onAttack_Swordman(obj, damager, bounding_box, is_stuck)
{
//    sq_SendCreatePassiveObjectPacketPos(obj, 12037, 0, obj.getXPos(), obj.getYPos(), 0);


    if (CNSquirrelAppendage.sq_IsAppendAppendage(obj, "character/newswordman/swordmain/ap_swordmain.nut"))
    {
        if (swordmain_Number<0) return true;

        for (local i = 0;i<20;i++)
        {
            local iceCoreObj = obj.getMyPassiveObject(24315,i);
            if(iceCoreObj)
                iceCoreObj.sendStateOnlyPacket(0);
        }

            swordmain_Number = swordmain_Number-1;

            obj.sq_StartWrite();
            obj.sq_WriteDword(4);	// attackBonusRate
            obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);

            if (swordmain_Number >= 1)
            {
                obj.sq_StartWrite();
                obj.sq_WriteDword(7);	// attackBonusRate
                obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
            }
            if (swordmain_Number >= 2)
            {
                obj.sq_StartWrite();
                obj.sq_WriteDword(8);	// attackBonusRate
                obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
            }
            if (swordmain_Number >= 3)
            {
                obj.sq_StartWrite();
                obj.sq_WriteDword(9);	// attackBonusRate
                obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
            }
            if (swordmain_Number >= 4)
            {
                obj.sq_StartWrite();
                obj.sq_WriteDword(10);	// attackBonusRate
                obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
            }



        obj.sq_StartWrite();
        obj.sq_WriteDword(5);	// attackBonusRate
        obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);

        local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_SWORDMAIN, STATE_SWORDMAIN, 0, 1.0);
        obj.sq_StartWrite();
        obj.sq_WriteDword(6);	// attackBonusRate
        obj.sq_WriteDword(attackBonusRate);	// attackBonusRate
        sq_SendCreatePassiveObjectPacketPos(obj,24315, 0, damager.getXPos(), damager.getYPos() + 1, damager.getZPos());
//      obj.sq_SendCreatePassiveObjectPacket(24315, 0, 0, -1, 0);
    }

}
