module Parity_Generator_behavioural_if(input a,b,c,output reg p);
always @ (*) begin
if(a^b^c)
p=1'b1;
else
p=1'b0;
end
endmodule

