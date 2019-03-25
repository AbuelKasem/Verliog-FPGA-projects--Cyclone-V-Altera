transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/clock_divider {C:/Users/Kasem/Documents/Quartus_Projects/clock_divider/CounterNBit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/clock_divider {C:/Users/Kasem/Documents/Quartus_Projects/clock_divider/Comparator32Bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/clock_divider {C:/Users/Kasem/Documents/Quartus_Projects/clock_divider/clock_divider.v}

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/clock_divider/simulation {C:/Users/Kasem/Documents/Quartus_Projects/clock_divider/simulation/clock_divider_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  clock_divider_tb

do C:/Users/Kasem/Documents/Quartus_Projects/clock_divider/simulation/load_sim.tcl
