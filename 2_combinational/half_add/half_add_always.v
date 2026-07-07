module half_add_always(
	input a,b ,
	output reg s,c );
always @(*) begin
	s=a^b;
	c=a&b;
end
endmodule
