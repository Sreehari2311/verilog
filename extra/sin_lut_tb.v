module tb_sine_lut;

reg clk;
reg rst;
wire [7:0] sine_out;

sin_lut dut (
    .clk(clk),
    .rst(rst),
    .sine_out(sine_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;

    #12 rst = 0;

    #200 $finish;
end

initial begin
    $display("Time\tSine_Out");
    $monitor("%0t\t%d", $time, sine_out);
end

initial begin
    $dumpfile("sine_lut.vcd");
    $dumpvars(0, tb_sine_lut);
end

endmodule
