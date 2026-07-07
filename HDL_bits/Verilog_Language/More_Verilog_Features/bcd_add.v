module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
);

    wire [99:0] c;
    bcd_fadd inst1 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(c[0]),
        .sum(sum[3:0])
    );
	genvar i;
    generate
        for (i = 1; i < 100; i = i + 1) begin : ripple
            bcd_fadd inst2 (
                .a(a[4*i+3 : 4*i]),
                .b(b[4*i+3 : 4*i]),
                .cin(c[i-1]),
                .cout(c[i]),
                .sum(sum[4*i+3 : 4*i])
            );
        end
    endgenerate

    assign cout = c[99];

endmodule
