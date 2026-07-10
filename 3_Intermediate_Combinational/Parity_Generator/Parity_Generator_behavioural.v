module Parity_Generator_behavioural(input a,b,c,output p);
always @(*) begin
p=a^b^c;
end
endmodule
