
module servo_selector #(

parameter in_freq=50,
parameter out_freq=50,

parameter n_channels =4,
parameter addr_bus_width= 2
)
(
   input clk,
	//input reset,
	input duty_cycle_value,
	input latch,
	//input rst,
	input [(addr_bus_width-1):0] address,
	
	output reg [(n_channels-1):0] pwm_o
	//output   pwm_o
	);
	
	
	
	reg [(n_channels-1):0] pwm_carrier;
	wire servo_pwm_single;
	reg reset;
	reg [7:0] duty_cycle;
	
initial begin
reset = 1'b1;
end
	
always @ (posedge latch)begin
reset = 1'b0;
duty_cycle=duty_cycle_value;
end

always @ * begin
pwm_o[(address)]	=servo_pwm_single;
//pwm_o	=servo_pwm_single;
end

Servo_Controller #(
   .in_freq (in_freq),
	.out_freq (out_freq )   // the output desired frequency IMPORTANT :IF the in_freq is the same as out_frequncy 
                          //replace (clk_enable ) with (Main_clock) in Servo_Controller module  at this line
								  //.d_in_clk(clk_enable)  which passes the divded clk signal to the cycle_scaler module instant
								  //name of instant is (instant2)
	           
	

) servo1(

     .Main_clock(clk),  // input clock
	  .duty_cycle(duty_cycle),  //enable counter
	  .reset (reset), 
	  .servo_pwm(servo_pwm_single)
	  
);

/*
always @ * begin
case (address) 

(addr_bus_width)'d0: pwm_carrier[0]= servo_pwm_single ; 
(addr_bus_width)'d1: pwm_carrier[1]= servo_pwm_single ; 
(addr_bus_width)'d2: pwm_carrier[2]= servo_pwm_single ; 
(addr_bus_width)'d3: pwm_carrier[3]= servo_pwm_single ; 

default: servo_pwm_out[0]= servo_pwm;  
endcase
end 
*/

endmodule 
