`timescale 1ns/1ps
module debouncer #(
    parameter STABLE_COUNT = 500_000   // 5 ms at 100 MHz
)(
    input  wire clk_100mhz,
    input  wire rst,
    input  wire raw_in,
    output reg  db_out
);
 
    // -------------------------------------------------------------------------
    // Stage 1: Two-flop synchroniser
    // -------------------------------------------------------------------------
    reg sync_ff1, sync_ff2;
 
    always @(posedge clk_100mhz) begin
        if (rst) begin
            sync_ff1 <= 1'b0;
            sync_ff2 <= 1'b0;
        end else begin
            sync_ff1 <= raw_in;
            sync_ff2 <= sync_ff1;
        end
    end
 
    // -------------------------------------------------------------------------
    // Stage 2: Stable-cycle counter
    // 19 bits covers up to 524_287 — enough for STABLE_COUNT = 500_000
    // -------------------------------------------------------------------------
    reg [18:0] stable_cnt;
    reg        last_sync;
 
    always @(posedge clk_100mhz) begin
        if (rst) begin
            stable_cnt <= 19'd0;
            last_sync  <= 1'b0;
            db_out     <= 1'b0;
        end else begin
            if (sync_ff2 != last_sync) begin
                // Input changed — reset counter and record new value
                stable_cnt <= 19'd0;
                last_sync  <= sync_ff2;
            end else if (stable_cnt == STABLE_COUNT - 1) begin
                // Input has been stable long enough — accept it
                db_out     <= sync_ff2;
                stable_cnt <= stable_cnt;  // hold at max, don't wrap
            end else begin
                stable_cnt <= stable_cnt + 1;
            end
        end
    end
 
endmodule
 
