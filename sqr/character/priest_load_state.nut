

//******************************************************************************************
// ZiTou
//******************************************************************************************
IRDSQRCharacter.pushScriptFiles("Character/Priest/Priest_header.nut");	// a

//******************************************************************************************
// ZiTou1
//******************************************************************************************
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/XinYangZhiYi/XinYangZhiYi.nut", "XinYangZhiYi", STATE_XINYANGZHIYI, SKILL_XINYANGZHIYI);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/ZhenLongFenTian/ZhenLongFenTian.nut", "ZhenLongFenTian", STATE_ZHENLONGFENTIAN, SKILL_ZHENLONGFENTIAN);

IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/atomicchopper/atomicchopper.nut", "atomicchopper", STATE_atomicchopper, SKILL_atomicchopper);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/demolitionpunch/demolitionpunch.nut", "demolitionpunch", STATE_demolitionpunch, SKILL_demolitionpunch);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/gatlingpunch/gatlingpunch.nut", "gatlingpunch", STATE_gatlingpunch, SKILL_gatlingpunch);

IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/pentagon/pentagon.nut", "pentagon", STATE_pentagon, SKILL_pentagon);
IRDSQRCharacter.pushPassiveObj("Character/Priest/pentagon/po_pentagon.nut", 24342);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/thebest7hit/thebest7hit.nut", "thebest7hit", STATE_thebest7hit, SKILL_thebest7hit);

IRDSQRCharacter.pushState(4, "Character/Priest/wrathofgod/wrathofgod.nut", "wrathofgod", STATE_wrathofgod, SKILL_wrathofgod);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/corkscrewblow/corkscrewblow.nut", "corkscrewblow", STATE_corkscrewblow, SKILL_corkscrewblow);
