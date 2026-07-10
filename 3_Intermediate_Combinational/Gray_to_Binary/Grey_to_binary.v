module Grey_to_binary(input [3:0]a,output reg [3:0] y);

integer i;

always @ (*) begin

y[3]=a[3];

for(i=2;i>=0;i=i-1)
begin
y[i]=a[i]^y[i+1];
end
end
endmodule
