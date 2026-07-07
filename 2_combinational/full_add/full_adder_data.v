module full_adder_data(
	input a,b,c,
	output sum,c_out
	);

	assign sum = a^b^c ;
	assign c_out = (a&b) | (b&c) | (a&c);
endmodule
