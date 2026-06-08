module decoder_3x8_tb;
reg A,B,C;
wire Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
decoder_3x8_struct uut(
.A(A),
.B(B),
.C(C),
.Y0(Y0),
.Y1(Y1),
.Y2(Y2),
.Y3(Y3),
.Y4(Y4),
.Y5(Y5),
.Y6(Y6),
.Y7(Y7)
);
initial begin
	$dumpfile("decoder_3x8.vcd");
	$dumpvars(0,decoder_3x8_tb);

	$display("A B C | Y0 Y1 Y2 Y3 Y4 Y5 Y6 Y7");
	{A,B,C}=3'b000;
	#10;
	$display("%b %b %b | %b %b %b %b %b %b %b %b",A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
	{A,B,C}=3'b001;
	#10;
	$display("%b %b %b | %b %b %b %b %b %b %b %b",A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
	{A,B,C}=3'b010;
	#10;
	$display("%b %b %b | %b %b %b %b %b %b %b %b",A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
	{A,B,C}=3'b011;
	#10;
	$display("%b %b %b | %b %b %b %b %b %b %b %b",A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
	{A,B,C}=3'b100;
	#10;
	$display("%b %b %b | %b %b %b %b %b %b %b %b",A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
	{A,B,C}=3'b101;
	#10;
	$display("%b %b %b | %b %b %b %b %b %b %b %b",A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
	{A,B,C}=3'b110;
	#10;
	$display("%b %b %b | %b %b %b %b %b %b %b %b",A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
	{A,B,C}=3'b111;
	#10;
	$display("%b %b %b | %b %b %b %b %b %b %b %b",A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
$finish;
end
endmodule
