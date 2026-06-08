module decoder_3x8_struct(
    input A,
    input B,
    input C,
    output Y0,
    output Y1,
    output Y2,
    output Y3,
    output Y4,
    output Y5,
    output Y6,
    output Y7
);

wire A_bar, B_bar, C_bar;

not g1(A_bar,A);
not g2(B_bar,B);
not g3(C_bar,C);

and g4(Y0,A_bar,B_bar,C_bar);
and g5(Y1,A_bar,B_bar,C);
and g6(Y2,A_bar,B,C_bar);
and g7(Y3,A_bar,B,C);

and g8(Y4,A,B_bar,C_bar);
and g9(Y5,A,B_bar,C);
and g10(Y6,A,B,C_bar);
and g11(Y7,A,B,C);

endmodule
