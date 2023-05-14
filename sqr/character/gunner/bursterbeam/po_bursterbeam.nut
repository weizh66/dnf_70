
// setCustomData
function setCustomData_po_BursterBeamNewCircle(obj, receiveData)
{
	if(!obj)
		return;
	local power = receiveData.readDword();
	
	local attackInfo = sq_GetCurrentAttackInfo(obj);
	sq_SetCurrentAttackPower(attackInfo, power);
}

function onEndCurrentAni_po_BursterBeamNewCircle(obj)
{
	if(!obj)
		return;
		
	if(obj.isMyControlObject())
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}
}

