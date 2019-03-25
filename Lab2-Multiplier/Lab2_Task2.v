/*
 * FPGA Design for SoC - Lab2
 * ----------------------------
 * By: Christina Fayad
 * For: University of Leeds
 * Date: 06 February 2019
 *
 * Description
 * ------------
 * The module is a Multiplier 5-bit which has been
 * built in Verilog using Gate-Level 1-bit full adders.
 *
 */

module  Lab2_Task2 (
    // Declare input and output ports
    input  [1:0] m,
    input  [2:0] q,
    output [4:0] p
);

wire c1 =1'b0;

Multiplier_FirstRowI block_1 (
   
           .m0   (m[0]),
			  .m1   (m[1]),
			  .q0   (q[0]),
			  .q1   (q[1]),
			  .cin  (c1),
			  .sum (sum),
           .cout(cout)
);

Multiplier_FirstRowII block_2 (
   
           .m0   (m[1]),
			  .m1   (c1),
			  .q0   (q[0]),
			  .q1   (q[1]),
			  .cin  (cout),
			  .sum1  (sum1),
           .cout1 (cout1)
);

Multiplier_SecondRowI block1(

           .m0   (m[0]),
			  .q2   (q[2]),
			  .cin  (c1),
			  .sum2  (sum2),
			  .cout2 (cout2)
);

Multiplier_SecondRowII block2(

           .m0   (m[1]),
			  .q2   (q[2]),
			  .cin  (cout2),
			  .sum3  (sum3),
			  .cout3 (cout3)
);
endmodule


module Multiplier_FirstRowI (
    // Declare input and output ports 
	 input  m0,
	 input  m1,
	 input  q0,
	 input  q1,
	 input  cin,
    output sum,
    output cout,
	 output [4:0] p
	 );
	 
	 //wire Link_A, Link_B, link1, link2, link3;
	 
	 wire Link_A = m0 & q1;
	 wire Link_B = m1 & q0;
	 
	 wire link1 = Link_A ^ Link_B;
	 assign sum = link1 ^ cin;
	 
	 wire link2 = Link_A & Link_B;
	 wire link3 = cin & link1;
	 assign cout  = link2 | link3;
	 
	 assign p[0] = q0 & m0;
	 assign p[1] = sum;
	 
endmodule 

module Multiplier_FirstRowII (
    // Declare input and output ports 
	 input  m0,
	 input  m1,
	 input  q0,
	 input  q1,
	 input  cin,
    output sum1,
    output cout1
	 );

	// wire Link_A, Link_B, link1, link2, link3;
	 
	 wire Link_A = m0 & q1;
	 wire Link_B = m1 & q0;
	 
	 wire link1 = Link_A ^ Link_B;
	 assign sum1  = link1 ^ cin;
	 
	 wire link2 = Link_A & Link_B;
	 wire link3 = cin & link1;
	 assign cout1 = link2 | link3;
	 
endmodule 

module Multiplier_SecondRowI (
    // Declare input and output ports 
	 input  m0,
	 input  q2,
	 input  cin,
	 output sum1,
    output sum2,
    output cout2,
	 output [4:0] p
	 );

	// wire Link_A, Link_B, link1, link2, link3;
	 
	wire  Link_A = m0 & q2;
	wire  Link_B = sum1;
	 
	wire  link1 = Link_A ^ Link_B;
	assign sum2  = link1 ^ cin;
	 
	wire link2 = Link_A & Link_B;
	wire  link3 = cin & link1;
	assign cout2 = link2 | link3;
	 
	assign p[2] = sum2;
	 
endmodule 

module Multiplier_SecondRowII (
    // Declare input and output ports 
	 input  m0,
	 input  q2,
	 input  cin,
	 output cout1,
    output sum3,
    output cout3,
	 output [4:0] p
	 );

	// wire Link_A, Link_B, link1, link2, link3;
	 
	wire  Link_A = m0 & q2;
	wire  Link_B = cout1;
	 
	wire  link1 = Link_A ^ Link_B;
	assign sum3  = link1 ^ cin;
	 
	wire  link2 = Link_A & Link_B;
	wire  link3 = cin & link1;
	assign cout3 = link2 | link3;
	 
	assign p[3] = sum3;
	assign p[4] = cout3;
	 
endmodule 