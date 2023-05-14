
function setCustomData_po_poisonexplosion(obj, reciveData)
{
	if(!obj) return;	
	
	local power			= reciveData.readFloat();
	local poisonLevel	= reciveData.readDword();	
	local poisonProb	= reciveData.readDword();	
	local poisonTime	= reciveData.readDword();	
			
	local attackInfo = sq_GetCurrentAttackInfo(obj);
	if(attackInfo)
	{
		sq_SetCurrentAttackBonusRate(attackInfo, power.tointeger());
		sq_SetAttackInfoForceHitStunTime(attackInfo, 0);
		sq_SetChangeStatusIntoAttackInfo(attackInfo, 0, ACTIVESTATUS_POISON, poisonProb, poisonLevel, poisonTime);
	}
}

function onEndCurrentAni_po_poisonexplosion(obj)
{
	if(!obj)
		return;
		
	if(obj.isMyControlObject())
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}
}
