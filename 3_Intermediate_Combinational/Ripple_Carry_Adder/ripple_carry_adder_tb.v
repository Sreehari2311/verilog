module ripple_carry_adder_tb;

reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire c;

ripple_carry_adder_data uut(.a(a),.b(b),.cin(cin),.c(c),.s(s));

integer i;

initial
begin
$dumpfile("ripple_carry_adder.vcd");
$dumpvars(0,ripple_carry_adder_tb);

$monitor("t=%0t,a=%b,b=%b,cin=%b,s=%b,cout=%b",$time,a,b,cin,s,c);

for(i=0;i<256;i=i+1)begin
{a,b,cin}=i;
#10;
end

end

endmodule
