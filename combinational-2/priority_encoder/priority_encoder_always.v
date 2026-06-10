module priority_encoder_always(
	input [3:0] A ,
	output reg [1:0]  Y 
	);

always @(*) begin
	Y=2'b00;
	casex(D)
		4'b0001 : Y = 2'b00 ;
		4'b001x : Y = 2'b01 ;
	 	4'b01xx : Y = 2'b10 ;
		4'b1xxx : Y = 2'b11 ;
	endcase
endmodule	
