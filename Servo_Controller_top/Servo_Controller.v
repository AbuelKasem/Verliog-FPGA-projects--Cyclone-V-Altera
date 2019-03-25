module Servo_Controller #(

   parameter in_freq=50,
	parameter out_freq=50
)

(
    input  Main_clock,  // this is the main clock source at frequency in_freq to divider module
	 
	 input reset,
	 input [7:0] duty_cycle, //duty cycle 8-bit wide from key0 to key7
	  // output to servo pin
    output   servo_pwm  
   
);

wire clk_enable;
wire enable;
assign enable =1'b1;


clk_en_divider #(
   .in_freq (in_freq),
	.out_freq (out_freq)
	

) instant1(

     .in_clk(Main_clock),  // input clock
	  .enable(enable),  //enable counter
	   .reset (reset), 
	   .clk_en(clk_enable)
);

cycle_scaler #(
	.in_freq (in_freq),
	.out_freq (out_freq)
	

) instant2(
		.d_in_clk(Main_clock),  //if main frequency same as ouput frequency replace clk_enable with Main_clock
	   .d_enable(enable),  //enable counter
	   .d_reset (reset), 
	   .d_duty_cycle(duty_cycle),
		//.n_current_N_clks(current_N_clks),
		.d_servo_pwm(servo_pwm)
);


endmodule

