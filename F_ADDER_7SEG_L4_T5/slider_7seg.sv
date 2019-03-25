module Button_7seg (

input [3:0] button,
output [6:0] seg
);

   

SEG_4bit B_2_S (

 .code (button),
 .decode (seg)

);
endmodule
