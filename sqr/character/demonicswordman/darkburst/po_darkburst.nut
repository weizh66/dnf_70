
function setCustomData_po_DarkBurst(obj, receiveData)
{
	if(!obj)
		return;

	local id = receiveData.readDword();
	
	if (id == 0)
    {
		local ani = obj.getCustomAnimation(0);
        obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj,0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (id == 1)
    {
		local ani = obj.getCustomAnimation(1);
        obj.setCurrentAnimation(ani);
	}

}
