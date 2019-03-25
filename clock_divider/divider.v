
module divider #(
  parameter freq=100
  
)
(
  
  output reg [31:0] div
  
  );
  
always @ (*) begin
case (freq) 
32'd100: div= 32'd1; // for 100mhz , divisor is 1
32'd50: div= 32'd2; // for 50mhz , divisor is 2
32'd25: div= 32'd4; // for 25mhz , divisor is 4
32'd10: div= 32'd10; 
32'd1: div= 32'd100; 

default: div= 32'd1; // 
endcase
end 
endmodule 