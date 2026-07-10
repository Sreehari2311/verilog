module fourbitcompare_tb;
reg [1:0]a;
reg [1:0]b;

wire g,e,l;

fourbitcompare_data_always_if uut(.a(a),.b(b),.g(g),.e(e),.l(l));

integer i;

initial begin
$dumpfile("fourbitcompare.vcd");
$dumpvars(0,fourbitcompare_tb);

$monitor("time=%0t,a=%b%b,b=%b%b,g=%b,e=%b,l=%b",$time,a[1],a[0],b[1],b[0],g,e,l);

for(i=0;i<16;i=i+1)begin
{a,b}=i;
#10;
end
$finish;
end
endmodule

