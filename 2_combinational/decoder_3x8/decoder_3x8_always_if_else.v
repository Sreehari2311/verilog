module decoder_3x8_if_else(
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

    if(~A && ~B && ~C)
        Y0 = 1;

    else if(~A && ~B && C)
        Y1 = 1;

    else if(~A && B && ~C)
        Y2 = 1;

    else if(~A && B && C)
        Y3 = 1;

    else if(A && ~B && ~C)
        Y4 = 1;

    else if(A && ~B && C)
        Y5 = 1;

    else if(A && B && ~C)
        Y6 = 1;
    else
        Y7 = 1;
end
endmodule
