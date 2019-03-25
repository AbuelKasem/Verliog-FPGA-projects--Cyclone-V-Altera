/*
 * 2-State Mealy Example
 * ---------------------
 * For: University of Leeds
 * Date: 2nd January 2018
 *
 * Description
 * ------------
 * The module is a simple example of a two state
 * Mealy machine described in the Lab 5 notes.
 *
 */

module Mealy (
    input clock, 
    input reset,
    input w,
    output reg z
); 

//State-Machine Registers
reg [1:0] state;

//Local Parameters used to define state names (similar to #define in C)
localparam A_STATE = 2'b01;
localparam B_STATE = 2'b10;

//Define the outputs for each state
always @ (*) begin
    case (state)
        A_STATE: begin // Define state A behaviour
            z = 1'b0; // In state A, z is not dependent on inputs, only state.
        end
        B_STATE: begin // Define state B behaviour
            if (w) begin
                z = 1'b1; // In state B, z *is* dependent on input and state.
            end else begin
                z = 1'b0;
            end
        end
        default: begin
            z = 1'b0;
        end
    endcase
end 

//Define state transitions, which are synchronous
always @(posedge clock or posedge reset) begin
    if (reset) begin
        state <= A_STATE;
    end else begin
        case (state)
            A_STATE: begin // Define state A behaviour
                if (w) begin
                    state <= B_STATE;
                end 
                if (!w) begin
                    state <= A_STATE;
                end
            end
            B_STATE: begin // Define state B behaviour
                if (w) begin
                    state <= B_STATE;
                end 
                if (!w) begin
                    state <= A_STATE;
                end
            end
            default: begin
                state <= A_STATE;
            end
        endcase
    end
end

endmodule
