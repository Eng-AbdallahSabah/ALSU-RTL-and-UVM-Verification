vlib work
vlog ALSU.v  alsu_tb.sv  alsu_pkg.sv +cover -covercells
vsim -voptargs=+acc work.alsu_tb -cover
add wave *
coverage save alsu_tb.ucdb -onexit
run -all
coverage exclude -du ALSU -togglenode bypass_A
coverage exclude -du ALSU -togglenode bypass_A_reg
coverage exclude -du ALSU -togglenode bypass_B
coverage exclude -du ALSU -togglenode bypass_B_reg
coverage exclude -src ALSU.v -line 67 -code s
coverage exclude -src ALSU.v -line 69 -code s
coverage exclude -src ALSU.v -line 71 -code s
coverage exclude -src ALSU.v -line 66 -code b
coverage exclude -src ALSU.v -line 68 -code b
coverage exclude -src ALSU.v -line 70 -code b
vcover report alsu_tb.ucdb -details -annotate -all -output coverage_rpt.txt