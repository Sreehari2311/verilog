module nand_always(
	input a,b ,
	output reg c);
always @(*) begin
	c = ~(a&b);
end
endmodule
