module mux_2x1_tb;
    reg  A, B, S;
    wire Y;

    mux_2x1_struct uut (
        .A(A),
	.B(B),
	.S(S),
	.Y(Y)
    );

    initial begin
	$dumpfile("mux_2x1.vcd");
	$dumpvars(0,mux_2x1_tb);
        $display("S  A  B | Y");
        $display("--------|--");
        {S, A, B} = 3'b000; #10; $display("%b  %b  %b | %b", S, A, B, Y);
        {S, A, B} = 3'b001; #10; $display("%b  %b  %b | %b", S, A, B, Y);
        {S, A, B} = 3'b010; #10; $display("%b  %b  %b | %b", S, A, B, Y);
        {S, A, B} = 3'b011; #10; $display("%b  %b  %b | %b", S, A, B, Y);
        {S, A, B} = 3'b100; #10; $display("%b  %b  %b | %b", S, A, B, Y);
        {S, A, B} = 3'b101; #10; $display("%b  %b  %b | %b", S, A, B, Y);
        {S, A, B} = 3'b110; #10; $display("%b  %b  %b | %b", S, A, B, Y);
        {S, A, B} = 3'b111; #10; $display("%b  %b  %b | %b", S, A, B, Y);
        $finish;
    end
endmodule
