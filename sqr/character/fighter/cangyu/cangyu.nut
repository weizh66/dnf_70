
function checkExecutableSkill_CangYu(obj)
{
	if (obj.sq_IsUseSkill(227)) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(0); // substate¼¼ÆÃ		
		obj.getVar("zhuazhu").clear_vector();
		obj.getVar("zhuazhu").push_vector(0);

		obj.sq_AddSetStatePacket(223 , 1, true);
		return true;
	}
	return false;
}

function checkCommandEnable_CangYu(obj)
{
return true;
}


function onSetState_CangYu(obj, state, datas, isResetTimer)
{
	local subState = sq_GetVectorData(datas, 0);
	obj.setSkillSubState(subState);		
	switch(subState) 
	{
		case 0 : 
			obj.sq_SetCurrentAnimation(122);
			obj.sq_SetCurrentAttackInfo(1);
			break;
		case 1 : 
			obj.sq_SetCurrentAnimation(123);
			break;
		case 2 : 
			obj.sq_SetCurrentAnimation(124);
			sq_SetZVelocity(obj, 1800, 1200);
			break;
		case 3 : 
			obj.sq_SetCurrentAnimation(125);
			obj.sq_ZStop();
			break;
		case 4 : 
			obj.sq_StopMove();
			obj.sq_SetCurrentAnimation(126);
			break;
		case 5 : 
			obj.sq_SetCurrentAnimation(127);
			break;
	}
}

function onEndCurrentAni_CangYu(obj)
{
	local subState = obj.getSkillSubState();
	switch(subState) 
	{
		case 0 : 
			if (obj.getVar("zhuazhu").get_vector(0) == 1){
				obj.sq_IntVectClear();
				obj.sq_IntVectPush(1); // substate¼¼ÆÃ
				obj.sq_AddSetStatePacket(223, 4, true);
			}
			else
				obj.sq_AddSetStatePacket(0, 1, false);
			break;
		case 1 : 
			obj.sq_IntVectClear();
			obj.sq_IntVectPush(2);
			obj.sq_AddSetStatePacket(223, 4, true);
			obj.sq_SendCreatePassiveObjectPacket(900051, 0, 0, 0, 0);
			break;
		case 2 : 
			obj.sq_IntVectClear();
			obj.sq_IntVectPush(3);
			obj.sq_AddSetStatePacket(223, 4, true);
			break;
		case 3 : 
			obj.sq_IntVectClear();
			obj.sq_IntVectPush(4);
			obj.sq_AddSetStatePacket(223, 4, true);
			break;
		case 4 : 
			obj.sq_IntVectClear();
			obj.sq_IntVectPush(5);
			obj.sq_SendCreatePassiveObjectPacket(900052, 0, 0, 0, -50);
			obj.sq_SetShake(obj, 6, 800);
			obj.sq_AddSetStatePacket(223, 4, true);
			break;
		case 5 : 
			obj.sq_AddSetStatePacket(0, 1, false);
			break;
	}
}


function onKeyFrameFlag_CangYu(obj,flagIndex)
{
	if(flagIndex == 1){
		obj.sq_SetShake(obj, 3, 300);
	}
	else if(flagIndex == 2){
		obj.sq_SetShake(obj, 4, 300);
	}
	return true;
}

function onAttack_CangYu(obj, damager, boundingBox, isStuck)
{
	if (!sq_IsGrabable(obj, damager))
		return 0;

	local var = obj.getVar();  		
	var.push_obj_vector(damager);


	obj.getVar("zhuazhu").clear_vector();
	obj.getVar("zhuazhu").push_vector(1);

	damager.setDirection(sq_GetOppositeDirection(obj.getDirection()));
}

function onProc_CangYu(obj)
{
	if(!obj)
		return;
	local subState = obj.getSkillSubState();
	local var = obj.getVar();  		
	local objectsSize = var.get_obj_vector_size();

	for(local i=0;i<objectsSize;++i)
	{
		local damager = var.get_obj_vector(i);
		local act = sq_GetCNRDObjectToActiveObject(damager);
		local mobX = damager.getXPos();
		local mobY = damager.getYPos();
		local mobZ = damager.getZPos();
		local mudidiX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), 40);

		if (mobX - mudidiX > 3)
			mobX -= 3;
		else if (mobX - mudidiX < -3)
			mobX += 3;
		if (mobY < obj.getYPos()-1)
			mobY += 1;
		else if (mobY > obj.getYPos()-1)
			mobY -= 1;
		if (mobZ > 0)
			mobZ -= 1;
		if (subState >= 2)
			mobZ = obj.getZPos();
		damager.setCurrentPos(mobX, mobY, mobZ);
		switch(subState) 
		{
			case 1 : 
				sq_IntVectorClear(sq_GetGlobalIntVector());
				sq_IntVectorPush(sq_GetGlobalIntVector(),0);
				sq_AddSetStatePacketActiveObject(act, 9, sq_GetGlobalIntVector(), 3);
				break;
			case 5 : 
				if (damager.getState() != 4){
					sq_IntVectorClear(sq_GetGlobalIntVector());
					sq_IntVectorPush(sq_GetGlobalIntVector(),damager.getDirection());
					sq_IntVectorPush(sq_GetGlobalIntVector(),0);
					sq_IntVectorPush(sq_GetGlobalIntVector(),1);
					sq_IntVectorPush(sq_GetGlobalIntVector(),0);
					sq_IntVectorPush(sq_GetGlobalIntVector(),0);
					sq_AddSetStatePacketActiveObject(act,4, sq_GetGlobalIntVector(), 3);
				}
				break;
		}

	}
}
