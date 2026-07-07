module full_adder_tb;
    reg a, b, c_in;
    wire s, c_out;

    full_adder_struct uut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .s(s),
        .c_out(c_out)
    );

    initial begin
        {a, b, c_in} = 3'b000; #10;
        $display("%b %b  %b    | %b  %b", a, b, c_in, s, c_out);

        {a, b, c_in} = 3'b001; #10;
        $display("%b %b  %b    | %b  %b", a, b, c_in, s, c_out);

        {a, b, c_in} = 3'b010; #10;
        $display("%b %b  %b    | %b  %b", a, b, c_in, s, c_out);

        {a, b, c_in} = 3'b011; #10;
        $display("%b %b  %b    | %b  %b", a, b, c_in, s, c_out);

        {a, b, c_in} = 3'b100; #10;
        $display("%b %b  %b    | %b  %b", a, b, c_in, s, c_out);

        {a, b, c_in} = 3'b101; #10;
        $display("%b %b  %b    | %b  %b", a, b, c_in, s, c_out);

        {a, b, c_in} = 3'b110; #10;
        $display("%b %b  %b    | %b  %b", a, b, c_in, s, c_out);

        {a, b, c_in} = 3'b111; #10;
        $display("%b %b  %b    | %b  %b", a, b, c_in, s, c_out);

        $finish;
    end

    
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);
    end

endmodule
