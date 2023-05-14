
function setCustomData_po_FlashCut(obj, receiveData)
{
	if(!obj)
		return;

	local id = receiveData.readDword();
	local tarid = receiveData.readDword();
	if (id == 0)
    {
		local ani = obj.getCustomAnimation(0);
        obj.setCurrentAnimation(ani);
	}
	
	local object = sq_GetObjectByObjectId(obj,tarid);
	obj.getVar("dama").clear_obj_vector();
	obj.getVar("dama").push_obj_vector(object);
	

}

function procAppend_po_FlashCut(obj)
{
	local damager = obj.getVar("dama").get_obj_vector(0);
	if (!damager)
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}else{
      obj.setCurrentPos(damager.getXPos(),damager.getYPos() + 1,damager.getZPos() + damager.getObjectHeight()/2);
  }
  
}

function onKeyFrameFlag_po_FlashCut(obj, flagIndex)
{
    local damager = obj.getVar("dama").get_obj_vector(0);
    if (flagIndex == 0)
    {
        local ani = obj.getCustomAnimation(1);
        obj.setCurrentAnimation(ani);
        sq_SendHitObjectPacket(obj,damager,0,0,0);
	}
	if (flagIndex == 1)
    {
        local ani = obj.getCustomAnimation(2);
        obj.setCurrentAnimation(ani);
        sq_SendHitObjectPacket(obj,damager,0,0,0);
	}
	if (flagIndex == 2)
    {
        local ani = obj.getCustomAnimation(3);
        obj.setCurrentAnimation(ani);
        sq_SendHitObjectPacket(obj,damager,0,0,0);
	}
	if (flagIndex == 3)
    {
        local ani = obj.getCustomAnimation(4);
        obj.setCurrentAnimation(ani);
        sq_SendHitObjectPacket(obj,damager,0,0,0);
	}
	if (flagIndex == 4)
	{
        local ani = obj.getCustomAnimation(5);
        obj.setCurrentAnimation(ani);
		sq_SendHitObjectPacket(obj,damager,0,0,0);
    }
	if (flagIndex == 5)
	{
        local ani = obj.getCustomAnimation(6);
        obj.setCurrentAnimation(ani);
	}

}
