module Grey_to_binary_tb;
reg [3:0]a;
wire [3:0]y;

Grey_to_binary uut(.a(a),.y(y));

integer i;

initial
begin

$dumpfile("Grey_to_Binary.vcd");
$dumpvars(0,Grey_to_binary_tb);

$monitor("t=%0t,a=%b,y=%b",$time,a,y);

for(i=0;i<4;i=i+1)
begin
a=i;
#10;
end
$finish;
end
endmodule
