#PVF_File

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step08A_SpinGlow03.ani`
	`ATMakeLotusSlash_Step08A_SpinGlow03`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step08A_SpinGlow02.ani`
	`ATMakeLotusSlash_Step08A_SpinGlow02`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step08A_Spin04.ani`
	`ATMakeLotusSlash_Step08A_Spin04`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step08A_SwordBottom(D).ani`
	`ATMakeLotusSlash_Step08A_SwordBottom(D)`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step08A_SwordBottom.ani`
	`ATMakeLotusSlash_Step08A_SwordBottom`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step08B_Leaf00.ani`
	`MoonEffect`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step08C_Beam.ani`
	`UpperEffect`

[add]
	0	-1
	`ATMakeLotusSlash_Step08A_SwordBottom(D)`

[add]
	0	-1
	`ATMakeLotusSlash_Step08A_SwordBottom`

[add]
	12	10001
	`ATMakeLotusSlash_Step08A_Spin04`

[add]
	12	10002
	`ATMakeLotusSlash_Step08A_SpinGlow02`

[add]
	12	10003
	`ATMakeLotusSlash_Step08A_SpinGlow03`

[create draw only object]
	0
	`UpperEffect`	0	0	0

[create draw only object]
	3
	`MoonEffect`	0	-1	-200
