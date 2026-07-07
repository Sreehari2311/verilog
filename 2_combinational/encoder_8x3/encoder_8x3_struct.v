module encoder_8x3_struct(
input D0,D1,D2,D3,D4,D5,D6,D7,
output Y0,Y1,Y2
);

or g1(Y0,D1,D3,D5,D7);

or g2(Y1,D2,D3,D6,D7);

or g3(Y2,D4,D5,D6,D7);

endmodule
