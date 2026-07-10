module onebitcompare_tb;
reg a,b;
wire g,e,l;

onebitcompare_data uut(.a(a),.b(b),.g(g),.e(e),.l(l));

initial
begin
$dumpfile("onebitcompare.vcd");
$dumpvars(0,onebitcompare_tb);
$monitor("time=%0t,a=%b,b=%b,g=%b,e=%b,l=%b",$time,a,b,g,e,l);

a=0;b=0; #10
a=0;b=1; #10
a=1;b=0; #10
a=1;b=1; #10

$finish;
end
endmodule
