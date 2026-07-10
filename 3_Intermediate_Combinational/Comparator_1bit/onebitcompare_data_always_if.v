module onebitcompare_data_always_if(input a,b,output reg g,e,l);
always @(*) begin
if(a>b)
begin
g=1;e=0;l=0;
end
else if(a<b)
begin
g=0;e=0;l=1;
end
else if(a==b)
begin
g=0;e=1;l=0;
end
else
begin
g=0;e=0;l=0;
end
end
endmodule

