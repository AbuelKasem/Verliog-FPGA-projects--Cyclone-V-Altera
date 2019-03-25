/*
 * Synchronous Test Bench
 * ======================
 *
 * Add description here
 *
 */
 
module clock_divider2_tb;

//
// Parameter Declarations
//
localparam NUM_CYCLES = 400;       //Simulate this many clock cycles. Max. 1 billion
localparam CLOCK_FREQ = 50; //Clock frequency (in Hz)  , clk period is 1 ms 
localparam RST_CYCLES = 1;        //Number of cycles of reset at beginning.
localparam WIDTH = 32;
//
// Test Bench Generated Signals
//

reg  clock;
reg  reset;
reg enable;


//
// Device Under Test
//


wire servo_pwm;
wire  out_clkt;
wire [31:0] n_clkst;

clock_divider2 clock_divider2_dut (
   
   .out_clkt ( out_clkt),
   .in_clkt  (clock),
   .resett (reset),
   .enablet (enable),
   .servo_pwm(servo_pwm),
   .n_clkst (n_clkst)
   
);

//
// Reset Logic
//
initial begin

    reset = 1'b1;                                      //Start in reset.
    repeat(RST_CYCLES) @(posedge clock);               //Wait for a couple of clocks
    reset = 1'b0;   
	//Then clear the reset signal.
end

//
//Clock generator + simulation time limit.
//
initial begin
 //Print to console that the simulation has started. $time is the current simulation time.
    $display("%d ms\tSimulation Started",$time);  
    //Monitor any changes to any values listed. This will automatically print to the console when they change.
    //There can only be one $monitor per simulation.
    $monitor("%d ms\enb=%b\\out_clkt=%b\clk=%b\rst=%b\n_clkst=%d\servo_pwm=%b",$time,enable,out_clkt,clock,reset,n_clkst,servo_pwm); 
    //Initialise a and b to 0.
	//dt_keys=8'b00000000;
    clock = 1'b1; //Initialise the clock to zero.
	enable=1'b1;
end
//Next we convert our clock period to nanoseconds and half it
//to work out how long we must delay for each half clock cycle
//Note how we convert the integer CLOCK_FREQ parameter it a real
real HALF_CLOCK_PERIOD = (1000000000.0 / $itor(CLOCK_FREQ)) / 2.0;

//Now generate the clock
integer half_cycles = 0;
always begin
    //Generate the next half cycle of clock
    #(HALF_CLOCK_PERIOD);          //Delay for half a clock period.
    clock = ~clock;                //Toggle the clock
    half_cycles = half_cycles + 1; //Increment the counter
    
    //Check if we have simulated enough half clock cycles
    if (half_cycles == (2*NUM_CYCLES)) begin 
        //Once the number of cycles has been reached
		half_cycles = 0; 		   //Reset half cycles, so if we resume running with "run -all", we perform another chunk.
        $stop;                     //Break the simulation
        //Note: We can continue the simualation after this breakpoint using 
        //"run -continue" or "run ### ns" in modelsim.
    end
end

endmodule
