function checkExecutableSkill_BursterBeam(obj)
{
	if (!obj) return false;

	local isUse = obj.sq_IsUseSkill(SKILL_BURSTERBEAM);

	if (isUse) {
		obj.getVar("state").clear_vector();
		obj.getVar("state").push_vector(0);
		obj.sq_AddSetStatePacket(STATE_BURSTERBEAM , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}


function onBeforeAttack_BursterBeam(obj, damager, boundingBox, isStuck)
{
    local attackInfo = sq_GetCurrentAttackInfo(obj);

    local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);	
    local attackBonusRate = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 1, level) ;	
//    local power = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 2, level);
//	sq_SetCurrentAttackPower(attackInfo, power );
//	sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
}


function checkCommandEnable_BursterBeam(obj)
{
	return true;
}


function onSetState_BursterBeam(obj, state, datas, isResetTimer)
{
	obj.sq_StopMove();
	local state = obj.getVar("state").get_vector(0);

	if (state == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAM_READY);
		obj.sq_SetStaticSpeedInfo(SPEED_TYPE_CAST_SPEED, SPEED_TYPE_CAST_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
	}

	else if (state == 1)
	{
		createBursterbeamgrounda02(obj, 0, -1, 0);
		createbursterbeamgroundb02(obj, 0, -1, 0);
		createbursterbeamgroundd02(obj, 0, -1, 0);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAM_ATKA);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_NEWBURSTERBEAM_ATTACK01);

		local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);
		local attackBonusRate = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 1, level) ;
		sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

		local power = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 0, level)*(104/10);
		sq_SetCurrentAttackPower(attackInfo, power);

		sq_flashScreen(obj,0,120,0,255, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
	}

	else if (state == 2)
	{
    local attackInfo = sq_GetCurrentAttackInfo(obj);

		createBursterbeamgrounda02(obj, 0, -1, 0);
		createbursterbeamgroundb02(obj, 0, -1, 0);
		createbursterbeamgroundd02(obj, 0, -1, 0);
//		obj.sq_SendCreatePassiveObjectPacket(26075, 0, 600, 0, 0);
//		obj.sq_SendCreatePassiveObjectPacket(26014, 0, 0, 0, 0);
		sq_flashScreen(obj,0,100,300,127, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAM_ATKB);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_NEWBURSTERBEAM_ATTACK02);

		local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);	
		local attackBonusRate = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 1, level) ;	
	sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
		local power = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 0, level)*(104/10);
		sq_SetCurrentAttackPower(attackInfo, power);
	}

	else if (state == 3)
	{
		createBursterbeamgrounda02(obj, 0, -1, 0);
		createbursterbeamgroundb02(obj, 0, -1, 0);
		createbursterbeamgroundd02(obj, 0, -1, 0);
		local attackInfo = sq_GetCurrentAttackInfo(obj);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAM_ATKC);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_NEWBURSTERBEAM_ATTACK03);
		local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);
		local attackBonusRate = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 1, level);
		sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
		local power = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 0, level)*(104/10);
		sq_SetCurrentAttackPower(attackInfo, power);
	}

	else if (state == 4)
	{
		local attackInfo = sq_GetCurrentAttackInfo(obj);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAM_ATKD);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BURSTERBEAM_ATTACK04);
		local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);
		local attackBonusRate = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 1, level);
		sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
		local power = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 0, level)*(104/10);
		sq_SetCurrentAttackPower(attackInfo, power);
	}

	else if (state == 5)
	{

		local attackInfo = sq_GetCurrentAttackInfo(obj);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAM_JUMP);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BURSTERBEAM_FINISH);
		local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);
		local attackBonusRate = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 1, level);
		sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);

		local power = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 0, level)*(104/10);	//1
		sq_SetCurrentAttackPower(attackInfo, power);
	}

	else if (state == 6)
	{
		local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);
		local attackBonusRateboom = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 3, level);
		local powerboom = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 2, level)*2;
		obj.sq_StartWrite();
		obj.sq_WriteDword(powerboom);
		obj.sq_WriteDword(attackBonusRateboom);
		obj.sq_SendCreatePassiveObjectPacket(24382, 0, 120, 1, -250);
	
		local attackInfo = sq_GetCurrentAttackInfo(obj);

		obj.sq_SetCurrentAnimation(CUSTOM_ANI_BURSTERBEAM_FINISH);
		obj.sq_SetCurrentAttackInfo(CUSTOM_ATTACK_INFO_BURSTERBEAM_FINISH);

		local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);
		local attackBonusRate = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 1, level);

		local power = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 0, level)*(104/10);
		local power2 = power*(104/10);
		sq_SetCurrentAttackBonusRate(attackInfo, attackBonusRate);
		sq_SetCurrentAttackPower(attackInfo, power);

        obj.setTimeEvent(0,2000,1,false);
		obj.setTimeEvent(1,120,0,false);
	}
}


function getScrollBasisPos_BursterBeam(obj)
		{
			local state = obj.getVar("state").get_vector(0);
			if (state == 5 || state == 6)
			{
			local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), 210);
            obj.sq_SetCameraScrollPosition(posX, obj.getYPos(), 0);
            return true;
            }
		}

function onTimeEvent_BursterBeam(obj, timeEventIndex, timeEventCount)
{	
	local state = obj.getVar("state").get_vector(0);
	if (state == 6)
    {
        if ( timeEventIndex == 0)
        {
        obj.getVar("state").clear_vector();

		obj.sq_AddSetStatePacket(STATE_BURSTERBEAM, STATE_PRIORITY_USER, true);
        }
		if ( timeEventIndex == 1)
		{
		obj.resetHitObjectList();	
        }
    }
}

function onProc_BursterBeam(obj)
{
	local state = obj.getVar("state").get_vector(0);
	local objZ = obj.getZPos();
	local pAni = obj.sq_GetCurrentAni();
	local frmIndex = obj.sq_GetCurrentFrameIndex(pAni);	
    if (state == 0)
    {
        if (frmIndex == 6)
        {
            sq_flashScreen(obj,0,70,100,20, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }
    }else if (state == 1)
    {
        if (frmIndex == 2)
        {
//            sq_flashScreen(obj,0,60,0,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
            sq_SetMyShake(obj,4,260);
        }else if (frmIndex == 3)
        {

//            sq_flashScreen(obj,0,420,0,153, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }
    }else if (state == 2)
    {
        if (frmIndex == 1)
        {
//            sq_flashScreen(obj,0,2400,0,204, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
            sq_SetMyShake(obj,4,260);	
        }else if (frmIndex == 4)
        {
            sq_SetMyShake(obj,1,2160);	
        }
    }else if (state == 3)
    {
        if (frmIndex == 2)
        {
            sq_SetMyShake(obj,1,480);	
        }else if (frmIndex == 3)
        {
            sq_SetMyShake(obj,5,400);	
        }
    }else if (state == 5)
    {

			obj.setCurrentPos(obj.getXPos(),obj.getYPos(),220);
        if (frmIndex == 2)
        {
            sq_SetMyShake(obj,1,480);
        }
    }else if (state == 6)
    {
			obj.setCurrentPos(obj.getXPos(),obj.getYPos(),220);
            sq_SetMyShake(obj,5,480);	

        if (frmIndex == 2)
        {
            sq_SetMyShake(obj,1,480);	
        }else if (frmIndex == 3)
        {
            sq_SetMyShake(obj,10,400);	
        }
    }
}

function onEndCurrentAni_BursterBeam(obj)
{

	local state = obj.getVar("state").get_vector(0);
	if (state == 0)
	{
		obj.getVar("state").set_vector(0,1);

		obj.sq_AddSetStatePacket(STATE_BURSTERBEAM, STATE_PRIORITY_USER, true);
	}
	else if (state == 1)
		{
		obj.getVar("state").set_vector(0,2);
		obj.sq_AddSetStatePacket(STATE_BURSTERBEAM, STATE_PRIORITY_USER, true);
		}
	else if (state == 2)
		{
		obj.getVar("state").set_vector(0,3);
		obj.sq_AddSetStatePacket(STATE_BURSTERBEAM, STATE_PRIORITY_USER, true);
		}
	else if (state == 3)
		{
		obj.getVar("state").set_vector(0,4);
		obj.sq_AddSetStatePacket(STATE_BURSTERBEAM, STATE_PRIORITY_USER, true);
		}
	else if (state == 4)
		{
		obj.getVar("state").set_vector(0,5);
		obj.sq_AddSetStatePacket(STATE_BURSTERBEAM, STATE_PRIORITY_USER, true);
		}
	else if (state == 5)
		{
		obj.getVar("state").set_vector(0,6);
		obj.sq_AddSetStatePacket(STATE_BURSTERBEAM, STATE_PRIORITY_USER, true);
		}
	else if (state == 6)
		{
		local level = sq_GetSkillLevel(obj, SKILL_BURSTERBEAM);
		local power = sq_GetLevelData(obj, SKILL_BURSTERBEAM, 2, level)*(104/10);
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);		// power
		obj.sq_SendCreatePassiveObjectPacket(24381, 0, 0, 0, -220);

		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
		}


//		obj.sq_SendCreatePassiveObjectPacket(26079, 0, 200, 0, -200);
//		obj.sq_SendCreatePassiveObjectPacket(26077, 0, 0, 0, -200);
//		obj.sq_SendCreatePassiveObjectPacket(26075, 0, 0, 0, -200);

}

function createBursterbeamgrounda02(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/gunner/effect/animation/bursterbeam/drawonly/bursterbeamgrounda_02.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);
}


function createbursterbeamgroundb02(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/gunner/effect/animation/bursterbeam/drawonly/bursterbeamgroundb_02.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_AddObject(obj,pooledObj,2,false);
}


function createbursterbeamgroundd02(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/gunner/effect/animation/bursterbeam/drawonly/bursterbeamgroundd_02.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_AddObject(obj,pooledObj,2,false);	

}

function createBursterbeamEffb(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","character/gunner/effect/animation/bursterbeamnew/bb2ndreadyeffb_00.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_moveWithParent(obj, pooledObj);
	
	sq_AddObject(obj,pooledObj,2,false);
}



function createBursterbeamFinishatkeff(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","passiveobject/character/gunner/animation/bursterbeam/bursterbeamfinishatkeff_overheat.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	local posX = sq_GetDistancePos(obj.getXPos(), obj.getDirection(), disX);
	
	pooledObj.setCurrentPos(posX,obj.getYPos() + disY,obj.getZPos() + disZ);
	
	pooledObj.setCurrentDirection(obj.getDirection());
	
	sq_AddObject(obj,pooledObj,2,false);	
}

function createGlncethehostCtion(obj, disX, disY, disZ)
{
	local ani = sq_CreateAnimation("","passiveobject/character/fighter/animation/atglancethehost/atfighter_nen2ndaction.ani");
	local pooledObj = sq_CreatePooledObject(ani,true);
	
	pooledObj.setCurrentPos(0,1,0);
	

}