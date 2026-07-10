module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);

    wire [3:0] q0, q1, q2;
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (q0 == 4'd9);
    assign c_enable[2] = (q0 == 4'd9) && (q1 == 4'd9);

    assign OneHertz = (q0 == 4'd9) &&
                      (q1 == 4'd9) &&
                      (q2 == 4'd9);

    
    bcdcount counter0 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[0]),
        .Q(q0)
    );

    // Ten
    bcdcount counter1 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[1]),
        .Q(q1)
    );

    // Hundreds
    bcdcount counter2 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[2]),
        .Q(q2)
    );

endmodule



// ------------------------------------------------------
// BCD Counter
// ------------------------------------------------------
module bcdcount (
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q
);

always @(posedge clk) begin
    if (reset)
        Q <= 4'd0;
    else if (enable) begin
        if (Q == 4'd9)
            Q <= 4'd0;
        else
            Q <= Q + 4'd1;
    end
end

endmodule
