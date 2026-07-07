module encoder_4x2_assign(
input D0,
input D1,
input D2,
input D3,
output Y0,
output Y1
);

assign Y0 = D1 | D3;
assign Y1 = D2 | D3;

endmodule
