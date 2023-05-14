
function setCustomData_po_pentagonattack(obj, reciveData)
{
	if(!obj) return;	
	
	local power			= reciveData.readFloat();
			
	local attackInfo = sq_GetCurrentAttackInfo(obj);
	if(attackInfo)
	{
		sq_SetCurrentAttackBonusRate(attackInfo, power.tointeger());
		sq_SetAttackInfoForceHitStunTime(attackInfo, 0);
	}
}

function onEndCurrentAni_po_pentagonattack(obj)
{
	if(!obj)
		return;
		
	if(obj.isMyControlObject())
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}
}
