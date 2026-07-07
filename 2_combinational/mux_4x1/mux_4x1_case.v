module mux_4x1_case (
    input  A, B, C, D,
    input  select_1, select_0,
    output reg Y
);
    always @(*) begin
        case ({select_1, select_0})
            2'b00: Y = A;
            2'b01: Y = B;
            2'b10: Y = C;
            2'b11: Y = D;
            default: Y = 1'bx;
        endcase
    end
endmodule
