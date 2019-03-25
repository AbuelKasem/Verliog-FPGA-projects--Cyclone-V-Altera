transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00 {C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00/LT24Display.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00 {C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00/LT24Top.v}

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00/simulation {C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00/simulation/LT24Top_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00/simulation {C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00/simulation/LT24FunctionalModel.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  LT24Top_tb

do C:/Users/Kasem/Documents/Quartus_Projects/Lab5_LT24TestProject00/simulation/load_sim.tcl
