module and_tb;
	reg a,b;
	wire c ;
and_struct uut(
	.a(a),
	.b(b),
	.c(c)
);

initial begin
	$dumpfile("and_gate.vcd");
	$dumpvars(0,and_tb);

	$display("A B | C");
	$monitor("%b %b | %b",a,b,c);
       	 a=0; b=0;#10;
   	 a=0; b=1;#10;
   	 a=1; b=0;#10;
   	 a=1; b=1;#10;

    $finish;
end

endmodule

