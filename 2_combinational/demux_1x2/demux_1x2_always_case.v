module demux_1x2_always_case(
    input I,
    input Select,
    output reg Y0,
    output reg Y1
);

always @(*) begin

    {Y0,Y1} = 2'b00;

    case(Select)

        1'b0: Y0 = I;
        1'b1: Y1 = I;

    endcase

end

endmodule
