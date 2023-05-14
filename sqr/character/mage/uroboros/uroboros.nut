function checkExecutableSkill_uroboros(obj)
{
	if (obj.sq_IsUseSkill(SKILL_uroboros))
	{
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_uroboros , 1, false); 
		return true;
	}
return false;
}

function checkCommandEnable_uroboros(obj)
{
return true;
}

function onSetState_uroboros(obj, state, datas, isResetTimer)
{
	obj.getVar("state").clear_ct_vector();
	obj.getVar("state").push_ct_vector();
	local skillsubstate = obj.getVar().get_vector(0);
	switch(skillsubstate) 
	{
		case 0 : 
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_UroborosStart);
			break;
		case 1 : 
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_UroborosReady);
			break;
		case 2 : 
			local t = obj.getVar("state").get_ct_vector(0);
			t.Reset();
			t.Start(1,0);
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_UroborosIdle);
			break;
		case 3 : 
			obj.sq_StopMove();
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_UroborosExp);
			break;
	}
}

function onEndCurrentAni_uroboros(obj)
{
	local skillsubstate = obj.getVar().get_vector(0);
	switch(skillsubstate) 
	{
		case 0 : 
			obj.getVar().clear_vector();
			obj.getVar().push_vector(1);
			obj.sq_SetShake(obj,5,300);
			obj.sq_AddSetStatePacket(STATE_uroboros , 1, false);
			break;
		case 1 : 
			obj.getVar().clear_vector();
			obj.getVar().push_vector(2);
			obj.sq_AddSetStatePacket(STATE_uroboros , 1, false);
			break;
		case 2 : 
			obj.getVar().clear_vector();
			obj.getVar().push_vector(3);
			obj.sq_AddSetStatePacket(STATE_uroboros , 1, false);
			break;
		case 3 : 
			obj.sq_SendCreatePassiveObjectPacket(700003, 0, 0, 0, 0);
			obj.sq_IntVectClear();
			obj.sq_IntVectPush(0);
			obj.sq_IntVectPush(0);
			obj.sq_IntVectPush(0);
			obj.sq_IntVectPush(0);
			obj.sq_IntVectPush(0);
			obj.sq_SetShake(obj,9,800);
			obj.sq_AddSetStatePacket(4, 1, true);
			break;
	}
}

function onProc_uroboros(obj)
{
	if (sq_IsKeyDown(5, 7))
		obj.sq_AddSetStatePacket(0, 1, false);
	if (sq_IsKeyDown(6, 7)){
		obj.setDirection(sq_GetOppositeDirection(obj.getDirection()));
	}
}

function onProcCon_uroboros(obj)
{
	local t = obj.getVar("state").get_ct_vector(0);
	if(t.Get() >= 5000){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_uroboros , 1, false);
	}
}

function onKeyFrameFlag_uroboros(obj,flagIndex)
{
	if(!obj)
		return false;

	local isMyControlObject = obj.sq_IsMyControlObject();
	if (flagIndex == 2)
	{
		obj.sq_SetShake(obj,5,500);
	}
	// 회오리 오브젝트 생성
	if (flagIndex == 22)
	{
		obj.sq_SetShake(obj,3,200);
		obj.sq_SendCreatePassiveObjectPacket(700017, 0, -50, 0, 0);
	}
	return true;
}




