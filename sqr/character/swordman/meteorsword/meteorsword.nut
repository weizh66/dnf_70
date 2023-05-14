
function checkExecutableSkill_meteorsword(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_meteorsword);

	if (isUse) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(0); // substate???
		obj.sq_AddSetStatePacket(STATE_meteorsword, STATE_PRIORITY_IGNORE_FORCE, true);
		return true;
	}

	return false;
}

function checkCommandEnable_meteorsword(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_meteorsword);
	}	
	
	
	return true;
}

function onSetState_meteorsword(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.sq_GetVectorData(datas, 0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	if(substate == 0)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_meteorsword1);
	}
	else if(substate == 1)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_meteorsword2);
	}
	else if(substate == 2)
	{
		obj.sq_SetShake(obj,4,200);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_meteorsword3);
	}
	else if(substate == 3)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_meteorsword4);
	}
	else if(substate == 4)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_meteorsword5);
		obj.sq_SendCreatePassiveObjectPacket(900030, 0, 0, 0, 0);
	}
	else if(substate == 5)
	{
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_meteorsword6);
	}
	else if(substate == 6)
	{
		obj.sq_SetShake(obj,6,500);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_meteorsword7);
		obj.sq_SendCreatePassiveObjectPacket(900038, 0, 0, 0, 0);
		local damage = obj.sq_GetBonusRateWithPassive(SKILL_meteorsword , STATE_meteorsword, 6, 1.0);
		obj.sq_SetCurrentAttackBonusRate(damage);	
	}

}

function onProc_meteorsword(obj)
{
	if(!obj) return;
	local substate = obj.getSkillSubState();
	
	local posX = obj.getXPos();
	local posY = obj.getYPos();
	local posZ = obj.getZPos();
	
	if(substate == 0) 
	{
	}
	if(substate == 1) 
	{
	}
	if(substate == 2) 
	{
	}
	if(substate == 3) 
	{
		local vX = 2
		local vY = 1
		
		//OPTION_HOTKEY_MOVE_UP <- 0
		//OPTION_HOTKEY_MOVE_LEFT <- 1
		//OPTION_HOTKEY_MOVE_DOWN <- 2
		//OPTION_HOTKEY_MOVE_RIGHT <- 3
		if (sq_IsKeyDown(1, ENUM_SUBKEY_TYPE_ALL))
		{
			if (!obj.isMovablePos(posX, posY))
			{
				sq_MoveToNearMovablePos(obj, posX, posY, 0, posX, posY, posZ, 100, -1, 2);
			}
			if (obj.isMovablePos(posX, posY))
			{
				obj.setCurrentPos(posX-vX, posY, posZ);
			}
		}
		if (sq_IsKeyDown(3, ENUM_SUBKEY_TYPE_ALL))
		{
			if (!obj.isMovablePos(posX, posY))
			{
				sq_MoveToNearMovablePos(obj, posX, posY, 0, posX, posY, posZ, 100, -1, 2);
			}
			if (obj.isMovablePos(posX, posY))
			{
				obj.setCurrentPos(posX+vX, posY, posZ);
			}
		}
		if (sq_IsKeyDown(0, ENUM_SUBKEY_TYPE_ALL))
		{
			if (!obj.isMovablePos(posX, posY))
			{
				sq_MoveToNearMovablePos(obj, posX, posY, 0, posX, posY, posZ, 100, -1, 2);
			}
			if (obj.isMovablePos(posX, posY))
			{
				obj.setCurrentPos(posX, posY-vY, posZ);
			}
		}
		if (sq_IsKeyDown(2, ENUM_SUBKEY_TYPE_ALL))
		{
			if (!obj.isMovablePos(posX, posY))
			{
				sq_MoveToNearMovablePos(obj, posX, posY, 0, posX, posY, posZ, 100, -1, 2);
			}
			if (obj.isMovablePos(posX, posY))
			{
				obj.setCurrentPos(posX, posY+vY, posZ);
			}
		}
	}
	if(substate == 4) 
	{
	}
	if(substate == 5) 
	{
	}
	if(substate == 6) 
	{
	}
}

function onEndCurrentAni_meteorsword(obj)
{
	//700058	`Actionobject/New/MeteorSword/MeteorSwordUpSub.obj`
	local substate = obj.getSkillSubState();
	if(substate == 0) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(1); // substate???
		obj.sq_AddSetStatePacket(STATE_meteorsword, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(2); // substate???
		obj.sq_AddSetStatePacket(STATE_meteorsword, STATE_PRIORITY_IGNORE_FORCE, true);
		obj.sq_SendCreatePassiveObjectPacket(900039, 0, 0, 0, 0);
	}
	else if(substate == 2) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(3); // substate???
		obj.sq_AddSetStatePacket(STATE_meteorsword, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 3) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(4); // substate???
		obj.sq_AddSetStatePacket(STATE_meteorsword, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 4) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(5); // substate???
		obj.sq_AddSetStatePacket(STATE_meteorsword, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 5) {
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(6); // substate???
		obj.sq_AddSetStatePacket(STATE_meteorsword, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 6) {
		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
	}
}


function onKeyFrameFlag_meteorsword(obj,flagIndex)
{
	if(!obj)
		return false;
	local substate = obj.getSkillSubState();
	local isMyControlObject = obj.sq_IsMyControlObject();

	if(substate == 0) 
	{
	}
	if(substate == 1) 
	{
	}
	if(substate == 2) 
	{
	}
	if(substate == 3) 
	{
	}
	if(substate == 4) 
	{
		if (flagIndex == 11)
		{
			obj.sq_SendCreatePassiveObjectPacket(000000, 0, 0, 0, 0);
		}
	}
	if(substate == 5) 
	{

	}
	if(substate == 6) 
	{

	}
	return true;
}
