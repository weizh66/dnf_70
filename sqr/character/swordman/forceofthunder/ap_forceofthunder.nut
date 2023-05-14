
function sq_AddFunctionName(appendage)
{
	appendage.sq_AddFunctionName("proc", "proc_appendage_forceofthunder")
	appendage.sq_AddFunctionName("onStart", "onStart_appendage_forceofthunder")
	appendage.sq_AddFunctionName("onEnd", "onEnd_appendage_forceofthunder")
}

function sq_AddEffect(appendage)
{
}

function proc_appendage_forceofthunder(appendage)
{
	if(!appendage) {
		return;
	}
	local currentT = appendage.getTimer().Get();
	local t = appendage.sq_var.get_timer_vector(0);

	local obj = appendage.getParent();
	local parentChr = sq_GetCNRDObjectToSQRCharacter(obj);

	local skill = sq_GetSkill(parentChr, SKILL_FORCEOFTHUNDER);

	if(!skill.isSealFunction())
	{
		if (t.isOnEvent(currentT) == true)
		{
			sq_SendCreatePassiveObjectPacket(obj, 900319, 0, 0, 0, 0, obj.getDirection());
		}
	}
}

function onStart_appendage_forceofthunder(appendage)
{
	if(!appendage) {
		return;
	}

	local obj = appendage.getParent();
	local parentObj = sq_GetCNRDObjectToSQRCharacter(obj);
	local skill_level = sq_GetSkillLevel(parentObj,SKILL_FORCEOFTHUNDER);
	local time = sq_GetLevelData(parentObj, SKILL_FORCEOFTHUNDER, 0, skill_level);

	appendage.sq_var.clear_timer_vector();
	appendage.sq_var.push_timer_vector();
	local t = appendage.sq_var.get_timer_vector(0);
	t.setParameter(1800, -1);
	t.resetInstant(0);
}

function onEnd_appendage_forceofthunder(appendage)
{
	if(!appendage) {
		return;
	}
	
	local obj = appendage.getParent();
}
