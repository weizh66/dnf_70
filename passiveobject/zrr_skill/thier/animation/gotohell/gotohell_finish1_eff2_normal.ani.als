#PVF_File

[use animation]
	`GotoHell_finish1_light.ani`
	`finish1_light`

[use animation]
	`GotoHell_finish1_dust1.ani`
	`finish1_dust1`

[use animation]
	`GotoHell_finish1_eff2_dodge.ani`
	`finish1_eff2_dodge`

[use animation]
	`GotoHell_finish1_eff1_dodge.ani`
	`finish1_eff1_dodge`

[use animation]
	`GotoHell_finish1_eff1_norma.ani`
	`finish1_eff1_norma`

[use animation]
	`GotoHell_finish1_shock_dodge.ani`
	`finish1_shock_dodge`

[use animation]
	`GotoHell_finish1_shock_normal.ani`
	`finish1_shock_normal`

[use animation]
	`GotoHell_finish1__crash.ani`
	`finish1__crash`

[add]
	0	-2
	`finish1_eff1_norma`

[add]
	0	-1
	`finish1_eff1_dodge`

[add]
	0	10001
	`finish1_eff2_dodge`

[add]
	0	10002
	`finish1_dust1`

[add]
	0	10003
	`finish1_light`

[create draw only object]
	0
	`finish1__crash`	0	0	-1000

[create draw only object]
	0
	`finish1_shock_normal`	0	0	-1000

[create draw only object]
	0
	`finish1_shock_dodge`	0	0	-1000
