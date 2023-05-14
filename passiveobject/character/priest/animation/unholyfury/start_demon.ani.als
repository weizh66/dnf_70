#PVF_File

[use animation]
	`../../Effect/Animation/UnholyFury/Start02/Start_Add01.ani`
	`Add01`

[use animation]
	`../../Effect/Animation/UnholyFury/Start02/Start_Add02.ani`
	`Add02`

[use animation]
	`../../Effect/Animation/UnholyFury/Start02/Start_Add03.ani`
	`Add03`

[use animation]
	`../../Effect/Animation/UnholyFury/Start02/Start_Add04.ani`
	`Add04`

[use animation]
	`../../Effect/Animation/UnholyFury/Start02/Start_redeye02.ani`
	`redeye02`

[use animation]
	`../../Effect/Animation/UnholyFury/Start02/Start_Glow.ani`
	`Glow`

[use animation]
	`../../Effect/Animation/UnholyFury/Start02/Start_Add05.ani`
	`Add05`

[use animation]
	`../../Effect/Animation/UnholyFury/Start02/Start_Add06.ani`
	`Add06`

[create draw only object]
	1
	`Add06`	0	2	0

[create draw only object]
	1
	`Add05`	0	-1	0

[add]
	0	10001
	`Glow`

[add]
	1	10002
	`redeye02`

[create draw only object]
	1
	`Add04`	0	3	0

[create draw only object]
	1
	`Add03`	0	4	0

[create draw only object]
	1
	`Add02`	0	5	0

[create draw only object]
	1
	`Add01`	0	6	0
