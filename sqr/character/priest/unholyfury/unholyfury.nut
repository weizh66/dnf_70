UnholyFury_STARTDEMON<- 0
UnholyFury_START<- 1
UnholyFury_LOOP<- 2
UnholyFury_LAST<- 3
UnholyFury_ENDSTART<- 4
UnholyFury_ENDLOOP<- 5
UnholyFury_END<- 6

function checkExecutableSkill_UnholyFury(obj)  
{
	if(!obj) return false;
	local b_useskill = obj.sq_IsUseSkill(130);
	if(b_useskill) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(UnholyFury_STARTDEMON);
		obj.sq_addSetStatePacket(130, STATE_PRIORITY_IGNORE_FORCE, true);
		return true;
	}	
	
	return false;
}

function checkCommandEnable_UnholyFury(obj)
{
	if(!obj) return false;

	local state = obj.sq_GetSTATE();
	
	if (state == STATE_STAND)
		return true;
	if(state == STATE_ATTACK) {
		return obj.sq_IsCommandEnable(130);
	}
	
	return true;
}



function onSetState_UnholyFury(obj, state, datas, isResetTimer)
{
	if(!obj) return;
	local substate = obj.sq_getVectorData(datas, 0); 
	obj.setSkillSubState(substate);
	obj.sq_stopMove();

	if(substate == UnholyFury_STARTDEMON) 
	{
		local start_ani = obj.getVar().GetAnimationMap("UnholyFury_startdemon", "character/priest/animation/unholyfury/start_demon.ani"); 
		obj.setCurrentAnimation(start_ani);
	}else if(substate == UnholyFury_START) 
	{
		local start_ani = obj.getVar().GetAnimationMap("UnholyFury_start", "character/priest/animation/unholyfury/loop_body.ani"); 
		obj.setCurrentAnimation(start_ani);
	}else if(substate == UnholyFury_LOOP) 
	{
		local loop_ani = obj.getVar().GetAnimationMap("UnholyFury_loop", "character/priest/animation/unholyfury/loop_body.ani"); 
		obj.setCurrentAnimation(loop_ani);
	}else if(substate == UnholyFury_END) 
	{
		local end_ani = obj.getVar().GetAnimationMap("UnholyFury_end", "character/priest/animation/unholyfury/endloop_body.ani");
		obj.setCurrentAnimation(end_ani);
	}else if(substate == UnholyFury_ENDLOOP) 
	{
		local endloop_ani = obj.getVar().GetAnimationMap("UnholyFury_endloop", "character/priest/animation/unholyfury/endpang_body.ani"); 
		obj.setCurrentAnimation(endloop_ani);
	}else if(substate == UnholyFury_LAST) 
	{
		local last_ani = obj.getVar().GetAnimationMap("UnholyFury_last", "character/priest/animation/unholyfury/last_body.ani"); 
		obj.setCurrentAnimation(last_ani);

	}
		obj.sq_setCurrentAttackInfo(110);
	obj.sq_setAttackPowerWithPassive(130, state, -1,1,1000.0);
}

function onEndCurrentAni_UnholyFury(obj)
{
	local substate = obj.getSkillSubState();

    if (substate == UnholyFury_STARTDEMON)
    {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(UnholyFury_START);
        obj.sq_addSetStatePacket(130, STATE_PRIORITY_USER, true);
    }else if (substate == UnholyFury_START)
    {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(UnholyFury_LOOP);
        obj.sq_addSetStatePacket(130, STATE_PRIORITY_USER, true);
    }else if (substate == UnholyFury_LOOP)
    {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(UnholyFury_ENDLOOP);
        obj.sq_addSetStatePacket(130, STATE_PRIORITY_USER, true);
    }else if (substate == UnholyFury_ENDLOOP)
    {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(UnholyFury_END);
        obj.sq_addSetStatePacket(130, STATE_PRIORITY_USER, true);
    }else if (substate == UnholyFury_END)
    {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(UnholyFury_LAST);
        obj.sq_addSetStatePacket(130, STATE_PRIORITY_USER, true);
    }else if (substate == UnholyFury_LAST)
    {
        obj.sq_addSetStatePacket(0, STATE_PRIORITY_USER, false);
    }


}