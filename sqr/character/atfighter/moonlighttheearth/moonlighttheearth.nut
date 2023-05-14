function checkExecutableSkill_Moonlighttheearth(obj)
{
	if (!obj) return false;

	local isUse = obj.sq_IsUseSkill(SKILL_MOONLIGJTTHEEARTH);

	if (isUse) {
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(0);
		obj.sq_AddSetStatePacket(STATE_MOONLIGJTTHEEARTH , STATE_PRIORITY_USER, false);	
		return true;
	}

	return false;
}


function onBeforeAttack_Moonlighttheearth(obj, damager, boundingBox, isStuck)
{
    local attackInfo = sq_GetCurrentAttackInfo(obj);	

    local level = sq_GetSkillLevel(obj, SKILL_MOONLIGJTTHEEARTH);
    local attackBonusRate = sq_GetLevelData(obj, SKILL_MOONLIGJTTHEEARTH, 1, level) ;
//    local power = sq_GetLevelData(obj, SKILL_MOONLIGJTTHEEARTH, 2, level) ;
//	sq_SetCurrentAttackPower(attackInfo, power );
//	sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
}


function checkCommandEnable_Moonlighttheearth(obj)
{
	return true;
}

function onSetState_Moonlighttheearth(obj, state, datas, isResetTimer)
{
	obj.sq_StopMove();
	local state = obj.getVar("state").get_vector(0);

	if (state == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_MOONLIGJTTHEEARTHSTART);
	}

	if (state == 1)
	{
        //local time = obj.sq_GetIntData(SKILL_MOONLIGJTTHEEARTH,1) * 5;
        //local hitcount = obj.sq_GetIntData(SKILL_MOONLIGJTTHEEARTH,0);

		obj.sq_SetCurrentAnimation(CUSTOM_ANI_MOONLIGJTTHEEARTHLOOP);
        obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_MOONLIGJTTHEEARTH);

        local attackInfo = sq_GetCurrentAttackInfo(obj);
        local level = sq_GetSkillLevel(obj, SKILL_MOONLIGJTTHEEARTH);
        local attackBonusRate = sq_GetLevelData(obj, SKILL_MOONLIGJTTHEEARTH, 0, level) ;
		sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
        obj.setTimeEvent(0,2000,1,false);
		obj.setTimeEvent(1,300,0,false);
	}

	if (state == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_MOONLIGJTTHEEARTHEND);
	}

	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_CAST_SPEED, SPEED_TYPE_CAST_SPEED,
		SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);

}

function onTimeEvent_Moonlighttheearth(obj, timeEventIndex, timeEventCount)
{	
	local state = obj.getVar("state").get_vector(0);
	if (state == 1)
    {
        if ( timeEventIndex == 0)
        {
        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(2);
		obj.sq_AddSetStatePacket(STATE_MOONLIGJTTHEEARTH, STATE_PRIORITY_USER, true);
        }
		if ( timeEventIndex == 1)
		{
		obj.resetHitObjectList();
        }
    }
}

function onEndCurrentAni_Moonlighttheearth(obj)
{
	local state = obj.getVar("state").get_vector(0);
	if (state == 0)
	{
        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(1);
		obj.sq_AddSetStatePacket(STATE_MOONLIGJTTHEEARTH, STATE_PRIORITY_USER, true);
	}
	else if (state == 2)
		{
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		}
}



function createGlncethehostEffect(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","passiveobject/character/fighter/animation/atglancethehost/ghgatheringpang_01.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);
}


function createGlncethehostGatheringGroundEffect(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","passiveobject/character/fighter/animation/atglancethehost/ghgatheringground_normal.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	

}

function createGlncethehostGatheringHitEffect(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","passiveobject/character/fighter/animation/atglancethehost/ghgatheringattack_hit.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	
}

function createGlncethehostCast(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/fighter/effect/animation/atglancethehost/cast/ghcasteffect_casting03.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	
}

function createGlncethehostCtion(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","passiveobject/character/fighter/animation/atglancethehost/atfighter_nen2ndaction.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);	
}