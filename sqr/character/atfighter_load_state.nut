

//******************************************************************************************
// 남법사 공통
//******************************************************************************************
IRDSQRCharacter.pushScriptFiles("Character/atfighter/atfighter_header.nut");	// 남법사 스크립트 개발을 위해 넣어둔 상수(enum값 모음)


//******************************************************************************************
// 스킬개별 NUT파일 로드
//******************************************************************************************

IRDSQRCharacter.pushState(7, "Character/atfighter/dropfire/dropfire.nut", "dropfire", STATE_dropfire, SKILL_dropfire);
IRDSQRCharacter.pushState(7, "Character/atfighter/atomiccannon/atomiccannon.nut", "atomiccannon", STATE_atomiccannon, SKILL_atomiccannon);
IRDSQRCharacter.pushState(7, "Character/atfighter/emperorcombination/emperorcombination.nut", "emperorcombination", STATE_emperorcombination, SKILL_emperorcombination);


IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_FIGHTER, "Character/ATFighter/Moonlighttheearth/moonlighttheearth.nut", "Moonlighttheearth", STATE_MOONLIGJTTHEEARTH, SKILL_MOONLIGJTTHEEARTH);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_AT_FIGHTER, "Character/ATFighter/GlancetheHost/glancethehost.nut", "Glancethehost", STATE_GLANCETHEHOST, SKILL_GLANCETHEHOST);

IRDSQRCharacter.pushState(7, "Character/atfighter/fireworks/fireworks.nut", "fireworks", STATE_fireworks, SKILL_fireworks);
IRDSQRCharacter.pushState(7, "Character/atfighter/finalextremestrike/finalextremestrike.nut", "finalextremestrike", STATE_finalextremestrike, SKILL_finalextremestrike);



