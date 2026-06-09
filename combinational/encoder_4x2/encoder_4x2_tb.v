module encoder_4x2_tb;

reg D0,D1,D2,D3;
wire Y0,Y1;

encoder_4x2_struct uut(
.D0(D0),
.D1(D1),
.D2(D2),
.D3(D3),
.Y0(Y0),
.Y1(Y1)
);

initial begin

$dumpfile("encoder_4x2.vcd");
$dumpvars(0,encoder_4x2_tb);

$display("D3 D2 D1 D0 | Y1 Y0");

D3=0; D2=0; D1=0; D0=1;
#10;
$display("%b %b %b %b | %b %b",D3,D2,D1,D0,Y1,Y0);

D3=0; D2=0; D1=1; D0=0;
#10;
$display("%b %b %b %b | %b %b",D3,D2,D1,D0,Y1,Y0);

D3=0; D2=1; D1=0; D0=0;
#10;
$display("%b %b %b %b | %b %b",D3,D2,D1,D0,Y1,Y0);

D3=1; D2=0; D1=0; D0=0;
#10;
$display("%b %b %b %b | %b %b",D3,D2,D1,D0,Y1,Y0);

$finish;

end

endmodule
