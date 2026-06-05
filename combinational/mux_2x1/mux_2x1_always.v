module mux_2x1_always (
    input  A, B, S,
    output reg Y
);
    always @(*) begin
        Y = S ? B : A;
    end
endmodule
