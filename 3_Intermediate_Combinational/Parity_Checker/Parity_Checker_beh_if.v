module Parity_Checker_beh_if #(parameter N=3)(input [N-1:0]a,input p,output reg y);

reg [N:0] temp;
always @(*) begin
temp={a,p};
if(^temp)
y=1'b1;
else
y=1'b0;
end
endmodule
