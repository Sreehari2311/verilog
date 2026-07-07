module decoder_2x4_struct(
    input A,
    input B,
    output Y0,
    output Y1,
    output Y2,
    output Y3
);

wire A_bar, B_bar;

not g1(A_bar, A);
not g2(B_bar, B);

and g3(Y0, A_bar, B_bar);
and g4(Y1, A_bar, B);
and g5(Y2, A, B_bar);
and g6(Y3, A, B);

endmodule
