/*
 * 8-Bit Comparator
 * ----------------
 * By: Thomas Carpenter
 * For: University of Leeds
 * Date: 30th December 2017
 *  // modified by Kasem
 * Description
 * -----------
 * The module is a simple 8-bit Comparator that has been
 * built in Verilog using Behavioural design and continuous
 * assign statements.
 *
 */

module Comparator32Bit ( 
    input  [31:0] a, 
    input  [31:0] b, 
    output  reg     	q
);

always @ (*) begin
	if (a < (b/2)) begin 
       q =1'b1;
	
	end else begin 
		q =1'b0;
	end
	
end   

endmodule
