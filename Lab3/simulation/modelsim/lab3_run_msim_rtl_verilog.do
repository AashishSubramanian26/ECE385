transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/Lab3 {C:/Users/Soumi/Documents/GitHub/ECE385/Lab3/ripple_adder.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/Lab3 {C:/Users/Soumi/Documents/GitHub/ECE385/Lab3/reg_17.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/Lab3 {C:/Users/Soumi/Documents/GitHub/ECE385/Lab3/mux2_1_17.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/Lab3 {C:/Users/Soumi/Documents/GitHub/ECE385/Lab3/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/Lab3 {C:/Users/Soumi/Documents/GitHub/ECE385/Lab3/control.sv}
vlog -sv -work work +incdir+C:/Users/Soumi/Documents/GitHub/ECE385/Lab3 {C:/Users/Soumi/Documents/GitHub/ECE385/Lab3/adder_toplevel.sv}

