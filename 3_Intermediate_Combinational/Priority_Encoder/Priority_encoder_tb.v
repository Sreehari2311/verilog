module Priority_encoder_tb;
reg [3:0]a;
wire [1:0]y;

integer i;

Priority_encoder_data_always_case uut(.a(a),.y(y));
initial begin
$dumpfile("Priority_encoder.vcd");
$dumpvars(0,Priority_encoder_tb);

$monitor("time=%0t,a=%b%b%b%b,y=%b%b",$time,a[3],a[2],a[1],a[0],y[1],y[0]);
for(i=0;i<16;i=i+1)
begin
a=i;
#10;
end
$finish;
end
endmodule

