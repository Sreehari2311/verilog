module half_sub_tb;
    reg a, b;
    wire diff,borrow;
half_sub_struct uut (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );
initial begin
        $dumpfile("half_sub.vcd");
        $dumpvars(0, half_sub_tb);
        $display("Time\tA\tB\tdiff\tborrow");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, a, b, diff, borrow);
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
