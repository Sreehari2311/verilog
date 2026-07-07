module decoder_2x4_always_case(
    input A,
    input B,
    output reg Y0,
    output reg Y1,
    output reg Y2,
    output reg Y3
);

always @(*) begin

    {Y0,Y1,Y2,Y3}=4'b0000;

    case({A,B})

        2'b00: Y0 = 1;
        2'b01: Y1 = 1;
        2'b10: Y2 = 1;
        2'b11: Y3 = 1;

    endcase

end

endmodule
