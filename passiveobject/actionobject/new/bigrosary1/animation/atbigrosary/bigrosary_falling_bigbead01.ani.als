#PVF_File

[use animation]
	`BigRosary_Falling_Floor.ani`
	`Falling_Floor`

[use animation]
	`BigRosary_Falling_BigBead02.ani`
	`Falling_BigBead02`

[use animation]
	`BigRosary_Falling_BigBeadTail_E03.ani`
	`Falling_BigBeadTail_E03`

[create draw only object]
	1
	`Falling_BigBeadTail_E03`	0	-1	0

[none effect add]
	0	-1
	`Falling_BigBead02`

[create draw only object]
	0
	`Falling_Floor`	0	1	-1000
