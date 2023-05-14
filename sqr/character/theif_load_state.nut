

//******************************************************************************************
// ZiTou
//******************************************************************************************
IRDSQRCharacter.pushScriptFiles("Character/thief/thief_header.nut");	// a


//******************************************************************************************
// ZiTou1
//******************************************************************************************
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_THIEF, "Character/thief/distribution/distribution.nut", "distribution", STATE_distribution, SKILL_distribution);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_THIEF, "Character/thief/exoticrampant/exoticrampant.nut", "exoticrampant", STATE_exoticrampant, SKILL_exoticrampant);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_THIEF, "Character/thief/novaremnant/novaremnant.nut", "novaremnant", STATE_novaremnant, SKILL_novaremnant);


IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_THIEF, "Character/thief/ballacreadvent/ballacreadvent.nut", "ballacreadvent", STATE_ballacreadvent, SKILL_ballacreadvent);
