module Lab3_4bit_cntr (

input clk,
input rst,
input cin,
output reg [3:0] out,
output  [3:0] sum
//output reg [3:0] cvalue
);

//initial begin
//assign cin = 4'b0; //Start in reset.
//assign sum = 4'b0; //Then clear the reset signal.
//end


always @( posedge clk or posedge rst) begin //At to rising edge of clock
if (rst) begin //If the reset signal is high
out <= 4'b0; //Clear the output q
end else begin
  out  <= sum;
//cvalue <= sum;  //Set Q1 equal to D
 //Simultaneously set Q2 equal to the old value of Q1
end

end





Adder4Bit theAdder (
   .cin (cin ),
   .a   (4'b1 ),
   .b   (out ),
   .sum (sum),
   .cout(cout)
);



endmodule



/* 4-Bit Full Adder
 * ----------------
 *
 * The module is a simple 4-bit Full Adder which has been
 * built in Verilog using Gate-Level 1-bit full adders.
 *
 */
 
module Adder4Bit (
    // Declare input and output ports
    input        cin,
    input  [3:0] a,
    input  [3:0] b,
    output [3:0] sum,
    output       cout
);

    // Internal carry signal between full adders
    wire [2:0] carry;
    
    // Instantiate full adders for bits 0 to 3
    Adder1Bit bit0 (
        .cin (cin     ),
        .a   (a    [0]),
        .b   (b    [0]),
        .sum (sum  [0]),
        .cout(carry[0])
    );
    
    Adder1Bit bit1 (
        .cin (carry[0]),
        .a   (a    [1]),
        .b   (b    [1]),
        .sum (sum  [1]),
        .cout(carry[1])
    );
    
    Adder1Bit bit2 (
        .cin (carry[1]),
        .a   (a    [2]),
        .b   (b    [2]),
        .sum (sum  [2]),
        .cout(carry[2])
    );
    
    Adder1Bit bit3 (
        .cin (carry[2]),
        .a   (a    [3]),
        .b   (b    [3]),
        .sum (sum  [3]),
        .cout(cout    )
    );

endmodule

/*
 * Gate Level 1-Bit Full Adder
 * ---------------------------
 *
 * This is a basic Full-Adder circuit built in Verilog using
 * built-in primitives. This is a basic example of Gate Level
 * design.
 *
 */
 

module Adder1Bit (
    // Declare input and output ports
    input  a,
    input  b,
    input  cin,
    output cout,
    output sum
);
    // Declare several single-bit wires that we can
    // use to interconnect the gates. You can use
    // any name you like as long as it contains only
    // a-z, A-Z, underscore (_), and 0-9. Names can't
    // start with a digit.
    wire link1,link2,link3;

    // Instantiate gates to calculate sum output
    xor(link1,a,b);
    xor(sum,link1,cin);

    // Instantiate gates to calculate carry (cout) output
    and(link2,a,b);
    and(link3,cin,link1);
    or (cout,link2,link3);

endmodule






