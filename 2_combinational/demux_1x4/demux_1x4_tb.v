module demux_1x4_tb;

reg I,Select1,Select0;
wire Y0,Y1,Y2,Y3;

demux_1x4_struct uut(
.I(I),
.Select1(Select1),
.Select0(Select0),
.Y0(Y0),
.Y1(Y1),
.Y2(Y2),
.Y3(Y3)
);

initial begin

$dumpfile("demux_1x4.vcd");
$dumpvars(0,demux_1x4_tb);

$display("I S1 S0 | Y0 Y1 Y2 Y3");

I=0; Select1=0; Select0=0;
#10;
$display("%b %b %b | %b %b %b %b",I,Select1,Select0,Y0,Y1,Y2,Y3);

I=0; Select1=0; Select0=1;
#10;
$display("%b %b %b | %b %b %b %b",I,Select1,Select0,Y0,Y1,Y2,Y3);

I=0; Select1=1; Select0=0;
#10;
$display("%b %b %b | %b %b %b %b",I,Select1,Select0,Y0,Y1,Y2,Y3);

I=0; Select1=1; Select0=1;
#10;
$display("%b %b %b | %b %b %b %b",I,Select1,Select0,Y0,Y1,Y2,Y3);

I=1; Select1=0; Select0=0;
#10;
$display("%b %b %b | %b %b %b %b",I,Select1,Select0,Y0,Y1,Y2,Y3);

I=1; Select1=0; Select0=1;
#10;
$display("%b %b %b | %b %b %b %b",I,Select1,Select0,Y0,Y1,Y2,Y3);

I=1; Select1=1; Select0=0;
#10;
$display("%b %b %b | %b %b %b %b",I,Select1,Select0,Y0,Y1,Y2,Y3);

I=1; Select1=1; Select0=1;
#10;
$display("%b %b %b | %b %b %b %b",I,Select1,Select0,Y0,Y1,Y2,Y3);

$finish;

end

endmodule
