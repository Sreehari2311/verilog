module demux_1x2_tb;

reg I,Select;
wire Y0,Y1;

demux_1x2_struct uut(
	.I(I),
	.Select(Select),
	.Y0(Y0),
	.Y1(Y1)
);

initial begin

	$dumpfile("demux_1x2.vcd");
	$dumpvars(0,demux_1x2_tb);

	$display("I Select | Y0 Y1");

	I=0; Select=0;
	#10;
	$display("%b %b | %b %b",I,Select,Y0,Y1);

	I=0; Select=1;
	#10;
	$display("%b %b | %b %b",I,Select,Y0,Y1);

	I=1; Select=0;
	#10;
	$display("%b %b | %b %b",I,Select,Y0,Y1);

	I=1; Select=1;
	#10;
	$display("%b %b | %b %b",I,Select,Y0,Y1);

$finish;

end

endmodule
