module mux_2x1_assign (
    input  A, B, S,
    output Y
);
    assign Y = S ? B : A;
endmodule
