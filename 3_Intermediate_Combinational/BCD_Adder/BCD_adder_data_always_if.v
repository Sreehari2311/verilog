module BCD_adder_data_always_if(input [3:0]a,b,input cin,output [3:0]s,output cout);
reg [4:0] temp;

always @ (*) begin
temp=a+b+cin;

if (temp>5'd9)

temp=temp+5'd6;

assign sum= temp[3:0];
assign cout=tmep[4];

end

endmodule
