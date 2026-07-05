module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
	wire c_out ;
    wire [31:0] x_out ;
    assign x_out = b ^ {32{sub}};
    add16 inst1 (a[15:0], x_out[15:0], sub, sum[15:0], c_out);
    add16 inst2 (a[31:16], x_out[31:16], c_out, sum[31:16] );
endmodule
