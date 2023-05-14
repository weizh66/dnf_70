
function setCustomData_po_FinalHeaven(obj, receiveData)
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

function procAppend_po_FinalHeaven(obj)
{
	local damager = obj.getVar("dama").get_obj_vector(0);
	if (!damager)
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}else{
      obj.setCurrentPos(damager.getXPos(),damager.getYPos() + 1,damager.getZPos() + damager.getObjectHeight()/2);
  }
  
}
