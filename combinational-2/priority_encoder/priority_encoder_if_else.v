module priority_encoder_if_else (
    input  [3:0] D,
    output reg [1:0]  Y
);

always @(*) begin
    if (D[3])
        Y = 2'b11;
    else if (D[2])
        Y = 2'b10;
    else if (D[1])
        Y = 2'b01;
    else if (D[0])
        Y = 2'b00;
    else
        Y = 2'b00;
end

endmodule
