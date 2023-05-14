
function checkExecutableSkill_dragonmine(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_dragonmine);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_dragonmine , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}



function checkCommandEnable_dragonmine(obj)
{
return true;
}


function onSetState_dragonmine(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DragonmineStart);
	}
	if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DragonmineJumpSpin);
		
		local lenX = obj.sq_GetIntData(SKILL_dragonmine, 0);
		local lenY = 0;
		
		local leftPress = sq_IsKeyDown(OPTION_HOTKEY_MOVE_LEFT, ENUM_SUBKEY_TYPE_ALL);
		local rightPress = sq_IsKeyDown(OPTION_HOTKEY_MOVE_RIGHT, ENUM_SUBKEY_TYPE_ALL);
		local upPress = sq_IsKeyDown(OPTION_HOTKEY_MOVE_UP, ENUM_SUBKEY_TYPE_ALL);
		local downPress = sq_IsKeyDown(OPTION_HOTKEY_MOVE_DOWN, ENUM_SUBKEY_TYPE_ALL);
		
		if(sq_GetDirection(obj) == ENUM_DIRECTION_RIGHT && leftPress) lenX = obj.sq_GetIntData(SKILL_dragonmine, 1);
		if(sq_GetDirection(obj) == ENUM_DIRECTION_LEFT && rightPress) lenX = obj.sq_GetIntData(SKILL_dragonmine, 1);
		if(sq_GetDirection(obj) == ENUM_DIRECTION_RIGHT && rightPress) lenX = obj.sq_GetIntData(SKILL_dragonmine, 2);
		if(sq_GetDirection(obj) == ENUM_DIRECTION_LEFT && leftPress) lenX = obj.sq_GetIntData(SKILL_dragonmine, 2);
		
		if (upPress) lenY = -obj.sq_GetIntData(SKILL_dragonmine, 4);
		if (downPress) lenY = obj.sq_GetIntData(SKILL_dragonmine, 4);
		
		obj.getVar("lenX").clear_vector();
		obj.getVar("lenX").push_vector(lenX);
		
		obj.getVar("lenY").clear_vector();
		obj.getVar("lenY").push_vector(lenY);
		
		obj.getVar("cpY").clear_vector();
		obj.getVar("cpY").push_vector(0);
		
		sq_SetZVelocity(obj,obj.sq_GetIntData(SKILL_dragonmine, 3),-2000);
	}
	if(substate == 2)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DragonmineImpact);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_dragonmine , STATE_dragonmine, 1, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);

		obj.getVar("dama").clear_obj_vector();
	}
	if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DragonmineBoom);
	}
	else if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DragonmineDrop);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onProc_dragonmine(obj)
{
	local substate = obj.getSkillSubState();
  if (substate == 3)
  {
    if (obj.getZPos() <= 0)
    {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_dragonmine, STATE_PRIORITY_IGNORE_FORCE, true);
    }
  }

   if (obj.sq_GetSkillSubState(obj) == 1)
    {

		local speed = obj.getVar("lenX").get_vector(0)/2;
		obj.sq_SetStaticMoveInfo(0, speed, speed, false);	
		obj.sq_SetMoveDirection(obj.getDirection(), ENUM_DIRECTION_NEUTRAL);	

        local y_move = obj.getVar("lenY").get_vector(0);
        local cpY = obj.getVar("cpY").get_vector(0);


        if( y_move < 0 )
        {
            if (cpY <= -y_move && obj.isMovablePos(obj.getXPos(), obj.getYPos() - 1 ) )
            {
                obj.setCurrentPos(obj.getXPos(),obj.getYPos() - 1,obj.getZPos());
                obj.getVar("cpY").clear_vector();
                obj.getVar("cpY").push_vector(cpY + 1);
            }
        }else{
        
            if (cpY <= y_move && obj.isMovablePos(obj.getXPos(), obj.getYPos() + 1 ) )
            {
                obj.setCurrentPos(obj.getXPos(),obj.getYPos() + 1,obj.getZPos());
                obj.getVar("cpY").clear_vector();
                obj.getVar("cpY").push_vector(cpY + 1);
            }
             }
    }

    if (obj.sq_GetSkillSubState(obj) == 2 || obj.sq_GetSkillSubState(obj) == 3 || obj.sq_GetSkillSubState(obj) == 4) 
    {

        local var = obj.getVar("dama");  		
        local objectsSize = var.get_obj_vector_size();


        for(local i=0;i<objectsSize;++i)
        {
            local damager = var.get_obj_vector(i);

            local objX = obj.getXPos();
            local objY = obj.getYPos();

            local damaX = damager.getXPos();
            local damaY = damager.getYPos();
            local damaZ = damager.getZPos();

            local x_move = 2;
            local y_move = 2;
            local value_etc = 1;
            if (objX < damaX) x_move = - x_move;
            if (objY < damaY) y_move = - y_move;

            damager.setCurrentPos(damaX + x_move,damaY + y_move,damaZ);

        }

    }


}

function onEndCurrentAni_dragonmine(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(1);
		obj.sq_AddSetStatePacket(STATE_dragonmine, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 1){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(2);
		obj.sq_AddSetStatePacket(STATE_dragonmine, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 2){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(3);
		obj.sq_AddSetStatePacket(STATE_dragonmine, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	if(substate == 3){
		obj.getVar().clear_vector();
		obj.getVar().push_vector(4);
		obj.sq_AddSetStatePacket(STATE_dragonmine, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 4){
		obj.sq_SendCreatePassiveObjectPacket(380150, 0, 0, 0, 0);
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}

function onKeyFrameFlag_dragonmine(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_dragonmine);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_dragonmine);
		local power 	= obj.sq_GetBonusRateWithPassive(SKILL_dragonmine , STATE_dragonmine, 0, 1.0);
		local poisonProb	= sq_GetLevelData(obj, SKILL_dragonmine, 7, level);
		local poisonLevel	= sq_GetLevelData(obj, SKILL_dragonmine, 10, level);
		local poisonTime	= sq_GetLevelData(obj, SKILL_dragonmine, 3, level);
		
		obj.sq_StartWrite();
		obj.sq_WriteFloat(power.tofloat());
		obj.sq_WriteDword(poisonProb);
		obj.sq_WriteDword(poisonLevel);
		obj.sq_WriteDword(poisonTime);
		obj.sq_SendCreatePassiveObjectPacket(24352, 0, 0, -30, 0);
	}
	return true;
}


