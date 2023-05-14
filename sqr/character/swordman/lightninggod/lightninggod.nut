
function checkExecutableSkill_lightninggod(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_lightninggod);
	
	if (isUse) {
		obj.sq_AddSetStatePacket(STATE_lightninggod , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_lightninggod(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		// �����忡���� Ư����ų�� ĵ���� �����մϴ�. �۾���:������ [2012.04.20]
		return obj.sq_IsCommandEnable(SKILL_lightninggod); // �����忡���� Ư����ų�� ĵ���� �����մϴ�. �۾���:������ [2012.04.20] 
		obj.sq_IsCommandEnable(SKILL_lightninggod);
	}	
	
	
	return true;
}


// state�� �����ϰ� ó������ ������ �˴ϴ�. ���� ���ҽ��� �����մϴ�. 
function onSetState_lightninggod(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_lightninggod);
	obj.sq_PlaySound("SM_lightninggod");
	obj.sq_SendCreatePassiveObjectPacket(900000, 0, 0, 0, 0);
}

function onEndCurrentAni_lightninggod(obj)
{
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	obj.sq_PlaySound("SM_lightninggod_CAST");
}


function onKeyFrameFlag_lightninggod(obj,flagIndex)
{
	if(!obj)
		return false;

	local isMyControlObject = obj.sq_IsMyControlObject();

	// ȸ���� ������Ʈ ����
	if (isMyControlObject && flagIndex == 1)
	{
		
		obj.sq_SendCreatePassiveObjectPacket(000000, 0, 0, 0, 0);
	}
	return true;
}
