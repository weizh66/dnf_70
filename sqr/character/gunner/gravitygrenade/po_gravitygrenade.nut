
function setCustomData_po_gravitygrenadeattack(obj, reciveData)
{
	if(!obj) return;	
	
	local power		= reciveData.readDword();
	local attackBonusRate	= reciveData.readDword();	
			
	local attackInfo = sq_GetCurrentAttackInfo(obj);
	sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
	sq_SetCurrentAttackPower(attackInfo, power);
}

function onEndCurrentAni_po_gravitygrenadeattack(obj)
{
	if(!obj)
		return;
		
	if(obj.isMyControlObject())
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}
}
