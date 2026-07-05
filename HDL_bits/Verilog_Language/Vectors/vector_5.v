module top_module (
    input a, b, c, d, e,
    output [24:0] out );
    wire [24:0] out_1 ;
    wire [24:0] out_2 ;
    assign out_1 = { {5{a}} , {5{b}} , {5{c}} , {5{d}} , {5{e}} } ;
    assign out_2 = { {5{a,b,c,d,e}} };
    assign out = ~out_1 ^ out_2 ;

endmodule
