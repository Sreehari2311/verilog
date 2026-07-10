module Priority_encoder_data_always_if(input [3:0]a,output reg [1:0]y);
always @(*) begin
if(a[3])
y=2'b11;
else if(a[2])
y=2'b10;
else if(a[1])
y=2'b01;
else if(a[0])
y=2'b00;
else
y=2'b00;
end
endmodule
