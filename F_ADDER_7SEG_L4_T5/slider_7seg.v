module slider_7seg (

input [3:0] slider,
output [6:0] seg
);

   

SEG_4bit Sl_2_Seg (

 .code (slider),
 .decode (seg)

);
endmodule
