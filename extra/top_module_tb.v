`timescale 1ns/1ps

module top_module_tb;

    reg clk;
    reg reset;

    wire OneHertz;
    wire [2:0] c_enable;

    // Instantiate DUT
    top_module dut (
        .clk(clk),
        .reset(reset),
        .OneHertz(OneHertz),
        .c_enable(c_enable)
    );

    // 10 ns clock period (100 MHz simulation clock)
    // Frequency doesn't matter in simulation.
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin

        // Generate waveform
        $dumpfile("wave.vcd");
        $dumpvars(0, top_module_tb);

        reset = 1;

        // Hold reset for two clocks
        #20;
        reset = 0;

        // Run for 1050 clock cycles
        repeat (1050)
            @(posedge clk);

        $finish;
    end

endmodule
