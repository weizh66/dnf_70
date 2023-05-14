
function setCustomData_po_atshardmagnum(obj, reciveData)
{
	if(!obj) return;	
	
	local power			= reciveData.readFloat();
	local iceLevel	= reciveData.readDword();	
	local iceProb	= reciveData.readDword();	
	local iceTime	= reciveData.readDword();	
			
	local attackInfo = sq_GetCurrentAttackInfo(obj);
	if(attackInfo)
	{
		sq_SetCurrentAttackBonusRate(attackInfo, power.tointeger());
		sq_SetAttackInfoForceHitStunTime(attackInfo, 0);
		sq_SetChangeStatusIntoAttackInfo(attackInfo, 0, ACTIVESTATUS_FREEZE, iceProb, iceLevel, iceTime);
	}
}

function onEndCurrentAni_po_atshardmagnum(obj)
{
	if(!obj)
		return;
		
	if(obj.isMyControlObject())
	{
		sq_SendDestroyPacketPassiveObject(obj);
	}
}
