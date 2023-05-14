IRDSQRCharacter.pushScriptFiles("character/newpriest/priest_common.nut");
IRDSQRCharacter.pushScriptFiles("character/newpriest/priest_header.nut");

IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "character/newpriest/jupiter/jupiter.nut", "Jupiter", STATE_JUPITER, SKILL_JUPITER);
IRDSQRCharacter.pushPassiveObj("Character/Priest/spearofdestiny/po_spearofdestiny.nut", 24341);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/spearofdestiny/spearofdestiny.nut", "spearofdestiny", STATE_spearofdestiny, SKILL_spearofdestiny);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_PRIEST, "Character/Priest/miraclespliter/miraclespliter.nut", "miraclespliter", STATE_miraclespliter, SKILL_miraclespliter);