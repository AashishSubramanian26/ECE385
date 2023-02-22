transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/lab4 {C:/Users/Soumi/Documents/GitHub/ECE385/lab4/Reg_8.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/lab4 {C:/Users/Soumi/Documents/GitHub/ECE385/lab4/Five_Bit_Adder.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/lab4 {C:/Users/Soumi/Documents/GitHub/ECE385/lab4/Register_unit.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/lab4 {C:/Users/Soumi/Documents/GitHub/ECE385/lab4/Processor.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/lab4 {C:/Users/Soumi/Documents/GitHub/ECE385/lab4/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/lab4 {C:/Users/Soumi/Documents/GitHub/ECE385/lab4/Control.sv}

vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/lab4 {C:/Users/Soumi/Documents/GitHub/ECE385/lab4/testbench_8.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
