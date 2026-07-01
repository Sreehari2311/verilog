`timescale 1ns/1ps

module clk_divider (
    input  wire clk_100mhz,
    input  wire rst,
    output reg  clk_1hz
);

    reg [25:0] counter;

    localparam CNT_1HZ = 49_999_999;

    always @(posedge clk_100mhz) begin
        if (rst) begin
            counter <= 0;
            clk_1hz <= 0;
        end
        else begin
            if (counter == CNT_1HZ) begin
                counter <= 0;
                clk_1hz <= ~clk_1hz;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
