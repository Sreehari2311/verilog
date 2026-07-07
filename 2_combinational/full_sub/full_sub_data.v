module full_sub_data(
	input a,b,c_in ,
	output diff , borrow );
	
	assign diff = a^b^c_in ;
	assign borrow =(c_in&(~(a^b))) | ((~a)&b);
endmodule
