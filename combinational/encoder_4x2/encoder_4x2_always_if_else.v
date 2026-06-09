module encoder_4x2_if_else(
input D0,
input D1,
input D2,
input D3,
output reg Y0,
output reg Y1
);

always @(*) begin

{Y1,Y0}=2'b00;

if(D0)
{Y1,Y0}=2'b00;

else if(D1)
{Y1,Y0}=2'b01;

else if(D2)
{Y1,Y0}=2'b10;

else if(D3)
{Y1,Y0}=2'b11;

end

endmodule
