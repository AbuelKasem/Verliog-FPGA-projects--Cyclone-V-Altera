
module clock_divider (

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
    .MAX_VALUE((div-1))
) clk_Counter (
    .clock     (in_clk ),    
    .reset     (reset ),
    .enable    (enable),
    .countValue(current_N_clks  )
);

Comparator32Bit clk_compare (

     .a     (current_N_clks ),
     .b         ((div) ),
    .q(out_clk )
);

endmodule
