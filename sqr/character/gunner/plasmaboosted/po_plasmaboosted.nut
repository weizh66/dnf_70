
function setCustomData_po_plasmaboost(obj, reciveData)
{
	if(!obj) return;	
	
	local power			= reciveData.readFloat();
	local power1			= reciveData.readFloat();
	local power2			= reciveData.readFloat();
	local power3			= reciveData.readFloat();
	local power4			= reciveData.readFloat();
			
	local attackInfo = sq_GetCurrentAttackInfo(obj);
	if(attackInfo)
	{
		sq_SetCurrentAttackBonusRate(attackInfo, power.tointeger());
		sq_SetCurrentAttackBonusRate(attackInfo, power1.tointeger());
		sq_SetCurrentAttackBonusRate(attackInfo, power2.tointeger());
		sq_SetCurrentAttackBonusRate(attackInfo, power3.tointeger());
		sq_SetCurrentAttackBonusRate(attackInfo, power4.tointeger());
		sq_SetAttackInfoForceHitStunTime(attackInfo, 0);
	}
}

function onEndCurrentAni_po_plasmaboost(obj)
{
	if(!obj)
		return;
		
	if(obj.isMyControlObject())
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}
}
