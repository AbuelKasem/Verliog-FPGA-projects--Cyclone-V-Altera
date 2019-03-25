module clk_freqdiv (
    
    
    input  clock_in,
   
    //input  load,    // load duty cycle
	 input enable,  //enable counter
	 input reset,
	// input [7:0] duty_cycle, //duty cycle 8-bit wide from key0 to key7
    output [31:0] n_clks,
    
    // output to servo pin
    output   clock_out
   
);

//reg  [31:0] on_ticks;            // on_ticks is the time in clock cycles that the pwm output should be hight
//localparam  [31:0] cycle_time=100;  // cycle time is the time for full pwm cycle [Ton + Toff]
                                 // for a 50mhz clk freq.  a number of 50000 clks equal 1 ms 
                                   // so for a full cycle of 20ms , clks = 20 *50000 = 1 million
 localparam [31:0] div=2;
 localparam [31:0] lim=2*div;
  
wire [31:0] current_N_clks;
assign n_clks=current_N_clks;  //remove

  /*always @ * begin
case (duty_cycle) 
8'd0: on_ticks = 32'd25; // for centre position , 0.5 ms * 50000 =25000 clks
8'd1: on_ticks = 32'd75; // for -90, 1.5 ms * 50000 =75000 clks
8'd2: on_ticks = 32'd125; // for +90, 2.5 ms * 50000 =125000 clks


default: on_ticks = 32'd25; // 
endcase
end */

CounterNBit #(
    .WIDTH  (32),
    .MAX_VALUE(lim)
) clk_Counter (
    .clock     (clock_in ),    
    .reset     (reset ),
    .enable    (enable),
    .countValue(current_N_clks  )
);

Comparator32Bit clk_compare (

     .a     (current_N_clks ),
     .b         (div ),
    .q(clock_out )
);

endmodule
