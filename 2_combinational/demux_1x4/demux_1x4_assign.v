module demux_1x4_assign(
input I,
input Select1,
input Select0,
output Y0,
output Y1,
output Y2,
output Y3
);

assign Y0 = I & (~Select1) & (~Select0);
assign Y1 = I & (~Select1) & Select0;
assign Y2 = I & Select1 & (~Select0);
assign Y3 = I & Select1 & Select0;

endmodule
