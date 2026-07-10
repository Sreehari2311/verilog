module ripple_carry_adder_data(input [3:0]a,input [3:0]b,input cin,output c,output [3:0]s);
wire w1,w2,w3;

assign s[0] = a[0]^b[0]^cin;
assign w1= (a[0]&b[0] | (a[0]^b[0])&cin);

assign s[1] = a[1]^b[1]^w1;
assign w2= (a[1]&b[1] | (a[1]^b[1])&w1);

assign s[2] = a[2]^b[2]^w2;
assign w3=( a[2]&b[2] | (a[2]^b[2])&w2);

assign s[3] = a[3]^b[3]^w3;
assign c=(a[3]&b[3] | (a[3]^b[3])&w3);

endmodule

