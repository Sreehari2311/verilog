module BCD_adder_data_always_case(input [3:0]a,b,input cin,output reg [3:0]s,output reg cout);
reg [4:0]temp;

always @(*) begin
temp=a+b+cin;

case(temp>5'd9)
1'b1: temp=temp+5'd6;
1'b0: temp=temp;

endcase

s=temp[3:0];
cout=temp[4];
end
endmodule
