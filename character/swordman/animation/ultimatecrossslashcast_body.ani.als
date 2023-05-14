#PVF_File

[use animation]
	`../Effect/Animation/UltimateCrossSlash/UltimateCrossSlashCast_00.ani`
	`UltimateCrossSlashCast_00`

[use animation]
	`../Effect/Animation/UltimateCrossSlash/UltimateCrossSlashCast_01.ani`
	`UltimateCrossSlashCast_01`

[use animation]
	`../Effect/Animation/UltimateCrossSlash/UltimateCrossSlashCast_02.ani`
	`UltimateCrossSlashCast_02`

[use animation]
	`../Effect/Animation/UltimateCrossSlash/UltimateCrossSlashCast_03.ani`
	`UltimateCrossSlashCast_03`

[use animation]
	`../Effect/Animation/UltimateCrossSlash/UltimateCrossSlashCast_05.ani`
	`UltimateCrossSlashCast_05`

[use animation]
	`../Effect/Animation/UltimateCrossSlash/Effect/CastBack_00.ani`
	`CastBack_00`

[use animation]
	`../Effect/Animation/UltimateCrossSlash/Effect/startgroundbs_00.ani`
	`startgroundbs_00`

[none effect add]
	0	-1
	`startgroundbs_00`

[create draw only object]
	0
	`CastBack_00`	0	-1	0

[none effect add]
	0	-1
	`UltimateCrossSlashCast_05`

[none effect add]
	0	10001
	`UltimateCrossSlashCast_03`

[none effect add]
	1	10002
	`UltimateCrossSlashCast_02`

[none effect add]
	0	10003
	`UltimateCrossSlashCast_01`

[none effect add]
	0	10004
	`UltimateCrossSlashCast_00`
