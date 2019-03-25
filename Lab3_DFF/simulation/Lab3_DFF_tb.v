/*
 * 8-Bit Comparator Test Bench
 * ---------------------------
 * By: Thomas Carpenter
 * For: University of Leeds
 * Date: 29th December 2017 
 *
 * Short Description
 * -----------------
 * This is a simple test bench module to test the 8-Bit Comparator.
 * module with a few stimulii.
 *
 */

// Timescale indicates unit of delays.
//  `timescale  unit / precision
// Where delays are given as:
//   #unit.precision
//
// Let's stick with a "unit" of 1ns. You may choose the "precision".
//
// e.g for `timescale 1ns/100ps then:
//   #1 = 1ns
//   #1.5 = 1.5ns
//   #1.25 = 1.3ns (rounded to nearest precision)
`timescale 1 ns/100 ps

// Test bench module declaration
//  Always end test bench module names with _tb for clarity
//  There is no port list for a test bench
module Lab3_DFF_tb;

//
// Parameter Declarations
//

//
// Test Bench Generated Signals
//
reg  a;
reg clock;
reg reset;


//
// DUT Output Signals
//
//wire a_lt_b;
//wire a_gt_b;
//wire a_eq_b;
wire  c;
wire  e;

//
// Device Under Test
//
Lab3_DFF Lab3_DFF_dut (
   .in1      ( a      ),
   .in2      ( a      ),
   .out1      ( c     ),
   .out2      ( e ),
   .clk   (clock),
   .rst (reset)
   
);

//
// Test Bench Logic
//
initial begin
    //Print to console that the simulation has started. $time is the current simulation time.
    $display("%d ns\tSimulation Started",$time);  
    //Monitor any changes to any values listed. This will automatically print to the console when they change.
    //There can only be one $monitor per simulation.
    $monitor("%d ns\td=%b\tq=%b\tq2=%b\clk=%b\rst=%b",$time,a,c,e,clock,reset); 
    //Initialise a and b to 0.
	
	clock = 1'b0;
	reset = 1'b1;
    a = 1'b0;
    #10; //Wait 10 ns.
	clock = 1'b1;
	reset = 1'b0;
    a = 1'b1;
    #10; //Wait 10 ns.
	clock = 1'b0;
	reset = 1'b0;
    a = 1'b0;
	#10; //Wait 10 ns.
	clock = 1'b1;
	reset = 1'b1;
    a = 1'b1;
	#10; //Wait 10 ns.
    //Finished
    $display("%d ns\tSimulation Finished",$time);
    //There are no other processes running in this testbench, so "run -all" in ModelSim
    //will finish the simulation automatically now.
    //We can also use $stop(); to finish the simulation whenever we want.
end


endmodule
