module cla_tb;

parameter N = 4;

reg [N-1:0] a,b;
reg cin;
wire [N-1:0] s;
wire cout;

Carry_lookahead_adder_data #(N) uut(
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .cout(cout)
);

integer i;

initial begin

    $dumpfile("Carry_look_ahead_adder.vcd");
    $dumpvars(0,cla_tb);

    $monitor("t=%0t a=%b b=%b cin=%b sum=%b cout=%b",
              $time,a,b,cin,s,cout);

    for(i=0; i<100; i=i+1) begin
        a   = $random;
        b   = $random;
        cin = $random;
        #10;
    end

    $finish;

end

endmodule
