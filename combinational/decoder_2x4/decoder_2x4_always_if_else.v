module decoder_2x4_if_else(
    input A,
    input B,
    output reg Y0,
    output reg Y1,
    output reg Y2,
    output reg Y3
);

always @(*) begin

    {Y0,Y1,Y2,Y3} = 4'b0000;

    if(A==0 && B==0)
        Y0 = 1;

    else if(A==0 && B==1)
        Y1 = 1;

    else if(A==1 && B==0)
        Y2 = 1;

    else
        Y3 = 1;

end

endmodule
