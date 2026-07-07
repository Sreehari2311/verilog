module decoder_3x8_case(
    input A,
    input B,
    input C,
    output reg Y0,
    output reg Y1,
    output reg Y2,
    output reg Y3,
    output reg Y4,
    output reg Y5,
    output reg Y6,
    output reg Y7
);

always @(*) begin

    {Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7} = 8'b00000000;

    case({A,B,C})

        3'b000: Y0 = 1;
        3'b001: Y1 = 1;
        3'b010: Y2 = 1;
        3'b011: Y3 = 1;
        3'b100: Y4 = 1;
        3'b101: Y5 = 1;
        3'b110: Y6 = 1;
        3'b111: Y7 = 1;

    endcase

end

endmodule
