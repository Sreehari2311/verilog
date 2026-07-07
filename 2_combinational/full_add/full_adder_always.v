module full_adder_always(
	input a,b,c ,
	output reg s,
	output reg c_out);

always @(*)begin
	s = a^b^c ;
	c_out = (a&b) | (b&c) | (a&c);
end
endmodule
