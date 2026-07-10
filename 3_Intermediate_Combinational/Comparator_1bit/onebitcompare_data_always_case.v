module onebitcompare_data_always_case(input a,b,output reg g,e,l);
always @(*) begin
case({a,b})
2'b00 : begin
g=0;e=1;l=0;
end

2'b11 : begin
g=0;e=1;l=0;
end

2;b01 :begin
g=0;e=0;l=1;
end

2'b10 : begin
g=1;e=0;l=0;
end

default : begin
g=0;e=0;l=0;
end
endcase
end
endmodule
