
module cycle_scaler #(
   parameter in_freq=50000000,
	parameter out_freq=50000000,
	parameter Toggle_value=(in_freq/out_freq),
	parameter clks_per_micro=(out_freq /1000000),   //*10000 number of clks per micro second based on desired frequency 
	parameter PWM_cycleTime_microS=20000,        // PWM cycle time =20ms = 20000 micro second , constant
	parameter Ticks_per_cycle = (clks_per_micro*20000),
	// these are the on_time in clks of each cycle based on the required position
	parameter Ticks_minus90_pos   = (500*clks_per_micro),   // -90 pos =0.5 ms =500 micro sec ,so number of ticks 
	                                                       // of a position equal number of micros by number of ticks in one micro second
	parameter Ticks_centre_pos   = (1500*clks_per_micro),   // zero pos =1.5 ms =1500 micro second
	parameter Ticks_plus90_pos   = (2500*clks_per_micro)   // +90 pos =2.5 ms =2500 micro second  
	

)
//localparam Ticks_centre_pos = (5*clks_per_micro);

(

    input d_in_clk,  // input clock
	 input d_enable,  //enable counter
	 input d_reset,  
	 input [7:0] d_duty_cycle,
	 output reg d_servo_pwm,
	 output  [31:0] n_current_N_clks
	
    
	 
	 
   
);




reg [31:0]on_ticks;
wire [31:0] current_N_clks;

always @ * begin
case (d_duty_cycle) 
8'd0: on_ticks = Ticks_centre_pos ; //Ticks_centre_pos  for centre position , 0.5 ms * 50000 =25000 clks
8'd1: on_ticks = Ticks_minus90_pos; // Ticks_minus90_posfor -90, 1.5 ms * 50000 =75000 clks
8'd2: on_ticks = Ticks_plus90_pos; //Ticks_plus90_pos for +90, 2.5 ms * 50000 =125000 clks


default: on_ticks = Ticks_centre_pos; // 
endcase
end 





CounterNBit #(
    .WIDTH  (32),
  .MAX_VALUE(Ticks_per_cycle )
) pwm_Counter (
    .clock     (d_in_clk),    
    .reset     (d_reset ),
    .enable    (d_enable),
    .countValue(n_current_N_clks  )
);

always @ (posedge d_in_clk) begin
	if (n_current_N_clks > on_ticks ) begin 
       d_servo_pwm <=1'b0;
	
	end 
	else begin 
		 d_servo_pwm <=1'b1;
	end
	
end   
/*
Comparator32Bit pwm_compare (

     .a     (on_ticks ),
     .b         (n_current_N_clks ),
    .q(d_servo_pwm  )
);

*/
endmodule
