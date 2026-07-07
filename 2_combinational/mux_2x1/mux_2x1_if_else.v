module mux_2x1_if_else (
    input  A, B, S,
    output reg Y
);
    always @(*) begin
        if (S)
            Y = B;
        else
            Y = A;
    end
endmodule
