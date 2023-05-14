function onProc_OptimizeAwaken(obj)
{
	local ani=sq_GetCurrentAnimation(obj);
	local frameIndex=sq_GetAnimationFrameIndex(ani);
	if(frameIndex > 3){
		obj.sq_AddSetStatePacket(0,STATE_PRIORITY_IGNORE_FORCE, true);
	}

	if(!obj)
		return;
}
