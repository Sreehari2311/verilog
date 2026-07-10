module Parity_Checker_tb;
reg [3:0]a;
reg p;

wire y;

Parity_Checker_beh #(4)uut (.a(a),.p(p),.y(y));

integer i;

initial
begin
$dumpfile("Parity_Checker.vcd");
$dumpvars(0,Parity_Checker_tb);
$monitor("time=%0t,a=%b,p=%b,y=%b",$time,a,p,y);

for(i=0;i<2**4;i=i+1)begin
{a,p}=i;
#10;
end
$finish;
end
endmodule

