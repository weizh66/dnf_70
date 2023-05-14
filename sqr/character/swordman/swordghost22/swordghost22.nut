function checkExecutableSkill_SwordGhost22(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_SWORD_GHOST_22);

	if (isUse) 
	{
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(0);
		obj.sq_AddSetStatePacket(STATE_SWORD_GHOST_22 , STATE_PRIORITY_IGNORE_FORCE, true);
		return true;
	}

	return false;
}


function checkCommandEnable_SwordGhost22(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();

	if (state == STATE_STAND)
		return true;
		
	return true;
}

function onSetState_SwordGhost22(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_StopMove();
	local substate = obj.sq_GetVectorData(datas, 0);
	obj.setSkillSubState(substate);
	
	
	if(substate == 0)
	{

		obj.sq_SendCreatePassiveObjectPacket(260204, 0, 0, 0, 0);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORD_GHOST_22_ER_JUE_START);
		obj.sq_SendCreatePassiveObjectPacket(260200, 0, -35, -5, 0);

		local activeObject = sq_FindTarget(obj, -400, 400, 150, 50);
		local id = sq_GetObjectId(activeObject);
		print("onSetState activeObject= " + activeObject);
		print("id activeObject= " + id);

		local activeObject_xPos = activeObject.getXPos();
		local activeObject_yPos = activeObject.getYPos();
		local activeObject_zPos = activeObject.getZPos();
				
		obj.getVar().clear_vector();
		obj.getVar().push_vector(activeObject_xPos);
		obj.getVar().push_vector(activeObject_yPos);
		obj.getVar().push_vector(activeObject_zPos);
		obj.getVar().push_vector(id);
		
		local masterAppendage = CNSquirrelAppendage.sq_AppendAppendage
		(activeObject, obj, STATE_SWORD_GHOST_22, false, "character/swordman/swordghost22/ap_erjue.nut", true);
		masterAppendage.sq_SetValidTime(4000);
			if(masterAppendage) 
				{
				sq_HoldAndDelayDie(activeObject, obj, true, true, true, 1, 1, ENUM_DIRECTION_NEUTRAL , masterAppendage);
				//local collectingTime = 400;			
				//sq_MoveToAppendageForce(activeObject, obj, activeObject, 0, 0, 10, collectingTime, true, masterAppendage);
				print(" sq_MoveToAppendageForce");
				}
	}
	else if(substate == 1)
	{
		
		
		local xPos = obj.getVar().get_vector(0);
		local yPos = obj.getVar().get_vector(1);
		local zPos = obj.getVar().get_vector(2);
		local activeObject = obj.getVar().get_vector(3);
		print("xPos " + xPos);
		print("yPos " + yPos);
		print("zPos " + zPos);

		local object = sq_GetObjectByObjectId(obj,activeObject);
		print("substate_activeObject " + activeObject);
		
		if(xPos == 0)
		{
			obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
			CNSquirrelAppendage.sq_RemoveAppendage(object, "character/swordman/swordghost22/ap_erjue.nut");
		}
		
		if(xPos != 0)
		{
			sq_SetCurrentPos(obj,xPos - 10,yPos,zPos);	
		}
		
		obj.sq_SendCreatePassiveObjectPacket(260203, 0, 0, -1, 0);
		obj.sq_SetCurrentAnimation(CUSTOM_ANI_SWORD_GHOST_22_ER_JUE_ATTACK);
		
		
		
	}

}


function onEndCurrentAni_SwordGhost22(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0)
	{
		obj.sq_IntVectClear();
		obj.sq_IntVectPush(1);
		obj.sq_AddSetStatePacket(STATE_SWORD_GHOST_22, STATE_PRIORITY_IGNORE_FORCE, true);
	}
	else if(substate == 1)
	{
		local activeObject = obj.getVar().get_vector(3);
		local object = sq_GetObjectByObjectId(obj,activeObject);
		
		
		print("onEnd activeObject " + activeObject);
		if(object != null)
		{
			//sq_SendCreatePassiveObjectPacketPos(obj, 261166, 0, activeObject.getXPos(), activeObject.getYPos(), activeObject.getZPos());
			CNSquirrelAppendage.sq_RemoveAppendage(object, "character/swordman/swordghost22/ap_erjue.nut");
		}
		if(object == 0)
		{
			obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
			CNSquirrelAppendage.sq_RemoveAppendage(object, "character/swordman/swordghost22/ap_erjue.nut");
		}


		local direction = sq_GetDirection(obj);//��������V
		
		if(direction == ENUM_DIRECTION_LEFT) 
		{
				obj.sq_SetDirection(ENUM_DIRECTION_RIGHT);
				sq_SetCurrentPos(obj,obj.getXPos() + 140,obj.getYPos(),obj.getZPos());	
		}
		else if(direction == ENUM_DIRECTION_RIGHT) 
		{
				obj.sq_SetDirection(ENUM_DIRECTION_LEFT);
				sq_SetCurrentPos(obj,obj.getXPos() - 140,obj.getYPos(),obj.getZPos());	
		}
		local posX = obj.getXPos();
		local posY = obj.getYPos();
		local posZ = obj.getZPos();
		if (!obj.isMovablePos(posX, posY))
		{
			sq_MoveToNearMovablePos(obj, posX, posY, 0, posX, posY, posZ, 200, -1, 3);
		}

		obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);

	}

}




function onKeyFrameFlag_SwordGhost22(obj,flagIndex)
{
	if(!obj)
		return false;

if (flagIndex == 1)
{


}
if (flagIndex == 2)
{
sq_flashScreen(obj, 400, 2000, 800, 255, sq_RGB(0,0,0), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_BOTTOM);//�t��
				
}
if (flagIndex == 3)
{
		sq_flashScreen(obj, 10, 30, 10, 180, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_COVER);//�t��

		obj.sq_SetShake(obj,20,200);//�_��

		obj.sq_SetCurrentAttackInfo(CUSTOM_ATK_SWORD_GHOST_22_ER_JUE_ATTACK1);	//�]�mATK�ƾ�
		
		local gaugeValue_rate = 0;
		
	local damage = obj.sq_GetBonusRateWithPassive(SKILL_SWORD_GHOST_22 , -1, 0, 1.0 + gaugeValue_rate.tofloat());
	obj.sq_SetCurrentAttackBonusRate(damage);				//����SKL�ޯ�ƾڼv�T	


}
if (flagIndex == 4)
{

		sq_flashScreen(obj, 10, 30, 10, 180, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_COVER);//�t��

		obj.sq_SetShake(obj,15,300);//�_��

		obj.sq_SetCurrentAttackInfo(CUSTOM_ATK_SWORD_GHOST_22_ER_JUE_ATTACK2);	//�]�mATK�ƾ�
		
		local gaugeValue_rate = 0;
		
	local damage = obj.sq_GetBonusRateWithPassive(SKILL_SWORD_GHOST_22 , -1, 1, 1.0 + gaugeValue_rate.tofloat());
	obj.sq_SetCurrentAttackBonusRate(damage);				//����SKL�ޯ�ƾڼv�T	

}
if (flagIndex == 5)
{

		sq_flashScreen(obj, 10, 30, 10, 180, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_COVER);//�t��

		obj.sq_SetShake(obj,15,300);//�_��

		obj.sq_SetCurrentAttackInfo(CUSTOM_ATK_SWORD_GHOST_22_ER_JUE_ATTACK3);	//�]�mATK�ƾ�
		
		local gaugeValue_rate = 0;
		
	local damage = obj.sq_GetBonusRateWithPassive(SKILL_SWORD_GHOST_22 , -1, 2, 1.0 + gaugeValue_rate.tofloat());
	obj.sq_SetCurrentAttackBonusRate(damage);				//����SKL�ޯ�ƾڼv�T	
}
if (flagIndex == 6)
{

		sq_flashScreen(obj, 10, 80, 10, 180, sq_RGB(255,255,255), GRAPHICEFFECT_NONE, ENUM_DRAWLAYER_COVER);//�t��

		obj.sq_SetShake(obj,28,290);//�_��

		obj.sq_SetCurrentAttackInfo(CUSTOM_ATK_SWORD_GHOST_22_ER_JUE_ATTACK1);	//�]�mATK�ƾ�
		
		local gaugeValue_rate = 0;
		
	local damage = obj.sq_GetBonusRateWithPassive(SKILL_SWORD_GHOST_22 , -1, 3, 1.0 + gaugeValue_rate.tofloat());
	obj.sq_SetCurrentAttackBonusRate(damage);				//����SKL�ޯ�ƾڼv�T	
}
if (flagIndex == 7)
{
				obj.sq_SendCreatePassiveObjectPacket(260201, 0, 149, 0, 0);
}
if (flagIndex == 8)
{

			local objectManager = obj.getObjectManager();
			local xPos = objectManager.getFieldXPos(400, ENUM_DRAWLAYER_NORMAL);
			local yPos = objectManager.getFieldYPos(300, 0, ENUM_DRAWLAYER_NORMAL);
			sq_SendCreatePassiveObjectPacketPos(obj, 260202, 0, xPos, yPos + 110, 0);

}
	return true;
}