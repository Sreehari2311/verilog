module demux_1x4_struct(
input I,
input Select1,
input Select0,
output Y0,
output Y1,
output Y2,
output Y3
);

wire S1_bar,S0_bar;

not g1(S1_bar,Select1);
not g2(S0_bar,Select0);

and g3(Y0,I,S1_bar,S0_bar);
and g4(Y1,I,S1_bar,Select0);
and g5(Y2,I,Select1,S0_bar);
and g6(Y3,I,Select1,Select0);

endmodule
