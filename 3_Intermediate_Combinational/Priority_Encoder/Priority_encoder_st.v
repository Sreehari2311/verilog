module Priority_encoder_st.v(input [3:0]a,output [1:0]y);
wire w1,w2,w3;
or (y[1],a[3],a[2]);
not(w1,a[2]);
and(w2,a[1],w1);
or(y[0],w2,a[3]);
endmodule
