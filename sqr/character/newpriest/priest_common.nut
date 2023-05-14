function getAttackAni_Priest(obj, index)
{
	if (!obj)
		return null;
	local animation = obj.sq_GetAttackAni(index);

	local isJupiter = obj.getVar("isJupiter").getBool(0);
	if(isJupiter)
	{
		animation = obj.sq_GetCustomAni(CUSTOM_ANI_JUPITER_ATTACK_A + index);

		obj.getVar("attackIndex").clear_vector();
		obj.getVar("attackIndex").push_vector(index);
	}

	return animation;
}

function getDefaultAttackInfo_Priest(obj, index)
{
	local attackInfo = obj.sq_GetDefaultAttackInfo(index);

	local isJupiter = obj.getVar("isJupiter").getBool(0);
	if(isJupiter)
	{
		attackInfo = sq_GetCustomAttackInfo(obj, CUSTOM_ATK_JUPITER_ATTACK_A + index);
	}

	return attackInfo;
}

function getAttackCancelStartFrameSize_Priest(obj)
{
	local maxAttackNumber = obj.sq_GetAttackCancelStartFrameSize();

	local isJupiter = obj.getVar("isJupiter").getBool(0);
	if(isJupiter)
	{
		maxAttackNumber = 2;
	}

	return maxAttackNumber;
}
