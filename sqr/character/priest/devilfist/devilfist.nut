
function checkExecutableSkill_DevilFist(obj)  
{
	if(!obj) return false;
	local b_useskill = obj.sq_IsUseSkill(129);
	if(b_useskill) {
		obj.sq_addSetStatePacket(129, STATE_PRIORITY_IGNORE_FORCE, false);
		return true;
	}	
	
	return false;
}

function checkCommandEnable_DevilFist(obj)
{
	if(!obj) return false;

	local state = obj.sq_GetSTATE();
	
	if(state == STATE_ATTACK) {
		return obj.sq_IsCommandEnable(129);
	}
	
	return true;
}


function onSetState_DevilFist(obj, state, datas, isResetTimer)
{
	if(!obj) return;
	obj.sq_stopMove();
	obj.sq_setCurrentAnimation(161);
	obj.sq_setCurrentAttackInfo(117);
	obj.sq_setAttackPowerWithPassive(129, state, -1,0,10.0);

	local substate = obj.sq_getVectorData(datas, 0);
	obj.setSkillSubState(substate); 



		local pAni = obj.sq_getCurrentAni();
		local initDelay = pAni.GetFrameStartTime(9);
		local hitCnt = obj.sq_getIntData(129, 4);
		local term = 1000 / hitCnt;

		obj.sq_timer_.setParameter(term, hitCnt);
		obj.sq_timer_.resetInstant(initDelay);

}

function onProc_DevilFist(obj)
{
	local substate = obj.getSkillSubState();

	local pAni = obj.sq_getCurrentAni();
	local frmIndex = obj.sq_ani_GetCurrentFrameIndex(pAni);

	local currentT = sq_GetCurrentTime(pAni);

	if (obj.sq_timer_.isOnEvent(currentT) == true)
	obj.resetHitObjectList();

}

function onEndCurrentAni_DevilFist(obj)
{
	obj.sq_addSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}

function onKeyFrameFlag_DevilFist(obj,flagIndex)
{
	if(flagIndex == 2)
		obj.sq_setShake(obj,3,150);
		
	return true;

}

function onAttack_DevilFist(obj,damager,boundingBox)
{
	local sq_var = obj.getVar();
	sq_var.setBool(0,true);
	
	local isLast = sq_var.getBool(1);
	if (!isLast) {
		sq_var.push_obj_vector(damager);
		sq_AtrractionForce(obj, damager, false, 270, -1, 2000.0, 1500.0, false); 
		sq_EffectLayerAppendage(damager,sq_RGB(255,255,255),155,0,80,0);	
	}
}
