
function setCustomData_po_chaserclusterobjectboom(obj, reciveData)
{
	if(!obj) return;	
	
	local attack		= reciveData.readFloat();
			
	local attackInfo = sq_GetCurrentAttackInfo(obj);
	if(attackInfo)
	{
		sq_SetCurrentAttackBonusRate(attackInfo, attack.tointeger());
		sq_SetAttackInfoForceHitStunTime(attackInfo, 0);
	}
}

function onEndCurrentAni_po_chaserclusterobjectboom(obj)
{
	if(!obj)
		return;
		
	if(obj.isMyControlObject())
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}
}
