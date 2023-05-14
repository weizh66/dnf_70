
function setCustomData_po_handlingswordfinishfirst(obj, receiveData)
{

    local attack1 = receiveData.readDword();
    local time = receiveData.readDword();
    local time2 = receiveData.readDword();
    local attack2 = receiveData.readDword();
    local height = receiveData.readDword();

    obj.setTimeEvent(0,time,0,true);
    local attackInfo = sq_GetCurrentAttackInfo(obj);
    sq_SetCurrentAttackBonusRate(attackInfo, attack1);

    local targetX = obj.getXPos();
    local targetY = obj.getYPos();
    local targetZ = obj.getZPos();

	local pChr = obj.getTopCharacter();
	local target = getPriorityTarget(pChr, -40, 600,300,1000, null, false);


    if (target)
    {
        targetX = target.getXPos();
        targetY = target.getYPos();
        targetZ = target.getZPos();

        local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage(target, obj, SKILL_SWORDMAIN, false, "character/newswordman/swordmain/ap_swordmain_last.nut", true);				 
        if(masterAppendage) 
        {
            sq_HoldAndDelayDie(target, obj, true, true, true, 200, 200, ENUM_DIRECTION_NEUTRAL , masterAppendage);
        }

        obj.getVar("dama").clear_obj_vector();
        obj.getVar("dama").push_obj_vector(target);

    }

        obj.setCurrentPos(targetX,targetY,height);
        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(0);

        obj.setTimeEvent(0,time,0,true);

        obj.getVar("attack2").clear_vector();
        obj.getVar("attack2").push_vector(attack2);
        obj.getVar("attack2").push_vector(time2);

        obj.getVar("hei").clear_vector();
        obj.getVar("hei").push_vector(height);

}

function procAppend_po_handlingswordfinishfirst(obj)
{
    local target = obj.getVar("dama").get_obj_vector(0);
    
    if (target)
    {
        local hei = obj.getVar("hei").get_vector(0);

        if (target.getZPos() > hei) 
        {
            target.setCurrentPos(obj.getXPos(),obj.getYPos(),target.getZPos()-1);
        }
        if (target.getZPos() < hei) 
        {
            target.setCurrentPos(obj.getXPos(),obj.getYPos(),target.getZPos()+1);
        }
        if (target.getZPos() == hei) 
        {
            target.setCurrentPos(obj.getXPos(),obj.getYPos(),hei);
        }

    }


}


function onTimeEvent_po_handlingswordfinishfirst(obj, timeEventIndex, timeEventCount)
{
    if (timeEventIndex == 0)
    {
        obj.resetHitObjectList();

    }
    if (timeEventIndex == 1)
    {
        sq_SendDestroyPacketPassiveObject(obj);
    }

}

function onEndCurrentAni_po_handlingswordfinishfirst(obj)
{
    if (obj.getVar("state").get_vector(0) == 0)
    {
        local attack1 = obj.getVar("attack2").get_vector(0);
        local time = obj.getVar("attack2").get_vector(1);
        local attackInfo = sq_GetCurrentAttackInfo(obj);
        sq_SetCurrentAttackBonusRate(attackInfo, attack1);
        local ani = obj.getCustomAnimation(0);
		obj.setCurrentAnimation(ani);
        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(1);
        obj.setTimeEvent(0,time,0,true);
        obj.setTimeEvent(1,4000,0,false);
        obj.getVar("hei").clear_vector();
        obj.getVar("hei").push_vector(0);

        obj.setCurrentPos(obj.getXPos(),obj.getYPos(),0);
        return true;
    }

    if (obj.getVar("state").get_vector(0) == 1)
    {
        sq_SendDestroyPacketPassiveObject(obj);

    }
}