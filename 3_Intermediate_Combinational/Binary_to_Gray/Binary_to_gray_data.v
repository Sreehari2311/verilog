module Binary_to_gray_data#(parameter N=4)(input [N-1:0]a,output [N-1:0]y);


genvar i;


assign y[N-1] = a[N-1];

generate
for(i=0; i<N-1; i=i+1)
begin : gray
assign y[i]=a[i]^a[i+1];
end
endgenerate
endmodule

