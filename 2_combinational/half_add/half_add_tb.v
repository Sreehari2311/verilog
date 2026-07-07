module half_adder_tb;
    reg a, b;
    wire s,c;
half_add_struct uut (
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );
initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);
        $display("Time\tA\tB\tSUM\tCARRY");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, a, b, s, c);
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
