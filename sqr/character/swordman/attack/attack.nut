

function onSetState_SwordManAttack(obj, state, datas, isResetTimer)
{	
	if(!obj) return;
	obj.sq_SetStaticSpeedInfo(SPEED_TYPE_ATTACK_SPEED, SPEED_TYPE_ATTACK_SPEED,SPEED_VALUE_DEFAULT, SPEED_VALUE_DEFAULT, 1.0, 1.0);	//受到攻擊速度影響

}

function onProc_SwordManAttack(obj)
{

	if(!obj) return;
		//print("onEnd SwordManAttack");
}

function checkExecutableSkill_SwordManAttack(obj)  
{
	if (!obj) return false;
	local isUse = obj.sq_IsUseSkill(-1);

	if (isUse) 
	{
		obj.sq_AddSetStatePacket(STATE_ATTACK , STATE_PRIORITY_USER, false);
		return true;
	}
	return false;
}


function onKeyFrameFlag_SwordManAttack(obj,flagIndex)
{
	if(!obj)
		return false;
	//-------------------------靈魂轉換-----------------
	local skillLevel = obj.sq_GetSkillLevel(174);//
	if (skillLevel > 0)
		{
		//print("onEnd onKeyFrameFlag_SwordManAttack");
			if (flagIndex == 117)//傷害定義（暗）
			{
				local gaugeValue_rate = 0;//獲取加成倍率
				obj.sq_SetCurrentAttackInfo(87);	//設置ATK數據
				local damage = obj.sq_GetBonusRateWithPassive(174 , -1, 0, 0.5 + gaugeValue_rate.tofloat());
				obj.sq_SetCurrentAttackBonusRate(damage);				//受到SKL技能數據影響	
			}
			if (flagIndex == 118)//傷害定義（火）
			{
				local gaugeValue_rate = 0;//獲取加成倍率
				obj.sq_SetCurrentAttackInfo(89);	//設置ATK數據
				local damage = obj.sq_GetBonusRateWithPassive(174 , -1, 0, 0.5 + gaugeValue_rate.tofloat());
				obj.sq_SetCurrentAttackBonusRate(damage);				//受到SKL技能數據影響	
			}
		}
	return true;//返回
}