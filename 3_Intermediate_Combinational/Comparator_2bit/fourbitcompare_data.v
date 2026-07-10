module fourbitcompare_data(input [1:0]a,input [1:0]b,output g,e,l);
assign e=~(a[1]^b[1]) & ~(a[0]^b[0]);
assign g=a[1]&~b[1] | ~(a[1]^b[1] & (a[0] & ~b[0]));
assign l=~a[1] &b[1] | ~(a[1]^b[1]) & (~a[0] & b[0]);
endmodule

