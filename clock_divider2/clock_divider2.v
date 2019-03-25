
/*module clock_divider #(
   parameter in_freq=50,
	parameter out_freq=25,
	parameter Toggle_value=(in_freq/out_freq)
	

)


(

    input  in_clk,
	 input enable,  //enable counter
	 input reset,
	
    output [31:0] n_clks,
    
    // output to servo pin
    output   out_clk
   
);
// base frequency is 100 mhz , div is the divisor for different frequency
// for example ,to get 50mhz output frequency ,div =100/50 =2;
//div =in_clk freq / out_clk freq

 localparam [31:0] div=4;   //clock divisor

wire [31:0] current_N_clks;
assign n_clks=current_N_clks;  //remove




CounterNBit #(
    .WIDTH  (32),
    .MAX_VALUE((Toggle_value-1))
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

endmodule */

module clock_divider2 (

    input  in_clkt,
	 input enablet,  //enable counter
	 input resett,
	output servo_pwm,
    output [31:0] n_clkst,
    
    // output to servo pin
    output   out_clkt
   
);
// base frequency is 100 mhz , div is the divisor for different frequency
// for example ,to get 50mhz output frequency ,div =100/50 =2;
//div =in_clk freq / out_clk freq

 //localparam [31:0] div=4;   //clock divisor

//wire [31:0] current_N_clkst;
//assign n_clkst=current_N_clkst;  //remove



/*
divider #(
    .in_freq  (50),
	 .out_freq  (50)
   
) notdiv (
    .in_clk    (in_clkt ),    
    .reset     (resett ),
    .enable    (enablet),
	 .out_clk (out_clkt ),
	 .n_clks (n_clkst)
    
);
*/

dividern #(
    .in_freq  (50),  
	 .out_freq  (50)
   
) div (
    .d_in_clk   (in_clkt ),   //this is the main clock source frequency
    .d_reset     (resett ),
    .d_enable    (enablet),
	 .d_duty_cycle(8'd0),
	 .d_out_clk (out_clkt),
	 .n_current_N_clks(n_clkst),	 
	 .d_servo_pwm_out(servo_pwm)
	 //.d_cycle_time_clks (cycle_time_clks),
	// .d_on_time_minus90_clks (on_time_minus90_clks),
	// .d_on_time_plus90_clks (on_time_plus90_clks ),
	// .d_on_time_centre__clks (on_time_centre__clks )
    
);
	
endmodule 