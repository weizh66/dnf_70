function sq_AddFunctionName(appendage)
{
	appendage.sq_AddFunctionName("proc", "proc_appendage_jupiter")
	appendage.sq_AddFunctionName("onStart", "onStart_appendage_jupiter")
	appendage.sq_AddFunctionName("onEnd", "onEnd_appendage_jupiter")
}

function sq_AddEffect(appendage)
{
}

function onStart_appendage_jupiter(appendage)
{
	if(!appendage)
	{
		return;
	}
	local obj = appendage.getParent();
	obj.getVar("isJupiter").setBool(0,true);
}

function proc_appendage_jupiter(appendage)
{
	if(!appendage)
	{
		return;
	}
	local obj = appendage.getParent();

	creatNormalAttackPassiveObj(obj);
	changeDashAttackToJupiter(obj);
	changeJumpAttackToJupiter(obj);
	changeUpperAttackToJupiter(obj);
}

function onEnd_appendage_jupiter(appendage)
{
	if(!appendage)
	{
		return;
	}
	local obj = appendage.getParent();
	obj.getVar("isJupiter").setBool(0,false);
}

function creatNormalAttackPassiveObj(obj)
{
	local state = obj.getState();
	if(state == 8)
	{
		local pAni = obj.getCurrentAnimation();
		local frmIndex = sq_GetAnimationFrameIndex(pAni);
		local attackIndex = obj.getVar("attackIndex").get_vector(0);
		local limit = obj.getVar("limit").get_vector(0);
		if(frmIndex == 4 && attackIndex == 2 && limit == 0)
		{
			obj.getVar("limit").clear_vector();
			obj.getVar("limit").push_vector(1);

			sq_SetMyShake(obj,8,50);

			sq_SendCreatePassiveObjectPacket(obj, 2019090301, 0, 180, 0, 0, obj.getDirection());
		}

		if(attackIndex == 2 && frmIndex > 4)
		{
			obj.getVar("limit").clear_vector();
			obj.getVar("limit").push_vector(0);
		}
	}
}

function changeDashAttackToJupiter(obj)
{
	local state = obj.getState();
	if(state == 15)
	{
		obj.getVar("jupiter").clear_vector();
		obj.getVar("jupiter").push_vector(1);
		sq_AddSetStatePacketActiveObject(obj,STATE_JUPITER, sq_GetGlobalIntVector(), STATE_PRIORITY_FORCE);
	}
}

function changeJumpAttackToJupiter(obj)
{
	local state = obj.getState();
	if(state == 7)
	{
		obj.getVar("jupiter").clear_vector();
		obj.getVar("jupiter").push_vector(2);
		sq_AddSetStatePacketActiveObject(obj,STATE_JUPITER, sq_GetGlobalIntVector(), STATE_PRIORITY_FORCE);
	}
}

function changeUpperAttackToJupiter(obj)
{
	local state = obj.getState();
	if(state == 20)
	{
		obj.getVar("jupiter").clear_vector();
		obj.getVar("jupiter").push_vector(3);
		sq_AddSetStatePacketActiveObject(obj,STATE_JUPITER, sq_GetGlobalIntVector(), STATE_PRIORITY_FORCE);
	}
}
