onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Execute
add wave -noupdate /testbench/Reset_ClearA_LoadB
add wave -noupdate /testbench/S
add wave -noupdate /testbench/Aval
add wave -noupdate /testbench/Bval
add wave -noupdate /testbench/LED
add wave -noupdate /testbench/HEX0
add wave -noupdate /testbench/HEX1
add wave -noupdate /testbench/HEX2
add wave -noupdate /testbench/HEX3
add wave -noupdate /testbench/XAB
add wave -noupdate /testbench/top/control_unit/curr_state
add wave -noupdate /testbench/top/control_unit/Sub
add wave -noupdate /testbench/top/Add_Shit/A
add wave -noupdate /testbench/top/Add_Shit/B
add wave -noupdate /testbench/top/Add_Shit/S
add wave -noupdate /testbench/top/Add_Shit/fn
add wave -noupdate /testbench/top/Add_Shit/BB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {390000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 192
configure wave -valuecolwidth 158
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {334319 ps} {434469 ps}
