`timescale 1ns/1ps

module sin_lut (
    input        clk,
    input        rst,
    output reg [7:0] sine_out
);

reg [3:0] addr;

always @(posedge clk or posedge rst) begin
    if (rst)
        addr <= 4'd0;
    else
        addr <= addr + 1'b1;
end

always @(*) begin
    case (addr)
        4'd0  : sine_out = 8'd128;
        4'd1  : sine_out = 8'd177;
        4'd2  : sine_out = 8'd218;
        4'd3  : sine_out = 8'd245;
        4'd4  : sine_out = 8'd255;
        4'd5  : sine_out = 8'd245;
        4'd6  : sine_out = 8'd218;
        4'd7  : sine_out = 8'd177;
        4'd8  : sine_out = 8'd128;
        4'd9  : sine_out = 8'd79;
        4'd10 : sine_out = 8'd38;
        4'd11 : sine_out = 8'd11;
        4'd12 : sine_out = 8'd0;
        4'd13 : sine_out = 8'd11;
        4'd14 : sine_out = 8'd38;
        4'd15 : sine_out = 8'd79;
        default: sine_out = 8'd128;
    endcase
end

endmodule
