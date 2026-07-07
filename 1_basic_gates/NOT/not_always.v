module not_always(
	input a,
	output reg b);
always @(*) begin
	b = ~a ;
end
endmodule
