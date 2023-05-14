
function setCustomData_po_bloodcut(obj, receiveData)
{
	if(!obj)
		return;

	local attackBonusRate = receiveData.readDword();// 공격력(%)	
	local id = receiveData.readDword();

    obj.getVar("id").clear_vector();
    obj.getVar("id").push_vector(id);


    if (id == 16)
    {
        local ani = obj.getCustomAnimation(23);
        obj.setCurrentAnimation(ani);
        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
        return true;
    }

    if (id == 15)
    {
        local attackValue = receiveData.readDword();
        local ani = obj.getCustomAnimation(22);

        obj.setCurrentAnimation(ani);

        obj.getVar("flag").clear_vector();
        obj.getVar("flag").push_vector(0);

        obj.getVar("attackValue").clear_vector();
        obj.getVar("attackValue").push_vector(attackValue);


		local attackInfo = sq_GetCustomAttackInfo(obj, 4);
		sq_SetCurrentAttackInfo(obj, attackInfo);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);


    }
    if (id == 14)
    {
        local tarId = receiveData.readDword();
        local liveTime = receiveData.readDword();

        local object = sq_GetObjectByObjectId(obj,tarId);

        if (!object)
        {
            sq_SendDestroyPacketPassiveObject(obj);	
        }
//character/newswordman/hardattack_hell/ap_hardattack_hell.nut1

		local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(object, obj, SKILL_HARDATTACK_HELL, false, "character/newswordman/hardattack_hell/ap_hardattack_hell.nut", true);				 
		if(masterAppendage) 
        {
			sq_HoldAndDelayDie(object, obj, true, true, true,0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);
        }



        obj.setTimeEvent(0,liveTime,0,false);

        local ani = obj.getCustomAnimation(21);
        obj.setCurrentAnimation(ani);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

        obj.getVar("dama").clear_obj_vector();
        obj.getVar("dama").push_obj_vector(object);


    }

    if(id == 13)
    {
        local attackCount = receiveData.readDword();
        local lastAttack = receiveData.readDword();
        local liveTime = receiveData.readDword();

		local attackInfo = sq_GetCustomAttackInfo(obj, 3);
		sq_SetCurrentAttackInfo(obj, attackInfo);


        obj.getVar("holdValue").clear_vector();
        obj.getVar("holdValue").push_vector(lastAttack);
        obj.getVar("holdValue").push_vector(liveTime);

//        obj.setTimeEvent(0,200/attackCount,0,false);

        local ani = obj.getCustomAnimation(20);
        obj.setCurrentAnimation(ani);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

    }




    if (id == 0)
    {
        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
    }
    if (id == 1)
    {
        local ani = obj.getCustomAnimation(0);
		obj.setCurrentAnimation(ani);
        obj.setTimeEvent(0,100,1,false);
        obj.setTimeEvent(1,2000,1,false);
    }
    if (id == 2)
    {
        local ani = obj.getCustomAnimation(1);
        local size = receiveData.readWord();

        local sizeRate = size.tofloat() / 100.0;
        ani.setImageRateFromOriginal(sizeRate, sizeRate);
        ani.setAutoLayerWorkAnimationAddSizeRate(sizeRate);
        sq_SetAttackBoundingBoxSizeRate(ani, sizeRate, sizeRate, sizeRate);

		obj.setCurrentAnimation(ani);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

    }

     if (id == 3)
    {

        local blood = receiveData.readDword();

        local ani = obj.getCustomAnimation(2);
		obj.setCurrentAnimation(ani);
        obj.setTimeEvent(0,100,0,false);

        obj.getVar("speed").clear_vector();
        obj.getVar("speed").push_vector(-10);

        obj.getVar("y").clear_vector();
        obj.getVar("y").push_vector(sq_getRandom(-15,15));

        obj.getVar("blood2").clear_vector();
        obj.getVar("blood2").push_vector(blood);


    }

    if (id == 4)
    {

        local aCount = receiveData.readDword();
        local attackBouns2 = receiveData.readDword();

        obj.getVar("4state").clear_vector();
        obj.getVar("4state").push_vector(0);

        obj.getVar("aCount").clear_vector();
        obj.getVar("aCount").push_vector(aCount);


        obj.getVar("dama").clear_obj_vector();

        obj.getVar("attackBouns2").clear_vector();
        obj.getVar("attackBouns2").push_vector(attackBouns2);


        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
        local ani = obj.getCustomAnimation(3);
		obj.setCurrentAnimation(ani);


    }

    if (id == 5)
    {
        local ani = obj.getCustomAnimation(6);
		obj.setCurrentAnimation(ani);

    }
    if (id == 6)
    {
        local ani = obj.getCustomAnimation(7);
		obj.setCurrentAnimation(ani);

    }

    if (id == 7)
    {
        local ani = obj.getCustomAnimation(8);
		obj.setCurrentAnimation(ani);

    }

    if (id == 8)
    {


    }

    if (id == 9)
    {

        local targetid = receiveData.readDword();// 공격력(%)	
        local attackCount = receiveData.readDword();// 공격력(%)	
        local attackTime = receiveData.readDword();// 공격력(%)	

        local isOK = receiveData.readDword();// 공격력(%)	
        local attackLast = receiveData.readDword();// 공격력(%)	
	
        local weaponType = receiveData.readDword();// 공격력(%)

        local ani = obj.getCustomAnimation(9);
		obj.setCurrentAnimation(ani);

        obj.getVar("xlValue").clear_vector();
        obj.getVar("xlValue").push_vector(isOK);
        obj.getVar("xlValue").push_vector(attackLast);

        obj.getVar("attackvalue").clear_vector();
        obj.getVar("attackvalue").push_vector(attackCount);
        obj.getVar("attackvalue").push_vector(attackTime);

        obj.setTimeEvent(0,attackTime,0,false);

        local object = sq_GetObjectByObjectId(obj, targetid);

        obj.setCurrentPos(object.getXPos(),object.getYPos(),object.getZPos());

		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);

        obj.getVar("dama").clear_obj_vector();
        obj.getVar("dama").push_obj_vector(object);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);


        if (weaponType == 1000)
        {

            local ani = obj.getCustomAnimation(11);
            obj.setCurrentAnimation(ani);

        }
        if (weaponType == 2)//dunqi
        {

            local xyProc = receiveData.readDword();
            local xyLv = receiveData.readDword();
            local xyTime = receiveData.readDword();
            sq_SetChangeStatusIntoAttackInfo(attackInfo, 0, ACTIVESTATUS_STUN, xyProc, xyLv, xyTime);

            //sq_SetChangeStatusIntoAttackInfo(attackInfo, 0, ACTIVESTATUS_BLEEDING, blood_proc, blood_level, blood_time,blood_attackRate);

        }

        if (weaponType == 1)//dunqi
        {

            local bloodProc = receiveData.readDword();
            local bloodLv = receiveData.readDword();
            local bloodTime = receiveData.readDword();
            local bloodRate = receiveData.readDword();
            sq_SetChangeStatusIntoAttackInfo(attackInfo, 0, ACTIVESTATUS_BLEEDING, bloodProc, bloodLv, bloodTime,bloodRate);

        }

    }

    if(id == 10)
    {

        local swordID = receiveData.readDword();


        local ani = obj.getCustomAnimation(12+swordID%7);
        obj.setCurrentAnimation(ani);
		local attackInfo = sq_GetCustomAttackInfo(obj, 1);
		sq_SetCurrentAttackInfo(obj, attackInfo);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);


    }

    if(id == 11)
    {

        local ani = obj.getCustomAnimation(12+sq_getRandom(0, 6));
        local time = receiveData.readDword();

        obj.setTimeEvent(0,time,0,false);

        obj.setCurrentAnimation(ani);
		local attackInfo = sq_GetCustomAttackInfo(obj, 1);
		sq_SetCurrentAttackInfo(obj, attackInfo);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

        local currentAni = sq_GetCurrentAnimation(obj);

        local size = 200;
        local sizeRate = size.tofloat()/100.0;
        currentAni.setImageRateFromOriginal(sizeRate, sizeRate);
        currentAni.setAutoLayerWorkAnimationAddSizeRate(sizeRate);
        sq_SetAttackBoundingBoxSizeRate(currentAni, sizeRate, sizeRate, sizeRate);

    }

    if(id == 12)
    {

        local ani = obj.getCustomAnimation(19);
        obj.setCurrentAnimation(ani);

		local attackInfo = sq_GetCustomAttackInfo(obj, 2);
		sq_SetCurrentAttackInfo(obj, attackInfo);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);



    }



}


function onKeyFrameFlag_po_bloodcut(obj, flagIndex)
{
    if (obj.getVar("id").get_vector(0) == 15)
    {
        if (flagIndex == 1 )
        {

            if (obj.getVar("flag").get_vector(0) <= 0)
            {
                local flag = obj.getVar("flag").get_vector(0);
                obj.getVar("flag").clear_vector();
                obj.getVar("flag").push_vector(flag+1);

                local attack = obj.getVar("attackValue").get_vector(0);
                local attackInfo = sq_GetCurrentAttackInfo(obj);
                sq_SetCurrentAttackBonusRate(attackInfo, attack);

                obj.resetHitObjectList();
            }

        }
    }

}

function onAttack_po_bloodcut(obj,damager, boundingBox, isStuck)
{

	if (!obj)
		return 0;
    if (obj.getVar("id").get_vector(0) == 15)
    {

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_GHOSTOUT, false, "character/newswordman/ghostout/ap_ghostout.nut", true);				 
        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, true, true, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);
        }

    }


    if (obj.getVar("id").get_vector(0) == 13)
    {
        if (!damager) return false;
        local id = sq_GetObjectId(damager);
        local lastAttack = obj.getVar("holdValue").get_vector(0);
        local liveTime = obj.getVar("holdValue").get_vector(1);

        sq_BinaryStartWrite();
        sq_BinaryWriteDword(lastAttack);	// attackBonusRate
        sq_BinaryWriteDword(14);	// attackBonusRate
        sq_BinaryWriteDword(id);	// attackBonusRate
        sq_BinaryWriteDword(liveTime);	// attackBonusRate

        sq_SendCreatePassiveObjectPacketPos(obj,24357, 0, damager.getXPos(), damager.getYPos() + 1,damager.getZPos() + damager.getObjectHeight()/2 );

    }

    if (obj.getVar("id").get_vector(0) == 11)
    {
        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_SWORD80, false, "character/newswordman/sword80/ap_sword80.nut", true);				 
        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(damager, obj, true, true, true, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);
            damager.setCurrentDirection(sq_GetOppositeDirection(obj.getDirection()));
        }

    }


    if (obj.getVar("id").get_vector(0) == 0)
    {
        sq_SetMyShake(obj,4,200);

        sq_SendCreatePassiveObjectPacketPos(obj,12106, 0, obj.getXPos(), obj.getYPos() + 1, obj.getZPos());
    }

    if (obj.getVar("id").get_vector(0) == 2)
    {
        sq_SendCreatePassiveObjectPacketPos(obj,12138, 0, damager.getXPos(), damager.getYPos() + 1, damager.getZPos() + damager.getObjectHeight()/2 );
        sq_SendCreatePassiveObjectPacketPos(obj,12140, 0, damager.getXPos(), damager.getYPos() + 2, damager.getZPos() );

        if(damager)
            CNSquirrelAppendage.sq_RemoveAppendage(damager, "character/atmage/blood45/ap_blood45.nut");		

		sq_BinaryStartWrite();
		sq_BinaryWriteDword(0);	// attackBonusRate
        sq_BinaryWriteDword(3);
        sq_BinaryWriteDword(mmmmm );

		sq_SendCreatePassiveObjectPacketPos(obj,24357, 0,damager.getXPos(), damager.getYPos() + 1, damager.getZPos() + damager.getObjectHeight()/2 );


    }

    if (obj.getVar("id").get_vector(0) == 4)
    {
        if (obj.getVar("4state").get_vector(0) == 0)
        {
            if (damager.getState() != STATE_HOLD 
		     && sq_IsGrabable(obj,damager) 
		     && sq_IsHoldable(obj,damager) 
		     && !sq_IsFixture(damager))
            {

                local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(damager, obj, SKILL_NEWBLOODDOGHOLD, false, "character/atmage/newblooddoghold/ap_newblooddoghold.nut", true);				 
                if(masterAppendage) 
                {
                    sq_HoldAndDelayDie(damager, obj, true, true, true, 0, 0, ENUM_DIRECTION_NEUTRAL , masterAppendage);
                    damager.setCurrentDirection(sq_GetOppositeDirection(obj.getDirection()));
                }

                obj.getVar("dama").push_obj_vector(damager);
            }
        }

        if (obj.getVar("4state").get_vector(0) == 1)
        {
            if (damager.getState() != STATE_HOLD 
		     && sq_IsGrabable(obj,damager) 
		     && sq_IsHoldable(obj,damager) 
		     && !sq_IsFixture(damager))
            {
                obj.getVar("dama").push_obj_vector(damager);
                sq_SetMyShake(obj,5,100);
            }
        }

    }
}




function onTimeEvent_po_bloodcut(obj, timeEventIndex, timeEventCount)
{


    if (obj.getVar("id").get_vector(0) == 14)
    {
        if (timeEventIndex == 0)
        {

            local damager = obj.getVar("dama").get_obj_vector(0);
            sq_SendHitObjectPacket(obj,damager,0,0,0);

            sq_SendCreatePassiveObjectPacketPos(obj,12200, 0, damager.getXPos(), damager.getYPos() + 1, damager.getZPos() + damager.getObjectHeight()/2 );

            sq_SendDestroyPacketPassiveObject(obj);	




//                obj.resetHitObjectList();
        }
    }

    if (obj.getVar("id").get_vector(0) == 13)
    {
        if (timeEventIndex == 0)
        {
                obj.resetHitObjectList();
        }
    }


    if (obj.getVar("id").get_vector(0) == 11)
    {
        if (timeEventIndex == 0)
        {
            sq_SendDestroyPacketPassiveObject(obj);	
        }
    }

    if (obj.getVar("id").get_vector(0) == 9)
    {
        if (timeEventIndex == 0)
        {
            if (timeEventCount <= obj.getVar("attackvalue").get_vector(0))
            {
                local damager = obj.getVar("dama").get_obj_vector(0);
                if (damager)
                {
                    sq_SendHitObjectPacket(obj,damager,0,0,0);
                }else{

            sq_SendDestroyPacketPassiveObject(obj);	

                }
            }else{
                local isxz = obj.getVar("xlValue").get_vector(0);

                if (isxz == 0)
                {
                    sq_SendDestroyPacketPassiveObject(obj);	
                }else{


                    local ani = obj.getCustomAnimation(10);
                    obj.setCurrentAnimation(ani);

                    local attackLast = obj.getVar("xlValue").get_vector(1);

                    local attackInfo = sq_GetCustomAttackInfo(obj, 0);
                    sq_SetCurrentAttackInfo(obj, attackInfo);

                    local attackInfo = sq_GetCurrentAttackInfo(obj);
                    sq_SetCurrentAttackBonusRate(attackInfo, attackLast);
    
                    local damager = obj.getVar("dama").get_obj_vector(0);

                    sq_SendHitObjectPacket(obj,damager,0,0,0);

                obj.setTimeEvent(0,99999,0,false);

                }
            }

        }

    }

    if (obj.getVar("id").get_vector(0) == 1)
    {
        if (timeEventIndex == 0)
        {
            obj.getVar("big").clear_vector();
            obj.getVar("big").push_vector(0);
            obj.setTimeEvent(2,100,999,false);
        }
        if (timeEventIndex == 1)
        {

            sq_SendDestroyPacketPassiveObject(obj);
        }

        if (timeEventIndex == 2)
        {
            local currentBig = obj.getVar("big").get_vector(0);
            local currentAni = sq_GetCurrentAnimation(obj);

            local sizeRate = (100 + currentBig).tofloat() / 100.0;
            currentAni.setImageRateFromOriginal(sizeRate, sizeRate);
            currentAni.setAutoLayerWorkAnimationAddSizeRate(sizeRate);

            obj.getVar("big").clear_vector();
            obj.getVar("big").push_vector(currentBig + 10);
        }
    }


    if (obj.getVar("id").get_vector(0) == 3)
    {

        if (timeEventIndex == 0)
        {
        obj.getVar("speed").set_vector(0, obj.getVar("speed").get_vector(0) + 1 );
        }

    }

    if (obj.getVar("id").get_vector(0) == 4)
    {
        if (timeEventIndex == 0 && obj.getVar("4state").get_vector(0) == 1 )
        {
            if (timeEventCount > obj.getVar("aCount").get_vector(0))
            {
                local ani = obj.getCustomAnimation(5);
                obj.setCurrentAnimation(ani);

                local attackBonusRate = obj.getVar("attackBouns2").get_vector(0);

                local attackInfo = sq_GetCurrentAttackInfo(obj);
                sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

                obj.resetHitObjectList();

                obj.getVar("4state").clear_vector();
                obj.getVar("4state").push_vector(2);

                local dvalue = 1;
                if (sq_GetDirection(obj) == ENUM_DIRECTION_LEFT) dvalue = -1;
                sq_SendCreatePassiveObjectPacketPos(obj,12165, 0, obj.getXPos() + 120 * dvalue , obj.getYPos() + 1, obj.getZPos() );


            }else{

                obj.resetHitObjectList();

                obj.getVar("aCCount").clear_vector();
                obj.getVar("aCCount").push_vector(timeEventCount);

            }

        }
    }

}






function procAppend_po_bloodcut(obj)
{

    if (obj.getVar("id").get_vector(0) == 14)
    {
        local damager = obj.getVar("dama").get_obj_vector(0);
        if (damager)
        {
            damager.setCurrentPos(obj.getXPos(),obj.getYPos(),obj.getZPos() - damager.getObjectHeight()/2);
        }else{

            sq_SendDestroyPacketPassiveObject(obj);
        }
    }


    if (obj.getVar("id").get_vector(0) == 9)
    {
        local damager = obj.getVar("dama").get_obj_vector(0);
        if (damager)
        {

            obj.setCurrentPos(damager.getXPos(),damager.getYPos(),damager.getZPos() + damager.getObjectHeight()/2);
        }

    }

    if (obj.getVar("id").get_vector(0) == 1)
    {
        local mage = obj.getTopCharacter();
        mage = sq_ObjectToSQRCharacter(mage);	

        local state = mage.getVar("state").get_vector(0);
        if (state == 2)
        {
            sq_SendDestroyPacketPassiveObject(obj);	
        }

    }
    if (obj.getVar("id").get_vector(0) >= 5 && obj.getVar("id").get_vector(0) <= 7)
    {
        local mage = obj.getTopCharacter();
        mage = sq_ObjectToSQRCharacter(mage);	

        local state = mage.getVar("state").get_vector(0);
        if (state == 2)
        {
            sq_SendDestroyPacketPassiveObject(obj);	
        }
    }

    if (obj.getVar("id").get_vector(0) == 3)
    {

        local mage = obj.getTopCharacter();
        mage = sq_ObjectToSQRCharacter(mage);	

        if (!mage)
        {

            sq_SendDestroyPacketPassiveObject(obj);	
        }
        local chrX = mage.getXPos();
        local chrY = mage.getYPos();
        local chrZ = mage.getZPos();


        local objX = obj.getXPos();
        local objY = obj.getYPos();
        local objZ = obj.getZPos() - (obj.getObjectHeight() * 2) / 3;


        if (obj.getVar("speed").get_vector(0) < 0)
        {

            local moveSpeed = - 3;
            local speedX = moveSpeed + obj.getVar("speed").get_vector(0);
            if (obj.getVar("y").get_vector(0)< 0 )
            {
                local speedY = obj.getVar("y").get_vector(0) - obj.getVar("speed").get_vector(0);
            }else{
                local speedY = obj.getVar("y").get_vector(0) + obj.getVar("speed").get_vector(0);
            }
            local speedZ = 1;

            if (chrX < objX ) speedX = - speedX;
            if (abs(chrX - objX) <= moveSpeed * 2) speedX = 0;

            obj.setCurrentPos(objX + speedX,objY + speedY,obj.getZPos() + speedZ);

        }else{

            local moveSpeed = - 3;
            local speedX = moveSpeed + obj.getVar("speed").get_vector(0);
            local speedY = obj.getVar("speed").get_vector(0);
            local speedZ = 1;

            if (chrX < objX ) speedX = - speedX;
            if (chrY < objY) speedY = - speedY;
            if (chrZ < objZ) speedZ = - speedZ;
        
            if (abs(chrX - objX) <= -moveSpeed * 2) speedX = 0;
            if (abs(chrY - objY) <= -moveSpeed * 2) speedY = 0;
            if (abs(chrZ - objZ) <= 2 ) speedZ = 0;
        
            obj.setCurrentPos(objX + speedX,objY + speedY,obj.getZPos() + speedZ);

        }


        if (abs(chrX - objX) < 20 && abs(chrY - objY) < 20 )
        {
            sq_SendCreatePassiveObjectPacketPos(obj,12160, 0, chrX,chrY,chrZ);
            sq_SendDestroyPacketPassiveObject(obj);	
            setBloodValue(mage,obj.getVar("blood2").get_vector(0) );

        }

    }


    if (obj.getVar("id").get_vector(0) == 4)
    {

        local var = obj.getVar("dama");  		
        local objectsSize = var.get_obj_vector_size();

        if (true)
        {

            for(local i=0;i<objectsSize;++i)
            {
                local damager = var.get_obj_vector(i);

                local dvalue = 1;
                if (sq_GetDirection(obj) == ENUM_DIRECTION_LEFT) dvalue = -1;

                local objX = obj.getXPos();
                local objY = obj.getYPos();
                local objZ = obj.getZPos();


                if (obj.getVar("4state").get_vector(0) == 0)
                {
                    damager.setCurrentPos(objX + 120 * dvalue,objY + 1,50 + objZ - damager.getObjectHeight()/2);
                }else{

                    local pAni = sq_GetCurrentAnimation(obj);
                    local frmIndex = sq_GetAnimationFrameIndex(pAni);

                    if (obj.getVar("4state").get_vector(0) == 1)
                    {

                        local x = 0;
                        local z = 0;
                        local xz = 0;

                        if (frmIndex == 0)
                        {
                            x = 176;
                            z = 17;
                            xz = - 52;
                        }

                        if (frmIndex == 1)
                        {
                            x = 163;
                            z = 16;
                            xz = -40;
                        }

                        if (frmIndex == 2)
                        {
                            x = 209;
                            z = 18;
                            xz = -28;
                        }

                        if (frmIndex == 3)
                        {
                            x = 223;
                            z = 32;
                            xz = -16;
                        }

                        if (frmIndex == 4)
                        {
                            x = 241;
                            z = 39;
                            xz = -4;
                        }

                        if (frmIndex == 5)
                        {
                            x = 236;
                            z = 37;
                            xz = 8;
                        }

                        if (frmIndex == 6)
                        {
                            x = 223;
                            z = 36;
                            xz = 20;
                        }

                        if (frmIndex == 7)
                        {
                            x = 213;
                            z = 29;
                            xz = 32;
                        }

                        if (frmIndex == 8)
                        {
                            x = 187;
                            z = 21;
                            xz = 44;
                        }

                        if (frmIndex == 9)
                        {
                            x = 165;
                            z = 36;
                            xz = 52;
                        }

                        if (frmIndex == 10)
                        {
                            x = 182;
                            z = 18;
                            xz = 40;
                        }

                        if (frmIndex == 11)
                        {
                            x = 212;
                            z = 32;
                            xz = 28;
                        }

                        if (frmIndex == 12)
                        {
                            x = 232;
                            z = 39;
                            xz = 16;
                        }

                        if (frmIndex == 13)
                        {
                            x = 229;
                            z = 37;
                            xz = 4;

                        }

                        if (frmIndex == 14)
                        {
                            x = 210;
                            z = 36;
                            xz = -8;

                        }

                        if (frmIndex == 15)
                        {
                            x = 193;
                            z = 39;
                            xz = -20;
                        }


                        damager.setCurrentPos(objX + x * dvalue,objY + 1,25 + z + objZ - damager.getObjectHeight()/2);
                        sq_SetCustomRotate(damager,xz.tofloat() * dvalue / 100.0);

                    }else{
                        sq_SetCustomRotate(damager,0.0);

                        local x = 0;
                        local z = 0;

                        if (frmIndex == 0)
                        {
                            x = 89;
                            z = 140;

                        }
                        if (frmIndex >= 1 && frmIndex <= 5)
                        {
                            x = -123;
                            z = 290;
                        }

                        if (frmIndex == 6)
                        {
                            x = 116;
                            z = 229;
                        }

                        if (frmIndex >= 7)
                        {
                            x = 243;
                            z = 33;
                        }

                        damager.setCurrentPos(objX + x * dvalue,objY + 1,25 + z + objZ);


                        //damager.setCurrentPos(objX + 360 * dvalue,objY + 1,50 + objZ - damager.getObjectHeight()/2);
                    }

                }


            }
        }
    }




}



function onEndCurrentAni_po_bloodcut(obj)
{
    if (obj.getVar("id").get_vector(0) == 16)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 15)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 13)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 12)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 10)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 0)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 9)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}


    if (obj.getVar("id").get_vector(0) == 1)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 2)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 3)
    {
		sq_SendDestroyPacketPassiveObject(obj);
	}

    if (obj.getVar("id").get_vector(0) == 4)
    {
        if (obj.getVar("4state").get_vector(0) == 0)
        {

            local ani = obj.getCustomAnimation(4);
            obj.setCurrentAnimation(ani);

            obj.getVar("4state").clear_vector();
            obj.getVar("4state").push_vector(1);

            obj.getVar("aCCount").clear_vector();

            obj.setTimeEvent(0,150,0,false);

        }

        if (obj.getVar("4state").get_vector(0) == 2)
        {

        local dvalue = 1;
        if (sq_GetDirection(obj) == ENUM_DIRECTION_LEFT) dvalue = -1;

        sq_SendCreatePassiveObjectPacketPos(obj,12036, 0, obj.getXPos() + 120 * dvalue , obj.getYPos() + 1, obj.getZPos() );


        sq_SendDestroyPacketPassiveObject(obj);
        }

	}


}