module Carry_look_ahead_adder_data #(parameter N=4)
(
    input  [N-1:0] a,
    input  [N-1:0] b,
    input          cin,
    output [N-1:0] s,
    output         cout
);

wire [N-1:0] p,g;
wire [N:0] c;

assign p = a ^ b;
assign g = a & b;

assign c[0] = cin;

genvar i;
generate
    for(i=0; i<N; i=i+1) begin : cla
        assign c[i+1] = g[i] | (p[i] & c[i]);
        assign s[i]   = p[i] ^ c[i];
    end
endgenerate

assign cout = c[N];

endmodule
