module demux_1x4_always_if_else(
input I,
input Select1,
input Select0,
output reg Y0,
output reg Y1,
output reg Y2,
output reg Y3
);

always @(*) begin

{Y0,Y1,Y2,Y3}=4'b0000;

if(~Select1 && ~Select0)
Y0=I;

else if(~Select1 && Select0)
Y1=I;

else if(Select1 && ~Select0)
Y2=I;

else
Y3=I;

end

endmodule
