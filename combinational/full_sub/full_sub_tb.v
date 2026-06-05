module full_sub_tb;

    reg a, b, c_in;
    wire diff, borrow;

    full_sub_struct uut (
        .a(a),
        .b(b),
        .c_in(c_in),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin

        {a,b,c_in}=3'b000; #10;
        $display("%b %b %b | %b %b",a,b,c_in,diff,borrow);

        {a,b,c_in}=3'b001; #10;
        $display("%b %b %b | %b %b",a,b,c_in,diff,borrow);

        {a,b,c_in}=3'b010; #10;
        $display("%b %b %b | %b %b",a,b,c_in,diff,borrow);

        {a,b,c_in}=3'b011; #10;
        $display("%b %b %b | %b %b",a,b,c_in,diff,borrow);

        {a,b,c_in}=3'b100; #10;
        $display("%b %b %b | %b %b",a,b,c_in,diff,borrow);

        {a,b,c_in}=3'b101; #10;
        $display("%b %b %b | %b %b",a,b,c_in,diff,borrow);

        {a,b,c_in}=3'b110; #10;
        $display("%b %b %b | %b %b",a,b,c_in,diff,borrow);

        {a,b,c_in}=3'b111; #10;
        $display("%b %b %b | %b %b",a,b,c_in,diff,borrow);

        $finish;

    end

    initial begin
        $dumpfile("full_sub.vcd");
        $dumpvars(0,full_sub_tb);
    end

endmodule

