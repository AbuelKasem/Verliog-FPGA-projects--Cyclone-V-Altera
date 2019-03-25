module Servo_Controller_top (


	input  clock, 
   input  load, //key0
   input  reset, 	//key1
   input [1:0] servo_address, //2 bit servo address bus ,for a 4 channel servo ,servo 0 (00) 
	                           // servo 1(01) ,servo 2(10)  servo 3(11)
	input [7:0] switch_duty_cycle,
   output reg [3:0] servo_pwm_out,    //4 channel servo output
	output  servo_pwm_out1 //
	);

wire servo_pwm;
//reg reset;
reg [7:0] duty_cycle;

//initial begin
//reset = 1'b1;
//end

always @ (posedge load)begin
//reset = 1'b0;
duty_cycle=switch_duty_cycle;
end

always @ * begin
case (servo_address) 

2'b00: servo_pwm_out[0]= servo_pwm ; 
2'b01: servo_pwm_out[1]= servo_pwm ; 
2'b10: servo_pwm_out[2]= servo_pwm ; 
2'b11: servo_pwm_out[3]= servo_pwm ; 

default: servo_pwm_out[0]= servo_pwm ;  // 
endcase
end 

Servo_Controller #(
   .in_freq (50000000),
	.out_freq (50000000)
	

) servo1(

     .Main_clock(clock),  // input clock
	  .duty_cycle(duty_cycle),  //enable counter
	  .reset (reset), 
	  //.servo_pwm(servo_pwm),
	  .servo_pwm(servo_pwm_out1) //
);


endmodule 