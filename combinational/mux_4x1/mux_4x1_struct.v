module mux_4x1_struct (
    input  A, B, C, D,
    input  select_1, select_0,
    output Y
);
    wire select_1_bar, select_0_bar;
    wire and_out_0, and_out_1, and_out_2, and_out_3;

    not g1 (select_1_bar, select_1);
    not g2 (select_0_bar, select_0);

    and g3 (and_out_0, A, select_1_bar, select_0_bar);
    and g4 (and_out_1, B, select_1_bar, select_0);
    and g5 (and_out_2, C, select_1,     select_0_bar);
    and g6 (and_out_3, D, select_1,     select_0);

    or  g7 (Y, and_out_0, and_out_1, and_out_2, and_out_3);
endmodule
