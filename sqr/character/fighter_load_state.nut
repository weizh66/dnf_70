

//******************************************************************************************
// 남법사 공통
//******************************************************************************************
IRDSQRCharacter.pushScriptFiles("Character/fighter/fighter_header.nut");	// 남법사 스크립트 개발을 위해 넣어둔 상수(enum값 모음)


//******************************************************************************************
// 스킬개별 NUT파일 로드
//******************************************************************************************

IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_FIGHTER, "Character/fighter/absorbenergyball/absorbenergyball.nut", "absorbenergyball", STATE_absorbenergyball, SKILL_absorbenergyball);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_FIGHTER, "Character/fighter/saintillusion/saintillusion.nut", "saintillusion", STATE_saintillusion, SKILL_saintillusion);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_FIGHTER, "Character/fighter/nenofbrilliance/nenofbrilliance.nut", "nenofbrilliance", STATE_nenofbrilliance, SKILL_nenofbrilliance);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_FIGHTER, "Character/Fighter/JiWu/JiWu.nut", "JiWu", STATE_JIWU, SKILL_JIWU);
IRDSQRCharacter.pushPassiveObj("Character/Fighter/JiWu/po_JiWu.nut", 24350);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_FIGHTER, "Character/Fighter/HuXiao/HuXiao.nut", "HuXiao", STATE_HUXIAO, SKILL_HUXIAO);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_FIGHTER, "Character/Fighter/ShengWu/ShengWu.nut", "ShengWu", STATE_SHENGWU, SKILL_SHENGWU);
IRDSQRCharacter.pushState(1, "Character/Fighter/CangYu/CangYu.nut", "CangYu", 223, 227);


IRDSQRCharacter.pushState(1, "Character/Fighter/chaindestruction/chaindestruction.nut", "chaindestruction", STATE_chaindestruction, SKILL_chaindestruction);
IRDSQRCharacter.pushState(1, "Character/Fighter/elbowthrow/elbowthrow.nut", "elbowthrow", STATE_elbowthrow, SKILL_elbowthrow);


IRDSQRCharacter.pushPassiveObj("Character/Fighter/torbellino/po_torbellino.nut", 24351);
IRDSQRCharacter.pushPassiveObj("Character/Fighter/poisonexplosion/po_poisonexplosion.nut", 24318);
IRDSQRCharacter.pushPassiveObj("Character/Fighter/dragonmine/po_dragonmine.nut", 24352);

IRDSQRCharacter.pushState(1, "Character/Fighter/torbellino/torbellino.nut", "torbellino", STATE_torbellino, SKILL_torbellino);
IRDSQRCharacter.pushState(1, "Character/Fighter/poisonexplosion/poisonexplosion.nut", "poisonexplosion", STATE_poisonexplosion, SKILL_poisonexplosion);
IRDSQRCharacter.pushState(1, "Character/Fighter/dragonmine/dragonmine.nut", "dragonmine", STATE_dragonmine, SKILL_dragonmine);