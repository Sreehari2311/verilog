module encoder_8x3_always_if_else(
input D0,D1,D2,D3,D4,D5,D6,D7,
output reg Y0,Y1,Y2
);

always @(*) begin

{Y2,Y1,Y0}=3'b000;

if(D0)
{Y2,Y1,Y0}=3'b000;

else if(D1)
{Y2,Y1,Y0}=3'b001;

else if(D2)
{Y2,Y1,Y0}=3'b010;

else if(D3)
{Y2,Y1,Y0}=3'b011;

else if(D4)
{Y2,Y1,Y0}=3'b100;

else if(D5)
{Y2,Y1,Y0}=3'b101;

else if(D6)
{Y2,Y1,Y0}=3'b110;

else if(D7)
{Y2,Y1,Y0}=3'b111;

end

endmodule
