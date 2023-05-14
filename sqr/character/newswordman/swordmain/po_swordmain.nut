function setCustomData_po_handlingsword(obj, receiveData)
{

    local id = receiveData.readDword();

    if (id == 0)
    {
        local ani = obj.getCustomAnimation(0);
        obj.setCurrentAnimation(ani);
    }
    if (id == 1)
    {
        local ani = obj.getCustomAnimation(1);
        obj.setCurrentAnimation(ani);
    }
    if (id == 2)
    {
        local ani = obj.getCustomAnimation(2);
        obj.setCurrentAnimation(ani);
    }
    if (id == 3)
    {
        local ani = obj.getCustomAnimation(3);
        obj.setCurrentAnimation(ani);
    }
    if (id == 4)
    {
        local ani = obj.getCustomAnimation(4);
        obj.setCurrentAnimation(ani);
    }

    if (id == 5)
    {
        local ani = obj.getCustomAnimation(5);
        obj.setCurrentAnimation(ani);
    }

    if (id == 6)
    {
//        swordmain_Number = swordmain_Number+1;
        local attack = receiveData.readDword();
        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attack);

        local ani = obj.getCustomAnimation(6);
        obj.setCurrentAnimation(ani);
        sq_SetCustomRotate(obj,0.784);

        obj.setTimeEvent(0,50,1,false);

        local rand = sq_getRandom(0 , 100);
        if (rand<50)
        {
            obj.setCurrentDirection(sq_GetOppositeDirection(obj.getDirection()));
        }
    }

    if (id == 7)
    {
        local ani = obj.getCustomAnimation(7);
        obj.setCurrentAnimation(ani);
    }

    if (id == 8)
    {
        local ani = obj.getCustomAnimation(8);
        obj.setCurrentAnimation(ani);
    }

    if (id == 9)
    {
        local ani = obj.getCustomAnimation(9);
        obj.setCurrentAnimation(ani);
    }

    if (id == 10)
    {
        local ani = obj.getCustomAnimation(10);
        obj.setCurrentAnimation(ani);
    }


    obj.getVar("id").clear_vector();
    obj.getVar("id").push_vector(id);

}

function setState_po_handlingsword(obj, state, datas)
{
    if (state == 0)
    {
        sq_SendDestroyPacketPassiveObject(obj);
    }

}

function onTimeEvent_po_handlingsword(obj, timeEventIndex, timeEventCount)
{

    if (timeEventIndex == 0) 
    {
        swordmain_Number = swordmain_Number+1;

    }
}
function onEndCurrentAni_po_handlingsword(obj)
{
    local id = obj.getVar("id").get_vector(0);

    if (id == 5)
    {
        sq_SendDestroyPacketPassiveObject(obj);
    }
    if (id == 6)
    {

        sq_SendDestroyPacketPassiveObject(obj);
    }
    if (id == 7)
    {
        obj.sq_StartWrite();
        obj.sq_WriteDword(0);	// attackBonusRate
        sq_SendCreatePassiveObjectPacketPos(obj,24315, 0, obj.getXPos(),obj.getYPos(),obj.getZPos());
        sq_SendDestroyPacketPassiveObject(obj);
    }

    if (id == 8)
    {
        obj.sq_StartWrite();
        obj.sq_WriteDword(1);	// attackBonusRate
        sq_SendCreatePassiveObjectPacketPos(obj,24315, 0, obj.getXPos(),obj.getYPos(),obj.getZPos());
        sq_SendDestroyPacketPassiveObject(obj);
    }

    if (id == 9)
    {
        obj.sq_StartWrite();
        obj.sq_WriteDword(2);	// attackBonusRate
        sq_SendCreatePassiveObjectPacketPos(obj,24315, 0, obj.getXPos(),obj.getYPos(),obj.getZPos());
        sq_SendDestroyPacketPassiveObject(obj);
    }

    if (id == 10)
    {
        obj.sq_StartWrite();
        obj.sq_WriteDword(3);	// attackBonusRate
        sq_SendCreatePassiveObjectPacketPos(obj,24315, 0, obj.getXPos(),obj.getYPos(),obj.getZPos());
        sq_SendDestroyPacketPassiveObject(obj);
    }

    if (id >=0 && id <= 4)
    {



    }

}


function procAppend_po_handlingsword(obj)
{
    local id = obj.getVar("id").get_vector(0);
    if (id >= 0 && id <= 4)
    {
        local swordman = obj.getTopCharacter();
        swordman = sq_ObjectToSQRCharacter(swordman);	

        obj.setCurrentDirection(swordman.getDirection());
        obj.setCurrentPos(swordman.getXPos(),swordman.getYPos()-1,swordman.getZPos() );
    }

    if (id >= 7 && id <= 10)
    {
        local swordman = obj.getTopCharacter();
        swordman = sq_ObjectToSQRCharacter(swordman);	

        obj.setCurrentDirection(swordman.getDirection());
        obj.setCurrentPos(swordman.getXPos(),swordman.getYPos()-1,swordman.getZPos() );
    }

}