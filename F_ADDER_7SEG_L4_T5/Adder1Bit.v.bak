/*
 * Gate Level 1-Bit Full Adder
 * ---------------------------
 * By: Thomas Carpenter
 * For: University of Leeds
 * Date: 20th December 2017
 *
 * Description
 * -----------
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
