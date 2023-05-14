
function checkExecutableSkill_dangerclose(obj)
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(SKILL_dangerclose);

	if (isUse) {
		obj.getVar().clear_vector();
		obj.getVar().push_vector(0);
		obj.sq_AddSetStatePacket(STATE_dangerclose , STATE_PRIORITY_USER, false);
		return true;
	}

	return false;
}

function checkCommandEnable_dangerclose(obj)
{
	if (!obj) return false;
	local state = obj.sq_GetState();
	

	if (state == STATE_STAND)
		return true;
		
	if(state == STATE_ATTACK)
	{
		return obj.sq_IsCommandEnable(SKILL_dangerclose);
		obj.sq_IsCommandEnable(SKILL_dangerclose);
	}	
	
	
	return true;
}


function onSetState_dangerclose(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	local substate = obj.getVar().get_vector(0);
	obj.setSkillSubState(substate);
	obj.sq_StopMove();
	
	local posX = obj.getXPos();
	local posY = obj.getYPos();
	if(substate == 0)
	{
		local offsetX = 100;
		offsetX = obj.sq_GetDistancePos(posX, obj.sq_GetDirection(), offsetX);
		local vX = obj.sq_GetIntData(SKILL_dangerclose, 0);
		local vY = 0;
		obj.sq_AddAimPointMark(offsetX, posY, vX, vY);

		obj.sq_SetCurrentAnimation(CUSTOM_ANI_DangerClose);
	}	
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,
			SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	
}

function onEndCurrentAni_dangerclose(obj)
{
	local substate = obj.getSkillSubState();
	if(substate == 0){
			
	}
}

function onProc_dangerclose(obj)
{
	if(!obj) return;

	local substate = obj.getSkillSubState();

	local pAni = obj.sq_GetCurrentAni();
	local currentT = sq_GetCurrentTime(pAni);
		
	local sq_var = obj.getVar();
	local posX = obj.getXPos();
	local posY = obj.getYPos();
	
	if(substate == 0)
	{ 
		if(obj.isMyControlObject())
		{
			local targetTime = obj.sq_GetIntData(SKILL_dangerclose, 1);
			
			print( " targetTime:" + targetTime);
			
			if(currentT > targetTime)
			{
				local skillLevel = sq_GetSkillLevel(obj, SKILL_dangerclose);
				local value = 0;
				
				local aimPosX = obj.sq_GetAimPosX(posX, posY, true);
				local offsetX = aimPosX - posX;
				
				if (offsetX < 0)
				{
					offsetX = -offsetX;
				}

				local offsetY = -1;
				obj.sq_SendCreatePassiveObjectPacket(24344, 0, offsetX, offsetY, 0);
				obj.sq_SendCreatePassiveObjectPacket(99207, 0, offsetX, offsetY, 0);
				obj.sq_SendCreatePassiveObjectPacket(99208, 0, offsetX, offsetY, 0);
				obj.sq_SendCreatePassiveObjectPacket(99209, 0, offsetX, offsetY, 0);
				obj.sq_SendCreatePassiveObjectPacket(99210, 0, offsetX, offsetY, 0);
				
				
				obj.getVar().clear_vector();
				obj.getVar().push_vector(aimPosX);
				obj.sq_AddSetStatePacket(STATE_STAND, STATE_PRIORITY_USER, false);
			}
		}
	}
	
}

function onKeyFrameFlag_dangerclose(obj, flagIndex)
{

	if(!obj) return false;

	local substate = obj.getSkillSubState();	
	local level		  = sq_GetSkillLevel(obj, SKILL_dangerclose);
	
	if(flagIndex == 1) {
		local level	    = sq_GetSkillLevel(obj, SKILL_dangerclose);
		local power		= obj.sq_GetBonusRateWithPassive(SKILL_dangerclose , STATE_dangerclose, 0, 1.0);
		local attackBonusRate 	= obj.sq_GetBonusRateWithPassive(SKILL_dangerclose , STATE_dangerclose, 0, 1.0);
		
		obj.sq_StartWrite();
		obj.sq_WriteDword(power);
		obj.sq_WriteDword(attackBonusRate);	
	}
	return true;
}

