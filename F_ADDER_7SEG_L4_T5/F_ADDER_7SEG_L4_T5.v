module F_ADDER_7SEG_L4_T5(
input [3:0] a_i, // inputs from sliders
input [3:0] b_i,
input  cin_i,


output [6:0] A_o,  //outputs to 7segs
output  [6:0] B_o,
output  [6:0] CIN_o,
output  [6:0] SUM,
output  [6:0] COUT,
output  [6:0] equ 
);

assign equ =7'b0110110;
wire [3:0] res;
wire [3:0] cout;

//SEG_4bit var_equ(    // display a on 7seg
//  .code (4'b1111),
 // .decode (equ)

//);

SEG_4bit var_a(    // display a on 7seg
  .code (a_i),
  .decode (A_o)
);
 
SEG_4bit var_b(  // display b on 7seg
  .code (b_i),
  .decode (B_o)
);

SEG_4bit var_cin(  // display cin on 7seg
  .code (cin_i),
  .decode (CIN_o)
);

Adder4Bit add_a_b (
    .cin (cin_i),
    .a   (a_i),
    .b   (b_i ),
    .sum (res),
    .cout(cout [0])

);

SEG_4bit sum_Seg (

 .code (res),
 .decode (SUM)

);

SEG_4bit cout_Seg (

 .code (cout),
 .decode (COUT)

);
endmodule 