
module divider #(
   parameter in_freq=50,
	parameter out_freq=25,
	parameter Toggle_value=(in_freq/out_freq),
	parameter clks_per_micro=(out_freq /1000000),   // number of clks per micro second based on desired frequency 
	parameter PWM_cycleTime_microS=20000,        // PWM cycle time =20ms = 20000 micro second , constant
	parameter Ticks_per_cycle     = (clks_per_micro*PWM_cycleTime_microS),
	// these are the on_time in clks of each cycle based on the required position
	parameter Ticks_minus90_pos   = (500*clks_per_micro),   // -90 pos =0.5 ms =500 micro sec ,so number of ticks 
	                                                       // of a position equal number of micros by number of ticks in one micro second
	parameter Ticks_centre_pos   = (1500*clks_per_micro),   // zero pos =1.5 ms =1500 micro second
	parameter Ticks_plus90_pos   = (2500*clks_per_micro)   // +90 pos =2.5 ms =2500 micro second  
	

)


(

    input d_in_clk,  // input clock
	 input d_enable,  //enable counter
	 input d_reset,  
	 input [7:0] d_duty_cycle,
	 output d_servo_pwm,
	
    output [31:0] d_n_clks,
    
    // output divided clock
    output   d_out_clk,
	 output n_current_N_clks
	 
	 //output reg d_cycle_time_clks,
	 //output reg d_on_time_minus90_clks,
	// output reg d_on_time_plus90_clks,
	// output reg d_on_time_centre__clks
   
);

//assigning calculated parameters to outputs
/*
always @ (*) begin
d_cycle_time_clks = Ticks_per_cycle;
d_on_time_minus90_clks = Ticks_minus90_pos;
d_on_time_plus90_clks = Ticks_plus90_pos;
d_on_time_centre__clks = Ticks_centre_pos;
end

*/
reg [31:0]on_ticks;
wire [31:0] current_N_clks;
//assign n_clks=current_N_clks;  //remove

always @ * begin
case (d_duty_cycle) 
8'd0: on_ticks = Ticks_centre_pos ; // for centre position , 0.5 ms * 50000 =25000 clks
8'd1: on_ticks = Ticks_minus90_pos; // for -90, 1.5 ms * 50000 =75000 clks
8'd2: on_ticks = Ticks_plus90_pos; // for +90, 2.5 ms * 50000 =125000 clks


default: on_ticks = Ticks_centre_pos; // 
endcase
end 


CounterNBit #(
    .WIDTH  (32),
    .MAX_VALUE((2*Toggle_value)-1)
) clk_Counter (
    .clock     (d_in_clk),    
    .reset     (d_reset ),
    .enable    (d_enable),
	// .MAX_VALUE((2*Toggle_value)-1),
    .countValue(current_N_clks  )
);

Comparator32Bit clk_compare (

     .a     (current_N_clks ),
     .b         ((Toggle_value) ),
    .q(d_out_clk )
);


CounterNBit #(
    .WIDTH  (32),
  .MAX_VALUE(Ticks_per_cycle )
) pwm_Counter (
    .clock     (d_out_clk),    
    .reset     (d_reset ),
    .enable    (d_enable),
	// .MAX_VALUE (cycle_time_clks),
    .countValue(n_current_N_clks  )
);

Comparator32Bit pwm_compare (

     .a     (n_current_N_clks ),
     .b         (on_ticks ),
    .q(d_servo_pwm  )
);

/*
CounterNBit #(
    .WIDTH  (32)
    //.MAX_VALUE((2*Toggle_value)-1)
) pwm_Counter (
    .clock     (in_clk ),    
    .reset     (reset ),
    .enable    (enable),
	  .MAX_VALUE((2*Toggle_value)-1),
    .countValue(current_N_clks  )
);

Comparator32Bit pwm_compare (

     .a     (current_N_clks ),
     .b         ((Toggle_value) ),
    .q(out_clk )
);
*/
endmodule
