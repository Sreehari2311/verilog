module encoder_4x2_case(
input D0,
input D1,
input D2,
input D3,
output reg Y0,
output reg Y1
);

always @(*) begin

{Y1,Y0}=2'b00;

case({D3,D2,D1,D0})

4'b0001: {Y1,Y0}=2'b00;
4'b0010: {Y1,Y0}=2'b01;
4'b0100: {Y1,Y0}=2'b10;
4'b1000: {Y1,Y0}=2'b11;

endcase

end

endmodule
