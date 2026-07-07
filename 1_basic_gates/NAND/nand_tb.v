module nand_tb;
reg a,b ;
wire c;

nand_struct uut(
.a(a),
.b(b),
.c(c)
);

initial begin
	$dumpfile("nand_gate.vcd");
	$dumpvars(0,nand_tb);
	
	$display("A B | C");
	$monitor("%b %b | %b",a,b,c);
       	 a=0; b=0;#10;
   	 a=0; b=1;#10;
   	 a=1; b=0;#10;
   	 a=1; b=1;#10;

    $finish;
end

endmodule


