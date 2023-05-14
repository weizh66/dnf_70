#PVF_File

[use animation]
	`BigRosary_Explosion_Front01.ani`
	`Explosion_Front01`

[use animation]
	`BigRosary_Explosion_Front03.ani`
	`Explosion_Front03`

[use animation]
	`BigRosary_Explosion_Front04.ani`
	`Explosion_Front04`

[use animation]
	`BigRosary_Explosion_Front05.ani`
	`Explosion_Front05`

[use animation]
	`BigRosary_Explosion_Floor02.ani`
	`Floor`

[none effect add]
	0	-3
	`Explosion_Front05`

[none effect add]
	0	-2
	`Explosion_Front04`

[none effect add]
	0	-1
	`Explosion_Front03`

[none effect add]
	0	10001
	`Explosion_Front01`

[create draw only object]
	0
	`Floor`	0	0	-1000
