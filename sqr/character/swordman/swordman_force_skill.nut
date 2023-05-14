function onProc_ForceSkill(obj)
{
	for(local i=0;i<90;i++){
		obj.setSkillCommandEnable(i, true);
	}

	if(!obj)
		return;
}
