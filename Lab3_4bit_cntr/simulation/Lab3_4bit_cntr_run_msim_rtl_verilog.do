transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab3_4bit_cntr {C:/Users/Kasem/Documents/Quartus_Projects/Lab3_4bit_cntr/Lab3_4bit_cntr.v}

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab3_4bit_cntr/simulation {C:/Users/Kasem/Documents/Quartus_Projects/Lab3_4bit_cntr/simulation/Lab3_4bit_cntr_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Lab3_4bit_cntr_tb

do C:/Users/Kasem/Documents/Quartus_Projects/Lab3_4bit_cntr/simulation/load_sim.tcl
