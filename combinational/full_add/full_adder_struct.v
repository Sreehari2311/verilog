module full_adder_struct(
	input a,b,c_in ,
	output s,c_out
 );

	wire w,x,y,z ;

	xor g1(w,a,b);
	xor g2(s,w,c_in);
	and g3(x,a,b);
	and g4(y,b,c_in);
	and g5(z,a,c_in);
	or g6(c_out,x,y,z);

endmodule
