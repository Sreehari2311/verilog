module encoder_4x2_struct(
input D0,
input D1,
input D2,
input D3,
output Y0,
output Y1
);

or g1(Y0,D1,D3);
or g2(Y1,D2,D3);

endmodule
