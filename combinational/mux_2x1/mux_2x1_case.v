module mux_2x1_case (
    input  A, B, S,
    output reg Y
);
    always @(*) begin
        case (S)
            1'b0: Y = A;
            1'b1: Y = B;
            default: Y = 1'bx;
        endcase
    end
endmodule
