module mux_2x1_struct (
    input  A, B, S,
    output Y
);
    wire S_bar, w1, w2;
    not  g1 (S_bar, S);
    and  g2 (w1, A, S_bar);
    and  g3 (w2, B, S);
    or   g4 (Y, w1, w2);
endmodule
