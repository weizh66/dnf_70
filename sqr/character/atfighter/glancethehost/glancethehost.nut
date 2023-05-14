function checkExecutableSkill_Glancethehost(obj)
{
	if (!obj) return false;

	local isUse = obj.sq_IsUseSkill(SKILL_GLANCETHEHOST);

	if (isUse) {
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(0);
		obj.sq_AddSetStatePacket(STATE_GLANCETHEHOST , STATE_PRIORITY_USER, false);	
		return true;
	}

	return false;
}


function onBeforeAttack_Glancethehost(obj, damager, boundingBox, isStuck)
{
    local attackInfo = sq_GetCurrentAttackInfo(obj);

    local level = sq_GetSkillLevel(obj, SKILL_GLANCETHEHOST);	
    local attackBonusRate = sq_GetLevelData(obj, SKILL_GLANCETHEHOST, 1, level) ;
//    local power = sq_GetLevelData(obj, SKILL_GLANCETHEHOST, 2, level) ;
//	sq_SetCurrentAttackPower(attackInfo, power );
//	sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
}


function checkCommandEnable_Glancethehost(obj)
{
	return true;
}

function onSetState_Glancethehost(obj, state, datas, isResetTimer)
{
	obj.sq_StopMove();
	local state = obj.getVar("state").get_vector(0);

	if (state == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_GLANCETHEHOSTCAST);
	}

	else if (state == 1)
	{
		createGlncethehostCast(obj, 0, 1, 0)
		obj.sq_SendCreatePassiveObjectPacket(26012, 0, 0, 0, 0);
		obj.sq_SendCreatePassiveObjectPacket(26014, 0, 0, 0, 0);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_GLANCETHEHOSTSTART);
//        obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_GLANCETHEHOSTAURA);
		sq_flashScreen(obj,0,120,0,255, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}

	else if (state == 2)
	{
    local attackInfo = sq_GetCurrentAttackInfo(obj);

         createGlncethehostGatheringGroundEffect(obj, 0, -1, 0);
		obj.sq_SendCreatePassiveObjectPacket(26013, 0, 0, 0, 0);
		sq_flashScreen(obj,0,100,300,127, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_GLANCETHEHOSTGATHERING);
        obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_GLANCETHEHOSTGATHERING);

    local level = sq_GetSkillLevel(obj, SKILL_GLANCETHEHOST);
    local attackBonusRate = sq_GetLevelData(obj, SKILL_GLANCETHEHOST, 0, level);
	sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

		obj.setTimeEvent(0,360,0,true);
        obj.getVar("flag").clear_vector();
        obj.getVar("flag").push_vector(0);
	}

	else if (state == 3)
	{

		local attackInfo = sq_GetCurrentAttackInfo(obj);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_GLANCETHEHOSTEND);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_GLANCETHEHOSTEXP);
		local level = sq_GetSkillLevel(obj, SKILL_GLANCETHEHOST);
		local attackBonusRate = sq_GetLevelData(obj, SKILL_GLANCETHEHOST, 1, level);
		sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
		obj.resetHitObjectList();
	}

}

function onTimeEvent_Glancethehost(obj, timeEventIndex, timeEventCount)
{	
	local state = obj.getVar("state").get_vector(0);
	if (state == 2)
    {
        if ( timeEventIndex == 0)
        {
			obj.resetHitObjectList();
        }   
    }
}

function onProc_Glancethehost(obj)
{
	local state = obj.getVar("state").get_vector(0);
	local pAni = obj.sq_GetCurrentAni();
	local frmIndex = obj.sq_GetCurrentFrameIndex(pAni);
    if (state == 0)
    {
        if (frmIndex == 1)
        {
            sq_flashScreen(obj,0,60,0,50, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }else if (frmIndex == 2)
        {
            sq_flashScreen(obj,0,60,0,102, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }else if (frmIndex == 3)
        {
            sq_flashScreen(obj,0,120,0,51, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }else if (frmIndex == 5)
        {
            sq_flashScreen(obj,0,60,0,102, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }
    }else if (state == 1)
    {
        if (frmIndex == 2)
        {
            sq_flashScreen(obj,0,60,0,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
            sq_SetMyShake(obj,4,260);
        }else if (frmIndex == 3)
        {

            sq_flashScreen(obj,0,420,0,153, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }
    }else if (state == 2)
    {
        if (frmIndex == 1)
        {
            sq_flashScreen(obj,0,2400,0,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
            sq_SetMyShake(obj,4,260);	
        }else if (frmIndex == 4)
        {
            sq_SetMyShake(obj,1,2160);	
        }else if (frmIndex == 19)
        {
            if (obj.getVar("flag").get_vector(0) == 0)
            {
                obj.getVar("flag").set_vector(0,1);
                createGlncethehostEffect(obj, 0, 1, 0);
                sq_flashScreen(obj,0,1520,800,255, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
            }
        }
    }else if (state == 3)
    {
        if (frmIndex == 2)
        {
            sq_SetMyShake(obj,1,480);	
        }else if (frmIndex == 3)
        {
            sq_SetMyShake(obj,10,400);	
        }
    }
}

function onEndCurrentAni_Glancethehost(obj)
{
	local state = obj.getVar("state").get_vector(0);
	if (state == 0)
	{
		obj.getVar("state").set_vector(0,1);

		obj.sq_AddSetStatePacket(STATE_GLANCETHEHOST, STATE_PRIORITY_USER, true);
	}
	else if (state == 1)
		{
		obj.getVar("state").set_vector(0,2);
		obj.sq_AddSetStatePacket(STATE_GLANCETHEHOST, STATE_PRIORITY_USER, true);
		}
	else if (state == 2)
		{
		obj.getVar("state").set_vector(0,3);
		obj.sq_AddSetStatePacket(STATE_GLANCETHEHOST, STATE_PRIORITY_USER, true);
		}
	else if (state == 3)
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
	
	pooledObj.setCurrentPos(0,1,0);
	

}