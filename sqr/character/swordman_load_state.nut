

//******************************************************************************************
// 남법사 공통
//******************************************************************************************
IRDSQRCharacter.pushScriptFiles("Character/swordman/swordman_header.nut");	// 남법사 스크립트 개발을 위해 넣어둔 상수(enum값 모음)
IRDSQRCharacter.pushScriptFiles("Character/swordman/swordman_common.nut"); //  이곳은 state로 구분짓는것이 아닌 남법사 공통 함수 입니다
IRDSQRCharacter.pushScriptFiles("Character/swordman/passive_skill_swordman.nut"); // 기본적인 패시브 스킬을 처리하는 부분입니다.


//******************************************************************************************
// 스킬개별 NUT파일 로드
//******************************************************************************************
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/bloodboom/bloodboom.nut", "bloodboom", STATE_bloodboom, SKILL_bloodboom);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/bloodmarble/bloodmarble.nut", "bloodmarble", STATE_bloodmarble, SKILL_bloodmarble);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/bloodriven/bloodriven.nut", "bloodriven", STATE_bloodriven, SKILL_bloodriven);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/meteorsword/meteorsword.nut", "meteorsword", STATE_meteorsword, SKILL_meteorsword);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/indaramang/indaramang.nut", "indaramang", STATE_indaramang, SKILL_indaramang);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/vajra/vajra.nut", "vajra", STATE_vajra, SKILL_vajra);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/lightninggod/lightninggod.nut", "lightninggod", STATE_lightninggod, SKILL_lightninggod);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/zigadvent/zigadvent.nut", "zigadvent", STATE_zigadvent, SKILL_zigadvent);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/swordman/indaramang/indaramang.nut", "indaramang", STATE_indaramang, SKILL_indaramang);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/lightninggod/lightninggod.nut", "lightninggod", STATE_lightninggod, SKILL_lightninggod);
IRDSQRCharacter.pushPassiveObj("Character/Swordman/FlashCut/po_FlashCut.nut", 24302);
IRDSQRCharacter.pushPassiveObj("Character/Swordman/SwordOfMind/po_SwordOfMind.nut", 24303);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/FlashCut/FlashCut.nut", "FlashCut", STATE_FLASHCUT, SKILL_FLASHCUT);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/SwordOfMind/SwordOfMind.nut", "SwordOfMind", STATE_SWORDOFMIND, SKILL_SWORDOFMIND);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/BerserKerEye/BloodSnatch/BloodSnatch.nut", "BloodSnatch", STATE_BLOODSNATCH, SKILL_BLOODSNATCH);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/BerserKerEye/Rage/Rage.nut", "Rage", STATE_RAGE, SKILL_RAGE);
IRDSQRCharacter.pushPassiveObj("Character/Swordman/BerserKerEye/BloodBoom/po_BloodBoom.nut", 24328);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/WeaponMaster/Black/Black.nut", "Black", STATE_BLACK, SKILL_BLACK);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/WeaponMaster/Black/Black.nut", "JumpAttack_Swordman", STATE_JUMP_ATTACK, -1);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/WeaponMaster/Black/Black.nut", "RapidMoveSlash", STATE_RAPIDMOVESLASH, -1);
IRDSQRCharacter.pushState(0, "character/swordman/hongyan/fatablood.nut", "FATABLOOD", STATE_FATABLOOD, SKILL_FATABLOOD);



IRDSQRCharacter.pushState(0, "character/newswordman/ghost75/ghost75.nut", "ghost75", STATE_ghost75, SKILL_ghost75);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_SWORDMAN, "Character/Swordman/SoulBringer/DarkFlameSlash/DarkFlameSlash.nut", "DarkFlameSlash", STATE_DARKFLAMESLASH, SKILL_DARKFLAMESLASH);




