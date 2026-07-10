module ripple_carry_adder_case(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output reg [3:0] sum,
    output reg cout
);

reg [4:0] temp;

always @(*) begin
    temp = a + b + cin;

    case(temp[4])
        1'b0: begin
            cout = 1'b0;
            sum  = temp[3:0];
        end

        1'b1: begin
            cout = 1'b1;
            sum  = temp[3:0];
        end
    endcase
end

endmodule
