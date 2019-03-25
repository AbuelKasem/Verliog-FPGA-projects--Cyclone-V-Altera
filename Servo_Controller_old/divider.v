
module divider #(
   parameter in_freq=50,
	parameter out_freq=25,
	parameter Toggle_value=(in_freq/out_freq),
	parameter clks_per_micro = (out_freq /1000000),   // number of clks per micro second based on desired frequency 
	parameter PWM_cycleTime_microS=20000,        // PWM cycle time =20ms = 20000 micro second , constant
	parameter Ticks_per_cycle     = (clks_per_micro*PWM_cycleTime_microS),
	// these are the on_time in clks of each cycle based on the required position
	parameter Ticks_minus90_pos   = (500*clks_per_micro),   // -90 pos =0.5 ms =500 micro sec ,so number of ticks 
	                                                       // of a position equal number of micros by number of ticks in one micro second
	parameter Ticks_centre_pos   = (1500*clks_per_micro) ,  // zero pos =1.5 ms =1500 micro second
	parameter Ticks_plus90_pos   = (2500*clks_per_micro)    // +90 pos =2.5 ms =2500 micro second  
	

)


(

    input d_in_clk,
	 input d_enable,  //enable counter
	 input d_reset,
	
    output [31:0] n_clks,
    
    // output to servo pin
    output   d_out_clk
	 output reg 
   
);

//localparam PWM_cycleTime_microS=20000 ;



wire [31:0] current_N_clks;
assign n_clks=current_N_clks;  //remove




CounterNBit #(
    .WIDTH  (32),
    .MAX_VALUE((2*Toggle_value)-1)
) clk_Counter (
    .clock     (in_clk ),    
    .reset     (reset ),
    .enable    (enable),
    .countValue(current_N_clks  )
);

Comparator32Bit clk_compare (

     .a     (current_N_clks ),
     .b         ((Toggle_value) ),
    .q(out_clk )
);

endmodule
