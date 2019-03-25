transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/two_3_multiplier {C:/Users/Kasem/Documents/Quartus_Projects/two_3_multiplier/two_3_multiplier.v}

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/two_3_multiplier/simulation {C:/Users/Kasem/Documents/Quartus_Projects/two_3_multiplier/simulation/two_3_multiplier_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  two_3_multiplier_tb

do C:/Users/Kasem/Documents/Quartus_Projects/two_3_multiplier/simulation/load_sim.tcl
