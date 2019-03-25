transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/clk_freqdiv {C:/Users/Kasem/Documents/Quartus_Projects/clk_freqdiv/CounterNBit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/clk_freqdiv {C:/Users/Kasem/Documents/Quartus_Projects/clk_freqdiv/Comparator32Bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kasem/Documents/Quartus_Projects/clk_freqdiv {C:/Users/Kasem/Documents/Quartus_Projects/clk_freqdiv/clk_freqdiv.v}

do "C:/Users/Kasem/Documents/Quartus_Projects/clk_freqdiv/simulation/load_sim.tcl"
