
// setCustomData
function setCustomData_po_bursterbeamendboom(obj, receiveData)
{
	if(!obj)
		return;
	local powerboom = receiveData.readDword();
	local attackBonusRateboom = receiveData.readDword();
	
	local attackInfo = sq_GetCurrentAttackInfo(obj);

	sq_SetCurrentAttackPower(attackInfo, powerboom);
	sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRateboom);
}

function onEndCurrentAni_po_bursterbeamendboom(obj)
{
	if(!obj)
		return;
		
	if(obj.isMyControlObject())
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}
}

