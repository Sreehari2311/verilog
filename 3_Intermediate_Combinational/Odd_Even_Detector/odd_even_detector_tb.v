module odd_even_detector_tb;
reg [2:0]a;
wire o,e;

odd_even_detector_beh #(3) uut (.a(a),.o(o),.e(e));

integer i;

initial
begin
$dumpfile("odd_even_detector.vcd");
$dumpvars(0,odd_even_detector_tb);

$monitor("time=%0t,a=%b,odd=%b,even=%b",$time,a,o,e);

for(i=0;i<8;i=i+1)
begin
a=i;
#10;
end
end
endmodule

