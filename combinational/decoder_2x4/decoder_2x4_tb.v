module decoder_2x4_tb;
reg A, B;
wire Y0, Y1, Y2, Y3;
decoder_2x4_struct uut(
    .A(A),
    .B(B),
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3)
);
initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0, decoder_2x4_tb);
    $display("A B | Y0 Y1 Y2 Y3");
    {A,B} = 2'b00;
    #10;
    $display("%b %b | %b  %b  %b  %b", A,B,Y0,Y1,Y2,Y3);
    {A,B} = 2'b01;
    #10;
    $display("%b %b | %b  %b  %b  %b", A,B,Y0,Y1,Y2,Y3);
    {A,B} = 2'b10;
    #10;
    $display("%b %b | %b  %b  %b  %b", A,B,Y0,Y1,Y2,Y3);
    {A,B} = 2'b11;
    #10;
    $display("%b %b | %b  %b  %b  %b", A,B,Y0,Y1,Y2,Y3);
  $finish;
end
endmodule
