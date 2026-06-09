module demux_1x4_always_case(
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

case({Select1,Select0})

2'b00: Y0=I;
2'b01: Y1=I;
2'b10: Y2=I;
2'b11: Y3=I;

endcase

end

endmodule
