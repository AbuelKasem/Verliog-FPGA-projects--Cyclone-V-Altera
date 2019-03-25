/*
 * LT24 Test Pattern Top
 * ------------------------
 * By: Thomas Carpenter
 * For: University of Leeds
 * Date: 13th February 2019
 *
 * Short Description
 * -----------------
 * This module is designed to interface with the LT24 Display Module
 * from Terasic. It makes use of the LT24Display IP core to show a
 * simple test pattern on the display.
 *
 */

module LT24Top (
    // Global Clock/Reset
    // - Clock
    input              clock,
    // - Global Reset
    input              globalReset,
    // - Application Reset - for debug
    output             resetApp,
    
    // LT24 Interface
    output             LT24Wr_n,
    output             LT24Rd_n,
    output             LT24CS_n,
    output             LT24RS,
    output             LT24Reset_n,
    output [     15:0] LT24Data,
    output             LT24LCDOn
);

//
// Local Variables
//
wire [ 7:0] xAddr;
wire [ 8:0] yAddr;
reg  [15:0] pixelData;
wire        pixelReady;
reg         pixelWrite;

//
// LCD Display
//
localparam LCD_WIDTH  = 240;
localparam LCD_HEIGHT = 320;

LT24Display #(
    .WIDTH       (LCD_WIDTH  ),
    .HEIGHT      (LCD_HEIGHT ),
    .CLOCK_FREQ  (50000000   )
) Display (
    .clock       (clock      ),
    .globalReset (globalReset),
    .resetApp    (resetApp   ),
    .xAddr       (xAddr      ),
    .yAddr       (yAddr      ),
    .pixelData   (pixelData  ),
    .pixelWrite  (pixelWrite ),
    .pixelReady  (pixelReady ),
    .pixelRawMode(1'b0       ),
    .cmdData     (8'b0       ),
    .cmdWrite    (1'b0       ),
    .cmdDone     (1'b0       ),
    .cmdReady    (           ),
    .LT24Wr_n    (LT24Wr_n   ),
    .LT24Rd_n    (LT24Rd_n   ),
    .LT24CS_n    (LT24CS_n   ),
    .LT24RS      (LT24RS     ),
    .LT24Reset_n (LT24Reset_n),
    .LT24Data    (LT24Data   ),
    .LT24LCDOn   (LT24LCDOn  )
);

//
// X Counter
//
UpCounterNbit #(
    .WIDTH    (          8),
    .MAX_VALUE(LCD_WIDTH-1)
) xCounter (
    .clock     (clock     ),
    .reset     (resetApp  ),
    .enable    (pixelReady),
    .countValue(xAddr     )
);

//
// Y Counter
//
wire yCntEnable = pixelReady && (xAddr == (LCD_WIDTH-1));
UpCounterNbit #(
    .WIDTH    (           9),
    .MAX_VALUE(LCD_HEIGHT-1)
) yCounter (
    .clock     (clock     ),
    .reset     (resetApp  ),
    .enable    (yCntEnable),
    .countValue(yAddr     )
);

//
// Pixel Write
//
always @ (posedge clock or posedge resetApp) begin
    if (resetApp) begin
        pixelWrite <= 1'b0;
    end else begin
        //In this example we always set write high, and use pixelReady to detect when
        //to update the data.
        pixelWrite <= 1'b1;
        //You could also control pixelWrite and pixelData in a State Machine.
    end
end

//
// This is a simple test pattern generator.
//
// We create a different colour for each pixel based on 
// the X-Y coordinate.
//
always @ (posedge clock or posedge resetApp) begin
    if (resetApp) begin
        pixelData           <= 16'b0;
    end else if (pixelReady) begin
        //Lets make the Red channel equal to the Y address
        pixelData[15:11]    <= xAddr[7:3];
        //The Green channel equals the Y address
        pixelData[10: 5]    <= yAddr[8:3];
        //We will change the blue channel each time we finish writing one frame.
        if ((xAddr == (LCD_WIDTH-1)) && (yAddr == (LCD_HEIGHT-1))) begin
            pixelData[4:0]  <= pixelData[4:0] + 5'b1;
        end
    end
end

endmodule

/*
 * N-Bit Up Counter
 * ----------------
 * By: Thomas Carpenter
 * Date: 13/03/2017 
 *
 * Short Description
 * -----------------
 * This module is a simple up-counter with a count enable.
 * The counter has parameter controlled width, increment,
 * and maximum value.
 *
 */

module UpCounterNbit #(
    parameter WIDTH = 10,               //10bit wide
    parameter INCREMENT = 1,            //Value to increment counter by each cycle
    parameter MAX_VALUE = (2**WIDTH)-1  //Maximum value default is 2^WIDTH - 1
)(   
    input                    clock,
    input                    reset,
    input                    enable,    //Increments when enable is high
    output reg [(WIDTH-1):0] countValue //Output is declared as "WIDTH" bits wide
);

always @ (posedge clock) begin
    if (reset) begin
        //When reset is high, set back to 0
        countValue <= {(WIDTH){1'b0}};
    end else if (enable) begin
        //Otherwise counter is not in reset
        if (countValue >= MAX_VALUE[WIDTH-1:0]) begin
            //If the counter value is equal or exceeds the maximum value
            countValue <= {(WIDTH){1'b0}};   //Reset back to 0
        end else begin
            //Otherwise increment
            countValue <= countValue + INCREMENT[WIDTH-1:0];
        end
    end
end

endmodule



