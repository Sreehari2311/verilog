module priority_encoder_tb;

reg [3:0] D;
wire [1:0] Y;

priority_encoder_if_else dut (
    .D(D),
    .Y(Y)
);

initial begin

    $dumpfile("p_encoder.vcd");
    $dumpvars(0,priority_encoder_tb);
    $monitor("Time=%0t D=%b Y=%b", $time, D, Y);

    D = 4'b0000; #10;
    D = 4'b0001; #10;
    D = 4'b0010; #10;
    D = 4'b0100; #10;
    D = 4'b1000; #10;
    D = 4'b0011; #10;
    D = 4'b0111; #10;
    D = 4'b1111; #10;


    $finish;
end

endmodule
