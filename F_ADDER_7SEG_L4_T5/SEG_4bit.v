module SEG_4bit #(  // parameters
      parameter invert =1
   
) (	  // I/O Declaration
    input  [3:0] code,
   
    output reg [6:0] decode
   
);


always @ * begin
case (code) //case ( expression )
4'h0: decode = 7'b0111111; // constantExpr: action;
4'h1: decode = 7'b0000110; // constantExpr: action;
4'h2: decode = 7'b1011011; // constantExpr: action;7'b‭‭1110111;
4'h3: decode = 7'b1001111; // constantExpr: action;7'b‭‭1110001‬‬;
4'h4: decode = 7'b1100110;
4'h5: decode = 7'b1101101;
4'h6: decode = 7'b1011111;
4'h7: decode = 7'b0000111;
4'h8: decode = 7'b1111111;
4'h9: decode = 7'b1101111;
4'd10: decode =7'b1110111; 
4'd11: decode = 7'b111111;
4'd12: decode = 7'b0111001; // d for deicmal ,h hexadecimal did not work
4'd13: decode = 7'b0111111;
4'd14: decode = 7'b1111001;
4'd15: decode = 7'b1110001;
//4'b1111: decode = 7'b1001001;

default: decode = 7'b0000000; // default: action;
endcase
if (invert) begin
decode=~decode;
end else begin
decode=decode;
end
end 

endmodule 