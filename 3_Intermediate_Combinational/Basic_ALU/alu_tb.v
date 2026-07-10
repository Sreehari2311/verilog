module alu_tb;
reg a,b;
reg [1:0]sel;
wire y;

alu_beh uut(.a(a),.b(b),.sel(sel),.y(y));

integer i;
initial
begin
$dumpfile("alu.vcd");
$dumpvars(0,alu_tb);
$monitor("time=%0t,a=%b,b=%b,sel=%b,y=%b",$time,a,b,sel,y);
for(i=0;i<16;i=i+1)
begin
{a,b,sel}=i;
#10;
end
end
endmodule

