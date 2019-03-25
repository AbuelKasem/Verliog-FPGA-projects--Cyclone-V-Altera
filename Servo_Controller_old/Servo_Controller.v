module Servo_Controller (
    
    
    input  Main_clock,
   
    //input  load,    // load duty cycle
	 input enable,  //enable counter
	 input reset,
	 input [7:0] duty_cycle, //duty cycle 8-bit wide from key0 to key7
	  // output to servo pin
    output   servo_pwm,
	 
    output [31:0] n_clks,   //for test bench only
    output [31:0] cycle_time//for test bench only
   
   
);

wire [31:0] on_ticks;            // on_ticks is the time in clock cycles that the pwm output should be hight
//localparam  [31:0] cycle_time=1000;  // cycle time is the time for full pwm cycle [Ton + Toff]
 //wire  [31:0] cycle_time;                                 // for a 50mhz clk freq.  a number of 50000 clks equal 1 ms ,50 clks /micro second
 reg [15:0] micro_second;                                  // so for a full cycle of 20ms , clks = 20 *50000 = 1 million
											  //
wire [31:0] current_N_clks;
assign n_clks=current_N_clks;  //remove
reg [15:0] ratio;
//localparam [31:0] freq=50;
/*
always @ * begin
case (freq) 
32'd100: micro_second= 16'd100; //  number of clks per microsecond at different freqs
32'd50: micro_second= 16'd50; // 
32'd25: micro_second= 16'd25; // 


default: micro_second= 16'd50; // 
endcase
end */
/*
always @ * begin
case (duty_cycle) 
8'd0: on_ticks = 32'd(25; // for centre position , 0.5 ms * 50000 =25000 clks
8'd1: on_ticks = 32'd75; // for -90, 1.5 ms * 50000 =75000 clks
8'd2: on_ticks = 32'd125; // for +90, 2.5 ms * 50000 =125000 clks


default: on_ticks = 32'd25; // 
endcase
end */
always @ * begin
case (duty_cycle) 
8'd0: ratio = 16'd5; // for centre position , 0.5 ms =500 micro
8'd1:  ratio = 16'd15; // for -90, 1.5 ms *=1500 mico
8'd2:  ratio = 16'd25; // for +90, 2.5 ms =2500


default:  ratio = 16'd5; // 
endcase
end

//always @ * begin
//cycle_time=(20*micro_second);   //20ms=20000micro second ,in clks = number of micros* clkc/micro 
//on_ticks =(ratio*micro_second);
//end
assign cycle_time=20*50;   //20ms=20000micro second ,in clks = number of micros* clkc/micro 
assign on_ticks =ratio*micro_second;
CounterNBit #(
    .WIDTH  (32),
    .MAX_VALUE(cycle_time)
) clk_Counter (
    .clock     (clock ),    
    .reset     (reset ),
    .enable    (enable),
	 //.MAX_VALUE (cycle_time),
    .countValue(current_N_clks  )
);

Comparator32Bit clk_compare (

     .a     (current_N_clks ),
     .b         (on_ticks ),
    .q(servo_pwm  )
);

endmodule
