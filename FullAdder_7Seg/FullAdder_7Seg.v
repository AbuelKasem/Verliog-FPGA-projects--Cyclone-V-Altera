module FullAdder_7Seg (

       input  [3:0] A,
		 input  [3:0] B,
		 input        Carry_In,
		 output [3:0] SUM,
       output       Carry_Out,
		 output reg [6:0] sevenSeg1,
		 output reg [6:0] sevenSeg2,
		 output reg [6:0] sevenSeg3,
		 output reg [6:0] sevenSeg4,
		 output reg [6:0] sevenSeg5,
		 output reg [6:0] sevenSeg6
		 
		 );

always @ * begin

 case (A)
 4'h0: sevenSeg1 = 7'b0111111;
 4'h1: sevenSeg1 = 7'b0000110;
 4'h2: sevenSeg1 = 7'b1011011;
 4'h3: sevenSeg1 = 7'b1001111;
 4'h4: sevenSeg1 = 7'b1100110;
 4'h5: sevenSeg1 = 7'b1101101;
 4'h6: sevenSeg1 = 7'b1111101;
 4'h7: sevenSeg1 = 7'b0000111;
 4'h8: sevenSeg1 = 7'b1111111;
 4'h9: sevenSeg1 = 7'b1101111;
 4'hA: sevenSeg1 = 7'b1110111;
 4'hB: sevenSeg1 = 7'b1111100;
 4'hC: sevenSeg1 = 7'b0111001;
 4'hD: sevenSeg1 = 7'b1011110;
 4'hE: sevenSeg1 = 7'b1111001;
 4'hF: sevenSeg1 = 7'b1110001;
 default: sevenSeg1 = 7'b0000000;
 endcase
 
case (B)
 4'h0: sevenSeg2 = 7'b0111111;
 4'h1: sevenSeg2 = 7'b0000110;
 4'h2: sevenSeg2 = 7'b1011011;
 4'h3: sevenSeg2 = 7'b1001111;
 4'h4: sevenSeg2 = 7'b1100110;
 4'h5: sevenSeg2 = 7'b1101101;
 4'h6: sevenSeg2 = 7'b1111101;
 4'h7: sevenSeg2 = 7'b0000111;
 4'h8: sevenSeg2 = 7'b1111111;
 4'h9: sevenSeg2 = 7'b1101111;
 4'hA: sevenSeg2 = 7'b1110111;
 4'hB: sevenSeg2 = 7'b1111100;
 4'hC: sevenSeg2 = 7'b0111001;
 4'hD: sevenSeg2 = 7'b1011110;
 4'hE: sevenSeg2 = 7'b1111001;
 4'hF: sevenSeg2 = 7'b1110001;
 default: sevenSeg2 = 7'b0000000;
 endcase
 
case (Carry_In)
 4'h0: sevenSeg3 = 7'b0111111;
 4'h1: sevenSeg3 = 7'b0000110;
 4'h2: sevenSeg3 = 7'b1011011;
 4'h3: sevenSeg3 = 7'b1001111;
 4'h4: sevenSeg3 = 7'b1100110;
 4'h5: sevenSeg3 = 7'b1101101;
 4'h6: sevenSeg3 = 7'b1111101;
 4'h7: sevenSeg3 = 7'b0000111;
 4'h8: sevenSeg3 = 7'b1111111;
 4'h9: sevenSeg3 = 7'b1101111;
 4'hA: sevenSeg3 = 7'b1110111;
 4'hB: sevenSeg3 = 7'b1111100;
 4'hC: sevenSeg3 = 7'b0111001;
 4'hD: sevenSeg3 = 7'b1011110;
 4'hE: sevenSeg3 = 7'b1111001;
 4'hF: sevenSeg3 = 7'b1110001;
 default: sevenSeg3 = 7'b0000000;
 endcase
 sevenSeg4 = 7'b1001000;
 
case (SUM)
 4'h0: sevenSeg5 = 7'b0111111;
 4'h1: sevenSeg5 = 7'b0000110;
 4'h2: sevenSeg5 = 7'b1011011;
 4'h3: sevenSeg5 = 7'b1001111;
 4'h4: sevenSeg5 = 7'b1100110;
 4'h5: sevenSeg5 = 7'b1101101;
 4'h6: sevenSeg5 = 7'b1111101;
 4'h7: sevenSeg5 = 7'b0000111;
 4'h8: sevenSeg5 = 7'b1111111;
 4'h9: sevenSeg5 = 7'b1101111;
 4'hA: sevenSeg5 = 7'b1110111;
 4'hB: sevenSeg5 = 7'b1111100;
 4'hC: sevenSeg5 = 7'b0111001;
 4'hD: sevenSeg5 = 7'b1011110;
 4'hE: sevenSeg5 = 7'b1111001;
 4'hF: sevenSeg5 = 7'b1110001;
 default: sevenSeg5 = 7'b0000000;
 endcase
 
case (Carry_Out)
 4'h0: sevenSeg6 = 7'b0111111;
 4'h1: sevenSeg6 = 7'b0000110;
 4'h2: sevenSeg6 = 7'b1011011;
 4'h3: sevenSeg6 = 7'b1001111;
 4'h4: sevenSeg6 = 7'b1100110;
 4'h5: sevenSeg6 = 7'b1101101;
 4'h6: sevenSeg6 = 7'b1111101;
 4'h7: sevenSeg6 = 7'b0000111;
 4'h8: sevenSeg6 = 7'b1111111;
 4'h9: sevenSeg6 = 7'b1101111;
 4'hA: sevenSeg6 = 7'b1110111;
 4'hB: sevenSeg6 = 7'b1111100;
 4'hC: sevenSeg6 = 7'b0111001;
 4'hD: sevenSeg6 = 7'b1011110;
 4'hE: sevenSeg6 = 7'b1111001;
 4'hF: sevenSeg6 = 7'b1110001;
 default: sevenSeg6 = 7'b0000000;
 endcase
 end
 endmodule
 