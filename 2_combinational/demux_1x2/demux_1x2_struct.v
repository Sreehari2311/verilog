module demux_1x2_struct(
    input I,
    input Select,
    output Y0,
    output Y1
);

wire Select_bar;

not g1(Select_bar,Select);

and g2(Y0,I,Select_bar);
and g3(Y1,I,Select);

endmodule
