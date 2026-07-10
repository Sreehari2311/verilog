module odd_even_detector_beh #(parameter N=3)(input [N-1:0]a,output reg o,e);
always @ (*) begin
if(a[0]==0)begin
o=0;e=1;end
else begin
o=1;e=0;end
end
endmodule
