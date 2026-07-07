module not_tb;
reg a;
wire b;

not_struct uut(
	.a(a),
	.b(b)
	);

initial	begin
	$dumpfile("not_gate.vcd");
	$dumpvars(0,not_tb);

	$display("A|B");
	$monitor("%b | %b",a,b);
       	 a=0;#10;
	 a=1;#10;
	$finish;
end
endmodule
