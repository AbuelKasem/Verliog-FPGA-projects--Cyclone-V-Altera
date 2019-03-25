transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab3_DFF {C:/Users/Kasem/Documents/Quartus_Projects/Lab3_DFF/DFlipFlopWithAclr.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab3_DFF {C:/Users/Kasem/Documents/Quartus_Projects/Lab3_DFF/DFlipFlop.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab3_DFF {C:/Users/Kasem/Documents/Quartus_Projects/Lab3_DFF/Lab3_DFF.v}

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/Lab3_DFF/simulation {C:/Users/Kasem/Documents/Quartus_Projects/Lab3_DFF/simulation/Lab3_DFF_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Lab3_DFF_tb

add wave *
view structure
view signals
run -all
