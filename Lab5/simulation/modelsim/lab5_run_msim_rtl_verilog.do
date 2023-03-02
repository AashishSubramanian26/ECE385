transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/FourInputMux.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/ALU_MOD.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/Reg_File.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/Ben.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/TwoInputMux.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/ThreeInputMux.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/Reg_16.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/datapath.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/BusMux.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/test_memory.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/SLC3_2.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/Mem2IO.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/ISDU.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/slc3.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/memory_contents.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/slc3_testtop.sv}

vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5 {C:/Users/Soumi/Documents/GitHub/ECE385_`/Lab5/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
