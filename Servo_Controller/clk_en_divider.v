module clk_en_divider #(
   parameter in_freq=50,
	parameter out_freq=25,
	parameter divisor=(in_freq/out_freq),
	parameter Toggle_value=((divisor/2))

)(

     input in_clk,  // input clock
	 input enable,  //enable counter
	 input reset, 
	output reg clk_en
);


//reg clk_en
wire [31:0]current_N_clks;

CounterNBit #(
    .WIDTH  (32),
    .MAX_VALUE((Toggle_value))
) clk_Counter (
    .clock     (in_clk),    
    .reset     (reset ),
    .enable    (enable),
	// .MAX_VALUE((2*Toggle_value)-1),
    .countValue(current_N_clks  )
);


always @ (posedge in_clk or posedge reset) begin
         if (reset)   begin
						clk_en=1'b0;
				end
			else if 	(current_N_clks == (Toggle_value) ) begin
			         clk_en =~clk_en;
			end
			else    begin  clk_en =~clk_en;
			end
end
endmodule		