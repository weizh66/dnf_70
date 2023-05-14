
function setCustomData_po_BloodBoom(obj, receiveData)
{
	
	if(!obj)
		return;

	local id = receiveData.readDword();		
	local tarid = receiveData.readDword();	
	local power = receiveData.readDword();	
	local object = sq_GetObjectByObjectId(obj,tarid);
	obj.getVar("dama").clear_obj_vector();
	obj.getVar("dama").push_obj_vector(object);
	obj.getVar("id").clear_vector();
    obj.getVar("id").push_vector(id);
	
	if (id == 0)	//Boom1
    {
		local ani = obj.getCustomAnimation(0);
        obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
		
		local attackInfo = sq_GetCurrentAttackInfo(obj, attackInfo);
		sq_SetCurrentAttackPower(attackInfo, power);
		
	}
	if (id == 1)	//Boom2
    {
		local ani = obj.getCustomAnimation(1);
        obj.setCurrentAnimation(ani);
	}
	if (id == 2)	//BloodRiven
    {
		local ani = obj.getCustomAnimation(2);
        obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
		
		local attackInfo = sq_GetCurrentAttackInfo(obj, attackInfo);
		sq_SetCurrentAttackPower(attackInfo, power);
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
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 1);	
		sq_SetCurrentAttackInfo(obj, attackInfo);
		
		local attackInfo = sq_GetCurrentAttackInfo(obj, attackInfo);
		sq_SetCurrentAttackPower(attackInfo, power);
	}
	if (id == 6)	
    {
		local ani = obj.getCustomAnimation(6);	//RageStart
        obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 2);	
		sq_SetCurrentAttackInfo(obj, attackInfo);
		
		local attackInfo = sq_GetCurrentAttackInfo(obj, attackInfo);
		sq_SetCurrentAttackPower(attackInfo, power);
	}
	if (id == 7)	
    {
		local ani = obj.getCustomAnimation(7);	//RageAttack1
        obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 3);	
		sq_SetCurrentAttackInfo(obj, attackInfo);
		
		local attackInfo = sq_GetCurrentAttackInfo(obj, attackInfo);
		sq_SetCurrentAttackPower(attackInfo, power);
		
		local atkT = receiveData.readDword();	
		obj.setTimeEvent(0, 45, 3, true);	
	}
	if (id == 8)	
    {
		local ani = obj.getCustomAnimation(8);	//RageAttack2
        obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 3);	
		sq_SetCurrentAttackInfo(obj, attackInfo);
		
		local attackInfo = sq_GetCurrentAttackInfo(obj, attackInfo);
		sq_SetCurrentAttackPower(attackInfo, power);
		
		local atkT = receiveData.readDword();	
		obj.setTimeEvent(0, 45, 2, true);	
	}
	if (id == 9)	
    {
		local ani = obj.getCustomAnimation(9);	//RageAttack3
        obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 4);	
		sq_SetCurrentAttackInfo(obj, attackInfo);
		
		local attackInfo = sq_GetCurrentAttackInfo(obj, attackInfo);
		sq_SetCurrentAttackPower(attackInfo, power);
		
		local atkT = receiveData.readDword();	
		obj.setTimeEvent(0, 45, 4, true);	
	}
	if (id == 10)	
    {
		local ani = obj.getCustomAnimation(10);	
        obj.setCurrentAnimation(ani);
		
		local time = receiveData.readDword();	
		obj.setTimeEvent(1,1400,0,false);
	}
	if (id == 11)	
    {
		local ani = obj.getCustomAnimation(11);	
        obj.setCurrentAnimation(ani);
		
		local time = receiveData.readDword();	
		obj.setTimeEvent(1,1400,0,false);
	}
	if (id == 12)	
    {
		local ani = obj.getCustomAnimation(12);	
        obj.setCurrentAnimation(ani);
		
		local time = receiveData.readDword();	
		obj.setTimeEvent(1,1400,0,false);
	}
	if (id == 13)	
    {
		local ani = obj.getCustomAnimation(13);	
        obj.setCurrentAnimation(ani);
		
		local time = receiveData.readDword();	
		obj.setTimeEvent(1,1400,0,false);
	}
	if (id == 14)	
    {
		local ani = obj.getCustomAnimation(14);
        obj.setCurrentAnimation(ani);
	}
	if (id == 15)	
    {
		local ani = obj.getCustomAnimation(15);
        obj.setCurrentAnimation(ani);
	}
	if (id == 16)	
    {
		local ani = obj.getCustomAnimation(16);
        obj.setCurrentAnimation(ani);
	}
	if (id == 17)	
    {
		local ani = obj.getCustomAnimation(17);
        obj.setCurrentAnimation(ani);
	}
}

function onTimeEvent_po_BloodBoom(obj, timeEventIndex, timeEventCount)
{
	if (obj.getVar("id").get_vector(0) == 7)
	{	
		if (timeEventIndex == 0)
		{
			obj.resetHitObjectList();
		}
	}
	if (obj.getVar("id").get_vector(0) == 8)
	{	
		if (timeEventIndex == 0)
		{
			obj.resetHitObjectList();
		}
	}
	if (obj.getVar("id").get_vector(0) == 9)
	{	
		if (timeEventIndex == 0)
		{
			obj.resetHitObjectList();
		}
	}
	if (obj.getVar("id").get_vector(0) == 10)
    {
		if (timeEventIndex == 1)
		{
			sq_SendDestroyPacketPassiveObject(obj);
		}
    }
	if (obj.getVar("id").get_vector(0) == 11)
    {
		if (timeEventIndex == 1)
		{
			sq_SendDestroyPacketPassiveObject(obj);
		}
    }
	if (obj.getVar("id").get_vector(0) == 12)
    {
		if (timeEventIndex == 1)
		{
			sq_SendDestroyPacketPassiveObject(obj);
		}
    }
	if (obj.getVar("id").get_vector(0) == 13)
    {
		if (timeEventIndex == 1)
		{
			sq_SendDestroyPacketPassiveObject(obj);
		}
    }
}	

function procAppend_po_BloodBoom(obj)
{
	local damager = obj.getVar("dama").get_obj_vector(0);
	
	if (obj.getVar("id").get_vector(0) == 3)
    {
		if (!damager)
		{
			sq_SendDestroyPacketPassiveObject(obj);
		}else{
		obj.setCurrentPos(damager.getXPos(),damager.getYPos() + 1,damager.getZPos() + damager.getObjectHeight()/2);
		}
	}
	if (obj.getVar("id").get_vector(0) == 4)
    {
		if (!damager)
		{
			sq_SendDestroyPacketPassiveObject(obj);
		}else{
		obj.setCurrentPos(damager.getXPos(),damager.getYPos() + 1,damager.getZPos() + damager.getObjectHeight()/2);
		}
	}
}
