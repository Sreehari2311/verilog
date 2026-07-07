module nor_tb;
reg a,b;
wire y;

nor_struct uut(a,b,y);

initial
begin
$dumpfile("nor.vcd");
$dumpvars(0,nor_tb);
$monitor("t=%0t,a=%b,b=%b,y=%b",$time,a,b,y);
a=0;b=0;
#10
a=0;b=1;
#10
a=1;b=0;
#10
a=1;b=1;
#10
$finish;
end
endmodule
