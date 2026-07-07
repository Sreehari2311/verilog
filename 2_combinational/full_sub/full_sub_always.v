module full_sub_always(
	input a,b,c_in ,
	output reg diff , borrow );
always @(*) begin
	 diff = a^b^c_in ;
         borrow =(c_in&(~(a^b))) | ((~a)&b);
end 
endmodule


