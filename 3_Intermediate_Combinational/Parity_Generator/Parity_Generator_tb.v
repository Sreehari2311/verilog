module Parity_Generator_tb;
reg a,b,c;
wire p;

Parity_Generator_behavioural_if uut(.a(a),.b(b),.c(c),.p(p));

integer i;

initial
begin
$dumpfile("Parity_Generator.vcd");
$dumpvars(0,Parity_Generator_tb);

for(i=0;i<8;i=i+1)
begin
{a,b,c}=i;
$display("time=%0t,a=%b,b=%b,c=%b | p=%b",$time,a,b,c,p);
#10;
end
end
endmodule
