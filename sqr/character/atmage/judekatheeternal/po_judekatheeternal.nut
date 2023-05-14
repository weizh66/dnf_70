
function setCustomData_po_judekatheeternal(obj, reciveData)
{
	if(!obj) return;	
	
	local power		= reciveData.readFloat();
	local icepower	= reciveData.readDword();	
	local expansionpower	= reciveData.readDword();	
	local explosionpower	= reciveData.readDword();	
			
	local attackInfo = sq_GetCurrentAttackInfo(obj);
	if(attackInfo)
	{
		sq_SetCurrentAttackBonusRate(attackInfo, power.tointeger());
		sq_SetAttackInfoForceHitStunTime(attackInfo, 0);
		sq_SetChangeStatusIntoAttackInfo(attackInfo, 0, ACTIVESTATUS_FREEZE, expansionpower, icepower, explosionpower);
	}
	
	if(obj.isMyControlObject()) 
	{
		local ani = sq_GetCurrentAnimation(obj);
		local inTime = ani.getDelaySum(0,9);
		local stayTime = ani.getDelaySum(10,27);
		local endTime = ani.getDelaySum(28,36);
		
		sq_flashScreen(obj, inTime, stayTime, endTime, 200, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_NORMAL);
	}
}

function onKeyFrameFlag_po_judekatheeternal(obj, flagIndex)
{
	if(!obj)
		return false;
		
		printc("flagIndex " + flagIndex);
	if(flagIndex < 4) {
		sq_SetMyShake(obj,4,60);
	}
	else {
		sq_SetMyShake(obj,4,200);
	}
	
	return true;
}