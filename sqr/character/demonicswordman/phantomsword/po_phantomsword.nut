
function setCustomData_po_PhantomSword(obj, receiveData)
{
	if(!obj)
		return;

	local id = receiveData.readDword();
	if (id == 0)
    {
		local ani = obj.getCustomAnimation(0);
        obj.setCurrentAnimation(ani);
	}
	
}

function onKeyFrameFlag_po_PhantomSword(obj, flagIndex)
{
	if (flagIndex == 0)
	{
		local ani = obj.getCustomAnimation(1);
		obj.setCurrentAnimation(ani);
	}
	if (flagIndex == 1)
	{
		local ani = obj.getCustomAnimation(2);
		obj.setCurrentAnimation(ani);
	}
	if (flagIndex == 2)
	{
		local ani = obj.getCustomAnimation(3);
		obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 4)	//Jian Zhen Duo Duan Gong Ji
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 5)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 6)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 7)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 8)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 9)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 10)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 11)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 12)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 13)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 14)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 15)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 16)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 17)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 18)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 19)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 20)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 21)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 22)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 23)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 24)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 25)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 26)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 27)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 28)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 29)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 30)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 32)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 34)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 36)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 38)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 40)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 42)
	{
		local attackInfo = sq_GetCustomAttackInfo(obj, 0);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	if (flagIndex == 43)
	{
		local ani = obj.getCustomAnimation(4);
		obj.setCurrentAnimation(ani);
		
		local attackInfo = sq_GetCustomAttackInfo(obj, 1);
		sq_SetCurrentAttackInfo(obj, attackInfo);
	}
	return true;
}
