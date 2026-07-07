module or_tb;
reg a,b;
wire c;

or_struct uut(
.a(a),
.b(b),
.c(c)
);

initial begin
	$dumpfile("or_gate.VCD");
	$dumpvars(0,or_tb);
	$display("A B | C");
	$monitor("%b %b | %b",a,b,c);
       	 a=0; b=0;#10;
   	 a=0; b=1;#10;
   	 a=1; b=0;#10;
   	 a=1; b=1;#10;

    $finish;
end

endmodule
	
