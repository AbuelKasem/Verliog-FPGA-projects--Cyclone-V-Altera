module Adder_7Seg (

       input [3:0] A_SW,
	    input [3:0] B_SW,
		 input       Cin_SW,
		 output[3:0] SUM,
       output      Cout,
		 output reg [6:0] A_Seg,
		 output reg [6:0] B_Seg,
		 output reg [6:0] Cin_Seg,
		 output reg [6:0] equal_Seg,
		 output reg [6:0] Sum_Seg,
		 output reg [6:0] Cout_Seg
		 
		 );
		 

Adder_7Seg A7Seg (

    .A(A_SW),
	 .B(B_SW),
	 .Carry_In(Cin_SW),
	 .SUM(SUM),
	 .Carry_Out(Cout),
	 .sevenSeg1(A_Seg),
	 .sevenSeg2(B_Seg),
	 .sevenSeg3(Cin_Seg),
	 .sevenSeg4(equal_Seg),
	 .sevenSeg5(Sum_Seg),
	 .sevenSeg6(Cout_Seg)
 );
 
 endmodule
 