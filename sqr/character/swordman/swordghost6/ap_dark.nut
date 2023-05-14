

function sq_AddFunctionName(appendage)
{
	appendage.sq_AddFunctionName("proc", "proc_appendage_buff_beidong")
	appendage.sq_AddFunctionName("prepareDraw", "prepareDraw_appendage_buff_beidong")
	appendage.sq_AddFunctionName("onStart", "onStart_appendage_buff_beidong")
	appendage.sq_AddFunctionName("onEnd", "onEnd_appendage_buff_beidong")
	appendage.sq_AddFunctionName("isEnd", "isEnd_appendage_buff_beidong")
}


function sq_AddEffect(appendage)
{
	if(!appendage)
		return;
	appendage.sq_AddEffectFront("Character/Mage/Effect/Animation/ATManaBurst/00_mana_dodge_loop.ani")



}





function proc_appendage_buff_beidong(appendage)
{
	if(!appendage) {
		return;
	}
	
	local obj = appendage.getParent();
	
	if(!obj)
	{
		appendage.setValid(false);
		return;
	}	
	
	local time = appendage.getTimer().Get();
	
	local x = obj.getXPos();
	local y = obj.getYPos();
	local z = obj.getZPos();
	
	local t = appendage.getVar().get_timer_vector(0);
	
	if(!t)
		return;
	
	if(t.isOnEvent(time) == true)
	{
		local particleCreater = appendage.getVar().GetparticleCreaterMap("mm_darkaura", "passiveobject/new_skill/at_mage_summon_nutouwang/particle/buff_effect.ptl", obj);
			
		particleCreater.Restart(0);
		particleCreater.SetPos(x, y, z);
		
		sq_AddParticleObject(obj, particleCreater);
	}
	
	if(t.isEnd() == true)
	{
		appendage.setValid(false);
	}
}


function onStart_appendage_buff_beidong(appendage)
{
	if(!appendage) {
		return;
	}	
	
	local obj = appendage.getParent();
	
	if(!obj)
	{
		appendage.setValid(false);
		return;
	}	
	
	initGetVarTimer(appendage, 1, 60, 90000);
	
	
}


function prepareDraw_appendage_buff_beidong(appendage)
{
	if(!appendage) {
		return;
	}
	
	local obj = appendage.getParent();	
}




function onEnd_appendage_buff_beidong(appendage)
{
	if(!appendage) {
		return;
	}
	
	local obj = appendage.getParent();	
	
}


// ??? ?? ??? ???
function isEnd_appendage_buff_beidong(appendage)
{
	
	
	return false;
}