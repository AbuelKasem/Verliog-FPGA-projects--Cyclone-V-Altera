module Servo_Controller #(

   parameter in_freq=50,
	parameter out_freq=25




)

(
    
    
    input  Main_clock,  // this is the main clock source at frequency in_freq to divider module
   
    
	 //input enable,  //enable counter
	 
	 input reset,
	 input [7:0] duty_cycle, //duty cycle 8-bit wide from key0 to key7
	  // output to servo pin
    output   servo_pwm
	// output  reg clk_enable,
    //output reg [31:0] current_N_clks   //for test bench only
    //output [31:0] cycle_time//for test bench only
   
   
);

wire clk_enable;
wire enable;
assign enable =1'b1;
/*divider #(
    .in_freq  (50),  
	 .out_freq  (50)
   
) notdiv (
    .d_in_clk   (Main_clock ),   //this is the main clock source frequency
    .d_reset     (reset ),
    .d_enable    (enable),
	 .d_duty_cycle(duty_cycle),
	 .d_out_clk (divided_clk),
	 .n_current_N_clks (current_N_clks),	 
	 .d_servo_pwm(servo_pwm)
	 //.d_cycle_time_clks (cycle_time_clks),
	// .d_on_time_minus90_clks (on_time_minus90_clks),
	// .d_on_time_plus90_clks (on_time_plus90_clks ),
	// .d_on_time_centre__clks (on_time_centre__clks )
    
);

*/
/*
always @ * begin
case (duty_cycle) 
8'd0: on_ticks = 32'd25 ; // for centre position , 0.5 ms * 50000 =25000 clks
8'd1: on_ticks = 32'd75; // for -90, 1.5 ms * 50000 =75000 clks
8'd2: on_ticks = 32'd125; // for +90, 2.5 ms * 50000 =125000 clks


default: on_ticks = 32'd25; // 
endcase
end 

*/

clk_en_divider #(
   .in_freq (50000000),
	.out_freq (50000000)
	

) instant1(

     .in_clk(Main_clock),  // input clock
	  .enable(enable),  //enable counter
	   .reset (reset), 
	   .clk_en(clk_enable)
);

cycle_scaler #(
	.in_freq (50000000),
	.out_freq (50000000)
	

) instant2(
		.d_in_clk(Main_clock),  //if main frequency same as ouput frequency replace clk_enable with Main_clock
	  .d_enable(enable),  //enable counter
	   .d_reset (reset), 
	   .d_duty_cycle(duty_cycle),
		//.n_current_N_clks(current_N_clks),
		.d_servo_pwm(servo_pwm)
);


/*
CounterNBit #(
    .WIDTH  (32),
    .MAX_VALUE(100)
) clk_Counter (
    .clock     (Main_clock),    //if main frequency same as ouput frequency replace clk_enable with Main_clock
    .reset     (reset ),
    .enable    (enable),
    .countValue(current_N_clks  )
);

Comparator32Bit clk_compare (

     .a     (current_N_clks ),
     .b         (25 ),
    .q(servo_pwm  )
);
*/

endmodule

