module ripple_carry_adder_data_always_if(
input [3:0]a,b,
output cout,
output [3:0]sum
);

wire [4:0] temp

always @ (*) begin

if(cin)

temp=a+b+cin;

else

temp=a+b;

end

assign sum=temp[3:0];
assign cout=temp[4];

endmodule
