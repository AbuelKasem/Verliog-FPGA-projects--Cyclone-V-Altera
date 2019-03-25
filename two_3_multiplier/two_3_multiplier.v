

module two_3_multiplier (

input [1:0] m,
input [2:0] q,
output [4:0] p

);


//wire aWire = 1'b0;
wire link1,link2,link3,link4;
assign p[0] =m[0] & q[0];
//and(p[0],m[0],q[0]);


first_row r1 (

        .cin (1'b0),
        .m0 (m[0]),
        .m1 (m[1]),
	     .q0 (q[0]),
	     .q1 (q[1]),
        .s (p[1]),
        .cout (link1)
);
		  





first_row r2 (

        .cin (link1),
        .m0 (m[1]),
        .m1 (1'b0),
	     .q0 (q[0]),
	     .q1 (q[1]),
        .s (link3),
        .cout (link2)

);


  
second_row sr1 (

        .cin (1'b0),
        .m (m[0]),
	     .q2 (q[2]),
	     .pp (link3),
        .s (p[2]),
        .cout (link4)



);

second_row sr2 (

        .cin (link4),
        .m (m[1]),
	     .q2 (q[2]),
	     .pp (link2),
        .s (p[3]),
        .cout (p[4])

);
endmodule

module first_row (

    input    cin,
    input     m0,
    input     m1,
	 input     q0,
	 input     q1,
    output    s,
    output  cout
	 );
	 
	 wire linkA,linkB;
	assign linkA= m0 & q1;
	// and(linkA,m0,q1);
	assign linkB= m1 & q0;
	//and(linkB,m1,q0);
	 
	 
	 Adder1Bit theAdder (
   .cin (cin ),
   .a   (linkA ),
   .b   (linkB ),
   .sum (s ),
   .cout(cout)
);
	 
endmodule
	 
	 
module second_row (

    input    cin,
    input     m,
	 input     q2,
	 input     pp,
    output  s,
    output  cout
	 );
	 
	 wire linkA;
	 
	assign linkA= m & q2;
	// and(linkA,m,q2);
	 
	 
	 Adder1Bit theAdder (
   .cin (cin ),
   .a   (linkA ),
   .b   (pp ),
   .sum (s ),
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