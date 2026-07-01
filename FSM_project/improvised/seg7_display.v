`timescale 1ns/1ps

// -----------------------------------------------------------------------------
// seg7_display.v
// Drives the EDGE Artix-7 4-digit common-anode 7-segment display.
//
// Display type : Common anode, anodes driven via NPN transistors
// Digit select : Active-HIGH  (1 = digit ON,  0 = digit OFF)
// Segment drive: Active-LOW   (0 = segment ON, 1 = segment OFF)
//
// We only need to show floors 0-3, so we permanently enable digit[0]
// (rightmost digit) and drive the correct segment pattern onto Seven_Seg.
// Digits 1-3 are kept OFF (digit select = 0).
//
// Seven_Seg bit mapping (from board XDC):
//   [0]=A  [1]=B  [2]=C  [3]=D  [4]=E  [5]=F  [6]=G  [7]=DP
//
//        aaa
//       f   b
//       f   b
//        ggg
//       e   c
//       e   c
//        ddd
// -----------------------------------------------------------------------------

module seg7_display (
    input  wire [1:0] current_floor,   // 2-bit floor number (0-3)
    output reg  [3:0] digit,           // digit enables, active-HIGH; [0]=rightmost
    output reg  [7:0] Seven_Seg        // segment drives, active-LOW; [7]=DP
);

    // Digit select: only rightmost digit active, others off
    // digit[0] = rightmost = our floor display
    always @(*) begin
        digit = 4'b0001;   // only digit[0] ON (active-HIGH)
    end

    // BCD to 7-segment, active-LOW
    // Bit order: {DP, G, F, E, D, C, B, A} = Seven_Seg[7:0]
    always @(*) begin
        case (current_floor)
            //                DP  G  F  E  D  C  B  A
            2'd0: Seven_Seg = 8'b1100_0000; // 0: a,b,c,d,e,f ON;  g OFF
            2'd1: Seven_Seg = 8'b1111_1001; // 1: b,c ON; rest OFF
            2'd2: Seven_Seg = 8'b1010_0100; // 2: a,b,d,e,g ON
            2'd3: Seven_Seg = 8'b1011_0000; // 3: a,b,c,d,g ON
            default: Seven_Seg = 8'b1111_1111; // all OFF
        endcase
    end

endmodule
