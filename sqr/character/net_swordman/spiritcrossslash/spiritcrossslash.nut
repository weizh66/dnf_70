function checkExecutableSkill_spiritcrossslash(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_spiritcrossslash);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_spiritcrossslash,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_spiritcrossslash(obj)
{
	if (!obj) return false;	
	return true;
}


function onSetState_spiritcrossslash(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();

		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_spiritcrossslash); 
		if(state == 0)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_spiritcrossslash1);
		}
		else if(state == 1)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_spiritcrossslash2);
			local X_distance = 300;
			local max_X = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), X_distance);//方向坐標
			local now_X = obj.getXPos();
			local max_Z = 0;
			local now_Z = obj.getZPos();
		
			obj.getVar().clear_vector();
			obj.getVar().push_vector(max_X);
			obj.getVar().push_vector(now_X);
			obj.getVar().push_vector(max_Z);
			obj.getVar().push_vector(now_Z);
		}
		else if(state == 2)
		{
			obj.sq_SetCurrentAnimation(CUSTOM_ANI_spiritcrossslash3);
		}
	}

function onEndCurrentAni_spiritcrossslash(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_spiritcrossslash,STATE_PRIORITY_USER, true);
		}
		else if(state == 1)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(2);
			obj.sq_AddSetStatePacket(STATE_spiritcrossslash,STATE_PRIORITY_USER, true);
		}
		else if(state == 2)
		{
			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}


function onProc_spiritcrossslash(obj)
{
	if(!obj) return;

	local substate = obj.getSkillSubState();//不多贅述，前幾期都有講

	if(substate == 0) //不多贅述，前幾期都有講
	{
	}
	else if(substate == 1) //不多贅述，前幾期都有講
	{
			local max_X = obj.getVar().get_vector(0);
		local now_X = obj.getVar().get_vector(1);

		local max_Z = obj.getVar().get_vector(2);
		local now_Z = obj.getVar().get_vector(3);

		local stateTimer = obj.sq_GetStateTimer();
		local xPosVelocity = sq_GetUniformVelocity(now_X, max_X, stateTimer, 300);
		local zPosVelocity = sq_GetUniformVelocity(now_Z, max_Z, stateTimer, 0);
		local stopX = sq_GetDistancePos(xPosVelocity, obj.getDirection(), 10);

		local iX = obj.getXPos();
		local iY = obj.getYPos();

		sq_MoveToNearMovablePos(obj,xPosVelocity,iY , zPosVelocity, iX, iY, zPosVelocity, 20, -1, 3);//人物移動（遇到障礙物自行調整）

	}
	else if(substate == 2) 
	{
	}
}