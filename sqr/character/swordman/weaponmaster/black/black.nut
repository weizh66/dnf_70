
function onAfterSetState_JumpAttack_Swordman(obj, state, datas, isResetTimer)
{
	local skillLevel = obj.sq_GetSkillLevel(SKILL_BLACK);
		
	if (skillLevel > 0)
	{
		local skillIndex = obj.getCurrentSkillIndex();
		
		if (skillIndex == 49)
		{
			obj.sq_SendCreatePassiveObjectPacket(660060, 0, 0, 20, 0);
		}
	}
}



function onAfterSetState_RapidMoveSlash(obj, state, datas, isResetTimer)
{
	local skillLevel = obj.sq_GetSkillLevel(SKILL_BLACK);
		
	if (skillLevel > 0)
	{
		local skillIndex = obj.getCurrentSkillIndex();
		
		if (skillIndex == 72)
		{
			obj.sq_SendCreatePassiveObjectPacket(990324, 0, 0, 20, 0);
		}
	}
}

















