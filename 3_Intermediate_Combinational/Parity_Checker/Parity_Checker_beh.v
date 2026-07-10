module Parity_Checker_beh#(parameter N=3)(input [N-1:0]a , input p,output reg y);
reg [N:0]temp;
always @ (*) begin
temp={a,p};
y=^temp;
end
endmodule
