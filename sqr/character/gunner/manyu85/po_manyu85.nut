function setCustomData_po_seventhflow(obj, receiveData)
{
	if(!obj)
		return;

	local attackBonusRate = receiveData.readDword();// 공격력(%)	
	local id = receiveData.readDword();// 공격력(%)	

    local ani = obj.getCustomAnimation(id);
	obj.setCurrentAnimation(ani);


	local attackInfo = sq_GetCurrentAttackInfo(obj);
	sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

    if (id == 11)
    {
        obj.setTimeEvent(0,50,0,false);
    }

}

function onTimeEvent_po_seventhflow(obj, timeEventIndex, timeEventCount)
{
        obj.resetHitObjectList();
}

function onEndCurrentAni_po_seventhflow(obj)
{

		sq_SendDestroyPacketPassiveObject(obj);
}
