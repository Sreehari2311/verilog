module onebitcompare_data(input a,b,output g,e,l);
assign g=a & ~b;
assign e = ~(a^b);
assign l= ~a & b;
endmodule
