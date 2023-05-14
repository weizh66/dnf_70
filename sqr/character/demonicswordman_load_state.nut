

IRDSQRCharacter.pushScriptFiles("Character/DemonicSwordman/demonicswordman_header.nut");
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_DEMONIC_SWORDMAN, "Character/DemonicSwordman/PhantomSword/PhantomSword.nut", "PhantomSword", STATE_PHANTOMSWORD, SKILL_PHANTOMSWORD);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_DEMONIC_SWORDMAN, "Character/DemonicSwordman/ChargeExplosion/ChargeExplosion.nut", "ChargeExplosion", STATE_CHARGEEXPLOSION, SKILL_CHARGEEXPLOSION);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_DEMONIC_SWORDMAN, "Character/DemonicSwordman/DarkBurst/DarkBurst.nut", "DarkBurst", STATE_DARKBURST, SKILL_DARKBURST);
IRDSQRCharacter.pushState(ENUM_CHARACTERJOB_DEMONIC_SWORDMAN, "Character/DemonicSwordman/TimeBreak/TimeBreak.nut", "TimeBreak", STATE_TIMEBREAK, SKILL_TIMEBREAK);

IRDSQRCharacter.pushPassiveObj("Character/DemonicSwordman/PhantomSword/po_PhantomSword.nut", 24317);
IRDSQRCharacter.pushPassiveObj("Character/DemonicSwordman/ChargeExplosion/po_ChargeExplosion.nut", 24322);
IRDSQRCharacter.pushPassiveObj("Character/DemonicSwordman/DarkBurst/po_DarkBurst.nut", 24320);
IRDSQRCharacter.pushPassiveObj("Character/DemonicSwordman/TimeBreak/po_TimeBreak.nut", 24321);
