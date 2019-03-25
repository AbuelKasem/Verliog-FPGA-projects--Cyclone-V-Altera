module Button_7seg (

input [3:0] button,
output [6:0] seg
);

   wire [3:0]  invert;
assign invert = ~ button;

SEG_4bit B_2_S (

 .code (invert),
 .decode (seg)

);
endmodule
