module Lab3_DFF (


input clk,
input rst,
input in1,
input in2,
output out1,
output out2

);


DFlipFlop dff1 (
.clock (clk),
  .d (in1),
 .q (out1)
 );

 
 DFlipFlopWithAclr dff2 (
    .clock (clk),
     .reset (rst),
     .d (in2),
     .q (out2)
 );
 endmodule 