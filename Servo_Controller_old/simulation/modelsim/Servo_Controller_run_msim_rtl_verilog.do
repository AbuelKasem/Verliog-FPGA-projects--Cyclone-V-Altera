transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old {C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old/Comparator32Bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old {C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old/CounterNBit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old {C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old/Servo_Controller.v}

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old/simulation {C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old/simulation/Servo_Controller_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Servo_Controller_tb

do C:/Users/Kasem/Documents/Quartus_Projects/Servo_Controller_old/simulation/load_sim.tcl
