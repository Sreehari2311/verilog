module demux_1x2_always_if_else(
    input I,
    input Select,
    output reg Y0,
    output reg Y1
);

always @(*) begin

    {Y0,Y1} = 2'b00;

    if(Select==0)
        Y0 = I;
    else
        Y1 = I;

end

endmodule
