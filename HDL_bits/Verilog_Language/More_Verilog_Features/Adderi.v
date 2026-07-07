module top_module(
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);

    fa inst1 (
        .a(a[0]),
        .b(b[0]),
        .c_in(cin),
        .sum(sum[0]),
        .c_out(cout[0])
    );
    
	genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin: HDLbits
            fa inst2 (
                .a(a[i]),
                .b(b[i]),
                .c_in(cout[i-1]),
                .sum(sum[i]),
                .c_out(cout[i])
            );
        end
    endgenerate

endmodule

module fa(
    input a, b,
    input c_in,
    output sum, c_out
);

    assign c_out = (a & b) | (b & c_in) | (c_in & a);
    assign sum = a ^ b ^ c_in;

endmodule
