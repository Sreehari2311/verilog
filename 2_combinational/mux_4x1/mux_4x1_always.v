module mux_4x1_always (

    input  A, B, C, D,
    input  select_1, select_0,
    output reg Y
);
    always @(*) begin
        Y = select_1 ? (select_0 ? D : C)
                     : (select_0 ? B : A);
    end
endmodule
