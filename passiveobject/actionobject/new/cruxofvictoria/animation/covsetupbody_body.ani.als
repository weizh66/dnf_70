#PVF_File

[use animation]
	`CruxOfVictoria/CrossCatch/CoVSetupEff_Feather_00.ani`
	`CoVSetupEff_Feather_00`

[use animation]
	`CruxOfVictoria/CrossCatch/CoVSetupBody_CrossLight.ani`
	`CoVSetupBody_CrossLight`

[use animation]
	`CruxOfVictoria/CrossCatch/CoVSetupBody_Cross_01.ani`
	`CoVSetupBody_Cross_01`

[use animation]
	`CruxOfVictoria/CrossCatch/CoVSetupBody_Cross_02.ani`
	`CoVSetupBody_Cross_02`

[use animation]
	`CruxOfVictoria/CrossCatch/CoVSetupBody_Wing_02.ani`
	`CoVSetupBody_Wing_02`

[use animation]
	`CruxOfVictoria/CrossCatch/CoVSetupBody_Wing_03.ani`
	`CoVSetupBody_Wing_03`

[use animation]
	`CruxOfVictoria/CrossCatch/CoVSetupBody_Cross_03.ani`
	`CoVSetupBody_Cross_03`

[use animation]
	`CruxOfVictoria/CrossCatch/CoVSetupBody_Cross_04.ani`
	`CoVSetupBody_Cross_04`

[none effect add]
	0	-4
	`CoVSetupBody_Cross_04`

[none effect add]
	0	-3
	`CoVSetupBody_Cross_03`

[none effect add]
	2	-2
	`CoVSetupBody_Wing_03`

[none effect add]
	1	-1
	`CoVSetupBody_Wing_02`

[none effect add]
	1	10001
	`CoVSetupBody_Cross_02`

[none effect add]
	1	10002
	`CoVSetupBody_Cross_01`

[none effect add]
	2	10003
	`CoVSetupBody_CrossLight`

[create draw only object]
	0
	`CoVSetupEff_Feather_00`	0	1	0
