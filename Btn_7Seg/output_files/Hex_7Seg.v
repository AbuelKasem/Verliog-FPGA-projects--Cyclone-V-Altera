module Hex_7Seg #(
parameter invert	= 1
)(
       input [3:0] hexValue,
		 output reg [6:0] sevenSeg
		 
		 );

always @ * begin

 case (hexValue)
 4'h0: sevenSeg = 7'b0111111;
 4'h1: sevenSeg = 7'b0000110;
 4'h2: sevenSeg = 7'b1011011;
 4'h3: sevenSeg = 7'b1001111;
 4'h4: sevenSeg = 7'b1100110;
 4'h5: sevenSeg = 7'b1101101;
 4'h6: sevenSeg = 7'b1111101;
 4'h7: sevenSeg = 7'b0000111;
 4'h8: sevenSeg = 7'b1111111;
 4'h9: sevenSeg = 7'b1101111;
 4'hA: sevenSeg = 7'b1110111;
 4'hB: sevenSeg = 7'b1111100;
 4'hC: sevenSeg = 7'b0111001;
 4'hD: sevenSeg = 7'b1011110;
 4'hE: sevenSeg = 7'b1111001;
 4'hF: sevenSeg = 7'b1110001;
 default: sevenSeg = 7'b0000000;
 endcase
 
 if (invert) begin
 sevenSeg = ~ sevenSeg;
 end else begin
 sevenSeg = 7'b0000000;
 end
 end
 endmodule
 