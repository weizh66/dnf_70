
function sq_AddFunctionName(appendage)
{
	appendage.sq_AddFunctionName("proc", "proc_appendage_swordmain")
	appendage.sq_AddFunctionName("onStart", "onStart_appendage_swordmain")
	appendage.sq_AddFunctionName("onEnd", "onEnd_appendage_swordmain")
	appendage.sq_AddFunctionName("drawAppend", "drawAppend_appendage_swordmain")	
}

function proc_appendage_swordmain(appendage)
{
	if(!appendage) {
		return;
	}

	local parentObj = appendage.getParent();

}


function onStart_appendage_swordmain(appendage)
{
	if(!appendage) {
		return;
	}


//    appendage.getVar("sN").clear_vector();
//    appendage.getVar("sN").push_vector(5);
	
}


function onEnd_appendage_swordmain(appendage)
{
	if(!appendage) {
		return;
	}
}
