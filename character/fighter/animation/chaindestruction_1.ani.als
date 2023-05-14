#PVF_File

[use animation]
	`../Effect/Animation/ChainDestruction/00_burst.ani`
	`00_burst`

[use animation]
	`../Effect/Animation/ChainDestruction/00_shock.ani`
	`00_shock`

[use animation]
	`../Effect/Animation/ChainDestruction/00_dash.ani`
	`00_dash`

[use animation]
	`../Effect/Animation/ChainDestruction/00_dash_floor.ani`
	`00_dash_floor`

[use animation]
	`../Effect/Animation/ChainDestruction/00_dash_dust.ani`
	`00_dash_dust`

[add]
	1	10001
	`00_dash_floor`

[add]
	1	10002
	`00_dash`

[add]
	4	10003
	`00_shock`

[add]
	4	10004
	`00_burst`

[create draw only object]
	1
	`00_dash_dust`	0	1	0
