module mux4x1_if_else (
    input  A, B, C, D,
    input  select_1, select_0,
    output reg Y
);
    always @(*) begin
        if
         (!select_1 && !select_0) Y = A;
        else if
	 (!select_1 &&  select_0) Y = B;
        else if
	 ( select_1 && !select_0) Y = C;
        else
	 Y = D;
end
endmodule

