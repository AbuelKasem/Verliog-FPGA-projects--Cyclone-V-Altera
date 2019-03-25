module Button_7Seg (

       input [3:0] button,
		 output reg [6:0] Seg
		 
		 );
		 
		 wire [3:0] invert;
		 assign invert = ~ button;

Button_7Seg b7Seg (

    .hexValue(invert),
	 .sevenSeg(Seg)
 );
 
 endmodule
 