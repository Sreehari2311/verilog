module mux_4x1_assign (
    input  A, B, C, D,
    input  select_1, select_0,
    output Y
);
    assign Y = select_1 ? (select_0 ? D : C) : (select_0 ? B : A);
endmodule
