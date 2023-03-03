onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /testbench/SW
add wave -noupdate -radix decimal /testbench/Clk
add wave -noupdate -radix decimal /testbench/Run
add wave -noupdate -radix decimal /testbench/Continue
add wave -noupdate -radix decimal /testbench/LED
add wave -noupdate /testbench/dut/slc/state_controller/State
add wave -noupdate -radix decimal /testbench/dut/slc/d0/IR
add wave -noupdate -radix decimal /testbench/dut/slc/d0/MDR_In
add wave -noupdate -radix decimal /testbench/dut/slc/d0/MAR
add wave -noupdate -radix decimal /testbench/dut/slc/d0/MDR
add wave -noupdate -radix decimal /testbench/dut/slc/d0/IR
add wave -noupdate -radix decimal /testbench/dut/slc/d0/PC
add wave -noupdate -radix decimal /testbench/dut/slc/d0/LED
add wave -noupdate -radix decimal /testbench/dut/slc/d0/BUS
add wave -noupdate -radix decimal -childformat {{{/testbench/dut/slc/d0/Register_File/registers[7]} -radix decimal} {{/testbench/dut/slc/d0/Register_File/registers[6]} -radix decimal} {{/testbench/dut/slc/d0/Register_File/registers[5]} -radix decimal} {{/testbench/dut/slc/d0/Register_File/registers[4]} -radix decimal} {{/testbench/dut/slc/d0/Register_File/registers[3]} -radix decimal} {{/testbench/dut/slc/d0/Register_File/registers[2]} -radix decimal} {{/testbench/dut/slc/d0/Register_File/registers[1]} -radix decimal} {{/testbench/dut/slc/d0/Register_File/registers[0]} -radix decimal}} -expand -subitemconfig {{/testbench/dut/slc/d0/Register_File/registers[7]} {-height 15 -radix decimal} {/testbench/dut/slc/d0/Register_File/registers[6]} {-height 15 -radix decimal} {/testbench/dut/slc/d0/Register_File/registers[5]} {-height 15 -radix decimal} {/testbench/dut/slc/d0/Register_File/registers[4]} {-height 15 -radix decimal} {/testbench/dut/slc/d0/Register_File/registers[3]} {-height 15 -radix decimal} {/testbench/dut/slc/d0/Register_File/registers[2]} {-height 15 -radix decimal} {/testbench/dut/slc/d0/Register_File/registers[1]} {-height 15 -radix decimal} {/testbench/dut/slc/d0/Register_File/registers[0]} {-height 15 -radix decimal}} /testbench/dut/slc/d0/Register_File/registers
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2877348 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 193
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {2829118 ps} {3008994 ps}
