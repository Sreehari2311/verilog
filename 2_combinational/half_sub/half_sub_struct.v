module half_sub_struct(
	input a,b ,
	output diff,borrow );
        wire x;
	xor g1(diff,a,b);
	not g3(x,a);
	and g2(borrow,x,b);
endmodule
