module Binary_to_gray_tb;

reg [9:0] a;
wire [9:0]y;

Binary_to_gray_data#(10) uut(.a(a),.y(y));


integer i;

initial
begin
$dumpfile("Binary_to_gray.vcd");
$dumpvars(0,Binary_to_gray_tb);
$monitor("t=%0t | a=%b | y=%b",$time,a,y);

for(i=0;i<1024;i=i+1)begin
a=i;
#3;
end

$finish;

end

endmodule

