module BCD_adder(input [3:0]a,b,input cin,output [3:0]s,output c);

wire[4:0] temp;
wire [4:0] crctd;

wire crction;

assign temp=a+b+cin;

assign crction = temp[4] | (temp[3] & temp[2]) | (temp[3] & temp[1]);

assign crctd = temp + (crction ? 5'd6 : 5'd0);

assign sum  = crctd[3:0];
assign cout = crctd[4];

endmodule
