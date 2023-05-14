#PVF_File

[use animation]
	`../Effect/Animation/ChainDestruction/01_burst.ani`
	`01_burst`

[use animation]
	`../Effect/Animation/ChainDestruction/01_attack_dust.ani`
	`01_attack_dust`

[use animation]
	`../Effect/Animation/ChainDestruction/01_wind.ani`
	`01_wind`

[use animation]
	`../Effect/Animation/ChainDestruction/01_dust.ani`
	`01_dust`

[add]
	0	10001
	`01_wind`

[add]
	2	10002
	`01_attack_dust`

[add]
	2	10003
	`01_burst`

[create draw only object]
	0
	`01_dust`	0	1	0
