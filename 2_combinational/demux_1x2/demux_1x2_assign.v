module demux_1x2_assign(
    input I,
    input Select,
    output Y0,
    output Y1
);

assign Y0 = I & (~Select);
assign Y1 = I & Select;

endmodule
