module top_module (input x, input y, output z);
    wire [3:0] main_z ;
    A A1 (x, y, main_z[0]);
    B B1 (x, y, main_z[1]);
    A A2 (x, y, main_z[2]);
    B B2 (x, y, main_z[3]);
    assign z = (main_z[0] | main_z[1]) ^ (main_z[2] & main_z[3]);

endmodule

module A(
    input x ,
    input y ,
    output z);
    assign z = (x^y)&x ;
endmodule

module B(
    input x ,
    input y ,
    output z);
    assign z = ~(x^y);
endmodule
