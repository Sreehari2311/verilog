module BCD_adder_tb;
reg [3:0]a,b;
reg cin;

wire [3:0]s;
wire cout;

BCD_adder_data_always_case uut(.a(a),.b(b),.s(s),.cin(cin),.cout(cout));

integer i;
initial
begin
$dumpfile("BCD_adder.vcd");
$dumpvars(0,BCD_adder_tb);

$monitor("time=%0t,a=%b,b=%b,cin=%b,cout=%b,s=%b",$time,a,b,cin,cout,s);

for(i=0;i<100;i=i+1)begin
a = $unsigned($random) % 10;
b = $unsigned($random) % 10;
cin = $unsigned($random) % 2;
#10;
end

$finish;
end
endmodule

