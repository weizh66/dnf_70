#PVF_File

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step07_SwordTop.ani`
	`ATMakeLotusSlash_Step07_SwordTop`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step07_SwordBottom.ani`
	`ATMakeLotusSlash_Step07_SwordBottom`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step07_Spin.ani`
	`ATMakeLotusSlash_Step07_Spin`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step07_SwordBottom(D).ani`
	`ATMakeLotusSlash_Step07_SwordBottom(D)`

[use animation]
	`ATMakeLotusSlash/ATMakeLotusSlash_Step07_SwordTop(D).ani`
	`ATMakeLotusSlash_Step07_SwordTop(D)`

[add]
	0	-1
	`ATMakeLotusSlash_Step07_SwordBottom(D)`

[add]
	0	-1
	`ATMakeLotusSlash_Step07_SwordBottom`

[add]
	4	10001
	`ATMakeLotusSlash_Step07_SwordTop`

[add]
	4	-10001
	`ATMakeLotusSlash_Step07_SwordTop(D)`

[create draw only object]
	1
	`ATMakeLotusSlash_Step07_Spin`	0	0	0
