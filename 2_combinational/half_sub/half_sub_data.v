module half_sub_data(
	input a,b ,
	output diff, borrow );
	
	assign diff = a^b ;
	assign borrow = (~a)&b ;
endmodule
