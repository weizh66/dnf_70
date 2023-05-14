function checkExecutableSkill_SwordGhost6(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_SWORD_GHOST_6);

	if (isUse) 
	{
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(0);
		obj.sq_AddSetStatePacket(STATE_SWORD_GHOST_6 , STATE_PRIORITY_IGNORE_FORCE, true);
		return true;
	}

	return false;
}

function checkCommandEnable_SwordGhost6(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	
	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_SWORD_GHOST_6);
	}	
	return true;
}

function onSetState_SwordGhost6(obj, state, datas, isResetTimer)
{	

	if(!obj) return;
	local substate = obj.sq_GetVectorData(datas, 0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();//�����
	local skill_level = sq_GetSkillLevel(obj, SKILL_SWORD_GHOST_6);
	if(substate == 0)
	{
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOST_CHANGE_CAST);	//�]�mANI�ʧ@

	obj.sq_SendCreatePassiveObjectPacket(260151, 0, 0, 1, 0);
	CNSquirrelAppendage.sq_RemoveAppendage(obj, "character/swordman/swordghost6/ap_dark.nut");
	CNSquirrelAppendage.sq_RemoveAppendage(obj, "character/swordman/swordghost6/ap_rad.nut");
	}
	else if(substate == 1)
	{
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOST_CHANGE_END);	//�]�mANI�ʧ@
	obj.sq_SendCreatePassiveObjectPacket(260152, 0, 0, 1, 0);
	obj.sq_SendCreatePassiveObjectPacket(260153, 0, 0, 1, 0);
		local appendage = CNSquirrelAppendage.sq_AppendAppendage(obj, obj, SKILL_SWORD_GHOST_6, false,
		"character/swordman/swordghost6/ap_dark.nut", false);
		appendage.sq_SetValidTime(120000);
		appendage.setAppendCauseSkill(BUFF_CAUSE_SKILL, sq_getJob(obj), SKILL_SWORD_GHOST_6, skill_level);
		CNSquirrelAppendage.sq_Append(appendage, obj, obj);
	}
	else if(substate == 2)
	{
	obj.sq_SetCurrentAnimation(CUSTOM_ANI_GHOST_CHANGE_END);	//�]�mANI�ʧ@
	obj.sq_SendCreatePassiveObjectPacket(260152, 0, 0, 1, 0);
	obj.sq_SendCreatePassiveObjectPacket(260154, 0, 0, 1, 0);
		local appendage = CNSquirrelAppendage.sq_AppendAppendage(obj, obj, SKILL_SWORD_GHOST_6, false,
		"character/swordman/swordghost6/ap_rad.nut", false);
		appendage.sq_SetValidTime(120000);
		appendage.setAppendCauseSkill(BUFF_CAUSE_SKILL, sq_getJob(obj), SKILL_SWORD_GHOST_6, skill_level);
		CNSquirrelAppendage.sq_Append(appendage, obj, obj);

	}

}
 
function onKeyFrameFlag_SwordGhost6(obj,flagIndex)
{
	if(!obj)
		return false;

	if (flagIndex == 0)
	{
		local substate = obj.getSkillSubState();
	
		if(substate == 0)
		{
			if (sq_IsKeyDown(OPTION_HOTKEY_MOVE_LEFT , ENUM_SUBKEY_TYPE_ALL))
			{
				obj.sq_IntVectClear();
				obj.sq_IntVectPush(1);
				obj.sq_AddSetStatePacket(STATE_SWORD_GHOST_6, STATE_PRIORITY_IGNORE_FORCE, true);
			}
			else if(sq_IsKeyDown(OPTION_HOTKEY_MOVE_RIGHT , ENUM_SUBKEY_TYPE_ALL))
			{
				obj.sq_IntVectClear();
				obj.sq_IntVectPush(2);
				obj.sq_AddSetStatePacket(STATE_SWORD_GHOST_6, STATE_PRIORITY_IGNORE_FORCE, true);
			}
			else if(sq_IsKeyDown(OPTION_HOTKEY_JUMP , ENUM_SUBKEY_TYPE_ALL))
			{
				obj.sq_SendCreatePassiveObjectPacket(260152, 0, 0, 1, 0);
				obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
			}
		}
	}

}

function onEndCurrentAni_SwordGhost6(obj)
{
		obj.sq_SendCreatePassiveObjectPacket(260152, 0, 0, 1, 0);
	obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
}


