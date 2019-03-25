module Servo_Controller_top (


	input  clock, 
	//input reset,
   input  load, //key0
   input [1:0] servo_address, //2 bit servo address bus (input from switch 8 and 9 ,for a 4 channel servo ,servo 0 (00) 
	                           // servo 1(01) ,servo 2(10)  servo 3(11)
	input [7:0] switch_duty_cycle,   //input from switch0 till switch 7
   output reg [3:0] servo_pwm_out    //4 channel servo output
	//output   servo_pwm_out    //4 channel servo output
);
	
	reg channel;
	wire channel_out;
	
always @ (servo_address) begin
channel =servo_address;
servo_pwm_out[(channel)]=channel_out;
//servo_pwm_out=channel_out;
end

servo_selector #(
.in_freq (50000000), // the output desired frequency IMPORTANT :IF the in_freq is the same as out_frequncy 
.out_freq(50000000), //replace (clk_enable ) with (Main_clock) in Servo_Controller module  at this line
								  //.d_in_clk(clk_enable)  which passes the divded clk signal to the cycle_scaler module instant
								  //name of instant is (instant2)
.n_channels (4),
.addr_bus_width(2)
 
)servo (
    .clk(clock),
	 //.reset (reset),
	 .duty_cycle_value(switch_duty_cycle),
	 .latch(load),
	 .address(servo_address),
	 .pwm_o(channel_out)
);
	
	

endmodule 