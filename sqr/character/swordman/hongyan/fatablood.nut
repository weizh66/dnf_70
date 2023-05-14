
function checkExecutableSkill_FATABLOOD(obj)
{
		if (!obj) return false;

		local isUseSkill = obj.sq_IsUseSkill(SKILL_FATABLOOD);
		if (isUseSkill)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(0);
			obj.sq_AddSetStatePacket(STATE_FATABLOOD,STATE_PRIORITY_USER, true);
			return true;
		}
		return false;
}


function checkCommandEnable_FATABLOOD(obj)
{
	if (!obj) return false;	
	return true;
}


function create1hitfront(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/1hitfront_04.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}

function create1hitback(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/1hitback_01.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}


function create2hitfront(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/2hitfront_02.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}

function create2hitback(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/2hitback_02.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}


function createdirectionforeground(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/directionforeground.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}


function create3hitfront_tb(obj)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/3hitfronttb_00.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	pooledObj.setCurrentPos(obj.getXPos() ,obj.getYPos(),obj.getZPos() );
	pooledObj.setCurrentDirection(obj.getDirection());
	sq_AddObject(obj,pooledObj,2,false);	

}


function create3hitground(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/3hitground_00.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}


function create3hitfront(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/3hitfront_07.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}

function create3hitback(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/swordman/effect/animation/fatalblood/3hitback_00.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}


function onSetState_FATABLOOD(obj, state, datas, isResetTimer)
{
		if(!obj) return;

		obj.sq_StopMove();
		local state = obj.getVar("state").get_vector(0);
		local skilllevel = sq_GetSkillLevel(obj, SKILL_FATABLOOD);
		if(state == 0)
		{
		create1hitback(obj, -15, -1, 0);
		create1hitfront(obj, -15, -1, 0);
			obj.sq_SetCurrentAnimation(194);
			obj.sq_SetCurrentAttackInfo(104);
			local power = obj.sq_GetPowerWithPassive(SKILL_FATABLOOD , STATE_FATABLOOD, 1, -1, 1.0);
			obj.sq_SetCurrentAttackBonusRate(power);
		}
		else if(state == 1)
		{
		create2hitback(obj, -15, -1, 0);
		create2hitfront(obj, -15, 1, 0);
			obj.sq_SetCurrentAnimation(195);
			obj.sq_SetCurrentAttackInfo(105);
			local power = obj.sq_GetPowerWithPassive(SKILL_FATABLOOD , STATE_FATABLOOD, 1, -1, 1.0);
			obj.sq_SetCurrentAttackBonusRate(power);
        local ani = obj.sq_GetCurrentAni();
		local delay = ani.getDelaySum(false);
        obj.getVar("dama").clear_obj_vector();
        obj.getVar("len").clear_vector();
        obj.getVar("len").push_vector(47);

        obj.getVar("posX").clear_vector();
        obj.getVar("posX").push_vector(obj.getXPos());
        obj.getVar("posX").push_vector(delay);
		}
		else if(state == 2)
		{
		createdirectionforeground(obj, -20, 0, -20)
		create3hitback(obj, -15, -1, 0);
		create3hitfront(obj, -15, 1, 0);
		obj.sq_SetCurrentAnimation(196);
		obj.sq_SetCurrentAttackInfo(106);
		local power = obj.sq_GetPowerWithPassive(SKILL_FATABLOOD , STATE_FATABLOOD, 1, -1, 1.0);
		obj.sq_SetCurrentAttackBonusRate(power);
        obj.sq_SendCreatePassiveObjectPacket(12205, 0, 50, 0, 0);
        local ani = obj.sq_GetCurrentAni();
		local delay = ani.getDelaySum(false);
        obj.getVar("dama").clear_obj_vector();
        obj.getVar("len").clear_vector();
        obj.getVar("len").push_vector(obj.sq_GetIntData(SKILL_FATABLOOD, 0));

        obj.getVar("posX").clear_vector();
        obj.getVar("posX").push_vector(obj.getXPos());
        obj.getVar("posX").push_vector(delay);
		}

}


function onKeyFrameFlag_FATABLOOD(obj, flagIndex)
{

    local state = obj.getVar("state").get_vector(0);

    if (flagIndex == 0)
    {

		sq_flashScreen(obj,60,420,300,12, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);

		sq_SetMyShake(obj,10,350);
    }
    if (flagIndex == 1)
    {

		obj.sq_AddStateLayerAnimation(1,
			obj.sq_CreateCNRDAnimation("effect/animation/fatalblood/3hitground_00.ani"), 100, 20);
    }
}


function onProc_FATABLOOD(obj)
{

    local state = obj.getVar("state").get_vector(0);
    local pAni = obj.sq_GetCurrentAni();
    local currentT = sq_GetCurrentTime(pAni);
    local frmIndex = obj.sq_GetCurrentFrameIndex(pAni);
		if(state == 1) 
	{
        local delayT = obj.getVar("posX").get_vector(1);
        local len = obj.getVar("len").get_vector(0);

		local v = sq_GetAccel(0, len, currentT, delayT, true);
		local srcX = obj.getVar("posX").get_vector(0);
		
		local dstX = sq_GetDistancePos(srcX, obj.getDirection(), v);
		 
		if(obj.isMovablePos(dstX, obj.getYPos() ))
        {
			sq_setCurrentAxisPos(obj, 0, dstX);
        }

	}

		if(state == 2) 
	{
        local delayT = obj.getVar("posX").get_vector(1);
        local len = obj.getVar("len").get_vector(0);

		local v = sq_GetAccel(0, len, currentT, delayT, true);
		local srcX = obj.getVar("posX").get_vector(0);
		
		local dstX = sq_GetDistancePos(srcX, obj.getDirection(), v);
		 
		if(obj.isMovablePos(dstX, obj.getYPos() ))
        {
			sq_setCurrentAxisPos(obj, 0, dstX);
        }

	}


}


function onEndCurrentAni_FATABLOOD(obj)
{
        local state = obj.getVar("state").get_vector(0);
		if(state == 0)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(1);
			obj.sq_AddSetStatePacket(STATE_FATABLOOD,STATE_PRIORITY_USER, true);
		}else if(state == 1)
		{
			obj.getVar("state").clear_vector();
			obj.getVar("state").push_vector(2);
			obj.sq_AddSetStatePacket(STATE_FATABLOOD,STATE_PRIORITY_USER, true);

		}else if(state == 2)
		{

			obj.sq_AddSetStatePacket(STATE_STAND,STATE_PRIORITY_USER, false);
		}

}


