module nor_data_always(input a,b,output reg y);
always @(*) begin
y=~(a|b);
end
endmodule
