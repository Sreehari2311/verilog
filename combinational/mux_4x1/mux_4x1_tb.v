module mux_4x1_tb;
    reg  A, B, C, D;
    reg  select_1, select_0;
    wire Y;

    mux_4x1_struct uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .select_1(select_1),
        .select_0(select_0),
        .Y(Y)
    );

    initial begin
        $dumpfile("mux_4x1.vcd");
        $dumpvars(0, mux_4x1_tb);

        A = 0; B = 1; C = 0; D = 1;

        $display("select_1  select_0 | A  B  C  D | Y");

        select_1=0; select_0=0; #10;
        $display("   %b        %b     | %b  %b  %b  %b  | %b", select_1, select_0, A, B, C, D, Y);

        select_1=0; select_0=1; #10;
        $display("   %b        %b     | %b  %b  %b  %b  | %b", select_1, select_0, A, B, C, D, Y);

        select_1=1; select_0=0; #10;
        $display("   %b        %b     | %b  %b  %b  %b  | %b", select_1, select_0, A, B, C, D, Y);

        select_1=1; select_0=1; #10;
        $display("   %b        %b     | %b  %b  %b  %b  | %b", select_1, select_0, A, B, C, D, Y);

        $finish;
    end
endmodule
