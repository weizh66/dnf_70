function checkExecutableSkill_manyu85(obj)  
{
	if (!obj) return false;

	local isUseSkill = obj.sq_IsUseSkill(SKILL_MANYU85);
	if (isUseSkill) 
    {
        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(0);

        obj.getVar("useY").clear_vector();
        obj.getVar("useY").push_vector(obj.getYPos());

		obj.sq_AddSetStatePacket(STATE_MANYU85, STATE_PRIORITY_USER, true);
		return true;
	}
	return false;
}


function checkCommandEnable_manyu85(obj)
{

	return true;
}

function onTimeEvent_MANYU85(obj, timeEventIndex, timeEventCount)
{
    local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_MANYU85, STATE_MANYU85, 0, 1.0);


	obj.sq_StartWrite();
	obj.sq_WriteDword(attackBonusRate);	
	obj.sq_WriteDword(11);
	obj.sq_SendCreatePassiveObjectPacket(24319, 0, 0, 1, 0);

}

function onSetState_MANYU85(obj, state, datas, isResetTimer)
{

    local state = obj.getVar("state").get_vector(0);
    local moveValue = 2;
    local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_MANYU85, STATE_MANYU85, 0, 1.0);

	obj.sq_StopMove();

    obj.getVar("flag").clear_vector();
    obj.getVar("flag").push_vector(0);





    if (state <= 12)
    {
        if (state == 0)
        {
            sq_flashScreen(obj,0,0,150,150, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_COVER);
        }
        if (state >= 1 && state < 12)
        {   
            sq_flashScreen(obj,0,0,100,100, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_COVER);
        }

        if (state == 11)
        {
            obj.setTimeEvent(0,100,0,true);
        }

        if (state == 12)
        {
            sq_flashScreen(obj,0,0,250,250, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_COVER);
			obj.setCurrentDirection(sq_GetOppositeDirection(obj.getDirection()));
        }


        local ani = sq_CreateAnimation("","character/gunner/animation/ani_als/seventhflow/2/move/move_mult.ani");
        local pooledObj = sq_CreatePooledObject(ani,true);
        pooledObj.setCurrentPos(obj.getXPos(),obj.getYPos(),obj.getZPos());
        sq_AddObject(obj,pooledObj,1,false);	
    
		obj.sq_StartWrite();
		obj.sq_WriteDword(attackBonusRate);	
		obj.sq_WriteDword(state);
		obj.sq_SendCreatePassiveObjectPacket(24319, 0, 0, 1, 0);

		local leftPress = sq_IsKeyDown(OPTION_HOTKEY_MOVE_LEFT, ENUM_SUBKEY_TYPE_ALL);
		local rightPress = sq_IsKeyDown(OPTION_HOTKEY_MOVE_RIGHT, ENUM_SUBKEY_TYPE_ALL);

		if(sq_GetDirection(obj) == ENUM_DIRECTION_RIGHT && leftPress) moveValue = 1;
		if(sq_GetDirection(obj) == ENUM_DIRECTION_LEFT && rightPress) moveValue = 1;

		if(sq_GetDirection(obj) == ENUM_DIRECTION_LEFT && leftPress) moveValue = 4;
		if(sq_GetDirection(obj) == ENUM_DIRECTION_RIGHT && rightPress) moveValue = 4;


        obj.getVar("startX").clear_vector();
        obj.getVar("startY").clear_vector();
        obj.getVar("startX").push_vector(obj.getXPos());
        obj.getVar("startY").push_vector(obj.getYPos());

        obj.getVar("moveValue").clear_vector();
        obj.getVar("moveValue").push_vector(moveValue);


		obj.sq_SetCurrentAnimation(CUSTOM_ANI_MANYU85_READY + state);

        if (state >= 1 && state<= 10)
        {
            obj.sq_SetStaticSpeedInfo(SPEED_TYPE_CAST_SPEED, SPEED_TYPE_CAST_SPEED,SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);
        }
    }

}

function onKeyFrameFlag_MANYU85(obj,flagIndex)
{


    local state = obj.getVar("state").get_vector(0);
    local attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_MANYU85, STATE_MANYU85, 0, 1.0);


    if (flagIndex == 1 && obj.getVar("flag").get_vector(0) == 0)
    {

        obj.getVar("flag").clear_vector();
        obj.getVar("flag").push_vector(1);


        if (state == 12)
        {
            attackBonusRate = obj.sq_GetBonusRateWithPassive(SKILL_MANYU85, STATE_MANYU85, 1, 1.0);

            sq_flashScreen(obj,0,0,500,500, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);
        }

		obj.sq_StartWrite();
		obj.sq_WriteDword(attackBonusRate);	
		obj.sq_WriteDword(state);
		obj.sq_SendCreatePassiveObjectPacket(24319, 0, 0, 1, 0);


		obj.sq_StartWrite();
		obj.sq_WriteDword(attackBonusRate);	
		obj.sq_WriteDword(state);   
		obj.sq_SendCreatePassiveObjectPacket(24319, 0, 0, 1, 0);


    }
}

function onProc_MANYU85(obj)
{

    local state = obj.getVar("state").get_vector(0);
    local moveValue = obj.getVar("moveValue").get_vector(0);

    if (state == 1)
    {
        move_manyu85(obj,1*moveValue,-10,15,42);
    }
    if (state == 2)
    {
        move_manyu85(obj,4*moveValue,15,30*moveValue,87);
    }
    if (state == 4)
    {
        move_manyu85(obj,7*moveValue,-17,51*moveValue,102);
    }
    if (state == 6)
    {
        move_manyu85(obj,9*moveValue,19,67*moveValue,124);
    }
    if (state == 8)
    {
        move_manyu85(obj,5*moveValue,-17,30*moveValue,102);
    }
    if (state == 10)
    {
        move_manyu85(obj,-2*moveValue,15,30*moveValue,42);
    }

    if (state == 11)
    {

//        obj.setCurrentPos(obj.getXPos(),obj.getVar("useY").get_vector(0),obj.getZPos());
        obj.sq_SetfindNearLinearMovablePos(obj.getXPos() ,obj.getVar("useY").get_vector(0),obj.getXPos(), obj.getYPos(), 10);

    }
}

function move_manyu85(obj,x,y,maxX,maxY)
{

    local chrDirection = 1;

    if(sq_GetDirection(obj) == ENUM_DIRECTION_LEFT) chrDirection = -1;

    if ( !obj.isMovablePos(obj.getXPos() + x * chrDirection, obj.getYPos() + y)) 
    {
        return false;
    }

    local stateStartX = obj.getVar("startX").get_vector(0);
    local stateStartY = obj.getVar("startY").get_vector(0);
    
    local currChrX = obj.getXPos();
    local currChrY = obj.getYPos();

    local lastAddX = x * chrDirection;
    local lastAddY = y;

    if (abs(stateStartX - currChrX) >= maxX ) lastAddX = 0;
    if (abs(stateStartY - currChrY) >= maxY ) lastAddY = 0;

    obj.setCurrentPos(obj.getXPos() + lastAddX , obj.getYPos() + lastAddY,obj.getZPos());

    //obj.sq_SetfindNearLinearMovablePos(obj.getXPos() + moveX * 3 * blood45_value ,obj.getYPos(),obj.getXPos(), obj.getYPos(), 10);
}

function onEndCurrentAni_MANYU85(obj)
{
    local state = obj.getVar("state").get_vector(0);

    if (state < 12)
    {

        obj.getVar("state").clear_vector();
        obj.getVar("state").push_vector(state+1);
		obj.sq_AddSetStatePacket(STATE_MANYU85, STATE_PRIORITY_USER, true);
    }else{
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
    }
}