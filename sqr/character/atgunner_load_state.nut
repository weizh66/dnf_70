

//******************************************************************************************
// ZiTou
//******************************************************************************************
IRDSQRCharacter.pushScriptFiles("Character/ATGunner/atgunner_header.nut");	// a


//******************************************************************************************
// ZiTou1
//******************************************************************************************
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_GUNNER, "Character/ATGunner/XueWu/XueWu.nut", "XueWu", STATE_XUEWU, SKILL_XUEWU);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_GUNNER, "Character/ATGunner/YaZhi/YaZhi.nut", "YaZhi", STATE_YAZHI, SKILL_YAZHI);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_GUNNER, "Character/ATGunner/HuoLi/HuoLi.nut", "HuoLi", STATE_HUOLI, SKILL_HUOLI);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_GUNNER, "Character/ATGunner/PT15/PT15.nut", "PT15", STATE_PT15, SKILL_PT15);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_GUNNER, "Character/ATGunner/DDay/DDay.nut", "DDay", STATE_DDAY, SKILL_DDAY);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_GUNNER, "Character/ATGunner/G96/G96.nut", "G96", STATE_G96, SKILL_G96);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_GUNNER, "Character/ATGunner/blt/blt.nut", "blt", STATE_blt, SKILL_blt);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_GUNNER, "Character/ATGunner/chaindevider/chaindevider.nut", "chaindevider", STATE_chaindevider, SKILL_chaindevider);

IRDSQRCharacter.pushPassiveObj("Character/ATGunner/plasmaboost/po_plasmaboost.nut", 24304);
IRDSQRCharacter.pushState(5, "Character/ATGunner/plasmaboost/plasmaboost.nut", "plasmaboost", STATE_plasmaboost, SKILL_plasmaboost);

IRDSQRCharacter.pushState(5, "Character/ATGunner/fsc_7/fsc_7.nut", "fsc_7", STATE_fsc_7, SKILL_fsc_7);
IRDSQRCharacter.pushState(5, "Character/ATGunner/openfire/openfire.nut", "openfire", STATE_openfire, SKILL_openfire);
IRDSQRCharacter.pushState(5, "Character/ATGunner/fireboom/fireboom.nut", "fireboom", STATE_fireboom, SKILL_fireboom);
IRDSQRCharacter.pushState(5, "Character/ATGunner/dimensionrunner/dimensionrunner.nut", "dimensionrunner", STATE_dimensionrunner, SKILL_dimensionrunner);
IRDSQRCharacter.pushState(5, "Character/ATGunner/gravitygrenade1/gravitygrenade1.nut", "gravitygrenade1", STATE_gravitygrenade1, SKILL_gravitygrenade1);
IRDSQRCharacter.pushState(5, "Character/ATGunner/new/new.nut", "new", STATE_new, SKILL_new);